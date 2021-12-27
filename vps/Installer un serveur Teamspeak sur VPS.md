# Rendez vous sur repertoire "home"

```cd /home```

# Creez un dossier nomé "ts"

```mkdir ts```

Allez dans le dossier que vous venez de creer 

```cd ts```

# Installez TeamSpeak

Vous pouvez à présent procéder à l’installation de TeamSpeak dans ce dossier. Pour ce faire, copiez et collez la commande suivante pour télécharger le fichier d’installation de TeamSpeak Server :

```wget http://teamspeak.gameserver.gamed.de/ts3/releases/3.3.1/teamspeak3-server_linux_amd64-3.3.1.tar.bz2```

Une fois le fichier téléchargé dans le dossier, vous devez extraire son contenu à l’aide de la commande suivante:

```tar xfvj teamspeak3-server_linux_amd64-3.3.1.tar.bz2```

 Tapez ensuite la commande `ls`, puis copiez le texte qui apparaît en bleu(sur putty) : teamspeak3-server_linux_amd64
 
 Allez maintenant dans le répertoire que vous venez de copier avec la commande suivante :
 
 ```cd teamspeak3-server_linux_amd64```
 
 Passez le dossier suivant en mode administrateur. Pour ce faire, copiez et collez la commande suivante :
 
 ```chmod 777 ts3server_startscript.sh```
 
 Vous devez maintenant accepter le contrat de licence de TeamSpeak en exécutant la commande suivante :
 
 ```touch .ts3server_license_accepted```
 
 Enfin, démarrez le serveur TeamSpeak fraîchement installé sur votre VPS. Tapez la commande suivante :
 
 ```./ts3server_startscript.sh start```
 
 Vous obtiendrez alors une clé de privilège pour administrer votre serveur TeamSpeak. L’adresse IP de votre serveur TeamSpeak est bien entendu celle de votre VPS.
 
 
