#!/bin/bash

# Ce script est destiné à être exécuté avec des privilèges de superutilisateur
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté avec des privilèges de superutilisateur."
   exit 1
fi

# Fonction pour démarrer le serveur Synapse
start_synapse() {
    echo "Démarrage du serveur Synapse..."
    systemctl start matrix-synapse
    systemctl start nginx
    echo "Le serveur Synapse est démarré et restera actif tant que ce script est ouvert."
}

# Fonction pour arrêter le serveur Synapse
stop_synapse() {
    echo "Arrêt du serveur Synapse..."
    systemctl stop matrix-synapse
    systemctl stop nginx
    echo "Le serveur Synapse a été arrêté."
}

# Fonction pour charger une base de données
load_database() {
    echo "Veuillez entrer l'URL de la base de données :"
    read -r db_url
    # Ajoutez ici la logique de validation de l'URL et de chargement de la base de données.
    echo "Si l'URL est valide, la base de données sera chargée ici."
}

# Fonction pour nettoyer avant de quitter
cleanup() {
    echo "Nettoyage et arrêt du serveur Synapse..."
    stop_synapse
    echo "Script terminé. Le serveur Synapse a été arrêté."
    exit 0
}

# Piège les signaux SIGINT et SIGTERM pour exécuter la fonction cleanup avant de quitter
trap cleanup SIGINT SIGTERM

# Menu principal
while true; do
    echo "Que souhaitez-vous faire ?"
    echo "1) Lancer le serveur Synapse"
    echo "2) Arrêter le serveur Synapse"
    echo "3) Charger une base de données"
    echo "4) Quitter"
    read -p "Sélectionnez une option : " choice

    case $choice in
        1)
            start_synapse
            # Attendez ici indéfiniment jusqu'à ce que l'utilisateur interrompe le script
            echo "Appuyez sur [CTRL+C] pour arrêter le serveur Synapse et quitter."
            while true; do sleep 1; done
            ;;
        2)
            stop_synapse
            ;;
        3)
            load_database
            ;;
        4)
            cleanup
            ;;
        *)
            echo "Choix invalide. Veuillez entrer 1, 2, 3 ou 4."
            ;;
    esac
done
