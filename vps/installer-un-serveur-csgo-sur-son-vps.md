# Installation d'un serveur CS:GO sur son VPS

1) Installez les dépendances

```dpkg --add-architecture i386 && apt install curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 steamcmd libsdl2-2.0-0:i386 -y```




2) Créer un utilisateur pour le serveur CSGO :

```adduser csgo``` (Valider avec entrer à toutes les questions)

Puis accéder à l'utilisateur : `su csgo`

3) Téléchargez le script d'installation de serveur

```wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh csgoserver```


4) Installez le serveur de jeu.


```./csgoserver install```

Entrez les informations demandées. L'installateur vous demandera d'entrer votre token, rendez vous sur https://steamcommunity.com/dev/managegameservers