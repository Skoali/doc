---
layout: post
title: "Installer openmediavault sur un VPS (Debian/Ubuntu)"
date: 2022-01-01 19:20:00 +0100
category: vps
---

Tout d'abord il faudra **se connecter en SSH via Putty** ([Voir aide](/vps/Connexion-a-un-VPS-en-SSH-avec-Putty)) ou un autre logiciel .

Une fois cela fait, il faudra entrer ces commandes pour commencer l'installation :

```
sudo apt-get update; sudo apt-get install samba -y
sudo apt-get update; sudo apt-get upgrade -y
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install | sudo bash
```

Il faudra ensuite redémarrer votre vps avec la commande `reboot`

Attendez quelques minutes. Vous pouvez désormais accéder au **panel de OpenMediaVault** en tapant **l'ip de votre VPS** dans votre Navigateur Web. Utiliser `admin` comme **nom d'utilisateur** et `openmediavault`  en **mot de passe**. Vous pourrez le **personnaliser** plus tard en allant dans la roue `Paramètres` puis `Modifier le mot de passe` , en haut à droite de la page. **Ceci est fortement conseillé**.

Pour savoir comment utiliser le panel de OpenMediaVault, je vous invite à lire <https://www.cachem.fr/nas-openmediavault-tuto-guide/> à partir de la section `Construction du RAID et volume de données`.
