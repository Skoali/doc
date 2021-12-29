## Introduction

Lors de la lecture de cet articule vous allez apprendre ce qu'est Screen et comment l'utiliser.

## Sommaire
- [Screen c'est quoi?](#screen-c'est-quoi)
- [Création d'un screen](#création-d-un-screen)
- [Quitter un screen](#quitter-un-screen)
- [Lister les screens actifs](#Lister-les-screen-actifs)
- [Se re attacher à un screen](#se-re-attacher-à-un-screen)
- [Kill un screen](#kill-un-screen)

## Screen c'est quoi

Screen est un utilitaire permettant d'ouvrir plusieurs terminaux dans une même console, de passer de l'un à l'autre et de les récupérer plus tard. 
Il peut être pratique lorsque l'on souhaite lancer plusieurs commandes.

Par exmeple, supposons que vous ayez un serveur Minecraft d'allumé et que vous souhaitez tout de meme quitter la console du serveur pour faire autre chose. Alors, vous pouvez crée un screen avant pour que votre serveur minecraft run puis quitter se dernier pour faire autre chose en meme temps.

## Création d'un screen

Avant de crée votre premier screen penser à installer Screen
```
$ apt-get install screen
```
 Pour crée votre screen faites ceci:
 
 ```
 $ screen -S [nom du screen]
 ```
 
 Vous voilà dans votre screen, près à lancer votre serveur minecraft comme vous l'aurais fais normalement
 
 ## Quitter un screen
 
 Pour quitter un screen riend de plus simple: [Ctrl+a+d] et vous voilà dans votre terminal de base.  
 Noter que si votre serveur minecraft run sur votre autre screen il reste allumé car le screen n'a pas été kill!
 
 ## Lister les screen actifs
 
 Vous pouvez lister tout les screen actifs avec la commande suivant

```
 screen -ls
 ```
 
 ## Se re attacher à un screen
 
 Maintenant que vous avez quitter votre console minecraft et que vous souhaite y revenir faite le commande suivante
 
```
 screen -r [nom du screen]
```

Vous voilà dans votre console minecraft.

## Kill un screen

Pour kill un screen faite la commande suivant:

```
$ screen -S [nom du screen] -X quit


