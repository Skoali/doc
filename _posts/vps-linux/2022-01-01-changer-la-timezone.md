---
layout: post
title: "Changer l'heure (la timezone) d'un vps"
description: "Changement de l'heure (la timezone) d'un vps avec la commande timedatectl"
date: 2022-01-01 15:30:00 +0100
category: vps-linux
---

Pour vérifier la timezone de votre machine, effectuez `timedatectl`

Pour lister toutes les timezone disponibles, faites `timedatectl list-timezones`

Pour changer celle-ci, faites : `sudo timedatectl set-timezone [La timezone de votre choix, par exemple Europe/Paris]`

Vérifiez qu’elle a bien été changée en faisant `timedatectl`
