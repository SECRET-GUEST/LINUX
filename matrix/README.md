```
███╗   ███╗ █████╗ ████████╗██████╗ ██╗██╗  ██╗    ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ 
████╗ ████║██╔══██╗╚══██╔══╝██╔══██╗██║╚██╗██╔╝    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
██╔████╔██║███████║   ██║   ██████╔╝██║ ╚███╔╝     ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
██║╚██╔╝██║██╔══██║   ██║   ██╔══██╗██║ ██╔██╗     ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║██║██╔╝ ██╗    ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝    ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝
```
# Serveur Synapse pour Matrix

Ce dépôt contient un script pour faciliter l'installation, la configuration et la gestion d'un serveur Synapse de Matrix sur votre Raspberry Pi, et pour maintenir à jour le certificat SSL.

## 💎 Recommandations

Avant de lancer le script, assurez-vous que votre Raspberry Pi est à jour et que le nom de domaine souhaité pointe vers l'adresse IP de votre Pi.

## 🚀 Script d'installation et de configuration

### `install_server_synaptic_matrix.sh`

Ce script effectue les actions suivantes :
- Installe Synapse, Nginx, et Certbot.
- Configure Nginx pour servir Synapse en HTTPS.
- Configure le pare-feu UFW.
- Configure `.pgpass` pour une authentification automatique à PostgreSQL.
- Demande une confirmation pour le mot de passe de la base de données.
- Planifie une tâche cron pour la sauvegarde hebdomadaire de la base de données.

**Usage** :
```bash
chmod +x install_server_synaptic_matrix.sh
sudo ./install_server_synaptic_matrix.sh
```

**Notes** :
- Fournissez le nom de domaine de votre serveur Matrix lors de l'exécution.
- Si vous souhaitez une configuration en réseau interne, laissez le champ du nom de domaine vide.
- Le script demandera la confirmation du mot de passe de la base de données pour éviter les erreurs de saisie.
- Le script demandera le chemin de sauvegarde des données de la base de données.

## 🛠 Maintenance

### Renouvellement du certificat SSL

Le script `install_server_synaptic_matrix.sh` configure une tâche cron pour renouveler automatiquement le certificat SSL, mais au besoin (c'est déconseillé puisque certbot a une fonction pour éviter le flood) vous pouvez toujours utiliser le fichier pour en créer un nouveau.

## 📝 Notes Importantes

Exécutez le script en tant que superutilisateur (root) pour vous assurer qu'il peut effectuer toutes les opérations nécessaires sans restrictions de permissions.

Les scripts sont conçus pour faciliter l'installation et la maintenance du serveur Synapse sur le Raspberry Pi. Il est recommandé de comprendre le contenu du script avant de l'exécuter. N'hésitez pas à ajuster le script 
