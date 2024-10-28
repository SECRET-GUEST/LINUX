# Configuration d'une Connexion SSH Sécurisée

Ce guide explique comment configurer une connexion SSH sécurisée entre un ordinateur sous Windows, Linux ou macOS (client) et un serveur sous Linux (raspberry ou autre). Il inclut les étapes pour générer une clé RSA de haute sécurité, restreindre l'accès uniquement à cette clé, modifier le port SSH pour plus de sécurité, et activer SSH au démarrage du serveur.

---

## Sommaire

1. [Générer une clé SSH RSA 8192 bits sur Windows](#1-générer-une-clé-ssh-rsa-8192-bits-sur-windows)
   - [Alternative pour Linux](#1-alternative-pour-linux)
   - [Alternative pour macOS](#1-alternative-pour-macos)
2. [Copier la clé publique sur le serveur Linux](#2-copier-la-clé-publique-sur-le-serveur-linux)
3. [Restreindre l'accès uniquement à la clé SSH](#3-restreindre-laccès-uniquement-à-la-clé-ssh)
4. [Modifier le port SSH et activer au démarrage](#4-modifier-le-port-ssh-et-activer-au-démarrage)
5. [Créer un script pour une connexion en un clic](#5-créer-un-script-pour-une-connexion-en-un-clic)

---

## 1. Générer une clé SSH RSA 8192 bits sur Windows

1. **Ouvrir PowerShell** :
   - Appuyez sur `Win + R`, tapez `powershell`, puis appuyez sur **Entrée**.

2. **Générer la clé** :
   - Tapez la commande suivante pour créer une clé SSH de haute sécurité (8192 bits) :
     ```powershell
     ssh-keygen -t rsa -b 8192 -f "C:\chemin\vers\dossier_ssh\ma_cle_id_rsa"
     ```
   - **Choisissez l’emplacement** : Remplacez `C:\chemin\vers\dossier_ssh\ma_cle_id_rsa` par le chemin où vous voulez enregistrer la clé.
   - **Mot de passe** : Appuyez sur **Entrée** pour ignorer la passphrase si vous souhaitez une connexion sans mot de passe.

3. **Résultat** : 
   - Deux fichiers sont créés :
     - **`ma_cle_id_rsa`** (clé privée) : Gardez-la en sécurité sur votre Windows.
     - **`ma_cle_id_rsa.pub`** (clé publique) : À copier sur le serveur Linux.

---

### 1. Alternative pour Linux

1. **Ouvrir un terminal**.

2. **Générer la clé** :
   - Sur Linux, utilisez cette commande pour créer une clé RSA 8192 bits :
     ```bash
     ssh-keygen -t rsa -b 8192 -f ~/.ssh/ma_cle_id_rsa
     ```
   - Par défaut, la clé est stockée dans `~/.ssh/`. Remplacez le chemin si nécessaire.

3. **Passphrase** : Appuyez sur **Entrée** pour ignorer la passphrase (ou choisissez-en une si vous préférez).

---

### 1. Alternative pour macOS

1. **Ouvrir le terminal** :
   - Allez dans **Applications** → **Utilitaires** → **Terminal**.

2. **Générer la clé** :
   - Tapez cette commande pour générer une clé RSA 8192 bits :
     ```bash
     ssh-keygen -t rsa -b 8192 -f ~/.ssh/ma_cle_id_rsa
     ```
   - La clé est enregistrée dans `~/.ssh/` par défaut.

3. **Passphrase** : Appuyez sur **Entrée** pour ignorer la passphrase ou en créez une pour plus de sécurité.

---

3. **Résultat** : 
   - Deux fichiers sont créés :
     - **`ma_cle_id_rsa`** (clé privée) : Gardez-la en sécurité sur votre Windows.
     - **`ma_cle_id_rsa.pub`** (clé publique) : À copier sur le serveur Linux.

---
[Retour au Sommaire](#sommaire) 

## 2. Copier la clé publique sur le serveur Linux

### Option 1 : Copier automatiquement avec `ssh-copy-id`

1. Dans PowerShell, tapez la commande suivante pour envoyer la clé publique sur le serveur (remplacez `user` par votre nom d’utilisateur Linux et `192.168.x.x` par l’adresse IP du serveur) :
   ```powershell
   ssh-copy-id -i "C:\chemin\vers\dossier_ssh\ma_cle_id_rsa.pub" user@192.168.x.x
   ```
   - Vous devrez entrer votre mot de passe Linux une dernière fois.

### Option 2 : Copier manuellement avec `cat` et `echo`

1. **Afficher la clé publique** :
   - Tapez cette commande dans PowerShell pour voir le contenu de votre clé publique :
     ```powershell
     cat "C:\chemin\vers\dossier_ssh\ma_cle_id_rsa.pub"
     ```
   - **Exemple de sortie** :
     ```
     ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3...(suite de caractères)
     ```

2. **Sur le serveur Linux, créez le fichier `authorized_keys`** :
   - Connectez-vous à votre serveur avec SSH.
   - Créez le dossier `.ssh` et le fichier `authorized_keys` :
     ```bash
     mkdir -p ~/.ssh
     echo "ssh-rsa AAA..(suite de caractères)" >> ~/.ssh/authorized_keys
     ```
   - **Astuce** : Vous pouvez aussi ouvrir directement le fichier `authorized_keys` avec `nano` :
     ```bash
     nano ~/.ssh/authorized_keys
     ```
     Collez ensuite la clé, sauvegardez avec `Ctrl + O`, et quittez avec `Ctrl + X`.

3. **Vérifier les permissions** :
   - Assurez-vous que les permissions sont correctes pour la sécurité :
     ```bash
     chmod 700 ~/.ssh
     chmod 600 ~/.ssh/authorized_keys
     ```

---
[Retour au Sommaire](#sommaire) 

## 3. Restreindre l'accès uniquement à la clé SSH

1. **Modifier la configuration SSH** :
   - Ouvrez le fichier de configuration SSH avec cette commande :
     ```bash
     sudo nano /etc/ssh/sshd_config
     ```
   - Recherchez et modifiez les paramètres suivants :
     ```plaintext
     PasswordAuthentication no       # Désactivez les mots de passe
     PubkeyAuthentication yes        # Activez les clés SSH
     ```

2. **Sauvegarder et redémarrer SSH** :
   - Sauvegardez avec `Ctrl + O` puis `Entrée`, quittez avec `Ctrl + X`, et redémarrez le service SSH :
     ```bash
     sudo systemctl restart sshd
     ```

---
[Retour au Sommaire](#sommaire) 
## 4. Modifier le port SSH et activer au démarrage

1. **Changer le port SSH** :
   - Dans le fichier `/etc/ssh/sshd_config`, modifiez cette ligne pour définir un port personnalisé (par exemple, `2222`) :
     ```plaintext
     Port 2222
     ```

2. **Activer SSH au démarrage** :
   - Exécutez la commande suivante pour que SSH démarre automatiquement à chaque démarrage :
     ```bash
     sudo systemctl enable sshd
     ```

3. **Redémarrer SSH** :
   - Pour appliquer les modifications, redémarrez SSH :
     ```bash
     sudo systemctl restart sshd
     ```

---
[Retour au Sommaire](#sommaire) 

## 5. Créer un script pour une connexion en un clic

Pour faciliter la connexion, créez un script batch sur votre machine Windows.

1. **Créer le fichier batch** :
   - Ouvrez un éditeur de texte comme Notepad et collez le code suivant. Remplacez `C:\chemin\vers\dossier_ssh\ma_cle_id_rsa` par le chemin de votre clé privée et `user` par votre nom d’utilisateur Linux :
     ```batch
     @echo off
     set /p ip="Entrez l'adresse IP du serveur : "
     ssh -p 2222 -i "C:\chemin\vers\dossier_ssh\ma_cle_id_rsa" user@%ip%
     ```
Ou si vous etes pressé ; 

     ```batch
     ssh -p 2222 -o StrictHostKeyChecking=no -i "C:\chemin\vers\dossier_ssh\ma_cle_id_rsa" user@%ip%
     ```
   - **Enregistrez** sous le nom `connect_ssh.bat`.

1. **Utiliser le script** :
   - Double-cliquez sur le fichier `connect_ssh.bat` et entrez l’adresse IP du serveur pour vous connecter directement.

