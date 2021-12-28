# Installer

## Avec Yum (Recommandé)

```sudo yum install postfix```  
```sudo yum install cyrus-sasl-plain```

## Sans Yum
entrez la commande:
```sudo apt-get install postfix```

Puis sélectionnez 'Internet Site'.

Installez mailutils avec la commande:
```sudo apt-get install mailutils```

Installer Cyrus SASL:

Téléchargez le fichier depuis github:
```wget https://github.com/cyrusimap/cyrus-sasl/releases/download/cyrus-sasl-2.1.27/cyrus-sasl-2.1.27.tar.gz```

dézippez le fichier:

```tar xvfz cyrus-sasl-2.1.27.tar.gz```

Changez de dossier: 
``` cd cyrus-sasl-2.1.27```

Configurez les fichiers:

```./configure --prefix=/usr/local/cyrus_sasl/2_1_27```

Finir l'installation:

```
make
make install
```


# configurez votre postfix server

entrez la commande:
```sudo vim /etc/postfix/main.cf```

Décommenter les lignes suivantes:
```
myhostname = yourhostname.com
myorigin = $myhostname
inet_interfaces = localhost
inet_protocols = ipv4
mydestination = $myhostname, localhost.$mydomain, localhost
mynetworks_style = host
```
# Lancer votre serveur

Lancez le serveur postfix avec la commande `service postfix start`

Testez votre serveur en envoyant un mail test:
```echo “test” | mail -s “Test mail “ youremailid@Votre_serveur.com```

# Envoyer des e-mails

### ***Vous pouvez également connecter votre serveur à votre service de messagerie pour envoyer des e-mails.***

Ouvrir le fichier de configuration: `vim /etc/postfix/main.cf`

Decommentez les ou ajoutez les lignes suivantes:
```
relayhost = [smtp.youremailserver.com] smtp_sasl_auth_enable = yes
smtp_sasl_password_maps=static:your_username:your_password
smtp_sasl_security_options=noanonymous
```

Restart votre serveur: `service postfix restart`

Voilà vous avez un serveur mail sur votre vps!
