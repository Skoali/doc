---
layout: post
title: "Installer un serveur Ark sur un VPS avec LinuxGSM (Debian/Ubuntu)"
description: "Installation d'un serveur Ark sur un VPS Debian ou Ubuntu avec LinuxGSM"
date: 2022-01-01 15:30:00 +0100
category: vps
---

## Installer les dépendances 
 
```
sudo dpkg --add-architecture i386  
sudo apt-get update  
sudo apt-get install mailutils postfix curl wget file gzip bzip2 bsdmainutils python util-linux tmux lib32gcc1 libstdc++6 libstdc++6:i386
```  
 
### Créer un utilisateur
 
```adduser arkserver```
 
Ecrivez votre mot de pass 
 
 ### Accéder à l'utilisateur crée ci-dessus
 
```su - arkserver```
 
### Téléchargez le script du serveur
 
```wget https://gameservermanagers.com/dl/arkserver```
 
### Exécuter le script
 
```chmod +x arkserver```
 
### Lancez l'installation 
 
```./arkserver install```
 
### Lancer le serveur
 
```./arkserver start```
 
## Tips
 
Obtenir la liste de commandes: `./arkserver`
 
Stopper le serveur: `./arkserver stop`
 
Redémarrer le serveur: `./arkserver restart`
 
Mettre à jour du serveur: `./arkserver update`
 
 
 
