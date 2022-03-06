---
layout: post
title: "Installer des modules NPM sur son hébergement NodeJS"
description: "Installer des modules NPM sur son hébergement NodeJS"
date: 2022-01-01 15:30:00 +0100
category: nodejs
---

----------------------------------
## Voici un tutoriel pour installer des modules NPM pour Bots Discord.

----------------------------------

        Vous avez plusieurs solutions 
                
                - Si vous avez une bonne connexion, vous pouvez transferer tous vos modules à partir du SFTP.
                - Transferer votre package.json (Je vous l'explique)

Donc, pour installer vos modules à partir de votre package.json, il vous faudra :

        - Supprimez vos anciens fichiers package.json et package.lock
        - Tapez "npm init" dans votre terminal, ou invite de commandes
        - Entrez les informations demandées
        
Une fois terminé, votre package.json sera crée, il devrait ressembler à quelque chose comme ça : 
        
        
 ```    
 {
  "name": "v2",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "dependencies": {
    "discord.js": "^11.5.1",
    "fs": "^0.0.1-security"
  },
  "devDependencies": {},
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}
```

Si votre package.json ne ressemble pas à ça, c'est qu'il y a eu un problème,

-----------------
Si il est comme ça, vous pouvez supprimer l'ancien de votre hébergement et upload votre package.json que vous avez en local à partir du gestionnaire de fichiers sur le panel, ou en sftp.
----------------------------------

*Si vous avez un soucis au niveau de ce tutoriel, passez sur le Discord de Skoali, et faites une demande d'entraide*
