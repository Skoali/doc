---
layout: post
title: "Installer un serveur VPN WireGuard (Debian/Ubuntu)"
description: "Installation WireGuard et configuration d'un serveur VPN avec un script d'installation."
date: 2022-03-23 17:45:00 +0100
category: vps
---

Cette documentation utilise le script d'installation de WireGuard d'[@angristan](https://github.com/angristan/wireguard-install)

## Installation

Pour télécharger le script d'installation, copiez collez la commande suivant dans un terminal :

```
curl -O https://raw.githubusercontent.com/angristan/wireguard-install/master/wireguard-install.sh && chmod +x wireguard-install.sh
```

## Utilisation

Lancez le script à l'aide de la commande suivante :

```
./wireguard-install.sh
```

### Premier lancement

Au premier lancement plusieurs questions vous serons posées, si vous ne savez pas comment répondre à certaines d'entre elles il vous suffira de laisser les réponses prédéfinies qui s'ont en général correct.

Quand vous aurez fini de répondre aux questions et que l'installation sera faite, vous aurez un QRCode sur votre écran pour vous permettre de configurer simplement le VPN sur un appareil mobile.
Un fichier .conf sera également créé et sauvegardé dans /root pour vous permettre de configurer le VPN sur n'importe quel client WireGuard.

### Crée un client

Pour créer un autre client, relancez le script et sélectionnez l'option 1, il suffira ensuite de répondre aux questions qui vous seront demandées.

### Supprimer un utilisateur

Pour supprimer un utilisateur, relancez le script et sélectionnez l'option 2, il suffira ensuite de choisir l'utilisateur que vous souhaitez supprimer.

### Désinstaller WireGuard

Le script permet également de désinstaller WireGuard, pour cela relancez-le et sélectionnez l'option 3, une confirmation vous sera alors demandée. Répondez oui (y) et WireGuard sera supprimé.

Vous pouvez ensuite supprimé le script avec la commande suivante :

```
rm wireguard-install.sh
```

Vous pouvez aussi supprimer manuellement les fichiers de configurations clients qui se trouvent dans /root. 