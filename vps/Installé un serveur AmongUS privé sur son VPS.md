# Installer un serveur privée AmongUS sur son VPS
## Prérequis & dépendances 

Pour suivre ce tutoriel vous devrez etre sur l'un des systeme d'exploitation suivant : 

**Debian** : 10 ou 9
**Ubuntu** :  20.10,   20.04 (LTS),  18.04 (LTS) ou 16.04 (LTS)

Pour commencer, nous allons vérifier que notre VPS est à jour et que les programmes requis sont installés avec cette commande : 

 ``apt-get update && 
apt-get full-upgrade -y && apt install screen ``

Ensuite il faut installer .Net 5 qui permet de lancer le serveur among us privée :

**Pour Debian :**

```wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

sudo dpkg -i packages-microsoft-prod.deb

sudo apt update

apt-get install -y apt-transport-https

sudo apt-get update

apt-get install -y dotnet-sdk-5.0

sudo apt-get install -y aspnetcore-runtime-5.0```

**Pour Ubuntu :**

```wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb``` (modifier la version dans le lien pour choisir la votre)

sudo dpkg -i packages-microsoft-prod.deb

sudo apt update

apt-get install -y apt-transport-https

sudo apt-get update

apt-get install -y dotnet-sdk-5.0

sudo apt-get install -y aspnetcore-runtime-5.0```

##Télécharger le serveur

Télécharger la derniere version du serveur privée [ici](https://ci.appveyor.com/project/Impostor/Impostor/branch/dev/artifacts) et prenez la version *"Impostor-Server_1.2.2-ci.124_linux-x64.tar"*, Ensuite avec un logiciel de décompression comme [Winrar](https://www.win-rar.com/start.html?&L=10) ou  [Zzip](https://www.01net.com/telecharger/windows/Utilitaire/compression_et_decompression/fiches/101457.html), Extrayer les fichiers sur votre bureau 

![indice](https://www.zupimages.net/up/21/03/hivs.png)

Ensuite, prenez les fichiers et ajoutez les dans un des fichiers de votre VPS grace a Filezilla ou WinSCP (voir tutoriel  [ici](https://github.com/Skoali/aide/blob/master/vps/Comment%20installer%20un%20serveur%20Minecraft%20sur%20son%20VPS.md) dans *- Utiliser un client SFTP et uploader manuellement sur notre serveur.*)

Normalement votre vps devrait ressemblé a ceci :

![indice2](https://zupimages.net/up/21/03/3o4a.png)

**Modifiez config.json et renseignez-y votre ip **

##Lancer le serveur

```chmod +x /path/vers/votre/Fichier.Server``` (modifier pour vous)

Ensuite il vous faudra crée un screen pour revenir sur votre serveur :

```screen -S ServAmongus```

Puis ensuite dirigez vous dans le fichier de l'instalation de votre serveur privée :

```cd /path/vers/votre/Fichier/``` (modifier pour vous)

Ensuite pour lancez votre serveur :

```./Impostor.Server```

**Bravo vous avez crée votre serveur amongus !**

##Connectez vous au serveur

Installer [ImpostorPatcher](https://ci.appveyor.com/api/buildjobs/1g7x9s6vkvr5wbqm/artifacts/build%2FImpostor-Patcher_1.2.2-ci.124_win-x64.zip), lancez le et renseignez-y votre ip :

![image](https://media.discordapp.net/attachments/790174003557957693/790300142048641044/unknown.png)

**C'est bon ! ** Lancez amongus, choissisez le serveur **"Impostor"** et connectez vous-y,partir de la vous pourrez jouer avec des mods, des plugins et presque sans lag. Si vous voulez savoir comment les installait, faites vos recherches sur google :

- [Reddit du moddée](https://www.reddit.com/r/AmongUsMods/)
- [Github du serveur privée](https://github.com/Impostor/Impostor)
- [Github des mods/plugins](https://github.com/topics/among-us)
