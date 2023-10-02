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
   - [Installation de Neofetch et Tree](#installation-de-neofetch-et-tree)
   - [Utilisation de Tree](#utilisation-de-tree)
4. [Navigation dans le système de fichiers](#navigation-dans-le-système-de-fichiers)
5. [Sécurité du système](#sécurité-du-système)
   - [Sécurité du mot de passe root](#sécurité-du-mot-de-passe-root)
   - [Pare-feu et outils de sécurité](#pare-feu-et-outils-de-sécurité)
   

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

Maîtrisez les commandes de base pour la navigation :
- `ls` : liste les fichiers et dossiers.
- `cd [nom_du_dossier]` : change de répertoire.
- `pwd` : affiche le répertoire courant.
- `mkdir [nom_du_dossier]` : crée un nouveau dossier.

## Sécurité du système

### Sécurité du mot de passe root

Désactivez le compte root pour une sécurité accrue :
```
sudo passwd -l root
sudo visudo
```
Commentez la ligne de root :
```
# root   ALL=(ALL:ALL) ALL
```

### Pare-feu et outils de sécurité

Activez le pare-feu UFW et apprenez à utiliser des outils tels que RKHunter et ClamAV.

- Activez UFW :
```
sudo ufw enable
```

- Installez et utilisez RKHunter :
```
sudo apt install rkhunter
sudo rkhunter --check
```

- Installez et utilisez ClamAV :
```
sudo apt install clamav clamav-daemon
sudo freshclam
sudo clamscan -r /home
```



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
