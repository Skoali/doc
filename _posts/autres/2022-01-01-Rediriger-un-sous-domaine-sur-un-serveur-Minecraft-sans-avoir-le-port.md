---
layout: post
title: "Lier son domaine à un serveur Minecraft sans avoir le port"
description: "Rediriger un sous-domaine à un serveur Minecraft sans avoir le port avec un enregistrement SRV"
date: 2022-01-01 15:30:00 +0100
category: autres
---

## Paramétrage d'un pointeur SRV

Créez un enregistrement de type SRV chez votre fournisseur de nom de domaine et indiquez les informations suivantes :

```
Sous-domaine : _minecraft._tcp.play
TTL : Auto / Par défaut
Priorité : 3600
Poids : 5
Port : XXXXX (Votre port (le :XXXXX) aprés l'ip)
Cible : srvXX.skoa.li (Le début de votre ip dans le port)
```

Veuillez à remplacer "play" par le sous-domaine que vous utilisez pour se connecter à votre serveur
Exemple : Si vous souhaitez que l'on puisse se connecter avec le sous-domaine minecraft.mondomaine.com,
remplacez "play" par "minecraft".

*Et voila! C'est terminé. Maintenant, il ne vous reste plus qu'à attendre que la magie de la propagation DNS opère. (Cela prend en général moins de 48h00)*
