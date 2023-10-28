
```
███████╗████████╗██████╗ ███████╗ █████╗ ███╗   ███╗██╗███╗   ██╗ ██████╗     ███████╗████████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔════╝     ██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
███████╗   ██║   ██████╔╝█████╗  ███████║██╔████╔██║██║██╔██╗ ██║██║  ███╗    ███████╗   ██║   ███████║   ██║   ██║██║   ██║██╔██╗ ██║
╚════██║   ██║   ██╔══██╗██╔══╝  ██╔══██║██║╚██╔╝██║██║██║╚██╗██║██║   ██║    ╚════██║   ██║   ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
███████║   ██║   ██║  ██║███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝    ███████║   ██║   ██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
```

![Bash Script](https://img.shields.io/badge/script-bash-green) 
![LINUX](https://img.shields.io/badge/Debian-LINUX-orange)

# Configuration et Utilisation du Serveur VNC et Tunnel SSH

Ce projet contient des scripts pour configurer un serveur VNC avec streaming audio sur une machine Linux, et établir un tunnel SSH depuis un Raspberry Pi pour accéder au serveur VNC et à l'audio.

## Structure des Dossiers

- `server/`: Contient les scripts pour la configuration et le lancement du serveur VNC sur la machine Linux.
- `viewer/`: Contient les scripts pour la configuration et le lancement du client VNC sur le Raspberry Pi.

## Détails des Scripts

### Serveur (machine Linux) :

- `server/setup_vnc_ssh.sh` :
  - Ce script installe les paquets nécessaires pour le serveur VNC, PulseAudio, et le serveur SSH.
  - Configure x11vnc avec un mot de passe.
  - Configure PulseAudio pour accepter les connexions réseau.
  - Génère une paire de clés SSH et copie la clé publique sur le Raspberry Pi pour l'authentification sans mot de passe.

- `server/raspberry_ssh_vnc.sh` :
  - Ce script lance le serveur VNC et PulseAudio.
  - Configure UFW (Uncomplicated Firewall) pour permettre uniquement les connexions au port 6554 (utilisé pour le VNC et SSH) depuis le Raspberry Pi.
  - Attends que le serveur VNC se termine avant de supprimer la règle UFW et d'arrêter PulseAudio.

### Viewer (Raspberry Pi) :

- `viewer/setup.sh` :
  - Ce script installe les paquets nécessaires pour le client VNC, le contrôleur de volume PulseAudio, et le client SSH sur le Raspberry Pi.

- `viewer/launch.sh` :
  - Ce script établit un tunnel SSH vers la machine Linux, redirigeant les ports nécessaires pour le VNC et l'audio.
  - Attends que l'utilisateur appuie sur Entrée pour fermer la connexion, puis ferme le tunnel SSH.


## 💎 Recommendations  

- [LNK reader](https://github.com/SECRET-GUEST/windows_link_reader): Permet de lire les raccourcis windows depuis un ordinateur linux, décodant les données binaires (donc c'est pas 100% fonctionnel)
- [File organizer ](https://github.com/SECRET-GUEST/file_organizer) : Un tool pour organiser les fichiers dans des dossiers selon leur extention, apres avoir utiliser un tool pour récuperer les fichiers notament.

Sinon voici une collection de petit scripts utiles pour tout et nimp :
- [Tiny Scripts](https://github.com/SECRET-GUEST/tiny-scripts)


## 📥 Installation

1. **Sur la machine Linux** :
   - Exécutez `server/setup_vnc_ssh.sh` pour configurer le serveur.
   - Exécutez `server/raspberry_ssh_vnc.sh` pour lancer le serveur VNC et PulseAudio.

2. **Sur le Raspberry Pi** :
   - Exécutez `viewer/setup.sh` pour configurer le client VNC.
   - Exécutez `viewer/launch.sh` pour établir la connexion tunnelisée via SSH et accéder au serveur VNC et à l'audio.



```
     _ ._  _ , _ ._            _ ._  _ , _ ._    _ ._  _ , _ ._      _ ._  _ , _ .__  _ , _ ._   ._  _ , _ ._   _ , _ ._   .---.  _ ._   _ , _ .__  _ , _ ._   ._  _ , _ ._      _ ._  _ , _ .__  _ , _ . .---<__. \ _
   (_ ' ( `  )_  .__)        (_ ' ( `  )_  .__ (_ ' ( `  )_  .__)  (_ '    ___   ._( `  )_  .__)  ( `  )_  .__)   )_  .__)/     \(_ ' (    )_  ._( `  )_  .__)  ( `  )_  .__)  (_ ' ( `  )_  ._( `` )_  . `---._  \ \ \
 ( (  (    )   `)  ) _)    ( (  (    )   `)  ) (  (    )   `)  ) _ (  (   (o o) )     )   `)  ) _    )   `)  ) _    `)  ) \.@-@./(  (    )   `)     )   `)  ) _    )   `)  ) _ (  (    )   `)         `) ` ),----`- `.))  
(__ (_   (_ . _) _) ,__)  (__ (_   (_ . _) _) _ (_   (_ . _) _) ,__ (_   (  V  ) _) (_ . _) _) ,_  (_ . _) _) ,_ . _) _) ,/`\_/`\ (_   (  . _) _) (_ . _) _) ,_  (_ . _) _) ,__ (_   (_ . _) _) (__. _) _)/ ,--.   )  |
    `~~`\ ' . /`~~`           `~~`\ ' . /`~~`   `~~`\ ' . /`~~`     `~~`/--m-m- ~~`\ ' . /`~~`   `\ ' . /`~~`  `\ ' . /  //  _  \\ ``\ '  . /`~~`\ ' . /`~~`   `\ ' . /`~~`     `~~`\ ' . /`~~`\ ' . /`~~/_/    >     |
         ;   ;                     ;   ;             ;   ;               ;   ;      ;   ;          ;   ;         ;   ;  | \     )|_   ;    ;      ;   ;          ;   ;               ;   ;      ;   ;    |,\__-'      |
         /   \                     /   \             /   \               /   \      /   \          /   \         /   \ /`\_`>  <_/ \  /    \      /   \          /   \               /   \      /   \     \__         \
________/_ __ \___________________/_ __ \___________/_ __ \______ __ ___/_ __ \____/_ __ \________/_ __ \_______/_ __ \\__/'---'\__/_/_  __ \____/_ __ \________/_ __ \_____ _______/_ __ \____/_ __ \____ __\___      )
```
