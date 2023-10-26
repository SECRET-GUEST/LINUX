#!/bin/bash

# Mettre à jour le package database
sudo apt-get update

# Installation des packages nécessaires
sudo apt-get install -y keyboard-configuration

# Configurer le layout du clavier en français
sudo sed -i 's/^XKBLAYOUT=.*/XKBLAYOUT="fr"/' /etc/default/keyboard

# Redémarrer le service keyboard-setup
sudo service keyboard-setup restart

# Configuration via dpkg-reconfigure
echo -e "pc105\nfr\n\n\n\n\n" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive dpkg-reconfigure keyboard-configuration -fnoninteractive

echo "Configuration du clavier terminée. Veuillez redémarrer votre système pour que les changements prennent effet."