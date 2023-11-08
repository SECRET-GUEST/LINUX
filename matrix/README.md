```
███╗   ███╗ █████╗ ████████╗██████╗ ██╗██╗  ██╗    ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ 
████╗ ████║██╔══██╗╚══██╔══╝██╔══██╗██║╚██╗██╔╝    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
██╔████╔██║███████║   ██║   ██████╔╝██║ ╚███╔╝     ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
██║╚██╔╝██║██╔══██║   ██║   ██╔══██╗██║ ██╔██╗     ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║██║██╔╝ ██╗    ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝    ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝
```

# Serveur Synapse pour Matrix

Ce dépôt contient des scripts pour faciliter l'installation et la gestion d'un serveur Synapse de Matrix sur votre Raspberry Pi, ainsi que pour maintenir à jour le certificat SSL.

## 💎 Recommandations

Pour une exécution facile de ces scripts via un terminal, envisagez d'utiliser [ce lanceur de scripts](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/launchers/script%20launcher). Cela vous permettra de lister et d'exécuter des scripts spécifiques directement.

## Scripts

### 1. `install_server_synaptic_matrix.sh`

Ce script installe Synapse, Nginx, et Certbot. Il configure Nginx pour servir Synapse sur HTTPS et met en place le pare-feu UFW.

**Usage** :
```bash
chmod +x install_server_synaptic_matrix.sh
./install_server_synaptic_matrix.sh
```

**Notes** :
- Fournissez le nom de domaine de votre serveur Matrix lors de l'exécution.
- Le nom de domaine doit pointer vers l'IP de votre Raspberry Pi avant de lancer le script.

### 2. `start_server.sh`

Ce script démarre le serveur Synapse. Il offre un menu interactif pour démarrer/arrêter le serveur ou charger une base de données. Le serveur reste actif tant que le script est ouvert.

**Usage** :
```bash
chmod +x start_server.sh
./start_server.sh
```

**Notes** :
- Sélectionnez '1' pour démarrer, '2' pour arrêter, '3' pour charger une base de données.
- Le serveur s'arrêtera si vous fermez le terminal ou le script.

### 3. `renew_cert.sh`

Ce script renouvelle le certificat SSL. Planifiez une tâche cron pour automatiser ce processus.

**Usage** :
```bash
chmod +x renew_cert.sh
./renew_cert.sh
```

**Planifier avec Cron** :
```bash
crontab -e
```
Ajoutez cette ligne pour renouveler quotidiennement à 2h du matin :
```bash
0 2 * * * /path/to/script/renew_cert.sh
```

## 📝 Note Importante

Avant de démarrer le serveur avec `start_server.sh`, assurez-vous que l'installation avec `install_server_synaptic_matrix.sh` a été réalisée avec succès. Les scripts doivent être exécutés avec des privilèges de superutilisateur.

Les scripts facilitent l'installation et la maintenance du serveur Synapse sur le Raspberry Pi. Veuillez vous assurer de comprendre leur contenu avant de les exécuter. N'hésitez pas à les modifier pour répondre à vos besoins spécifiques.
