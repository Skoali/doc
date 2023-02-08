---
layout: post
title: "Installer un certificat SSL avec Certbot (Debian/Ubuntu)"
description: "Installation et renouvellement d'un certificat SSL avec Certbot (Nginx/Apache2)"
date: 2022-11-01 19:33:00 +0100
category: vps
---

Certbot est un outil qui permet d'installer et de renouveler des certificats SSL. Il est disponible pour la plupart des systèmes d'exploitation et est très facile à utiliser. Il est recommandé d'utiliser Certbot pour installer un certificat SSL sur votre serveur web.

## Installation

### Installation classique

Certbot est disponible dans les dépôts de la plupart des distributions Linux. Vous pouvez donc l'installer avec votre gestionnaire de paquets habituel. Par exemple, pour Debian et Ubuntu, vous pouvez utiliser la commande suivante:

    sudo apt-get install certbot

### Installation pour Nginx

Certbot peut également être installé pour Nginx. Pour ce faire, vous devez installer le paquet `python3-certbot-nginx`:

    sudo apt-get install python3-certbot-nginx

### Installation pour Apache2

Certbot peut également être installé pour Apache. Pour ce faire, vous devez installer le paquet `python3-certbot-apache`:

    sudo apt-get install python3-certbot-apache

## Utilisation

### Utilisation classique

Pour utiliser Certbot, vous devez exécuter la commande suivante:

    sudo certbot certonly

Cela vous demandera d'entrer votre adresse e-mail et de confirmer que vous acceptez les conditions d'utilisation de Let's Encrypt. Ensuite, vous devrez choisir un nom de domaine pour lequel vous souhaitez obtenir un certificat SSL. Certbot vous demandera ensuite si vous souhaitez rediriger le trafic HTTP vers HTTPS. Si vous choisissez cette option, vous devrez également choisir un serveur web. Certbot vous demandera ensuite si vous souhaitez activer le renouvellement automatique du certificat. Si vous choisissez cette option, vous devrez également choisir un moyen de recevoir des notifications lorsque le certificat doit être renouvelé.

### Utilisation pour Nginx

Pour utiliser Certbot pour Nginx, vous devez exécuter la commande suivante:

    sudo certbot --nginx

### Utilisation pour Apache2

Pour utiliser Certbot pour Apache, vous devez exécuter la commande suivante:

    sudo certbot --apache

## Renouvellement

Pour renouveler un certificat SSL, vous devez exécuter la commande suivante:

    sudo certbot renew

## Renouvellement automatique

Vous pouvez configurer un cron pour exécuter le renouvellement périodiquement. Vous pouvez utiliser la commande suivante pour exécuter la commande toutes les semaines:

    sudo crontab -e

Ensuite, ajoutez la ligne suivante au fichier:

    0 0 * * 0 sudo certbot renew

## Ressources

-    [Certbot](https://certbot.eff.org/)
-    [Let's Encrypt](https://letsencrypt.org/)
-    [Certbot pour Nginx](https://certbot.eff.org/instructions?ws=nginx&os=debianbuster)
-    [Certbot pour Apache](https://certbot.eff.org/instructions?ws=apache&os=debianbuster)
