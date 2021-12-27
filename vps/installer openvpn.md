Introduction

Vous allez apprendre a installer un serveur openvpn sur votre vps

Installation
1. Connectez-vous en SSH sur votre serveur GNU/Linux à l’aide du logiciel PuTTY par exemple.

2. Mettez ensuite le système GNU/Linux à jour avec la commande suivante :
apt-get update && apt-get upgrade

3. Maintenant que le système de votre serveur est à jour, téléchargez OpenVPN sur votre VPS en allant [sur ce site](https://openvpn.net/vpn-software-packages/) 
Vous choisissez votre distribution puis allez en bas de la page puis copier le lien de AS (version) for (votre distribution)
dans mon cas:
![screen](https://media.discordapp.net/attachments/644281973115846676/925136349001035816/unknown.png?width=920&height=676)
puis faites wget (l'url que vous avez copiez)
si vous n'avez pas wget faites apt install wget
ensuite faites dpkg -i (le nom du fichier)

et voilà vous avez installer openvpn
