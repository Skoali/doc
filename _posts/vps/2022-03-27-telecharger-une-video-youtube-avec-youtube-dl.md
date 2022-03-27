---
layout: post
title: "Télécharger une vidéo YouTube (ou autre) sur Linux avec youtube-dl"
description: "Présentation de youtube-dl qui permet de télécharger une vidéo YouTube (ou autre) depuis son terminal Linux."
date: 2022-03-27 11:10:00 +0100
category: vps
---

youtube-dl permet de télécharger une vidéo de YouTube, Instagram, Twitch, TikTok, Twitter [Voir toute la liste](https://ytdl-org.github.io/youtube-dl/supportedsites.html) depuis le terminal d'une machine sous Linux.

Il télécharge les vidéos directement depuis les serveurs du site et possède aussi une option pour télécharger que le son d'une vidéo.

## Installation

**Debian/Ubuntu**

```
apt install youtube-dl
```

**Depuis PIP**

```
sudo -H pip install --upgrade youtube-dl
```

**CentOS/Fedora**

```
wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
chmod a+rx /usr/local/bin/youtube-dl
```

## Utilisation

**Télécharger une vidéo :**

```
youtube-dl https://example.com/video
```

**Télécharger uniquement l'audio d'une vidéo :**

```
youtube-dl -x https://example.com/video
```