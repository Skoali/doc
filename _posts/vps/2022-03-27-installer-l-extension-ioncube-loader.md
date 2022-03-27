---
layout: post
title: "Comment installer l'extension PHP Ioncube Loader."
description: "Installer l'extension PHP Ioncube Loader afin de décrypter des fichiers PHP."
date: 2022-03-27 13:35:00 +0100
category: vps
---

L'extension PHP Ioncube Loader permet de décrypter des fichiers cryptées (souvent utilisé par des logiciels propriétaires comme WHMCS).

**Avant de suivre cet aide assurez vous que PHP est déjà installer et utilisé par votre serveur WEB.**

## Installation d'Ioncube Loader

Tout d'abord vous devez télécharger la dérniere version du "Loader Wizard" d'Ioncube via ce [lien](https://www.ioncube.com/loader-wizard/loader-wizard.zip).

Ensuite vous devez mettre le fichier loader-wizard.php (contenu dans l'archive telehargé) dans le répertoire de votre serveur web (Pour ma part /var/www/html)

Ensuite accédez à votre serveur WEB sur le fichier loader-wizard.php (Ex : http://example.com/loader-wizard.php), vous deviez accèder à la page "ionCube Loader Wizard"

Pour evitez les questions supplémentaires sélectionnez "Local install"

Suivez ensuite les étapes affichées :

![Installation d'ioncube]({{ site.baseurl }}/images/ioncube-install-instructions.png)

* Télécharger l'archive contenant les loaders (En zip ou en tar.gz selon votre préference)
* Mettez le fichier de l'extension dans le répertoire indiqué (Pour moi /usr/lib/php/20190902) en fonction de votre version de PHP (Par exemple moi j'utilise PHP 7.4 je vais donc mettre le fichié "ioncube_loader_lin_7.4.so")
* Sauvegardez ensuite le fichier "00-ioncube.ini" (Trouvable dans l'étape 3) et mettez le dans le répertoire indiqué (pour moi /etc/php/7.4/fpm/conf.d)
* Redémarrez ensuite PHP avec la commande suivante :

```
systemctl restart php*
```

* Cliquez ensuite sur "click here to test the Loader" de l'étape 5, si le message "Loader Installed Successfully" s'affiche vous avez réussi.
* Supprimez ensuite le loader-wizard.php de votre serveur WEB.