---
layout: post
title: "Créer une clé SSH et l'utiliser pour se connecter à un VPS"
description: "Comment créer une clé SSH pour se connecter en toute sécurité à un VPS"
date: 2023-05-04 15:30:08 +0100
category: vps
---

Les clés SSH peuvent être utilisées pour se connecter de manière sécurisée à un serveur. Cet article explique comment créer une clé SSH et la mettre sur un VPS.

Dans cet article, nous allons vous montrer comment créer une clé SSH sur Linux et Windows et comment la mettre sur votre VPS pour vous connecter en toute sécurité.

## Créer une clé SSH sous Linux

1. Ouvrez un terminal et entrez la commande suivante pour générer une nouvelle clé SSH :

```
ssh-keygen
```

2. Vous serez invité à entrer un chemin pour enregistrer la clé SSH. Appuyez simplement sur Entrée pour utiliser le chemin par défaut.

3. Vous serez invité à entrer un mot de passe pour protéger votre clé SSH. Si vous ne souhaitez pas utiliser de mot de passe, appuyez simplement sur Entrée deux fois.

4. La clé SSH a été générée. Elle se trouve maintenant dans le répertoire `~/.ssh/` et se nomme `id_rsa`.

## Créer une clé SSH sous Windows

1. Téléchargez et installez [PuTTYgen](https://www.putty.org/).

2. Ouvrez PuTTYgen et cliquez sur "Générer".

3. Bougez votre souris aléatoirement dans la fenêtre pour générer une clé aléatoire.

4. Entrez un mot de passe pour protéger votre clé SSH, si vous le souhaitez.

5. Cliquez sur "Enregistrer la clé privée".

6. Enregistrez votre clé SSH dans un emplacement sécurisé sur votre ordinateur.

## Installer la clé SSH sur le VPS et autoriser la connexion avec

### Installer la clé SSH

1. Connectez-vous à votre VPS en utilisant un client SSH tel que PuTTY.

2. Entrez la commande suivante pour créer un nouveau répertoire `.ssh` :

```
mkdir ~/.ssh
```

3. Ouvrez le fichier `authorized_keys` en utilisant un éditeur de texte comme nano :

```
nano ~/.ssh/authorized_keys
```


4. Copiez la clé publique (contenue dans le fichier `id_rsa.pub` sous Linux ou dans le champ "Texte de clé publique" sous PuTTYgen) dans le fichier `authorized_keys`.

5. Enregistrez et fermez le fichier.

6. Modifiez les permissions du répertoire `.ssh` pour limiter l'accès aux utilisateurs autorisés :

```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

### Autoriser la connexion par clé SSH

Pour autoriser la connexion par clé SSH sur un VPS, vous devez éditer le fichier de configuration ssh (sshd_config)

1. Éditez le fichier de configuration ssh en utilisant un éditeur de texte :

```
nano /etc/ssh/sshd_config
```


2. Cherchez la ligne "PubkeyAuthentication" et modifiez-la pour activer l'authentification par clé publique :

```
PubkeyAuthentication yes
```


3. Enregistrez les modifications et fermez l'éditeur.

4. Redémarrez le service ssh pour appliquer les modifications :

```
systemctl restart ssh
```

Maintenant, vous pouvez vous connecter à votre VPS en utilisant votre clé SSH. Cela vous permettra de vous connecter de manière sécurisée sans avoir à entrer un mot de passe.
