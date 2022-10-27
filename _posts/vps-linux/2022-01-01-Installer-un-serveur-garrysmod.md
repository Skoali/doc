---
layout: post
title: "Installer un server Garry's Mod sur son VPS (Debian/Ubuntu)"
description: "Installation d'un server Garry's Mod sur un VPS Debian ou Ubuntu avec LinuxGSM"
date: 2022-01-01 15:30:00 +0100
category: vps-linux
---

## Installation :

> Installation des dépendances

Commençons par installer les dépendances avec la commande suivante :

```
dpkg --add-architecture i386; apt update; apt install mailutils postfix curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 lib32stdc++6 steamcmd libtinfo5:i386 netcat -y
```

Si jamais il vous est affiché une grande page avec en bas "`<Ok>`" appuyez sur la touche TAB de votre clavier (Au-dessus de la touche pour verrouiller la majuscule) de manière à ce que "`<Ok>`" soit surlignée en rouge. Ensuite il y aura une autre page affiché où sera sélectionner par défaut "I DECLINE" déscendez et selectionnez "I AGREE" avec la flèche du bas de votre clavier puis appuyez sur entrée. Ensuite laissez l'installation ce terminé.

> Création d'un utilisateur

Une fois ceci fait ajoutez un utilisateur avec la commande suivante :

```
adduser gmodserver
```

  Dans notre cas l'utilisateur sera appelé "gmodserver" 
  Il vous dira "Enter a new UNIX password" vous aurez donc a entrée votre mot de passe, une fois ceci fait il vous demandera une deuxième fois d'entrer le mot de passe afin de s'assurer qu'il n'y ait pas de fautes de frappes.
Une fois le mot de passe défini, il vous demandera des informations comme "Full name" et autre, appuyez simplement sur entrée sans rien écrire.
Ensuite vous aurez le message "Is the information correct? [Y/n]", appuyez simplement sur entrée pour valider. Votre utilisateur est désormais créé.
Il faudra désormais s'y connecter afin d'installer le serveur de jeu. Pour cela faites la commande suivante :

> Connexion à l'utilisateur

```
su - gmodserver
```

> Installation de LinuxGSM et du serveur Garry's Mod

Une fois connecté à l'utilisateur, effectuez les commandes suivantes afin d'installer LinuxGSM
```
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh gmodserver
./gmodserver install
```
Cela vous affichera une page ou il y aura marqué en bas "Continue? [Y/n] Y", appuyez sur entrée.
Ensuite l'installation du serveur se lancera, attendez quelques minutes le temps que tout se télécharge et s'installe.
Une fois l'installation terminée, vous aurez le message "Was the install successful? [Y/n] Y" appuyez sur entrée.

Ensuite vous aurez "GSLT TOKEN:" appuyez sur entrée sans rien mettre.

Une fois cela fait vous aurez un message "Install Complete!", votre serveur est désormais installé.
## Démarrage du serveur
Avant de démarrer le serveur, assurez-vous d'être connecté sur l'utilisateur crée pour votre serveur Garry's Mod :
```
su - gmodserver
```
Puis démarrez le serveur avec la commande :
```
./gmodserver start
```
Si le message "[  OK  ] Starting gmodserver: LinuxGSM" s'affiche s'est que votre serveur a correctement été démarrer.

Si le message "[ INFO ] Starting gmodserver: LinuxGSM is already running" : Cela veut dire que le serveur est déjà allumé.

## Arrêt du serveur
Avant d’arrêter le serveur, assurez-vous d'être connecté sur l'utilisateur crée pour votre serveur Garry's Mod :
```
su - gmodserver
```
Puis arrêtez le serveur avec la commande :
```
./gmodserver stop
```
Si le message "[  OK  ] Stopping gmodserver: Graceful: sending "quit": OK" s'affiche, c'est que le serveur a correctement été éteint.

Si le message "[ INFO ] Stopping gmodserver: LinuxGSM is already stopped" c'est que votre serveur est déjà éteint.
## Redémarrage du serveur
Avant de redémarrer le serveur, assurez-vous d'être connecté sur l'utilisateur crée pour votre serveur Garry's Mod :

```
su - gmodserver
```

Puis redémarrez le serveur avec la commande :

```
./gmodserver restart
```

 Si le message "[  OK  ] Starting gmodserver: LinuxGSM" s'affiche, c'est que le redémarrage a bien été effectué.
## Accès à la console
Avant d'accéder à la console du serveur, assurez-vous d'être connecté sur l'utilisateur crée pour votre serveur Garry's Mod :

```
su - gmodserver
```

Vous aurez ensuite le message "Continue? [Y/n] Y"
Appuyez sur entrée, vous êtes désormais sur la console.

Pour quitter la console, appuyez sur Ctrl + B puis appuyez juste sur "d"
## Informations pour ajouter, enlevé ou éditer les fichiers du serveur.

Une fois votre serveur installé, vous pouvez ajouter des fichiers en vous connectant en SFTP à l'IP de votre VPS, l'utilisateur crée plus tôt (gmodserver si vous avez mis le même que celui du tutoriel.) avec le mot de passe choisi au début puis sur le port 22. Une fois connecter, allez dans le dossier "serverfiles" et vous aurez accès aux fichiers de votre serveur.
