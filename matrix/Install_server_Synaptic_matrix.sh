#!/bin/bash

# Vérification des privilèges root
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté avec des privilèges de superutilisateur."
   exit 1
fi

# Mise à jour des paquets et installation des paquets nécessaires
echo "Mise à jour des paquets système et installation des dépendances..."
apt update && apt upgrade -y
apt install -y lsb-release wget apt-transport-https nginx ufw fail2ban

# Ajout du dépôt Matrix Synapse
echo "Ajout du dépôt Matrix Synapse et installation..."
wget -O /usr/share/keyrings/matrix-org-archive-keyring.gpg https://packages.matrix.org/debian/matrix-org-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/matrix-org-archive-keyring.gpg] https://packages.matrix.org/debian/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/matrix-org.list
apt update

# Installation de Synapse
if apt install -y matrix-synapse-py3; then
    echo "Matrix Synapse est installé avec succès."
else
    echo "Échec de l'installation de Matrix Synapse."
    exit 1
fi

# Activation du pare-feu UFW
ufw enable

# Configuration du pare-feu par défaut
ufw default deny incoming
ufw default allow outgoing

# Fonction de configuration de Nginx
configure_nginx() {
    echo "Configuration de Nginx..."
    local server_name=$1
    local nginx_config_path="/etc/nginx/sites-available/matrix"
    
    # Écriture de la configuration de Nginx dans le fichier
    cat > "$nginx_config_path" <<- EOF
server {
    listen 80;
    server_name $server_name;
    return 301 https://\$host\$request_uri;
}

server {
    listen 443 ssl;
    server_name $server_name;

    ssl_certificate /etc/letsencrypt/live/$server_name/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$server_name/privkey.pem;

    # Configuration HTTPS stricte
    add_header Strict-Transport-Security "max-age=31536000";

    location / {
        proxy_pass http://localhost:8008;
        proxy_set_header X-Forwarded-For \$remote_addr;
    }
}
EOF

    # Activation de la configuration de Nginx et rechargement du service
    ln -sf "$nginx_config_path" /etc/nginx/sites-enabled/
    systemctl reload nginx
}

# Choix de la configuration du serveur
echo "Voulez-vous configurer le serveur pour un accès public (Internet) ou seulement en réseau interne ?"
echo "1) Accès public avec HTTPS"
echo "2) Réseau interne seulement"
read -r -p "Entrez votre choix (1 ou 2) : " yn

case $yn in
    1)
        echo "Vous avez choisi un accès public pour le serveur."
        read -p "Entrez le nom de domaine de votre serveur Matrix (par exemple, matrix.example.com) : " domain

        # Installation de Certbot pour les certificats SSL
        apt install -y certbot python3-certbot-nginx

        # Obtention du certificat SSL
        certbot --nginx -d "$domain" || {
            echo "Certbot a échoué, création d'un certificat auto-signé."
            mkdir -p "/etc/letsencrypt/live/$domain"
            openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
            -keyout "/etc/letsencrypt/live/$domain/privkey.pem" \
            -out "/etc/letsencrypt/live/$domain/fullchain.pem" \
            -subj "/CN=$domain"
        }

        configure_nginx "$domain"

        # Autoriser le trafic HTTPS
        ufw allow 'Nginx Full'

        echo "Le serveur est maintenant accessible depuis https://$domain"
        ;;
    2)
        echo "Vous avez choisi une configuration de réseau interne."
        local_ip=$(hostname -I | cut -d' ' -f1)
        
        configure_nginx "$local_ip"

        # Autoriser le trafic interne sur le port 8008
        ufw allow from 192.168.0.0/16 to any port 8008
        ufw allow from 10.0.0.0/8 to any port 8008
        ufw allow from 172.16.0.0/12 to any port 8008

        echo "Votre serveur Synapse est maintenant accessible en réseau interne à l'adresse http://$local_ip:8008"
        ;;
      * )
        echo "Choix invalide, veuillez entrer 1 ou 2."
        ;;
    esac

# Planification des sauvegardes hebdomadaires de la base de données
backup_script="
#!/bin/bash
pg_dump matrix-synapse > /var/backups/matrix_backup_$(date +\%F).sql
"
echo "$backup_script" | sudo tee /etc/cron.weekly/matrix_backup.sh
sudo chmod +x /etc/cron.weekly/matrix_backup.sh

# Activation et démarrage de Synapse
systemctl enable matrix-synapse
systemctl start matrix-synapse

# Affichage de l'URL pour se connecter à Synapse via Element
if [[ $yn == 1 ]]; then
    echo "Votre serveur Synapse est maintenant accessible depuis Internet à l'adresse https://$domain"
fi

echo "L'installation de Synapse, Nginx, et le pare-feu est terminée."
echo "Appuyez sur n'importe quelle touche pour continuer..."
read -n 1 -s -r
