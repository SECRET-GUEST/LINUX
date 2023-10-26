```
 ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ ██╗   ██╗██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ ██║   ██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗██║   ██║██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║
██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║██║   ██║██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝╚██████╔╝██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
```


# Configuration de l'Utilisateur sur Kali Linux

Ce dossier contient des scripts pour configurer un environnement utilisateur sécurisé et personnalisé sur Kali Linux. Ces scripts vous permettront de changer les paramètres DNS, de configurer le layout du clavier en français, et de créer un nouvel utilisateur sécurisé.

## 💎 Recommendations

Vous pouvez utiliser [ce lanceur de script ](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/launchers/script%20launcher) pour exécuter ces scripts facilement via un terminal. Ce truc liste tous les scripts du dossier et vous permet de choisir celui que vous souhaitez exécuter.

## 🛠️ Utilisation des Scripts

### 1. change_DNS.sh

Ce script modifie les paramètres DNS de votre système pour utiliser les serveurs DNS de Quad9.

**Utilisation** :
```bash
chmod +x change_DNS.sh
./change_DNS.sh
```

**Notes** :
- Ce script doit être exécuté en tant que root.
- Une sauvegarde du fichier de configuration actuel est créée avant d'appliquer les modifications.

### 2. change_FR_clavier.sh

Ce script configure le layout du clavier en français.

**Utilisation** :
```bash
chmod +x change_FR_clavier.sh
./change_FR_clavier.sh
```

**Notes** :
- Il est recommandé de redémarrer votre système après l'exécution de ce script pour que les changements prennent effet.

### 3. new_secure_user.sh

Ce script crée un nouvel utilisateur sécurisé, verrouille le mot de passe de root, et ajoute le nouvel utilisateur au groupe sudo.

**Utilisation** :
```bash
chmod +x new_secure_user.sh
./new_secure_user.sh
```

**Notes** :
- Vous serez invité à fournir un nom d'utilisateur, un hostname, et un nom de machine.
- Vous serez également invité à fournir un mot de passe pour le nouvel utilisateur.
- Des instructions pour changer de session et supprimer l'ancien utilisateur seront affichées à la fin du script.

---

Ces scripts sont conçus pour être exécutés sur une installation fraîche de Kali Linux sur un Raspberry Pi. Ils facilitent la configuration initiale de l'environnement utilisateur selon vos préférences. N'hésitez pas à examiner et à modifier ces scripts selon vos besoins spécifiques.
