#!/bin/bash

# Vérifie si le script est exécuté en tant que root
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant que root" 
   exit 1
fi

# Renouvelle le certificat
sudo certbot renew

# Recharge la configuration de Nginx pour utiliser le nouveau certificat
sudo systemctl reload nginx

# Vérifiez si Nginx fonctionne après le rechargement
if systemctl is-active --quiet nginx; then
    echo "Le certificat a été renouvelé et Nginx a été rechargé avec succès."
else
    echo "Il y a eu un problème lors du rechargement de Nginx. Veuillez vérifier manuellement."
fi#!/bin/bash
