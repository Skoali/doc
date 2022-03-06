---
layout: post
title: "Installer Mysql et phpmyadmin sur un VPS (Debian/Ubuntu)"
description: "Installation de Mysql et phpmyadmin (sous apache2) sur un VPS Debian ou Ubuntu"
date: 2022-01-01 15:30:00 +0100
category: vps
---

## Installez mariadb.
```apt install mariadb-client mariadb-server -y```
## Configurez l'accès à MySQL.
```sudo mysql_secure_installation```
 * Enter current password for root (enter for none) : appuyez sur enter
 * Set root password? [Y/n] : Y
 * New password : votre mot de passe
 * Re-enter new password : votre mot de passe
 * Remove anonymous users? [Y/n] : Y
 * Disallow root login remotely? [Y/n] : n
 * Remove test database and access to it? [Y/n] : Y
 * Reload privilege tables now? [Y/n] : Y
## Créer un utilisateur pour PhpMyAdmin.
```
sudo mysql -u root -p
GRANT ALL ON *.* TO 'UTILISATEUR'@'localhost' IDENTIFIED BY 'MOTDEPASSE';  
FLUSH PRIVILEGES;  
exit;
```  
## Installer apache2 et les dépendances PHP
```sudo apt install apache2 php php-json php-mbstring php-zip php-gd php-xml php-curl php-mysql php-mysqli php-xml```
## Installer PhpMyAdmin.
```
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.zip
sudo unzip phpMyAdmin-5.1.0-all-languages.zip -d /opt
sudo mv -v /opt/phpMyAdmin-5.1.0-all-languages /opt/phpMyAdmin
sudo chown -Rfv www-data:www-data /opt/phpMyAdmin
sudo nano /etc/apache2/sites-available/phpmyadmin.conf
```
Entrez dans ce fichier le contenu suivant :

```
<VirtualHost *:9000>
ServerAdmin webmaster@localhost
DocumentRoot /opt/phpMyAdmin

<Directory /opt/phpMyAdmin>
Options Indexes FollowSymLinks
AllowOverride none
Require all granted
</Directory>
ErrorLog ${APACHE_LOG_DIR}/error_phpmyadmin.log
CustomLog ${APACHE_LOG_DIR}/access_phpmyadmin.log combined
</VirtualHost>
```

Ici c'est le port 9000 qui est utilisé, vous pouvez choisir le vôtre
entrez la suite de touches suivantes "ctrl + x => y => enter"
```sudo nano /etc/apache2/ports.conf```
# Accédez à PhpMyAdmin.
 -Rendez-vous sur l'ip du vps + :9000 (le port choisis).
 -Entrez vos identifiants.
 -Voila! vous avez installé PhpMyAdmin sur votre VPS 
