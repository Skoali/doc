---
layout: post
title: "Netdata : Un outil de monitoring simple et opensource"
description: "Présentation et installation de Netdata, un outil de monitoring simple et opensource"
date: 2022-01-01 15:30:00 +0100
category: vps
---

## Qu'est-ce qu'est Netdata ?

Netdata et un outil de monitoring opensource et simple à installer qui vous aidera à monitorer votre serveur.

## Images & Demo

![Netdata]({{ site.baseurl }}/images/netdata1.PNG)

Voici un lien de démo si vous voulez essayer : https://london.my-netdata.io

## Installation

Pour l'installer c'est très facile, il suffit de faire la commande suivante : 

``bash <(curl -Ss https://my-netdata.io/kickstart.sh)``

Quand vous aurez le message "Press ENTER to build and install netdata to your system" appuyez sur entrer.

Quand l'installation sera terminée, vous aurez ce message :

![Netdata2]({{ site.baseurl }}/images/netdata2.png)

Vous pourrez désormais accéder à votre netdata via votre navigateur à l'IP de votre VPS sur le port 19999.

Exemple : http://123.256.789.012:19999

## Désinstallation

Pour désinstaller Netdata :

Commencez par télécharger le script de désinstallation avec la commande suivante et donnez-lui les permissions d'éxecution :

```
wget https://raw.githubusercontent.com/netdata/netdata/master/packaging/installer/netdata-uninstaller.sh
chmod +x ./netdata-uninstaller.sh
```

Ensuite lancez le :

```./netdata-uninstaller.sh --yes```

Quand vous aurez les messages "Press ENTER to recursively delete directory" appuyez sur entrer jusqu'à avoir le message "Netdata files were successfully removed from your system".

Supprimez le script de désinstallation avec la commande suivante :

```rm netdata-uninstaller.sh```

Ca y est, votre Netdata est désintaller !
