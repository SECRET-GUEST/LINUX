```
███╗   ███╗ █████╗ ████████╗██████╗ ██╗██╗  ██╗    ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ 
████╗ ████║██╔══██╗╚══██╔══╝██╔══██╗██║╚██╗██╔╝    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
██╔████╔██║███████║   ██║   ██████╔╝██║ ╚███╔╝     ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
██║╚██╔╝██║██╔══██║   ██║   ██╔══██╗██║ ██╔██╗     ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║██║██╔╝ ██╗    ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝    ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝
```

# Serveur Synapse pour Matrix

Ce dossier contient des scripts qui facilitent l'installation, la gestion, et le renouvellement du certificat SSL pour un serveur Synapse de Matrix sur votre Raspberry Pi. Voici une description de chaque script et des instructions sur la manière de les utiliser.


## 💎 Recommendations

Vous pouvez utiliser [ce lanceur de script ](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/launchers/script%20launcher) pour exécuter ces scripts facilement via un terminal. Ce truc liste tous les scripts du dossier et vous permet de choisir celui que vous souhaitez exécuter.


## 1. Install_server_Synaptic_matrix.sh

Ce script automatise l'installation de Synapse, de Nginx, et de Certbot. Il configure également Nginx pour servir Synapse, obtient un certificat SSL avec Certbot, et configure le pare-feu UFW.

**Utilisation** :
```bash
chmod +x Install_server_Synaptic_matrix.sh
./Install_server_Synaptic_matrix.sh
```

**Notes** :
- Vous devrez fournir le nom de domaine de votre serveur Matrix lors de l'exécution du script.
- Assurez-vous que le nom de domaine pointe vers l'adresse IP de votre Raspberry Pi avant d'exécuter le script.

## 2. renew_cert.sh

Ce script permet de renouveler le certificat SSL de votre serveur. Il est conseillé de configurer une tâche cron pour exécuter ce script régulièrement.

**Utilisation** :
```bash
chmod +x renew_cert.sh
./renew_cert.sh
```

**Configurer une tâche Cron pour le renouvellement automatique** :
```bash
crontab -e
```
Ajoutez la ligne suivante pour renouveler le certificat tous les jours à 2h du matin :
```bash
0 2 * * * /chemin/vers/le/script/renew_cert.sh
```

## 3. start_server.sh

Ce script lance le serveur Synapse et Nginx, et crée un fichier de logs sur le bureau.

**Utilisation** :
```bash
chmod +x start_server.sh
./start_server.sh
```

**Notes** :
- Ce script doit être exécuté chaque fois que vous souhaitez démarrer votre serveur Synapse.
- Un fichier `error.logs` sera créé sur votre bureau, qui contiendra les logs du serveur.

---

Ces scripts simplifient grandement le processus d'installation et de gestion de votre serveur Synapse sur Raspberry Pi. Assurez-vous de lire et de comprendre les scripts avant de les exécuter, et n'hésitez pas à les modifier selon vos besoins spécifiques.
