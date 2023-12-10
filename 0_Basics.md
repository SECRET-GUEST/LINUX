# SOMMAIRE

## [Guide des distributions Linux](#guide-des-environnements-de-bureau-pour-ubuntudebian)

1. [Environnements de Bureau Alternatifs](#environnements-de-bureau-alternatifs)
2. [Autres Distributions](#autres-distributions) 


## [Guide des Navigateurs de Fichiers pour Ubuntu/Debian](#guide-des-navigateurs-de-fichiers-pour-ubuntudebian)

1. [Changer de Navigateur de Fichiers](#changer-de-navigateur-de-fichiers)
2. [Comparaison des Navigateurs](#comparaison-des-navigateurs)

## [Guide des bases de Linux](#guide-des-bases-de-linux)

1. [Introduction et Ressources](#introduction-et-ressources)
2. [Mise à jour du système](#mise-à-jour-du-système)
3. [Installation de logiciels et Paquets Debian](#installation-de-logiciels-et-paquets-debian)
4. [Navigation dans le système de fichiers](#navigation-dans-le-système-de-fichiers)

## [Guide sur la cybersécurité du système](#guide-sur-la-cybersécurité-du-système)

1. [Sécurité du mot de passe root](#sécurité-du-mot-de-passe-root)
2. [Sécurisation du DNS avec Quad9](#sécurisation-du-dns-avec-quad9)
3. [Activation des Mises à Jour Automatiques](#activation-des-mises-à-jour-automatiques)
4. [Autres Astuces de Sécurité](#autres-astuces-de-sécurité)
5. [Pare-feu et outils de sécurité](#pare-feu-et-outils-de-sécurité)
6. [Mesures de sécurité avancées](#mesures-de-sécurité-avancées)


## [Guide des Raccourcis sur Ubuntu/Debian](#guide-des-raccourcis-sur-ubuntudebian)

1. [Raccourcis Clavier](#raccourcis-clavier)
2. [Menu Contextuel de Nautilus](#menu-contextuel-de-nautilus)
3. [Exécuter des Scripts via le Menu Contextuel](#exécuter-des-scripts-via-le-menu-contextuel)


## [Guide d'Installation d'Applications sur Ubuntu/Debian](#guide-dinstallation-dapplications-sur-ubuntudebian)

1. [Créer une Application sur le Bureau ou dans le Menu des Applications](#créer-une-application-sur-le-bureau-ou-dans-le-menu-des-applications)
2. [Installer des Paquets `.deb`](#installer-des-paquets-deb)
3. [Installer des Archives `tar.gz`](#installer-des-archives-targz)
4. [Installer un Éditeur de Texte (Vim)](#installer-un-éditeur-de-texte-vim)
5. [Définir Brave ou un autre Navigateur comme Navigateur par Défaut](#définir-brave-ou-un-autre-navigateur-comme-navigateur-par-défaut)
6. [Installation et Configuration d'OpenRGB](#installation-et-configuration-dopenrgb)

## [Guide de Maintenance](#guide-de-maintenance)

1. [Maintenance de Syslog](#maintenance-de-syslog)
2. [Sauvegarde et Restauration des Données](#sauvegarde-et-restauration-des-données)
3. [Autres Méthodes de Sauvegarde et Restauration](#autres-méthodes-de-sauvegarde-et-restauration)

## [Guide du partage de données](#guide-du-partage-de-données)

1. [Configuration du Serveur avec RealVNC](#configuration-du-serveur-avec-realvnc)

---
---
---
---
---
```markdown
 _ _ _ ____ ____ _  _ ____ ___  ____ ____ ____ 
 | | | |  | |__/ |_/  [__  |__] |__| |    |___ 
 |_|_| |__| |  \ | \_ ___] |    |  | |___ |___ 
```

# Guide des Environnements de Bureau pour Ubuntu/Debian

Ce guide est destiné aux utilisateurs des distributions **Ubuntu** / **Debian** basées sur **GNOME** / **Nautilus**. Si c'est votre système et que vous ne comptez pas changer, sautez directement à la section [Raccourcis](#raccourcis).

Linux, étant hautement personnalisable, nécessite parfois un certain investissement en temps pour l'adapter à vos besoins. Ubuntu, en particulier, est une solution "clé en main" simplifiée, mais d'autres environnements de travail existent et peuvent être explorés.

## Environnements de Bureau Alternatifs

### KDE Plasma 

###   ![Niveau](https://img.shields.io/badge/Niveau-Moyen%20%2F%20Débutant-blue)

Permet de tout personnaliser facilement.
```bash
sudo apt install kde-plasma-desktop
reboot
# Pour supprimer les anciens environnements de bureau (faites attention à ne pas supprimer des composants importants) :
sudo apt remove --purge ubuntu-desktop gnome-desktop
```

### i3 

### ![Niveau](https://img.shields.io/badge/Niveau-Confirmé-orange)

Gestion entièrement au clavier, idéal pour se passer de la souris. [Documentation](https://i3wm.org/docs/)
```bash
sudo apt install i3
```


## Autres Distributions

Vous pouvez également vous tourner vers d'autres distributions, voici un site pouvant vous aider à faire votre choix : 

https://distrochooser.de/fr/

Sinon voici également d'autres distributions moins connue mais convenant parfaitement à des débutants :

### Terminal First
1. **Raspberry Pi OS Lite** (pour Raspberry Pi) - [Site Officiel](https://www.raspberrypi.org/software/operating-systems/)
2. **Slackware** (Stabilité et simplicité) - [Site Officiel](https://www.slackware.com/getslack/)
3. **CentOS Stream** (Développement et déploiement d'applications, version rolling-release de CentOS) - [Site Officiel](https://www.centos.org/download/)

### Cyber Sec
1. **QubeOS** (Tout en sandbox) - [Site Officiel](https://www.qubes-os.org/)
2. **Kali Linux** (Sécurité offensive) - [Site Officiel](https://www.kali.org/get-kali/#kali-platforms)
3. **Black Arch** (Pas fait pour vous) - [Site Officiel](https://blackarch.org/)

### Brain Damage
1. **Arch** (Tout installer via un terminal, de 0) - [Site Officiel](https://archlinux.fr/)
2. **Gentoo** (De 0 en compilant soi-même) - [Site Officiel](https://www.gentoo.org/)
3. **Linux from Scratch** (Inventer l'os) - [Site Officiel](http://fr.linuxfromscratch.org/)

![image](https://github.com/SECRET-GUEST/LINUX/assets/92639080/3545f54c-10fb-4b60-ad0b-4ca9b21fb710)


## Raccourcis
Si vous optez pour un autre environnement que GNOME, ce guide ne vous sera d'aucune utilité.











---
---
---
```markdown
 _  _ ____ _  _ _ ____ ____ ___ ____ ____ ____ 
 |\ | |__| |  | | | __ |__|  |  |  | |__/ [__  
 | \| |  |  \/  | |__] |  |  |  |__| |  \ ___] 
```

[Retour au Sommaire](#sommaire) 

# Guide des Navigateurs de Fichiers pour Ubuntu/Debian

Après avoir choisi votre environnement de bureau, vous pouvez également envisager de changer de navigateur de fichiers. Bien que Nautilus soit le choix par défaut sur GNOME/Ubuntu, d'autres options comme **Dolphin** peuvent offrir plus de personnalisation et de fonctionnalités.

## Changer de Navigateur de Fichiers

### Installer Dolphin

###  ![Compatibilité](https://img.shields.io/badge/Compatibilité-GNOME%20Ubuntu-blue)

Dolphin est un navigateur de fichiers puissant et personnalisable. Voici comment le remplacer par Nautilus :

```bash
sudo apt install dolphin
xdg-mime default org.kde.dolphin.desktop inode/directory
```

### Revenir à Nautilus

```bash
xdg-mime default org.gnome.Nautilus.desktop inode/directory
```

## Comparaison des Navigateurs

### Pourquoi Dolphin ?

###  ![Personnalisation](https://img.shields.io/badge/Personnalisation-Extrême-green)

- **Personnalisation extrême** sans utilisation de logiciels tiers.
- Pas besoin d'utiliser `ctrl + L` pour naviguer.

### Pourquoi Nautilus ?

###  ![Intuitivité](https://img.shields.io/badge/Intuitivité-Élevée-green)

- Création d'onglets et de "dossiers favoris".
- Interface soignée et intuitive.
- Déplacement facile des dossiers vers la barre directionnelle pour ajouter des dossiers en tant que signets.
- Navigation rapide en cliquant sur les éléments de la barre de chemin.
- Appuyez sur `ctrl + L` pour voir ou modifier l'adresse complète (évitez d'utiliser la loupe, elle est pour la recherche de fichiers dans le répertoire ouvert).

## Raccourcis

Si vous choisissez un autre navigateur que Nautilus, la section sur les raccourcis ne vous sera pas utile.













---
---
---
```markdown
___  ____ ____ _ ____ ____ 
|__] |__| [__  | |    [__  
|__] |  | ___] | |___ ___] 
```
[Retour au Sommaire](#sommaire) 

# Guide des bases de Linux

## Introduction

Bienvenue dans le monde de Linux et d'Ubuntu. Avant de commencer, assurez-vous de consulter la [documentation officielle d'Ubuntu](https://ubuntu.com/tutorials) et les [forums d'Ubuntu](https://ubuntuforums.org/) pour des ressources et des supports supplémentaires.

## Mise à jour du système

La première étape consiste à mettre à jour votre système. Ouvrez le terminal et exécutez :
```
sudo apt update && sudo apt upgrade
```

## Installation de logiciels : Préférez les paquets Debian

Pour installer des logiciels, il est conseillé d'utiliser les paquets Debian plutôt que Snap. Pour plus de détails, consultez le [Guide d'Installation d'Applications sur Ubuntu/Debian](#guide-dinstallation-dapplications-sur-ubuntudebian).

### Installation de Neofetch et Tree
```
sudo apt install neofetch tree
neofetch
```

### Utilisation de Tree
Après l'installation de `tree`, vous pouvez visualiser la structure de vos répertoires de la manière suivante :
```
tree [nom_du_dossier]
```
Cela affichera une structure arborescente des répertoires et sous-répertoires, par exemple :
```
.
├── Documents
│   └── file1.txt
└── Pictures
    └── photo.jpg
```

## Navigation dans le système de fichiers


Maîtriser les commandes de base pour la navigation et la gestion de fichiers est crucial dans un environnement Linux. Vous trouverez ci-dessous une liste de commandes essentielles qui vous aideront à travailler efficacement dans ce système. 

Ne vous laissez pas intimider par la longueur de cette liste ! Chaque commande a son utilité et, avec le temps, vous vous retrouverez à les utiliser fréquemment. Si vous débutez, ne vous inquiétez pas de mémoriser toutes ces commandes immédiatement. 


- `ls` : Liste les fichiers et dossiers du répertoire courant.
   - Options utiles :
     - `-l` : Affiche les détails des fichiers et dossiers.
     - `-a` : Affiche tous les fichiers et dossiers, y compris les fichiers cachés.
     - `-h` : Affiche les tailles de fichier de manière lisible.
     - 
- `cd [nom_du_dossier]` : Change de répertoire.
- `pwd` : Affiche le chemin du répertoire courant.
- `mkdir [nom_du_dossier]` : Crée un nouveau dossier.
- `rmdir [nom_du_dossier]` : Supprime un dossier vide.
- `rm [nom_du_fichier]` : Supprime un fichier.
   - Options utiles :
     - `-r` ou `-R` : Supprime récursivement des dossiers et leurs contenus.
     - `-f` : Force la suppression sans demander de confirmation.
- `cp [source] [destination]` : Copie des fichiers ou des dossiers.
   - Options utiles :
     - `-r` : Copie récursivement des dossiers et leurs contenus.

- `mv [source] [destination]` : Déplace ou renomme des fichiers ou des dossiers.
- 
- `touch [nom_du_fichier]` : Crée un nouveau fichier vide ou met à jour la date de modification d'un fichier existant.

- `cat [nom_du_fichier]` : Affiche le contenu d'un fichier texte.
- `vim [nom_du_fichier]` : Ouvre un fichier dans l'éditeur de texte vim.
- `chmod [permissions] [nom_du_fichier_ou_dossier]` : Change les permissions d'un fichier ou d'un dossier.

- `chown [utilisateur]:[groupe] [nom_du_fichier_ou_dossier]` : Change le propriétaire et le groupe d'un fichier ou d'un dossier.

- `find [chemin] -name [nom_du_fichier_ou_dossier]` : Recherche des fichiers ou des dossiers par nom.
 
- `grep [motif] [nom_du_fichier]` : Recherche un motif dans un fichier.
- `df -h` : Affiche l'espace disque utilisé et disponible.
- `du -sh [nom_du_dossier]` : Affiche l'espace disque utilisé par un dossier.
- `ps aux` : Affiche la liste des processus en cours d'exécution.
- `top` : Affiche les processus en temps réel, triés par utilisation du processeur.
- `kill [ID_du_processus]` : Termine un processus.

En vous familiarisant avec ces commandes, vous pourrez naviguer et gérer vos fichiers et dossiers efficacement dans un environnement Linux.

Revenez à ce guide quand vous en avez besoin, et vous constaterez que l'utilisation de ces commandes deviendra une seconde nature.







---
---
---
```markdown
____ _   _ ___  ____ ____ ____ ____ ____ 
|     \_/  |__] |___ |__/ [__  |___ |    
|___   |   |__] |___ |  \ ___] |___ |___ 
```
[Retour au Sommaire](#sommaire) 

# Guide sur la cybersécurité du système

La cybersécurité est essentielle pour protéger les systèmes, réseaux et programmes informatiques contre les attaques numériques. Elle vise à protéger l'intégrité, la confidentialité, et la disponibilité des données. Dans ce guide, nous explorerons diverses mesures, outils et astuces pour renforcer la sécurité de votre système Ubuntu.

### Sécurité du mot de passe root
Pour renforcer la sécurité de votre système, désactivez le compte root :
```sh
sudo passwd -l root
sudo visudo
```
Commentez la ligne de root :
```sh
# root   ALL=(ALL:ALL) ALL
```

### Sécurisation du DNS avec Quad9

Pour sécuriser votre DNS avec Quad9 sur Ubuntu, vous pouvez soit utiliser l'interface graphique (GUI), soit modifier manuellement les fichiers de configuration (déconseillé).

#### Via l'Interface Utilisateur Graphique (GUI) :

1. Appuyez sur la touche `Super` (touche Windows) et tapez `Réseau` ou `Network` dans la recherche.
2. Sélectionnez votre connexion actuelle (Wi-Fi ou Ethernet) dans les paramètres du réseau.

Ensuite, configurez les paramètres DNS comme suit:

| Méthode            | IPv4                  | IPv6              |
|--------------------|-----------------------|-------------------|
| Automatique (DHCP) | 9.9.9.9, 149.112.112.112 | 2620:fe::fe, 2620:fe::9 |


#### Méthode Manuelle (déconseillée) :

La modification directe du fichier `/etc/resolv.conf` est déconseillée car il est géré par `systemd-resolved` et peut être réinitialisé automatiquement en plus de provoquer des conflits avec le gestionnaire de réseau d'Ubuntu et doit être effectuée avec prudence.

```sh
sudo vim /etc/resolv.conf
```
Si nécessaire, remplacez les serveurs DNS par:
```sh
nameserver 9.9.9.9
nameserver 149.112.112.112
```


### Activation des Mises à Jour Automatiques
Mettre en place les mises à jour automatiques pour toujours bénéficier des derniers correctifs de sécurité :
```sh
sudo apt install unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades
```
Sélectionnez "<Yes>" lorsqu'il vous sera demandé d'activer les mises à jour automatiques.

### Autres Astuces de Sécurité
- **Audit régulier du système :** Exécutez régulièrement des outils d'audit de sécurité tels que Lynis pour identifier et corriger les vulnérabilités.
- **Restriction des privilèges :** Utilisez le principe du moindre privilège et n'accordez les droits d'administration qu'aux utilisateurs qui en ont besoin.
- **Méthodes d'authentification robustes :** Mettez en place une authentification à deux facteurs et utilisez des clés SSH pour les connexions à distance.

### Pare-feu et outils de sécurité

La sécurisation de votre système est cruciale, et Ubuntu propose plusieurs outils pour vous aider dans cette tâche. Bien que ces outils ne soient pas obligatoires, leur utilisation peut grandement contribuer à la protection de votre système.

#### UFW (Uncomplicated Firewall)

UFW est un pare-feu simple et intuitif, idéal pour ceux qui débutent avec la gestion de pare-feu.

Pour activer UFW :
```sh
sudo ufw enable
```

| Avantages | Inconvénients |
|-----------|---------------|
| Facilité d'utilisation. | Moins de fonctionnalités avancées. |
| Bonne documentation et support communautaire. | |

#### RKHunter (Rootkit Hunter)

RKHunter est un scanner de rootkits qui aide à détecter la présence de rootkits sur votre système.

Pour installer et utiliser RKHunter :
```sh
sudo apt install rkhunter
sudo rkhunter --check --skip-keypress
```

| Avantages | Inconvénients |
|-----------|---------------|
| Peut détecter de nombreux rootkits, backdoors et exploits possibles. | Faux positifs possibles, nécessitant une analyse plus approfondie. |
| Mises à jour régulières de la base de données de rootkits. | |

#### ClamAV

ClamAV est un moteur antivirus pour Linux.

Pour installer et utiliser ClamAV :
```sh
sudo apt install clamav clamav-daemon
sudo freshclam
sudo clamscan -r /home
```

| Avantages | Inconvénients |
|-----------|---------------|
| Open source et gratuit. | Moins efficace contre les menaces zero-day par rapport aux solutions payantes. |
| Mises à jour régulières de la base de données de virus. | Performances système possiblement affectées pendant les scans. |

### Mesures de sécurité avancées

#### Chiffrement complet du disque

Protégez vos données en cas de vol physique de l'ordinateur en utilisant le chiffrement du disque lors de l'installation d'Ubuntu. Pour plus d'informations, consultez la [documentation Ubuntu](https://help.ubuntu.com/community/Full_Disk_Encryption_Howto).

#### Firejail

Firejail est un outil de sandboxing qui permet d'isoler les applications.

Pour installer Firejail :
```sh
sudo apt install firejail
```

| Avantages | Inconvénients |
|-----------|---------------|
| Isolation efficace des applications. | Peut être complexe à configurer. |
| Réduit les risques d'attaque réseau. | |

Plus d'informations : [Firejail Documentation](https://firejail.wordpress.com/documentation-2/)

#### Lynis

Lynis est un outil d'audit de sécurité pour les systèmes Unix.

Pour installer et utiliser Lynis :
```sh
sudo apt install lynis
sudo lynis audit system
```

| Avantages | Inconvénients |
|-----------|---------------|
| Fournit des recommandations d'amélioration. | Les résultats nécessitent une interprétation et une analyse. |
| Mises à jour régulières. | |

Plus d'informations : [Lynis Documentation](https://cisofy.com/documentation/lynis/get-started/)

#### OpenVAS

OpenVAS est un framework d'analyse de vulnérabilités.

Pour installer et utiliser OpenVAS :
```sh
sudo apt install openvas
sudo openvas-setup
```

| Avantages | Inconvénients |
|-----------|---------------|
| Identification de nombreuses vulnérabilités de sécurité. | Complexité et durée de la configuration et de l'analyse. |
| Scans approfondis. | |

Plus d'informations : [OpenVAS Documentation](https://docs.greenbone.net/)

#### Grsecurity

Grsecurity est une série de patches pour le noyau Linux visant à améliorer sa sécurité.

| Avantages | Inconvénients |
|-----------|---------------|
| Protection renforcée du kernel. | Peut être difficile à installer et à configurer. |
| Renforce l'isolation entre les utilisateurs. | |

Plus d'informations : [Grsecurity Documentation](https://en.wikibooks.org/wiki/Grsecurity)

#### AIDE (Advanced Intrusion Detection Environment)

AIDE est un outil de vérification de l'intégrité des fichiers.

Pour installer et utiliser AIDE :
```sh
sudo apt install aide
sudo aideinit
```

| Avantages | Inconvénients |
|-----------|---------------|
| Détecte les modifications non autorisées de fichiers. | Peut générer de faux positifs. |
| Personnalisable. | Nécessite une configuration soigneuse. |

Plus d'informations : [AIDE Manual](https://aide.github.io/manual.html)



---
---
---
```markdown
 ____ ____ ____ ____ ____ _  _ ____ ____ _ ____ 
 |__/ |__| |    |    |  | |  | |__/ |    | [__  
 |  \ |  | |___ |___ |__| |__| |  \ |___ | ___] 
```

[Retour au Sommaire](#sommaire) 



# Guide des Raccourcis sur Ubuntu/Debian

Les raccourcis permettent une gestion plus rapide du système. Par exemple, lorsqu'on télécharge un logiciel, il faut répéter dans un terminal les commandes suivantes :

```bash
sudo apt-get update         # met à jour le système
sudo apt-get upgrade        # upgrade les paquets
sudo apt-get dist-upgrade   # vérifie les mise à jour 
```

`sudo` est l'abréviation de "super utilisateur doit faire...", plus exactement, on autorise le système à faire les choses qui requièrent des permissions.

Bref, c'est plus intéressant d'appuyer sur 2 touches pour faire tout ça **Windows + U**, et c'est en ça que ce tuto consiste.



## Raccourcis Clavier

1. Appuyez sur la touche `Super` (Windows) et tapez "raccourcis", puis appuyez sur `Entrée`.
2. Explorez et personnalisez les raccourcis existants.
3. Création de raccourcis personnalisés :
    - **Moniteur Système** (équivalent de Ctrl + Alt + Suppr sur Windows) :
        ```bash
        gnome-system-monitor
        ```
    - **Ouvrir un Dossier Spécifique** :
        ```bash
        nautilus "/path/vers/le/dossier"
        ```
    - **Navigation Incognito avec Brave ou Chrome** :
        ```bash
        # Si installé via snap  (à éviter)
        /snap/bin/brave --incognito
        # Sinon
        brave --incognito
        ```
    - **Exécuter une Commande dans un Terminal** :
        ```bash
        gnome-terminal -- bash -c "commande"
        ```
    - **Mise à Jour et Upgrade de Linux** :
        ```bash
        gnome-terminal -- bash -i -c "sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y; exec bash -i"
        ```
    - **Plus de paramètres avec dconf editor** :
        
        ```bash
        sudo apt-get install dconf-editor
        dconf-editor
        ```

## Menu Contextuel de Nautilus

1. **Installation de git et mise à jour du système** :
    ```bash
    sudo apt update && sudo apt install git && sudo apt upgrade -y && sudo apt dist-upgrade -y
    ```
    
2. **Cloner le répertoire pour plus d'actions** :
    ```bash
    git clone https://github.com/SECRET-GUEST/actions-for-nautilus.git
    ```
    - Pour plus d'infos, visitez [actions-for-nautilus](https://github.com/SECRET-GUEST/actions-for-nautilus).

## Exécuter des Scripts via le Menu Contextuel

1. **Création et Placement du Script** :
    - Placez vos scripts dans : `/home/VOTRE_NOM_D'UTILISATEUR/.local/share/nautilus/scripts/`
    - Le nom du fichier sera le nom affiché dans l'onglet script du menu contextuel.

    **Exemple** : Script "chmod X" pour accorder le droit d'exécution sur le fichier sélectionné.
    ```bash
    echo -e "#!/bin/bash\nchmod +x \"\$1\"" > /home/VOTRE_NOM_D'UTILISATEUR/.local/share/nautilus/scripts/chmodX.sh && chmod +x /home/VOTRE_NOM_D'UTILISATEUR/.local/share/nautilus/scripts/chmodX.sh
    ```

  [Rendez vous ici pour des exemples de scripts ](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/nautilus%20scripts)

2. **Rendre le Script Exécutable** :
    ```bash
    chmod +x "/home/VOTRE_NOM_D'UTILISATEUR/.local/share/nautilus/scripts/NOM_DU_SCRIPT.sh"
    ```

3. **Génération du Script en Ligne de Commande** :
    - La commande donnée dans l'exemple ci-dessus crée également le script et le rend exécutable en une seule ligne.



---
---
---
```markdown
 ____ ___  ___  _    _ ____ ____ ___ _ ____ _  _ ____ 
 |__| |__] |__] |    | |    |__|  |  | |  | |\ | [__  
 |  | |    |    |___ | |___ |  |  |  | |__| | \| ___]
```

[Retour au Sommaire](#sommaire) 

# Guide d'Installation d'Applications sur Ubuntu/Debian

Les applications peuvent provenir de divers gestionnaires de paquets. Il est recommandé de toujours mettre à jour le système avant d'installer un paquet (via `sudo apt update...`).

## Créer une Application sur le Bureau ou dans le Menu des Applications

- **Via la Ligne de Commande** (dans le repertoir concerné):
    
    ```bash
    echo -e "[Desktop Entry]\nName=Mon App\nExec=la_commande\nIcon=icon-path\nType=Application\nTerminal=false" > ~/.local/share/applications/mon_app.desktop && chmod +x ~/.local/share/applications/mon_app.desktop
    ```
    
- **Manuellement** :
    1. Créer un fichier `.desktop`, soit sur le bureau (`~/Desktop/mon_app.desktop`) ou dans le menu des applications (`~/.local/share/applications/mon_app.desktop`):
        ```plaintext
        [Desktop Entry]
        Name=Mon Script
        Exec=/home/ton_nom_dutilisateur/script.sh
        Icon=utilities-terminal
        Type=Application
        Terminal=true
        ```

    2. Rendre l'application exécutable :
        ```bash
        chmod +x /chemin/vers/mon_application.desktop
        ```

    3. **Suppression / Désinstallation de l'app** :
        ```bash
        rm ~/.local/share/applications/mon_app.desktop
        rm ~/Desktop/mon_app.desktop
        rm /chemin/vers/ton/script_ou_application
        sudo update-desktop-database
        ```

## Installer des Paquets `.deb`

- **Installation via le Terminal** :
    ```bash
    sudo dpkg -i /chemin/vers/votre/paquet.deb
    sudo apt-get install -f  # si des dépendances sont manquantes
    ```

- **Installation via Nautilus avec un Script** :
    1. Créer un nouveau script exécutable dans `.local/share/nautilus/scripts/` (voir étape III de Raccourcis).
        ```bash
        #!/bin/bash
        
        # Emplacement du script principal
        scriptPath=~/.local/share/nautilus/scripts/installDeb.sh
        
        # Création du script principal
        
        echo "#!/bin/bash
        if [[ \"\$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS\" == *.deb ]]; then
            gnome-terminal -- bash -c \"sudo apt update && sudo apt upgrade -y && sudo dpkg -i '\$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS' && sudo apt-get install -f && read -n1 -s -r -p 'Appuyez sur une touche pour fermer...'\"
        else
            zenity --error --text=\"Le fichier sélectionné n'est pas un paquet .deb\"
        fi" > "$scriptPath"
        
        # Rendre le script principal exécutable
        
        chmod +x "$scriptPath"
        ```

## Installer des Archives `tar.gz`

- **Installation Manuelle** :
    ```bash
    tar -xzvf /chemin/vers/votre/archive.tar.gz -C /le/dossier/de/destination/
    cd /le/dossier/de/destination/nom_du_dossier
    ./configure
    make
    sudo make install
    ```

    [Plus d'infos](https://github.com/SECRET-GUEST/actions-for-nautilus)

## Installer un Éditeur de Texte (Vim)

- **Installation et Usage de Vim** :
    ```bash
    sudo apt update
    sudo apt install vim
    sudo vim /home/UTILISATEUR1/desktop/internet.py  # pour créer/ouvrir un fichier
    ```

## Définir Brave ou un autre Navigateur comme Navigateur par Défaut

```bash
xdg-settings set default-web-browser brave_brave.desktop
```

## Installation et Configuration d'OpenRGB

- **Préparation du Système** :
    ```bash
    sudo modprobe i2c-dev
    sudo modprobe i2c-i801   # Pour un système Intel OU
    sudo modprobe i2c-piix4   # Pour un système AMD
    sudo vim /etc/modules  # ajouter i2c-dev et i2c-i801 (Intel) ou i2c-piix4 (AMD), puis :wq pour quitter vim
    ```

- **Installation d'OpenRGB** :
    ```bash
    sudo apt update && sudo apt upgrade
    sudo add-apt-repository ppa:thopiekar/openrgb -y
    sudo apt update
    sudo apt install openrgb
    openrgb  # pour lancer l'application
    ```

    [Plus d'infos](https://www.linuxcapable.com/how-to-install-openrgb-on-ubuntu-linux/)
    [OpenRGB sur GitLab](https://gitlab.com/CalcProgrammer1/OpenRGB)







---
---
---
```markdown
_  _ ____ _ ___     ___ _ _  _ ____ 
|\/| |__| | |  \     |  | |\/| |___ 
|  | |  | | |__/     |  | |  | |___ 
                                    
```

[Retour au Sommaire](#sommaire) 

# Guide de Maintenance

Ce guide propose plusieurs procédures de maintenance pour assurer le bon fonctionnement de votre système.


## Maintenance de Syslog

La gestion des fichiers de log est cruciale pour maintenir un système fonctionnel et pour faciliter le dépannage. Voici comment vous pouvez gérer les fichiers de log générés par syslog :

### Troncature

La troncature réinitialise la taille d'un fichier à zéro en supprimant tout son contenu, tout en conservant le fichier lui-même.

Commande pour tronquer un fichier de log :
```bash
sudo truncate -s 0 /var/log/syslog
```

### Rotation des Logs

La rotation des logs renomme et archive les fichiers de log actuels, et crée un nouveau fichier vide pour les entrées de log futures.

#### Configuration existante

Vérifiez la configuration existante dans le répertoire `/etc/logrotate.d/` :

```bash
cat /etc/logrotate.d/rsyslog
```

#### Créer ou modifier une configuration de rotation

1. **Ouvrir ou créer un fichier de configuration** :
```bash
sudo vim /etc/logrotate.d/rsyslog
```

2. **Ajouter ou modifier les directives** :
```plaintext
{
        rotate 2
        daily
        size 100M
        missingok
        notifempty
        compress
        delaycompress
        sharedscripts
        postrotate
                /usr/lib/rsyslog/rsyslog-rotate
        endscript
}
```

3. **Sauvegarder et fermer** le fichier de configuration.

4. **Tester la configuration** :
```bash
sudo logrotate --force /etc/logrotate.d/rsyslog
```

## Sauvegarde et Restauration des Données

La sauvegarde et la restauration des données sont essentielles pour assurer la continuité et la récupération en cas de problème sur le système.

### Sauvegarde des Configurations avec DConf

Pour une approche simplifiée de la sauvegarde des configurations, un [script DConf](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/backup/dconf%20backup) a été réalisé.

### Gestion des Packages

Un [script](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/backup/package%20backup) a été créé pour faciliter la gestion des packages sur les systèmes basés sur Debian.

### Restauration des Données

- **Données Utilisateur** :
   - Les scripts mentionnés précédemment peuvent servir de rappels pour la restauration des configurations et des packages.

### Snapshots Système

Les snapshots (ou instantanés) permettent de capturer l'état actuel d'un système à un moment donné, ce qui facilite la restauration en cas de problème.

1. **Utilisation de Timeshift** :
   - Timeshift est un outil populaire sous Linux pour créer des snapshots du système.
   - Installation : 
     ```bash
     sudo apt-add-repository -y ppa:teejee2008/ppa
     sudo apt-get update
     sudo apt-get install timeshift
     ```
   - Utilisation :
     - Lancez Timeshift depuis le menu ou en ligne de commande (`timeshift`).
     - Suivez l'assistant pour configurer Timeshift et créer un snapshot.
     - Pour restaurer un snapshot, lancez Timeshift, sélectionnez le snapshot, puis cliquez sur "Restore".

2. **Utilisation de Btrfs** :
   - Si votre système utilise le système de fichiers Btrfs, vous pouvez utiliser ses fonctionnalités de snapshot intégrées.
   - Création d'un snapshot :
     ```bash
     sudo btrfs subvolume snapshot / /snapshots/snapshot_name
     ```
   - Restauration d'un snapshot :
     ```bash
     sudo btrfs subvolume set-default /snapshots/snapshot_name
     sudo reboot
     ```

## Autres Méthodes de Sauvegarde et Restauration

### Rsync

Rsync est un outil de copie de fichiers rapide et versatile qui permet de synchroniser des fichiers et des dossiers entre deux emplacements. Il est particulièrement utile pour les sauvegardes incrémentielles et la réplication de données.

- **Installation** :
  ```bash
  sudo apt-get install rsync
  ```

- **Utilisation Basique** :
  - Pour copier des fichiers d'un dossier source à un dossier destination :
    ```bash
    rsync -av /source/directory /destination/directory
    ```

- **Sauvegarde Incrémentielle** :
  - Rsync ne copie que les fichiers qui ont changé depuis la dernière copie, ce qui permet des sauvegardes efficaces et rapides.
    ```bash
    rsync -av --exclude='/path/to/exclude' /source/directory /destination/directory
    ```

- **Sauvegarde sur un Serveur Distant** :
  - Rsync peut aussi synchroniser des données vers ou depuis un serveur distant :
    ```bash
    rsync -av /source/directory user@remote-server:/destination/directory
    ```

### Clonezilla

Clonezilla est un programme de clonage de partition ou de disque dur. Il supporte une grande variété de systèmes de fichiers et convertit les données en images pour la sauvegarde.

- **Utilisation** :
  1. Téléchargez l'image ISO de Clonezilla depuis le [site officiel](https://clonezilla.org/downloads.php) et créez un support de démarrage USB ou CD/DVD.
  2. Redémarrez votre ordinateur et bootez sur le support de démarrage de Clonezilla.
  3. Suivez les instructions à l'écran pour sélectionner la source (disque ou partition) et la destination (emplacement pour stocker l'image).
  4. Une fois la sauvegarde terminée, vous pouvez redémarrer votre système et retirer le support de démarrage.

- **Restauration** :
  1. Bootez de nouveau sur le support de démarrage de Clonezilla.
  2. Sélectionnez l'option de restauration et suivez les instructions pour restaurer votre système à partir de l'image précédemment créée.

### Bacula / Bareos

Bacula et Bareos sont des solutions de sauvegarde et de restauration en réseau robustes et professionnelles. Ils permettent la planification de sauvegardes, la gestion de plusieurs sources et destinations, et la restauration de données à partir de sauvegardes.

- **Installation** :
  - Vous pouvez installer Bacula ou Bareos depuis les dépôts de votre distribution ou depuis leurs sites officiels.

- **Configuration** :
  - Ces outils nécessitent une configuration minutieuse des fichiers de configuration pour définir les emplacements des sauvegardes, les horaires, et d'autres options.

- **Utilisation** :
  - Avec une interface CLI ou GUI, vous pouvez gérer les tâches de sauvegarde et de restauration, planifier des sauvegardes régulières, et restaurer des données en cas de besoin.




---
---
---
```markdown
___  ____ ___ ____    ____ _  _ ____ ____ _ _  _ ____ 
|  \ |__|  |  |__|    [__  |__| |__| |__/ | |\ | | __ 
|__/ |  |  |  |  |    ___] |  | |  | |  \ | | \| |__] 
```
[Retour au Sommaire](#sommaire) 

# Guide du partage de données

Ce guide vous permet de partager votre écran via VNC au sein de votre réseau local. Cependant, il ne propose aucune mesure de sécurité ; toute personne ayant l'adresse, ou la trouvant sur votre réseau interne, sera en mesure d'intercepter vos données !

## Configuration du Serveur avec RealVNC

Ce document guide l'utilisateur à travers l'installation et la configuration d'un serveur VNC sur Ubuntu en utilisant RealVNC.

### Étape 1 : Installation du Serveur VNC

1. Ouvrez un terminal sur votre machine Ubuntu.
2. Exécutez la commande suivante pour installer `x11vnc` :
    ```bash
    sudo apt-get install x11vnc
    ```

### Étape 2 : Configuration du Serveur VNC

1. Configurez un mot de passe pour le serveur VNC en exécutant la commande suivante :
    ```bash
    x11vnc -storepasswd
    ```


2. Lancez le serveur VNC en spécifiant le port de votre choix (par exemple, 45454) :
    ```bash
    x11vnc -usepw -rfbport 45454
    ```

### Étape 3 : Trouver l'Adresse IP Locale

1. Trouvez l'adresse IP de votre machine Ubuntu en exécutant la commande suivante :
    ```bash
    hostname -I
    ```
    Si vous en avez plusieurs, ca peut etre dut à plusieurs choses, docker, wifi,... Utilisez celle qui ressemble a 192.168....

### Étape 4 : Installation de RealVNC Viewer sur la Tablette

1. Sur votre tablette, accédez au Google Play Store.
2. Recherchez et installez l'application `VNC Viewer` de RealVNC (le meilleur).

### Étape 5 : Connexion au Serveur VNC depuis la Tablette

1. Ouvrez l'application `VNC Viewer` sur votre tablette.
2. Tapez l'adresse IP de votre machine Ubuntu suivie du port sur lequel le serveur VNC est en cours d'exécution, séparés par un deux-points (par exemple, `192.168.1.100:45454`).
3. Entrez le mot de passe que vous avez configuré précédemment pour le serveur VNC lorsque vous y êtes invité.
4. Tapotez sur "Connect" pour vous connecter au serveur VNC.

Vous devriez maintenant être en mesure d'accéder à l'interface d'Ubuntu depuis votre tablette via VNC.

### Sécurité

Par défaut, cette configuration permettra l'accès au serveur VNC uniquement au sein de votre réseau local. Pour accéder au serveur VNC depuis l'extérieur de votre réseau local, des configurations supplémentaires comme le transfert de port et/ou un service DNS dynamique seront nécessaires, tout en tenant compte des implications en matière de sécurité.


