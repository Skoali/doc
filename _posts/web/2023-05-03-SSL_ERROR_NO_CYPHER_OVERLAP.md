---
layout: post
title: "Résoudre les erreurs SSL_ERROR_NO_CYPHER_OVERLAP et ERR_SSL_VERSION_OR_CIPHER_MISMATCH"
description: "Ce guide explique comment résoudre les erreurs SSL_ERROR_NO_CYPHER_OVERLAP et ERR_SSL_VERSION_OR_CIPHER_MISMATCH"
date: 2023-05-03 11:34:23 +0100
category: web
---

## Que signifie ces messages d'erreur ?

C'est un message d'erreur qui apparaît dans le navigateur quand il n'y a pas de cyphers communs entre le serveur et le client. Ce message d'erreur est généralement causé par un problème de configuration du serveur. Il est possible que le serveur ne supporte pas les cyphers (Protocoles de chiffrement) utilisés par le client.

## Comment résoudre ce problème ?

## Vous êtes le propriétaire du site

Si vous êtes le propriétaire du site vous pouvez essayer de résoudre ce problème avec les solutions ci-dessous :

### Vous utilisez Cloudflare

Cloudflare retourne généralement ce message d'erreur quand vous essayez de proxyfier un "Sous-sous domaine" (Par exemple un.deux.example.com), en effet Cloudflare ne supporte pas les "sous-sous domaines". Pour résoudre ce problème vous pouvez soit :

  * Utiliser un sous-domaine (Par exemple nom.example.com)
  * Utiliser un domaine

### Essayez de générer un nouveau certificat SSL

Il est possible que votre certificat SSL soit invalide. Vous pouvez essayer de générer un nouveau certificat SSL pour voir si le problème persiste.

## Vous êtes un utilisateur

Si vous êtes un utilisateur vous pouvez essayer de résoudre ce problème avec les solutions ci-dessous :

### Mettez à jour votre navigateur

Il est possible que votre navigateur ne supporte pas les cyphers utilisés par le site. Essayez de mettre à jour votre navigateur pour voir si le problème persiste.

### Changez de navigateur

Si mettre à jour votre navigateur ne résout pas le problème, essayez d'utiliser un autre navigateur.

* Si le problème persiste, il est possible que l'erreur provienne du site. Vous pouvez essayer de contacter le propriétaire du site pour voir si le problème peut être résolu.