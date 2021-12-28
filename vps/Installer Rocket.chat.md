# Installer Rocket.chat sur un Debian et Ubuntu

# Prérequis
* Mongodb 
* NodeJS 

## Avec snap (Ubuntu uniquement)
```sudo snap install rocketchat-server```

## Manuellement (Debian)

Telecharger la derrniere vesion de rocket.chat:

`wget https://releases.rocket.chat/latest/download -O /tmp/rocket.chat.tgz`

Extraire l'archive: `tar xzf /tmp/rocket.chat.tgz -C /tmp`

Installer toutes les dépendances: `(cd /tmp/bundle/programs/server; npm i)`

Pour finir ajoutez la commande: `sudo mv /tmp/bundle /opt/Rocket.Chat`

accedez a votre instance rocket.chat avec l'url: `http://IP-de-VOTRE-SERVEUR:3000`

# Mise en place d'un reverse proxy Nginx

Un reverse Proxy NGINX peut servir pour avoir un certificat SSL (https)

### Installer Nginx

```apt update && apt install nginx```

### Créer un "vhost"

```nano /etc/nginx/sites-available/chat.votredomaine.tld```

### Activer "vhost"

```ln -s /etc/nginx/sites-available/chat.votredomaine.tld /etc/nginx/sites-enabled/```

### Reload Nginx

```service nginx reload```

# Obtenir un certificat SSL avec "Let's Encrypt"

![image](/images/letsencrypt.png)


### Istaller acme.sh

```
wget -O -  https://get.acme.sh | sh
sudo source ~/.bashrc
```  

### Générez votre certificat

```
acme.sh  --issue  -d chat.votredomaine.tld --pre-hook "systemctl stop nginx" --standalone --post-hook "systemctl start nginx" --ecc -k ec-384
```

### Stocker votre certificat

```mkdir -p /etc/letsencrypt/live/chat.votredomaine.tld```

### Installer votre certificat

```
acme.sh --install-cert -d chat.votredomaine.tld --ecc \
--cert-file /etc/letsencrypt/live/chat.votredomaine.tld/cert.pem \
--key-file /etc/letsencrypt/live/chat.votredomaine.tld/key.pem \
--fullchain-file /etc/letsencrypt/live/chat.votredomaine.tld/fullchain.pem \
--ca-file /etc/letsencrypt/live/chat.votredomaine.tld/ca.pem \
--reloadcmd "systemctl restart nginx.service"
```

## Ajouter le certificat à votre configuration Nginx
Créez le fichier `/var/www/chat.votredomaine.tld/conf/nginx/ssl.conf`qui sera automatiquement ajouté dans notre vhost grâce à la directive `include  /var/www/chat.votredomaine.tld/conf/nginx/*conf;`

Son contenu est: 
```
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    ssl_certificate /etc/letsencrypt/live/chat.votredomaine.tld/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/chat.votredomaine.tld/key.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/chat.votredomaine.tld/ca.pem;

```
### Dernière étape

Reload votre Nginx avec la commande `service nginx reload`



