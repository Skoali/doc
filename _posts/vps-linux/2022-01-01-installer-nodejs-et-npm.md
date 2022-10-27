---
layout: post
title: "Installer NodeJS et NPM sur un VPS (Debian/Ubuntu)"
description: "Installation de NodeJS et NPM sur un VPS Debian ou Ubuntu"
date: 2022-01-01 15:30:00 +0100
category: vps
---

Afin d’installer NodeJS & NPM faites : 
```sudo apt install nodejs npm```

Une fois l’installation finie, vérifiez que ceux-ci sont installés avec ces commandes : `node -v et npm -v`
Vous verrez ainsi la version de NodeJS et NPM.

Pour installer une dépendance, faites : `npm i [Le nom de la dépendance]`

Pour lancer votre application NodeJS, faites : `node [nom de votre app].js`
