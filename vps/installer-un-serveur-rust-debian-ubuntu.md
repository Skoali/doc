# Installer un serveur Rust sur un VPS Debian/Ubuntu

## Installer les dépendances

```
sudo dpkg --add-architecture i386  
sudo apt-get update  
sudo apt-get install mailutils postfix curl wget file gzip bzip2 bsdmainutils python util-linux tmux lib32gcc1 libstdc++6 libstdc++6:i386
```

## Créer un utilisateur
``
adduser rustserver
``

## Accéder à l'utilisateur crée ci-dessus
``
su - rustserver
``

## Téléchargez linuxgsm.sh
``
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh rustserver
``

## Lancez l'installation
``
./rustserver install
``


## Lancez le serveur
``
./rustserver start
``

## Tips

Obtenir la liste de commandes: ``./rustserver``

Stopper le serveur: ``./rustserver stop``

Redémarrer le serveur: ``./rustserver restart``

Mettre à jour du serveur: ``./rustserver update``

Voir la cosole: ``./rustserver console``