#!/bin/bash

# Ce script est destiné à être exécuté avec des privilèges de superutilisateur
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté avec des privilèges de superutilisateur."
   exit 1
fi

# Mise à jour des paquets et installation des paquets nécessaires
if apt update && apt upgrade -y; then
    apt install -y lsb-release wget apt-transport-https nginx ufw fail2ban
else
    echo "Échec de la mise à jour des paquets, vérifiez votre connexion Internet ou les sources de paquets."
    exit 1
fi

# Configuration de Synapse
if wget -O /usr/share/keyrings/matrix-org-archive-keyring.gpg https://packages.matrix.org/debian/matrix-org-archive-keyring.gpg &&
   echo "deb [signed-by=/usr/share/keyrings/matrix-org-archive-keyring.gpg] https://packages.matrix.org/debian/ $(lsb_release -cs) main" |
   tee /etc/apt/sources.list.d/matrix-org.list &&
   apt update &&
   apt install -y matrix-synapse-py3; then
    echo "Synapse est installé."
else
    echo "Échec de l'installation de Synapse."
    exit 1
fi

# Activation du pare-feu UFW
ufw enable

# Configuration initiale du pare-feu
ufw default deny incoming
ufw default allow outgoing

# Choix de configuration
echo "Comment souhaitez-vous configurer votre serveur Synapse ?"
echo "1) Ouvrir le serveur à Internet avec un accès HTTPS sécurisé."
echo "2) Fonctionner uniquement en réseau interne."
echo -n "Entrez 1 ou 2 pour votre choix : "

while :
do
    read -r yn
    case $yn in
        1 )
            echo "Configuration pour un accès ouvert à Internet."
            read -p "Entrez le nom de domaine de votre serveur Matrix (par exemple, matrix.example.com) : " domain
            if apt install -y certbot python3-certbot-nginx && 
               certbot --nginx -d "$domain"; then
                echo "Certbot a réussi à obtenir un certificat SSL."
            else
                echo "Certbot a échoué, génération d'un certificat auto-signé."
                mkdir -p "/etc/letsencrypt/live/$domain"
                openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
                -keyout "/etc/letsencrypt/live/$domain/privkey.pem" \
                -out "/etc/letsencrypt/live/$domain/fullchain.pem" \
                -subj "/CN=$domain"
            fi
            # Configuration de Nginx pour Synapse avec HTTPS strict
            configure_nginx
            # Autoriser le trafic HTTPS de n'importe où
            ufw allow 443/tcp
            ufw allow 80/tcp
            break
            ;;
        2 )
            echo "Configuration pour un fonctionnement en réseau interne uniquement."
            # L'adresse IP locale sera utilisée pour accéder à Synapse
            local_ip=$(hostname -I | awk '{print $1}')
            # Configuration de Nginx pour Synapse avec HTTPS strict
            configure_nginx
            # Autoriser le trafic interne uniquement
            ufw allow from 192.168.0.0/16 to any port 8008
            ufw allow from 10.0.0.0/8 to any port 8008
            ufw allow from 172.16.0.0/12 to any port 8008
            break
            ;;
        * )
            echo "Choix invalide, veuillez entrer 1 ou 2."
            ;;
    esac
done

# Fonction de configuration de Nginx
configure_nginx() {
    echo "Configuration de Nginx..."
    nginx_config="
    server {
        listen 80;
        server_name $domain;
        return 301 https://\$host\$request_uri;
    }

    server {
        listen 443 ssl;
        server_name $domain;

        ssl_certificate /etc/letsencrypt/live/$domain/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/$domain/privkey.pem;

        # Configuration HTTPS stricte
        add_header Strict-Transport-Security \"max-age=31536000\";

        location / {
            proxy_pass http://localhost:8008;
            proxy_set_header X-Forwarded-For \$remote_addr;
        }
    }
    "
    echo "$nginx_config" | tee /etc/nginx/sites-available/matrix
    ln -s /etc/nginx/sites-available/matrix /etc/nginx/sites-enabled
    systemctl reload nginx
}

# Activation et démarrage de Synapse
systemctl enable matrix-synapse
systemctl start matrix-synapse

# Affichage de l'URL pour se connecter à Synapse via Element
if [[ $yn == 1 ]]; then
    echo "Votre serveur Synapse est maintenant accessible depuis Internet à l'adresse https://$domain"
elif [[ $yn == 2 ]]; then
    echo "Votre serveur Synapse est maintenant accessible en réseau interne à l'adresse http://$local_ip:8008"
fi

echo "L'installation de Synapse, Nginx, et le pare-feu est terminée. Veuillez utiliser l'URL ci-dessus pour vous connecter via Element."
