---
layout: post
title: "Installer Plex sur un VPS (Debian/Ubuntu)"
description: "Installation de Plex sur un VPS Debian ou Ubuntu"
date: 2022-01-01 15:30:00 +0100
category: vps
---

# Installer Plex sur un VPS.

## Plex c'est quoi
 
 Plex vous offre un seul endroit pour trouver et accéder à tous les médias qui vous intéressent. Des médias personnels sur votre propre serveur aux films et émissions gratuits et à la demande, en passant par la télévision en direct, les podcasts et les émissions Web, en passant par la musique en streaming, vous pouvez profiter de tout cela dans une seule application, sur n'importe quel appareil.
 
## Installer Plex Media Serveur
 
```
sudo apt-get install curl
echo "deb http://shell.ninthgate.se/packages/debian squeeze main" | sudo tee -a /etc/apt/sources.list.d/plexmediaserver.list
sudo curl http://shell.ninthgate.se/packages/shell-ninthgate-se-keyring.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install plexmediaserver
```
Accéder à Plex avec l'url "http://votreip:32400/web"
 
![image]({{ site.baseurl }}/images/plexsettings.png)
 
### Liez votre serveur a Plex.tv
 
```ssh -L 32400:127.0.0.1:32400 root@IPSERVEUR```
 
Vous y accéder maintenant avec l'url "https://localhost:32400/web"
 
Suite à cela connectez vous à votre compte plex (dans la partie reglages)
 
![image]({{ site.baseurl }}/images/plexbibli.png)
 
## Ajoutez des bibliothèques
 
 Appuyez sur l'icône "+" à gauche, spécifiez le type de contenu, la langue, la descriptions et le dossier
 
 ![image]({{ site.baseurl }}/images/plexbibli.png)
 
## Lancer votre serveur
 
Pour lancer votre serveur entrez la commande: `service plexmediaserver start`
 
Pour arrêter votre serveur entrez la commande: `service plexmediaserver stop`
 
Pour redémarrer votre serveur entrez la commande: `service plexmediaserver restart`
