---
layout: post
title: "Installer NGINX et PHP sur son VPS (Debian/Ubuntu)"
description: "Installation d'un serveur Web (nginx) et PHP sur un VPS Debian ou Ubuntu"
date: 2022-01-01 15:30:00 +0100
category: vps
---

## Introduction

Lors de la lecture de cet article, vous allez apprendre comment installer un serveur Web sur votre VPS avec nginx et PHP 7.1.

## Sommaire
- [Installation de nginx](#installation-de-nginx)
- [Installation de PHP](#installation-de-PHP)
- [Nginx VHosts](#nginx-vhosts)

## Installation de nginx

1) Pour installer nginx utilisez ces commandes :
```
$ sudo apt update
$ sudo apt install nginx
```
2) Visiter l'ip de votre machine sur votre navigateur de rechather favoris.
![image]({{ site.baseurl }}/images/welcomenginx.png)

3) Voilà, naviguer maintenant à ce dossier `cd /var/www/html` et modifier `index.html`

## Installation de PHP

1) Pour installer PHP 7.1 tapez ces commandes :
```
$ sudo apt update
$ sudo apt install php-fpm
```
2) Une fois fini, vérifier que PHP fonctionne correctement
```
$ systemctl status php7.2-fpm
```
3) Vous pouvez à présent changer la configuration de nginx pour que ce dernier supporte PHP.

```
$ cd /etc/nginx/sites-enabled
$ nano default
```

Dans `default`

```
server {

    # . . . other code

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
    }
}
```
4) Pour finir, redémarrer nginx
```
$ sudo systemctl restart nginx
```

## Nginx VHosts

Pour avoir 2 sites web différents sur le même serveur, il vous faut :

1) Créez les dossiers ou le html de vos sites se trouverons
```
$ cd /var/www/html
$ mkdir site1
$ mkdir site2
```

2) Créez 2 fichiers index.html différentes pour chaque site pour pouvoir les différencier
```
$ cd site1
$ nano index.html
```

Ecrivez:

```html
<html>
  <body>
    <h1>Site 1</h1>
  </body>
</html>
```
Puis `Ctrl+x` et `y`. Faites de même en mettant `Site 2` dans le `index.html` du dossier site2

3) Maintenant que vos 2 sites sont faits, aller dans le dossier de configuration de nginx et copier 2 fois le fichier `default` pour le site1 et le site2.
```
$ cd /etc/nginx/sites-available
$ cp default site1.conf
$ cp default site2.conf
```

4) Ouvrez chaqu'un des fichiers .conf et trouver `root /var/www/html;` et remplacez par `root /var/www/html/site1;`
5) Faites de memes pour site2.conf et penser à remplacer par `root /var/www/html/site2;`
6) Réouvrer chaqu'un des deux fichiers .conf et mettes les domaines respectifs des 2 sites web dans `server_name _;` en mettant par exemple `server_name www.site1.com site1.com` pour `site1.conf`
7) Supprimer le fichier `default` 
```
$ rm default
```
9) Crée un lien pour les 2 fichiers .conf dans `/etc/nginx/sites-enabled`
```
$ ln -s /etc/nginx/sites-available/site1 /etc/nginx/sites-enabled
$ ln -s /etc/nginx/sites-available/site2 /etc/nginx/sites-enabled
```

10) Redemarrer nginx
```
$ systemctl restart nginx
```

Vous pouvez maintenant visiter vos domaines pour vérifier.
