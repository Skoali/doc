## Article à terminer

---
layout: post
title: "Faire un Proxy HTTP sur Linux avec Squid (Debian/Ubuntu)"
description: "Présentation de Squid qui permet de crée un Proxy HTTP."
date: 2022-03-27 12:10:00 +0100
category: vps
---

## Pourquoi utiliser un Proxy HTTP ?

Plusieurs raisons peuvent vous pousser à utiliser un Proxy HTTP :

* Changer d'adresse IP.
* Avoir plus de confidentialité sur internet.
* Avoir des logs des sites visitées.
* Accéder à du contenu uniquement disponible à l'étranger.
* Bloquer l'accès à certains sites.

## Installation 

```
apt install squid
```

## Configuration

Videz la configuration de base avec la commande suivante :

```
echo "" > /etc/squid/squid.conf
```

Ensuitez editez le fichier (avec nano par exemple) :

```
nano /etc/squid/squid.conf
```

Ajoutez ensuite la configuration (et modifiez la pour votre utilisation) :

```
#Port

http_port 3128

# Nom de votre Proxy
visible_hostname NomProxy

# Transmettre ou non l'IP du client au site (off ou on)
forwarded_for off

# Logs (sert à activer les logs)
access_log /var/log/squid/access.log
cache_log /var/log/squid/cache.log


# Serveurs DNS (Ici ceux de Google et de Quad9)
dns_nameservers 8.8.8.8 9.9.9.9

# Si vous activez cette option tout le monde pourra utiliser votre proxy (déconseiller)
http_access allow all 

# Exemple de restriction d'accès par IP (ACL)

#acl client1 src 1.1.1.1
#http_access allow client1

## Ne pas attendre lors de l'arret de Squid
shutdown_lifetime 0 seconds
```

Rédemarrez squid :

```
systemctl restart squid
```