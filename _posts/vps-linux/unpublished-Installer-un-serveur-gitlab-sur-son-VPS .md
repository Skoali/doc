---
layout: post
title: "Installer un serveur GitLab sur son VPS"
description: "Installation d'un serveur GitLab sur un VPS Debian ou Ubuntu"
date: 2022-10-25 11:55:00 +0100
category: vps
---

## Mises à jour

Avant toute installation, veillez à mettre à jour votre système 

```bash
apt update  
apt upgrade -y  
apt dist-upgrade -y
```

## Installation de Gitlab

- D'abord les dépendances
	```bash
	$ apt install -y curl openssh-server ca-certificates
	```

- Ensuite, le dépôt de Gitlab à votre VPS
	```bash
	$ curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | bash
	```

- Pour finir, installez Gitlab sur le port de votre choix, ici 6080
	```bash
	EXTERNAL_URL="http://vpsXXXXX.skoa.li" 
  apt install gitlab-ee
	```

- Patientez...
- Si il n'y a pas d'erreur faites
```bash
gitlab-ctl restart
```

## Configuation du reverse proxy (Nginx)
- Collez ce qui suit dans le fichier de configuration Nginx.
```
server {
    server_name foo.example.com git.exemple.com;
    rewrite ^/?(.*) https://%{SERVER_NAME}/$1 last;
}
server {
    server_name foo.example.com git.exemple.com;
    listen 443 ssl;
    error_log /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
    ssl_certificate /etc/letsencrypt/live/git.exemple.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/git.exemple.com/privkey.pem;
    # *add* contents of the file listed under ssl_certificate from  /etc/letsencrypt/live/git.exemple.com/chain.pem;
    rewrite ^/?(.*) https://%{SERVER_NAME}/$1 last;
}
  
- Redémarrer Apache
```
$ systemctl restart nginx
```
