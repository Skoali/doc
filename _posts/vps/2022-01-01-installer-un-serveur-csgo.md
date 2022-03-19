---
layout: post
title: "Installer un serveur CS:GO sur un VPS (Debian/Ubuntu)"
description: "Installation d'un serveur CS:GO sur un VPS Debian ou Ubuntu avec LinuxGSM"
date: 2022-01-01 15:30:00 +0100
category: vps
---

## Installez les dépendances

```
dpkg --add-architecture i386 && apt install curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 steamcmd libsdl2-2.0-0:i386 -y
```

![dpkgaddarchitecture]({{ site.baseurl }}/images/dpkgaddarchitecture.png)


## Créer un utilisateur pour le serveur CSGO :

```adduser csgo``` (Valider avec entrer à toutes les questions)

Puis accéder à l'utilisateur : `su csgo`

![dpkgaddarchitecture]({{ site.baseurl }}/images/addusercsgo.png)

## Téléchargez le script d'installation de serveur

```wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh csgoserver```

![csgowgetlinuxgsm]({{ site.baseurl }}/images/csgowgetlinuxgsm.png)

## Installez le serveur de jeu.


```./csgoserver install```

Entrez les informations demandées. L'installateur vous demandera d'entrer votre token, rendez vous sur https://steamcommunity.com/dev/managegameservers

![csgoserverinstall]({{ site.baseurl }}/images/csgoserverinstall.png)
