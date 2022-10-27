---
layout: post
title: "Enregistrer son terminal ou sa session SSH avec Asciinema."
description: "Installation de Asciinema pour enregistrer son terminal ou sa session SSH et partager l'enregistrement."
date: 2022-03-19 18:30:00 +0100
category: vps-linux
---

## Installation 

**Debian :**

```
apt install asciinema
```

**Ubuntu :**

```
sudo apt-add-repository ppa:zanchey/asciinema
sudo apt-get update
sudo apt-get install asciinema
```

**CentOS / Fedora :**

```
yum install asciinema
```

## Lier son installation à un compte asciinema (Facultatif, mais conseillé)

Lier son installation à un compte asciinema permet de garder les enregistrements plus de 7 jours.

Pour ce faire il faut effectuer la commande `asciinema auth` et suivre le lien qui s'affiche dans le terminal.

## Enregistrer son terminal

Pour commencer un enregistrement de terminal il faut executer le commande `asciinema rec`

Pour arrêter un enregistrement, il faut faire les touches Ctrl + D pour faire entrer pour l'envoyer sur le site asciinema.

## Exemple d'enregistrement

[![Demo asciinema](https://asciinema.org/a/F0WpQJoegWyXdKLnFjB3XuOPq.svg)](https://asciinema.org/a/F0WpQJoegWyXdKLnFjB3XuOPq)