---
layout: post
title: Se connecter au SFTP de son serveur de jeu
description: Se connecter au SFTP de son serveur de jeu
date: "2022-07-08 18:02:00"
category: autres
---

## Télécharger un client SFTP.

### Quel client SFTP utiliser ?

### Windows

Pour Windows, les deux grands clients SFTP sont FileZilla et WinSCP.

    * FileZilla : http://filezilla-project.org/download.php?type=client
    * WinSCP : http://winscp.net/download.php

Nous vous conseillons WinSCP. Et les captures d'écrans de cette documentation serons des captures d'écrans de WinSCP.

### MacOS

    * FileZilla : http://filezilla-project.org/download.php?type=client
    * Cyberduck : https://cyberduck.io/download

## Connexion au SFTP de votre serveur de jeu.

Sur le panel de votre serveur de jeu, allez dans le menu "Settings" 

Vous aurez ensuite "SFTP DETAILS" ou vous y trouverez vos identifiants de connexion SFTP :

[SftpDetailsPanel](/images/SFTP_Details_Panel.webp)

Cliquez ensuite sur "Launch SFTP" afin de lancer le client SFTP.

Si c'est votre première connexion, vous aurez un message d'avertissement :

[Winscp cert warning](/images/winscpcertwarning.webp)

Acceptez en appuyant sur "OUI".

Ensuite, il vous sera demander votre mot de passe :

[Winscp password](/images/winscppasswd.webp)

Vous serez ensuite connecté au SFTP de votre serveur de jeu :

[Winscp files](/images/winscpfiles.webp)

* Si vous n'arrivez pas à vous connecter via le bouton "Launch SFTP", vous pouvez essayer de vous connecter directement en entrant vos identifiants sur votre client SFTP.