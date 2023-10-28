![LINUX](https://img.shields.io/badge/LINUX-yellow)

```
██████╗  █████╗ ███████╗██████╗ ██████╗ ███████╗██████╗ ██████╗ ██╗   ██╗
██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
██████╔╝███████║███████╗██████╔╝██████╔╝█████╗  ██████╔╝██████╔╝ ╚████╔╝ 
██╔══██╗██╔══██║╚════██║██╔═══╝ ██╔══██╗██╔══╝  ██╔══██╗██╔══██╗  ╚██╔╝  
██║  ██║██║  ██║███████║██║     ██████╔╝███████╗██║  ██║██║  ██║   ██║   
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   
                                                                                                        
```

## Introduction

Bienvenue sur cette branche qui vise à faciliter l'installation du Raspberry Pi OS sur un Raspberry Pi. Ce guide vous accompagnera à travers les étapes nécessaires pour télécharger, installer et configurer Raspberry Pi OS sur votre Raspberry Pi.

### Étape 1 : Téléchargement de l'image du Raspberry Pi OS

1. Rendez-vous sur la [page de téléchargement du Raspberry Pi OS](https://www.raspberrypi.org/software/operating-systems/).
2. Téléchargez l'image correspondante à vos besoins. Raspberry Pi OS est disponible en trois variantes : Lite (sans environnement de bureau), Desktop (avec environnement de bureau) et Desktop avec applications recommandées.

### Étape 2 : Écriture de l'image sur une carte SD

Exécutez la commande suivante pour écrire l'image du Raspberry Pi OS sur votre carte SD :

```bash
unzip -p image-file.zip | sudo dd of=/dev/sdb bs=4M status=progress
```

**Notes**:
- Remplacez `image-file.zip` par le nom du fichier zip que vous avez téléchargé.
- Remplacez `sdb` par l'identifiant de votre carte SD.
- Pour trouver l'identifiant de votre carte SD, vous pouvez utiliser des outils tels que `lsblk`, `fdisk`, ou `gparted`.

### Étape 3 : Scripts de configuration

La suite du tutoriel se trouve dans les différents dossiers accompagnés de scripts. Nous partons du principe que les personnes souhaitant installer Raspberry Pi OS sont déjà familières avec Bash, car autrement, ce ne serait pas recommandé pour elles de procéder à cette installation.

Les scripts fournis sont généraux et peuvent nécessiter des modifications selon vos besoins spécifiques. Chaque script contient des explications détaillées sur les étapes qu'il effectue. Par exemple, le dossier `matrix` contient des scripts permettant de configurer un serveur Synapse pour Element.io, et ainsi de suite.

N'hésitez pas à explorer les dossiers et à modifier les scripts selon vos besoins pour personnaliser votre installation de Raspberry Pi OS sur votre Raspberry Pi.

## 💎 Recommendations

Vous pouvez utiliser [ce lanceur de script](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/launchers/script%20launcher) pour exécuter ces scripts facilement via un terminal. Ce truc liste tous les scripts du dossier et vous permet de choisir celui que vous souhaitez exécuter.

```
     .~~.   .~~.
    \ '. \ ' / .'
     .~ .~~~..~.
    : .~.'~'.~. :
   ~ (   ) (   ) ~
  ( : '~'.~.'~' : )
   ~ .~ (   ) ~. ~
    (  : '~' :  )
     ~ .~~~. ~
        '~'
```
