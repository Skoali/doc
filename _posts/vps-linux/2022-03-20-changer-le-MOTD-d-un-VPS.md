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
- [Qu'est-ce qu'un MOTD ?](#un-motd-cest-quoi)
- [Modification du MOTD](#modification-du-motd)

## Un MOTD c'est quoi?

Le MOTD est le long message que vous voyez dès votre connexion au VPS.

Exemple:

![image]({{ site.baseurl }}/images/motd-vps.webp){:width="80%"}

Pour modifier ce dernier, veuillez passer à l'étape suivante.

## Modification du MOTD

Copiez et collez la commande ci-dessous
```
nano /etc/motd
```

Mettez le MOTD de votre choix, par exemple.

```

   _____  _  __ ____            _       _____ 
  / ____|| |/ // __ \    /\    | |     |_   _|
 | (___  | ' /| |  | |  /  \   | |       | |  
  \___ \ |  < | |  | | / /\ \  | |       | |  
  ____) || . \| |__| |/ ____ \ | |____  _| |_ 
 |_____/ |_|\_\\____//_/    \_\|______||_____|
                                              

```

Ctrl + X puis Ctrl + S


Vous verrez votre nouveau MOTD à votre prochaine connexion.

