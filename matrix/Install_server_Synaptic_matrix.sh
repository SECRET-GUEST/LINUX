#!/bin/bash

# Vérification des privilèges root
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté avec des privilèges de superutilisateur."
   exit 1
fi

# Demande des informations initiales à l'utilisateur
echo "Bienvenue dans la configuration de votre serveur Synapse Matrix."
read -p "Entrez le nom de domaine pour votre serveur Matrix (laissez vide pour une configuration en réseau interne): " domain

# Déterminez si l'accès est public ou local en fonction de la présence d'un nom de domaine
if [[ -z "$domain" ]]; then
    yn="local"
    domain=$(hostname -I | cut -d' ' -f1)  # Utilisez l'adresse IP locale si aucun nom de domaine n'est fourni
else
    yn="public"
    read -p "Entrez le nom de l'utilisateur de la base de données pour Synapse: " synapse_db_user
    read -s -p "Entrez le mot de passe pour l'utilisateur de la base de données Synapse: " synapse_db_password
    echo
fi

# Demandez le chemin pour les sauvegardes de la base de données
read -p "Entrez le chemin complet pour les sauvegardes de la base de données Synapse: " backup_path
mkdir -p "$backup_path" 

# Continuez avec la mise à jour et l'installation
echo "Mise à jour des paquets système et installation des dépendances..."
apt update && apt upgrade -y
apt install -y lsb-release wget apt-transport-https nginx ufw fail2ban postgresql

# Ajoutez le dépôt Matrix Synapse et installez-le
echo "Ajout du dépôt Matrix Synapse et installation..."
wget -O /usr/share/keyrings/matrix-org-archive-keyring.gpg https://packages.matrix.org/debian/matrix-org-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/matrix-org-archive-keyring.gpg] https://packages.matrix.org/debian/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/matrix-org.list
apt update && apt install -y matrix-synapse-py3

# Vérifiez que Matrix Synapse est installé et actif
systemctl is-active --quiet matrix-synapse || { echo "Matrix Synapse n'a pas pu être démarré."; exit 1; }

# Configurez le pare-feu UFW
ufw enable
ufw default deny incoming
ufw default allow outgoing

# Configuration de Nginx avec SSL
configure_nginx() {
    # Configuration pour l'accès public avec HTTPS
    if [[ $1 == "public" ]]; then
        # Installation de Certbot pour les certificats SSL et obtention d'un certificat pour le domaine
        apt install -y certbot python3-certbot-nginx
        certbot --nginx -d "$domain" || {
            echo "Certbot a échoué, création d'un certificat auto-signé."
            mkdir -p "/etc/letsencrypt/live/$domain"
            openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
            -keyout "/etc/ssl/private/selfsigned.key" \
            -out "/etc/ssl/certs/selfsigned.crt" \
            -subj "/CN=$domain"
            domain=$(hostname -I | cut -d' ' -f1)
        }
        ssl_certificate="/etc/letsencrypt/live/$domain/fullchain.pem"
        ssl_certificate_key="/etc/letsencrypt/live/$domain/privkey.pem"
        ufw allow 'Nginx Full'
    else
        # Configuration pour l'accès en réseau interne avec un certificat auto-signé
        mkdir -p "/etc/ssl/private"
        openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
        -keyout "/etc/ssl/private/selfsigned.key" \
        -out "/etc/ssl/certs/selfsigned.crt" \
        -subj "/CN=$domain"
        ssl_certificate="/etc/ssl/certs/selfsigned.crt"
        ssl_certificate_key="/etc/ssl/private/selfsigned.key"
        ufw allow from 192.168.0.0/16 to any port 8008
        ufw allow from 10.0.0.0/8 to any port 8008
        ufw allow from 172.16.0.0/12 to any port 8008
    fi

    # Création du fichier de configuration de Nginx
    cat > /etc/nginx/sites-available/matrix <<EOF
server {
    listen 80;
    server_name $domain;
    return 301 https://\$host\$request_uri;
}

server {
    listen 443 ssl;
    server_name $domain;

    ssl_certificate $ssl_certificate;
    ssl_certificate_key $ssl_certificate_key;

    # Configuration HTTPS stricte
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains";

    location / {
        proxy_pass http://localhost:8008;
        proxy_set_header X-Forwarded-For \$remote_addr;
    }
}
EOF
    ln -sf /etc/nginx/sites-available/matrix /etc/nginx/sites-enabled/
    systemctl reload nginx
}



# Gestion de la configuration en fonction du choix de l'utilisateur
if [[ $yn == 1 ]]; then
    # Installation de Certbot pour les certificats SSL
    apt install -y certbot python3-certbot-nginx

    # Obtention ou renouvellement du certificat SSL
    certbot --nginx -d "$domain" || {
        echo "Certbot a échoué, création d'un certificat auto-signé."
        mkdir -p "/etc/letsencrypt/live/$domain"
        openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
        -keyout "/etc/letsencrypt/live/$domain/privkey.pem" \
        -out "/etc/letsencrypt/live/$domain/fullchain.pem" \
        -subj "/CN=$domain"
    }

    # Configuration de Nginx avec le certificat obtenu
    configure_nginx "$domain" "/etc/letsencrypt/live/$domain/fullchain.pem" "/etc/letsencrypt/live/$domain/privkey.pem"

    # Autorisation du trafic HTTPS via UFW
    ufw allow 'Nginx Full'
elif [[ $yn == 2 ]]; then
    echo "Configuration pour un réseau interne."
    local_ip=$(hostname -I | cut -d' ' -f1)

    # Génération d'un certificat auto-signé pour l'usage interne
    mkdir -p "/etc/ssl/private"
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -keyout "/etc/ssl/private/selfsigned.key" \
    -out "/etc/ssl/certs/selfsigned.crt" \
    -subj "/CN=$local_ip"

    # Configuration de Nginx avec le certificat auto-signé
    configure_nginx "$local_ip" "/etc/ssl/certs/selfsigned.crt" "/etc/ssl/private/selfsigned.key"

    # Autorisation du trafic interne sur le port 8008 via UFW
    ufw allow from 192.168.0.0/16 to any port 8008
    ufw allow from 10.0.0.0/8 to any port 8008
    ufw allow from 172.16.0.0/12 to any port 8008
else
    echo "Choix invalide. Le script va maintenant se terminer."
    exit 1
fi
# Appel de la fonction de configuration de Nginx
configure_nginx "$yn"

# Configurez PostgreSQL et créez l'utilisateur et la base de données pour Synapse si nécessaire
if [[ $yn == "public" ]]; then
    # Créez l'utilisateur et la base de données PostgreSQL pour Synapse
    sudo -u postgres psql -c "CREATE USER $synapse_db_user WITH PASSWORD '$synapse_db_password';"
    sudo -u postgres createdb $synapse_db_user -O $synapse_db_user

    # Mise à jour du fichier de configuration de Synapse avec les nouvelles informations de la base de données
    sed -i "s/name: 'synapse'/name: '$SYNAPSE_DB_NAME'/g" /etc/matrix-synapse/homeserver.yaml
    sed -i "s/user: 'matrix-synapse'/user: '$SYNAPSE_DB_USER'/g" /etc/matrix-synapse/homeserver.yaml
    sed -i "s/password: ''/password: '$db_password'/g" /etc/matrix-synapse/homeserver.yaml
fi

# Redémarrage de Synapse pour appliquer les changements
systemctl restart matrix-synapse

# Configuration de la sauvegarde hebdomadaire
backup_script="/etc/cron.weekly/synapse_backup.sh"
cat > "$backup_script" <<EOF
#!/bin/bash
pg_dump -U $synapse_db_user $synapse_db_user > "$backup_path/synapse_backup_\$(date +\%Y\%m\%d).sql"
EOF
chmod +x "$backup_script"
echo "La sauvegarde hebdomadaire est configurée au chemin suivant : $backup_path"

# Affichez l'URL pour se connecter à Synapse via Element
if [[ $yn == "public" ]]; then
    echo "Votre serveur Synapse est maintenant accessible depuis https://$domain"
else
    echo "Votre serveur Synapse est maintenant accessible sur le réseau interne à http://$domain:8008"
fi

echo "Installation et configuration terminées. Appuyez sur n'importe quelle touche pour continuer..."
read -n 1 -s -r
