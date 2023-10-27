![LINUX](https://img.shields.io/badge/LINUX-yellow)

```
██╗  ██╗ █████╗ ██╗     ██╗    ██████╗  █████╗ ███████╗██████╗ ██████╗ ███████╗██████╗ ██████╗ ██╗   ██╗
██║ ██╔╝██╔══██╗██║     ██║    ██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
█████╔╝ ███████║██║     ██║    ██████╔╝███████║███████╗██████╔╝██████╔╝█████╗  ██████╔╝██████╔╝ ╚████╔╝ 
██╔═██╗ ██╔══██║██║     ██║    ██╔══██╗██╔══██║╚════██║██╔═══╝ ██╔══██╗██╔══╝  ██╔══██╗██╔══██╗  ╚██╔╝  
██║  ██╗██║  ██║███████╗██║    ██║  ██║██║  ██║███████║██║     ██████╔╝███████╗██║  ██║██║  ██║   ██║   
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   
                                                                                                        
```

## Introduction

Bienvenue sur cette branche qui vise à faciliter l'installation de Kali Linux sur un Raspberry Pi. Ce guide vous accompagnera à travers les étapes nécessaires pour télécharger, installer et configurer Kali Linux sur votre Raspberry Pi.

### Étape 1 : Téléchargement de l'image de Kali Linux

1. Rendez-vous sur la [page de téléchargement de Kali Linux](https://www.kali.org/get-kali/#kali-arm).
2. Téléchargez l'image correspondante à votre modèle de Raspberry Pi. Par exemple, pour un Raspberry Pi avec 8 Go de RAM, il est recommandé de télécharger une image avec une architecture 64 bits car les versions 32 bits ne peuvent pas gérer plus de 4 Go de RAM.

### Étape 2 : Écriture de l'image sur une carte SD

Exécutez la commande suivante pour écrire l'image de Kali Linux sur votre carte SD :

```bash
$ xzcat kali-linux-2023.3-raspberry-pi-armhf.img.xz | sudo dd of=/dev/sdb bs=4M status=progress
```

**Notes**:
- Remplacez `sdb` par l'identifiant de votre carte SD.
- Pour trouver l'identifiant de votre carte SD, vous pouvez utiliser des outils tels que `lsblk`, `fdisk`, ou `gparted`.

### Étape 3 : Scripts de configuration

La suite du tutoriel se trouve dans les différents dossiers accompagnés de scripts. Nous partons du principe que les personnes souhaitant installer Kali Linux sont déjà familières avec Bash, car autrement, ce ne serait pas recommandé pour elles de procéder à cette installation.

Les scripts fournis sont généraux et peuvent nécessiter des modifications selon vos besoins spécifiques. Chaque script contient des explications détaillées sur les étapes qu'il effectue.

N'hésitez pas à explorer les dossiers et à modifier les scripts selon vos besoins pour personnaliser votre installation de Kali Linux sur votre Raspberry Pi.

## 💎 Recommendations

Vous pouvez utiliser [ce lanceur de script ](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/launchers/script%20launcher) pour exécuter ces scripts facilement via un terminal. Ce truc liste tous les scripts du dossier et vous permet de choisir celui que vous souhaitez exécuter.


```
..............            
            ..,;:ccc,.        
          ......''';lxO.                          
.....''''..........,:ld;         
           .';;;:::;,,.x,            
      ..'''.            0Xxoc:,.  ...     
  ....                ,ONkc;,;cokOdc',.     
 .                   OMo           ':ddo.   
                    dMc               :OO;      
                    0M.                 .:o.    
                    ;Wd                       
                     ;XO,                  
                       ,d0Odlc;,..           
                           ..',;:cdOOd::,.    
                                    .:d;.':;.   
                                       'd,  .'     
                                         ;l   ..  
                                          .o
                                            c                              
                                            .'                             
                                             .


```
