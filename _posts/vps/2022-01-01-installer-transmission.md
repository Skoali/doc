---
layout: post
title: "Installer un client torrent (transmission) (Debian/Ubuntu)"
description: "Installation du client torrent transmission sur un VPS sous Debian ou Ubuntu"
date: 2022-01-01 15:30:00 +0100
category: vps
---

## Installation

```
sudo apt update
sudo apt install transmission-daemon
sudo systemctl enable transmission-daemon --now
```

Désormais votre interface web de Transmission est désormais disponible sur le port 9091 de votre machine ! (ex : 1.1.1.1:9091)

Afin de vous y connecter, le nom d’utilisateur ainsi que le mot de passe par défaut est transmission

SI vous obtenez une erreur de “Whitelist”, et que le mot de passe ne marche pas, suivez ces étapes :

Faites : `nano /etc/transmission-daemon/settings.json`

Trouvez la ligne `"rpc-whitelist-enabled": true`,  et remplacez true par false

Trouvez ensuite la ligne `"rpc-password": “mot de passe”`

Remplacez ce qui se trouve entre les guillemets par un mot de passe de votre choix

Quittez nano en faisant CTRL + X puis y puis la touche entrée pour sauvegardé

Faites ensuite `sudo systemctl reload transmission-daemon` pour redémarrer transmission

Rafraichissez la page et connectez vous avec votre nouveau mot de passe
