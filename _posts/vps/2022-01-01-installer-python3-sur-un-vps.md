---
layout: post
title: "Installer Python3 sur un VPS (Debian/Ubuntu)"
description: "Installation de Python3 sur un VPS Debian ou Ubuntu"
date: 2022-01-01 15:30:00 +0100
category: vps
---

## Mise en place de Python 3

Ubuntu 20.04 et d'autres versions de Debian Linux sont livrés avec Python 3 préinstallé. Pour être sûr que nos versions sont actualisées, mettons à jour et à niveau le système avec la commande apt pour qu'il fonctionne avec l’outil d’empaquetage avancé d'Ubuntu :

```
sudo apt update
sudo apt -y upgrade
```
## Installer PIP

```sudo apt install -y python3-pip```
Les paquets Python peuvent être installés en tapant :
```pip3 install package_name```

## Créer un .py

Dans cet exemple nous allons créer un programme "hello World":

Créez un fichier avec la commande `nano hello.py` (hello est le nom du fichier et .py l'extension)

Une fois le fichier créé et ouvert ecrivez-y votre code:

```print("Hello, World!")```

Pour quitter nano et sauvegarder faites, Ctrl + x => y

## Exécuter un .py
 ```python hello.py```(Ici hello est le nom du fichier)
 

