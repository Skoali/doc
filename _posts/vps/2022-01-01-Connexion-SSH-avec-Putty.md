---
layout: post
title: "Connexion à un VPS en SSH avec Putty"
description: "Se connecter à son VPS par SSH avec le logiciel Putty"
date: 2022-01-01 15:30:00 +0100
category: vps
---

## Introduction

 Lors de la lecture de cet article, vous allez apprendre comment vous connecter en SSH à votre VPS à l'aide de Putty.

## Sommaire
- [Installation de Putty](#installation-de-putty)
- [Préparation de donnès de connexion](#preparation-de-donnès-de-connexion)
- [Connexion avec Putty](#connexion-avec-putty)

## Installation de Putty

1) Cliquez [ici](https://the.earth.li/~sgtatham/putty/latest/w32/putty.exe) afin d'installer Putty dans sa dernière version.  
Après télèchargement, installez le logiciel, ouvrez-le, ça devrait ressembler à ça. 

![image]({{ site.baseurl }}/images/putty.webp)

## Préparation de donnés de connexion

1) Connectez-vous à votre espace client.
2) Cliquez sur la machine à laquelle vous souhaitais vous connecter. Vous devriez voir quelque chose comme sa.  
En rouge, vous aurez l'IP de votre machine gardez-la précieusement, elle servira à vous connecter à votre VPS.
![image]({{ site.baseurl }}/images/managervpsip.webp){:width="80%"}

3) Scrollez vers le bas et vérifiez que votre machine est belle et bien allumée, comme ci-dessous (Si ce n'est pas le cas, démarrez-la):
![image]({{ site.baseurl }}/images/vpsstatus.webp)

4) Notez que lors de l'achat de votre VPS, vous avez dû choisir le mot de passe de votre VPS. Si vous ne vous en rappelez plus, réinitialiser votre VPS à nouveau et l'option pour choisir un nouveau mot de passe devrait apparaitre. Mais attention, toutes vos données seront effacer, si votre VPS est vierge cela ne devrais pas causer de soucis pour vous.

## Connexion avec Putty

Maintenant que vous avez l'IP de votre machine et son mot de passe, vous êtes fin prêt à vous y connecter !
1) Rendez-vous sur Putty et dans le champ "Host Name (or IP address)" renseignez l'IP de votre VPS.
2) Pour les prochaines fois, donner un nom à votre session pour pouvoir y vous connecter plus facilement par la suite.
![image]({{ site.baseurl }}/images/puttysession.webp )
3) Cliquez sur "Save" pour enregistrer votre session.
4) Sélectionnez votre nouvelle session et cliquez sur "Open"
5) Vous devriez avoir une fenêtre noire, mettez votre nom d'utilisateur (root par défaut) et appuyez sur entrer.
![image]({{ site.baseurl }}/images/sshloginas.webp)

6) Ensuite, une deuxième information devrais vous demander le mot de passe
![image]({{ site.baseurl }}/images/sshloginaspassword.webp)

7) Une fois votre mot de passe mis, appuyez sur entrer et voilà ! Vous êtes à présent connecté en SSH sur votre VPS avec Putty.
