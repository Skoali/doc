---
layout: post
title: "Changer le message d'accueil (MOTD) d'un VPS Linux."
description: "Personnaliser le message d'accueil (MOTD) lors d'une connexion SSH à un VPS Linux"
date: 2022-03-20 15:30:00 +0100
category: vps
---

## Introduction

Lors de la lecture de cet article vous allez apprendre comment changer le MOTD de votre VPS.

## Sommaire
- [Qu'est-ce qu'un MOTD?](#quest-ce-quun-motd?)
- [Modification du MOTD](#modification-du-motd)

## Qu'est-ce qu'un MOTD?

Le MOTD de votre message est le long message que vous voyez dès votre connexion au VPS.

Exemple:

![image]({{ site.baseurl }}/images/motd-vps.png)

Pour modifier ce dernier, veuillez passer à l'étape suivante.

## Modification du MOTD

Copiez et collez la commande ci-dessous
```
$  nano /etc/motd
```

Mettez le MOTD de votre choix, par exemple.

```

███████╗██╗  ██╗ ██████╗  █████╗ ██╗     ██╗
██╔════╝██║ ██╔╝██╔═══██╗██╔══██╗██║     ██║
███████╗█████╔╝ ██║   ██║███████║██║     ██║
╚════██║██╔═██╗ ██║   ██║██╔══██║██║     ██║
███████║██║  ██╗╚██████╔╝██║  ██║███████╗██║
╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝
          
 |-------------------------------------------------|
 |                    Bienvenue                    |
 |-------------------------------------------------|
 |-------------------    VPS    -------------------|
 |-------------------------------------------------|
 |                                                 |
 |          Server      Alpha                      |
 |                                                 |
 |          IP          [Ip De Votre Serveur]      |
 |                                                 |
 |          Provider    Skoali                     |
 |          Machine     vps-48235                  |
 |                                                 |
 |                                                 |
 |-------------------------------------------------|

```

Ctrl + X puis Ctrl + S


Vous verrez votre nouveau MOTD à votre prochaine connexion.

