---
layout: post
title: "Installer un serveur mail sur VPS (Debian/Ubuntu)"
date: 2022-01-01 15:30:00 +0100
category: vps
---

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

# Mise en place de DKIM

L'instalation DKIM est fortement recomandée malgé le faite qu'elle ne soit pas nesesaire.

Pour comancer dans votre interface de gestion DNS, créez un nouvel enregistrement TXT comme ci-dessous:

```TXT  @   v=spf1 mx ~all```

![image](https://user-images.githubusercontent.com/60802587/147597245-cf967382-02a6-4d6e-ab5e-16ca9d8d8dd0.png)


Pour vérifier si votre enregistrement SPF est propagé sur l'Internet public, vous pouvez utiliser l'utilitaire dig sur votre machine Linux comme ci-dessous. (Sur Ubuntu, vous devez installer le package bind9-dnsutils pour utiliser la commande dig : sudo apt install bind9-dnsutils)

```dig your-domain.com txt```

## Configurez SPF Policy Agent

Tout d'abord, installez les packages requis :
```sudo apt install postfix-policyd-spf-python```

Editez ensuite le fichier de configuration du processus maître de Postfix:
```sudo nano /etc/postfix/master.cf```

Ajoutez les lignes suivantes à la fin du fichier, qui indiquent à Postfix de démarrer le démon de politique SPF lorsqu'il démarre lui-même:
```
policyd-spf  unix  -       n       n       -       0       spawn
    user=policyd-spf argv=/usr/bin/policyd-spf
```

Save and close the file. Next, edit Postfix main configuration file:
```sudo nano /etc/postfix/main.cf```

Ajoutez les lignes suivantes à la fin du fichier. La première ligne spécifie le paramètre de délai d'expiration de l'agent de politique Postfix. Les lignes suivantes imposeront une restriction aux e-mails entrants en rejetant les e-mails non autorisés et en vérifiant l'enregistrement SPF.

```
policyd-spf_time_limit = 3600
smtpd_recipient_restrictions =
   permit_mynetworks,
   permit_sasl_authenticated,
   reject_unauth_destination,
   check_policy_service unix:private/policyd-spf
```

Enregistrez et fermez le fichier. Redémarrez ensuite Postfix.

```sudo systemctl restart postfix```

La prochaine fois, lorsque vous recevrez un e-mail d'un domaine qui possède un enregistrement SPF, vous pourrez voir les résultats de la vérification SPF dans l'en-tête brut de l'e-mail. L'en-tête suivant indique que l'expéditeur a envoyé l'e-mail à partir d'un hôte autorisé.

## Mise en place de DKIM

Tout d'abord, installez OpenDKIM qui est une implémentation open source du système d'authentification de l'expéditeur DKIM:

```sudo apt install opendkim opendkim-tools```

Ajoutez ensuite l'utilisateur postfix au groupe opendkim`sudo gpasswd -a postfix opendkim`

Edit OpenDKIM main configuration file: `sudo nano /etc/opendkim.conf`

Décommentez les lignes suivantes. Remplacez simple par relaxed/simple:

```
Canonicalization   simple
Mode               sv
SubDomains         no
```

Ajoutez ensuite les lignes suivantes sous la ligne #ADSPAction continue. Si votre fichier n'a pas de ligne continue #ADSPAction, ajoutez-les simplement sous les Ajoutez ensuite les lignes suivantes sous la ligne #ADSPAction continue. Si votre fichier n'a pas de ligne continue #ADSPAction, ajoutez-les simplement sous les sous-domaines no. no.

```
AutoRestart         yes
AutoRestartRate     10/1M
Background          yes
DNSTimeout          5
SignatureAlgorithm  rsa-sha256
```

Ajoutez les lignes suivantes à la fin de ce fichier. (Notez que sur Ubuntu 18.04 et 20.04, l'ID utilisateur est déjà défini sur opendkim)
```
#OpenDKIM user
# Remember to add user postfix to group opendkim
UserID             opendkim

# Map domains in From addresses to keys used to sign messages
KeyTable           refile:/etc/opendkim/key.table
SigningTable       refile:/etc/opendkim/signing.table

# Hosts to ignore when verifying signatures
ExternalIgnoreList  /etc/opendkim/trusted.hosts

# A set of internal hosts whose mail should be signed
InternalHosts       /etc/opendkim/trusted.hosts
```

Enregistrez et fermez le fichier.

## Créer une table de signature, une table de clés et un fichier d'hôtes de confiance

Créer une structure de répertoire pour OpenDKIM: 
```
sudo mkdir /etc/opendkim

sudo mkdir /etc/opendkim/keys
```

Changez le propriétaire de root en opendkim et assurez-vous que seul l'utilisateur opendkim peut lire et écrire dans le répertoire des clés:
```
sudo chown -R opendkim:opendkim /etc/opendkim

sudo chmod go-rw /etc/opendkim/keys
```

Créez la table de signature: `sudo nano /etc/opendkim/signing.table`

Ajoutez cette ligne au fichier. Cela indique à OpenDKIM que si un expéditeur sur votre serveur utilise une adresse @votre-domaine.com, il doit être signé avec la clé privée identifiée par défaut._domainkey.votre-domaine.com :

```*@your-domain.com    default._domainkey.your-domain.com```

Enregistrez et fermez le fichier. Créez ensuite la table de clés:

```sudo nano /etc/opendkim/key.table```

Ajoutez la ligne suivante, qui indique l'emplacement de la clé privée:
```default._domainkey.your-domain.com     your-domain.com:default:/etc/opendkim/keys/your-domain.com/default.private```

Enregistrez et fermez le fichier. Ensuite, créez le fichier des hôtes de confiance:

```sudo nano /etc/opendkim/trusted.hosts```

Ajoutez les lignes suivantes au fichier nouvellement créé. Cela indique à OpenDKIM que si un e-mail provient de localhost ou du même domaine, OpenDKIM ne doit pas effectuer de vérification DKIM sur l'e-mail:

```
127.0.0.1
localhost

*.your-domain.com
```

Enregistrez et fermez le fichier.

## Générer une paire de clés privée/publique

Étant donné que DKIM est utilisé pour signer les messages sortants et vérifier les messages entrants, nous devons générer une clé privée pour la signature et une clé publique pour le vérificateur à distance. La clé publique sera publiée dans DNS.

Créez un dossier séparé pour le domaine: `sudo mkdir /etc/opendkim/keys/your-domain.com`


Générez des clés à l'aide de l'outil opendkim-genkey: `sudo opendkim-genkey -b 2048 -d your-domain.com -D /etc/opendkim/keys/your-domain.com -s default -v`

La commande ci-dessus créera des clés de 2048 bits. -d (domaine) spécifie le domaine. -D (répertoire) spécifie le répertoire où les clés seront stockées et nous utilisons par défaut comme sélecteur (-s), également connu sous le nom. Une fois la commande exécutée, la clé privée sera écrite dans le fichier default.private et la clé publique sera écrite dans le fichier default.txt.

Faire opendkim en tant que propriétaire de la clé privée:
```sudo chown opendkim:opendkim /etc/opendkim/keys/your-domain.com/default.private```

Et modifiez l'autorisation, de sorte que seul l'utilisateur opendkim ait un accès en lecture et en écriture au fichier: ```sudo chmod 600 /etc/opendkim/keys/your-domain.com/default.private```

## Publiez votre clé publique dans les enregistrements DNS

Afficher la clé publique: `sudo cat /etc/opendkim/keys/votre-domaine.com/default.txt`

La chaîne après le paramètre `p` est la clé publique.

Dans votre gestionnaire DNS, créez un enregistrement TXT, saisissez default._domainkey dans le champ du nom. Revenez ensuite à la fenêtre du terminal, copiez tout ce qui se trouve entre parenthèses et collez-le dans le champ de valeur de l'enregistrement DNS. Vous devez supprimer tous les guillemets doubles et les espaces blancs dans le champ de valeur. Si vous ne les supprimez pas, le test de clé de l'étape suivante échouera probablement.

![image](https://user-images.githubusercontent.com/60802587/147598863-17d0658a-a62d-4e2a-85e9-282f9e0de561.png)

Tester la clé DKIM

Entrez la commande suivante sur le serveur Ubuntu pour tester votre clé:

```sudo opendkim-testkey -d your-domain.com -s default -vvv```

Si tout est OK, vous verrez Key OK dans la sortie de la commande: 

```
opendkim-testkey: using default configfile /etc/opendkim.conf
opendkim-testkey: checking key 'default._domainkey.your-domain.com'
opendkim-testkey: key secure
opendkim-testkey: key OK
```

Si vous voyez Key not secure dans la sortie de la commande, ne paniquez pas. C'est parce que DNSSEC n'est pas activé sur votre nom de domaine. DNSSEC est une norme de sécurité pour les requêtes DNS sécurisées. La plupart des noms de domaine n'ont pas activé DNSSEC. Il n'y a absolument aucun besoin de s'inquiéter de la clé non sécurisée. Vous pouvez continuer à suivre ce guide.


If you see the query timed out error, you need to comment out the following line in /etc/opendkim.conf file and restart opendkim.service.
`TrustAnchorFile       /usr/share/dns/root.key`

## Connectez Postfix to OpenDKIM

Postfix peut communiquer avec OpenDKIM via un fichier socket Unix. Le fichier socket par défaut utilisé par OpenDKIM est /var/run/opendkim/opendkim.sock, comme indiqué dans le fichier /etc/opendkim.conf. Mais le démon SMTP postfix fourni avec Ubuntu s'exécute dans une prison chroot, ce qui signifie que le démon SMTP résout tous les noms de fichiers relatifs au répertoire de file d'attente de Postfix (/var/spool/postfix). Nous devons donc modifier le fichier de socket OpenDKIM Unix.

Créez un répertoire pour contenir le fichier de socket OpenDKIM et autorisez uniquement l'utilisateur opendkim et le groupe postfix à y accéder.

```
sudo mkdir /var/spool/postfix/opendkim

sudo chown opendkim:postfix /var/spool/postfix/opendkim
```
Modifiez ensuite le fichier de configuration principal OpenDKIM: `sudo nano /etc/opendkim.conf`

Trouvez la ligne suivante (Ubuntu 18.04):   
`Socket    local:/var/run/opendkim/opendkim.sock`

Ou (Ubuntu 20.04):
`Socket    local:/run/opendkim/opendkim.sock`   

Remplacez-le par la ligne suivante. (Si vous ne trouvez pas la ligne ci-dessus, ajoutez la ligne suivante.)  
`Socket    local:/var/spool/postfix/opendkim/opendkim.sock`

Enregistrez et fermez le fichier.

Si vous pouvez trouver la ligne suivante dans le fichier `/etc/default/opendkim.`    


`SOCKET="local:/var/run/opendkim/opendkim.sock"`
ou   
`SOCKET=local:$RUNDIR/opendkim.sock`
Moddifiez le en:   

`SOCKET="local:/var/spool/postfix/opendkim/opendkim.sock"`

![image](https://user-images.githubusercontent.com/60802587/147599420-9f757b47-5570-48a0-b926-26c632e316d4.png)

Enregistrez et fermez le fichier.

Ensuite, nous devons éditer le fichier de configuration principal de Postfix.

```sudo nano /etc/postfix/main.cf```

Ajoutez les lignes suivantes à la fin de ce fichier, ainsi Postfix pourra appeler OpenDKIM via le protocole milter:

```
# Milter configuration
milter_default_action = accept
milter_protocol = 6
smtpd_milters = local:opendkim/opendkim.sock
non_smtpd_milters = $smtpd_milters
```

Enregistrez et fermez le fichier. Redémarrez ensuite opendkim et le service postfix: `sudo systemctl restart opendkim postfix`

## Vérification SPF et DKIM

You can now send a test email from your mail server to your Gmail account to see if SPF and DKIM checks are passed. On the right side of an opened email message in Gmail, if you click the show original button from the drop-down menu, you can see the authentication results.

![image](https://user-images.githubusercontent.com/60802587/147599627-eb066d06-667a-40ee-8869-6275499454ab.png)

Si votre message n'est pas signé et que la vérification DKIM a échoué, vous voudrez peut-être vérifier le journal de postfix (/var/log/mail.log) pour voir ce qui ne va pas avec votre configuration. Si vous voyez le message suivant dans le journal des e-mails,

`avertissement : connectez-vous au service Milter local : opendkim/opendkim.sock : aucun fichier ou répertoire de ce type`

vous voudrez peut-être vérifier si le service opendkim systemd est réellement en cours d'exécution.

`systemctl status opendkim`

If opendkim is running and you still see the above error, you might need to edit the `/etc/postfix/main.cf` file, change:

`smtpd_milters = local:opendkim/opendkim.sock`

à

`smtpd_milters = local:/opendkim/opendkim.sock`

Redémarrez ensuite Postfix.

Votre serveur de messagerie effectuera également des vérifications SPF et DKIM sur le domaine de l'expéditeur. Vous pouvez voir les résultats dans les en-têtes des e-mails. Ce qui suit est la vérification SPF et DKIM d'un expéditeur à l'aide de Gmail.

```
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c2d; helo=mail-yw1-xc2d.google.com; envelope-from=someone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: email.linuxbabe.com;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XWMRd2co";
	dkim-atps=neutral
```














