# Introduction
Lors de la lecture de cet article, vous apprendrez a installer Next

# Sommaire 
- [Installation de Nextcloud](#installation-et-nextcloud)
- [Création de BDD](#création-et-bdd)
- [Création VHost](#création-VHost)
- [Installer PHP](#installer-php)

## Installation de Nextcloud
1) Téléchargez  Nextcloud
```
$ wget https://download.nextcloud.com/server/releases/nextcloud-23.0.0.zip
```
2) Dézipper le dossier
```
$ sudo apt install unzip
$ sudo unzip nextcloud-23.0.0.zip -d /var/www/
```
3) Ici on mets tout dans le répertoire du serveur web et on donne tout les droits d'écriture a apache
```
sudo chown www-data:www-data /var/www/nextcloud/ -R
```

## Création de BDD
1) Lancez mysql
```
$ sudo mysql
```
2) Crée une base de donnèes pour NextCloud
```
$ create database nextcloud;
```
3) Crée l'utilisateur de la base de donnèes
```
$ create user nextclouduser@localhost identified by 'votre_mot_de_passe';
```
4) Donnez tous les privillèges à cet utilisateur et flusher le tout
```
$ grant all privileges on nextcloud.* to nextclouduser@localhost identified by 'your-password';
$ flush privileges;
```
## Création VHost
1) Crèez un fichier `nextcloud.conf` dans `/etc/apache2/sites-available/`
```
$ sudo nano /etc/apache2/sites-available/nextcloud.conf
```
2) Copiez et collez le texte suivant en remplacant `nextcloud.example.com` par votre domaine
```
<VirtualHost *:80>
        DocumentRoot "/var/www/nextcloud"
        ServerName nextcloud.example.com

        ErrorLog ${APACHE_LOG_DIR}/nextcloud.error
        CustomLog ${APACHE_LOG_DIR}/nextcloud.access combined

        <Directory /var/www/nextcloud/>
            Require all granted
            Options FollowSymlinks MultiViews
            AllowOverride All

           <IfModule mod_dav.c>
               Dav off
           </IfModule>

        SetEnv HOME /var/www/nextcloud
        SetEnv HTTP_HOME /var/www/nextcloud
        Satisfy Any

       </Directory>

</VirtualHost>
```
3) [Ctrl+x] puis [y]
4) Activez ce virtual host
```
$ sudo a2ensite nextcloud.conf
```
5) Lancez apache
```
$ sudo a2enmod rewrite headers env dir mime setenvif ssl
```
6) Vérifiez la configuration Apache
```
$ sudo apache2ctl -t
```
7) Si tout vas bien redémarrer Apache
```
$ sudo systemctl restart apache2
```

## Installer PHP

1) Installez les modules PHP et activez-les
```
$ sudo apt install php-imagick php7.4-common php7.4-mysql php7.4-fpm php7.4-gd php7.4-json php7.4-curl  php7.4-zip php7.4-xml php7.4-mbstring php7.4-bz2 php7.4-intl php7.4-bcmath php7.4-gmp
```

2) Redémarrz Apache
```
$ sudo systemctl reload apache2
```
