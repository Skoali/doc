---
layout: post
title: "Changer le MOTD d'un VPS"
description: "Modifier le MOTD de connexion de votre VPS"
date: 2022-03-20 15:30:00 +0100
category: vps
---

# Introduction

Lors de la lecture de cet articule vous allez apprendre comment changer le MOTD de votre vps

# Sommaire
- [Qu'est ce qu'un MOTD?](#quest-ce-quun-motd?)
- [Modification du MOTD](#modification-du-motd)

## Qu'est ce qu'un MOTD?

Le MOTD de votre message est le long message que vous voyer dès votre connexion au VPS.

Exemple:

![image](https://user-images.githubusercontent.com/76696559/159167168-10aa2d5d-f37d-47d0-8ec2-8747f774f620.png)

Pour modifier ce dernier veuillez passer à l'étape suivante.

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


Vous verrez votre nouveau MOTD à vôtre prochaine connexion.

