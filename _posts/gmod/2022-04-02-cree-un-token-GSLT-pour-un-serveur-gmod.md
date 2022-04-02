---
layout: post
title: "Crée un GSLT (Game Server Login Token) pour son serveur Garry's Mod"
description: "Création d'un Game Server Login Token (GSLT) pour un serveur de jeu Garry's Mod"
date: 2022-04-02 14:15:00 +0100
category: gmod
---

## À quoi sert le Game Server Login Token ?

Le Game Server Login Token (GSLT) sert à lier votre serveur Garry's Mod à un compte Steam qui possède le jeu.

Les serveurs Garry's Mod qui ne sont pas lié un à compte Steam possédant le jeu sont pénalisé dans le classement du serveur dans les listes publiques.

Il aide également vos joueurs à trouver votre serveur, si l'adresse IP de votre serveur a été modifiée.

## Comment obtenir un Game Server Login Token (GSLT) ?

- Rendez vous sur le lien suivant : https://steamcommunity.com/dev/managegameservers?l=french
- Connectez vous à Steam
- Rendez vous en bas de la page où il y a "Créer un nouveau compte de serveur de jeu"
- Dans la première case (App ID) mettez 4000 (ID du jeu Garry's Mod)
- Dans la deuxième case (Mémo) mettez ce qui vous voulez (Le mémo permet d'identifier les serveurs parmi plusieurs Tokens)
- Ensuite appuyez sur "Créer"
- Vous obtiendrez votre Game Server Login Token (GSLT)

## Mettre le Game Server Login Token (GSLT) sur son serveur Garry's Mod

Une fois le token crée, suivez les étapes suivantes pour le lié à votre serveur :

### Pour un serveur Garry's Mod chez Skoali.

Copiez coller votre token dans les paramètres de démarrage du serveur et redémarrez votre serveur

### Pour un serveur sur un VPS.

Pour mettre le token sur un serveur crée sur un VPS ou un serveur qui vous hébergez vous-même, ajoutez l'argument suivant :

```
+sv_setsteamaccount TOKEN
```