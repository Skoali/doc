---
layout: post
title: "Comment configurer un serveur DNS sur un VPS Windows"
description: "Guide pour installer et configurer un serveur DNS sur un VPS Windows"
date: 2023-05-04 17:34:11 +0100
category: vps-windows
---

Un serveur DNS (Domain Name System) est un système qui permet de résoudre les noms de domaine en adresses IP. En configurant un serveur DNS sur votre VPS Windows, vous pouvez gérer vos propres noms de domaine et améliorer les performances de votre réseau. Dans cet article, nous allons vous montrer comment configurer un serveur DNS sur un VPS Windows.

## Prérequis

Avant de commencer, vous devez disposer des éléments suivants : 

- VPS Windows fonctionnel avec accès administrateur
- Un nom de domaine

## Étape 1 : Installer le rôle DNS

1. Connectez-vous à votre VPS Windows en tant qu'administrateur.

2. Ouvrez le Gestionnaire de serveur.

3. Cliquez sur "Ajouter des rôles et des fonctionnalités".

4. Suivez les instructions à l'écran pour installer le rôle DNS.

## Étape 2 : Configurer le serveur DNS

1. Ouvrez le DNS Manager.

2. Cliquez avec le bouton droit de la souris sur le nœud du serveur et sélectionnez "Configurer un serveur DNS".

3. Suivez les instructions à l'écran pour configurer votre serveur DNS. Assurez-vous de saisir correctement les informations de votre nom de domaine.

## Étape 3 : Configurer les zones DNS

Maintenant que vous avez configuré votre serveur DNS, vous devez configurer les zones DNS pour votre nom de domaine. Pour ce faire, suivez les étapes suivantes :

1. Ouvrez le DNS Manager.

2. Cliquez avec le bouton droit de la souris sur le nœud "Zones de recherche directe" et sélectionnez "Nouvelle zone...".

3. Suivez les instructions à l'écran pour créer une zone de recherche directe pour votre nom de domaine.

4. Cliquez avec le bouton droit de la souris sur le nœud de la zone et sélectionnez "Nouvel enregistrement...".

5. Suivez les instructions à l'écran pour ajouter les enregistrements DNS pour votre nom de domaine.

## Étape 4 : Tester la configuration

Une fois que vous avez configuré votre serveur DNS et vos zones DNS, vous pouvez tester la configuration en résolvant un nom de domaine en adresse IP. Pour ce faire, suivez les étapes suivantes :

1. Ouvrez une invite de commande.

2. Entrez la commande suivante : nslookup [nom_de_domaine]

3. Confirmez que le nom de domaine est résolu en adresse IP.

## Conclusion

Voilà, vous avez configuré un serveur DNS sur votre VPS Windows et configuré les zones DNS pour votre nom de domaine. Vous pouvez maintenant gérer vos propres noms de domaine et améliorer les performances de votre réseau. Assurez-vous de suivre les instructions attentivement pour éviter toute erreur de configuration.
