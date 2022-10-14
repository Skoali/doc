# **Installer un serveur gitlab sur son VPS**

## Étape 0
Avant toute installation, veillez à mettre à jour votre système 
```
$ apt-get update  
$ apt-get upgrade -y  
$ apt-get dist-upgrade -y
```

## Installation de Gitlab
- D'abord les dépendances
	```
	$ apt-get install -y curl openssh-server ca-certificates
	```

- Ensuite, le dépôt de Gitlab à votre VPS
	```
	$ curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | bash
	```

- Pour finir, installez Gitlab sur le port de votre choix, ici 6080
	```
	$ EXTERNAL_URL="http://vpsXXXXX.lws-hosting.com:6080" apt-get install gitlab-ee
	```

- Patientez...
- Si il n'y a pas d'erreur faites
	```
	$ gitlab-ctl restart
	```

## Configuation du reverse proxy (Apache)

- Crée un fichier de configuration
```
$ nano /etc/apache2/sites-available/gitlab.conf
```
- Collez ce qui suit, et vérifier les configuration de certificat SSL
```
  <VirtualHost *:80>
    ServerName git.exemple.com
    ServerAdmin root@git.exemple.com

    RewriteEngine On
    RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]
</VirtualHost>

<VirtualHost *:443>
    ServerName git.exemple.com
    ServerAdmin root@git.exemple.com

    ProxyRequests Off
    ProxyPreserveHost On
    ProxyVia Full

    <Proxy *>
        Require all granted
    </Proxy>

    <Location />
        ProxyPass http://127.0.0.1:6080/
        ProxyPassReverse http://127.0.0.1:6080/
    </Location>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    LogLevel warn
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/git.exemple.com/fullchain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/git.exemple.com/privkey.pem
    SSLCertificateChainFile /etc/letsencrypt/live/git.exemple.com/chain.pem
</VirtualHost>
```
- Activons ce nouveau vhost
  ```
  $ ln -s /etc/apache2/sites-available/gitlab.conf /etc/apache2/sites-enabled/000-gitlab.conf
  ```
 - Redémarrer Apache
   ```
  $ systemctl restart apache2
  ```
