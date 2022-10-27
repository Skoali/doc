---
layout: post
title: "Ouvrir des ports sur le pare-feu Windows."
description: "Ouvrir les ports sur Windows (Par l'interface graphique, le CMD et le PowerShell)"
date: 2022-10-27 15:35:30 +0100
category: vps-windows
--- 

## Pourquoi ouvrir ses ports ?

Par défaut le pare-feu de Windows bloque toutes les connexions entrantes, bien que la plupart des services créent la règle automatiquement, certains services ne le font pas pour rendre ces services accessibles il faut donc créer manuellement une règle de pare-feu pour autoriser les connexions sur le port.

## Quel protocole (TCP ou UDP) ?

Lors de l'ouverture du port, il vous sera demander le protocole, vous aurez le choix entre TCP ou UDP.

Vous pouvez rechercher sur internet quel protocole est utilisé par votre service, certains services utilisent ces deux protocoles. En cas de doute, vous pouvez ouvrir les ports sur les deux protocoles.

## Ouvrir les ports

### Méthode 1 : (Par l'interface graphique)

1. Ouvrez "Pare-feu Windows Defender avec fonctions avancées de sécurité" en tapant "Pare-feu" dans la barre de recherche de Windows.

![Screen Recherche Pare-Feu]({{ site.baseurl }}/images/recherchePareFeu.webp){:width="80%"}

2. Cliquez sur "Régles de traffic entrant"

3. Cliquez sur "Nouvelle règle"

![Screen page Pare-Feu]({{ site.baseurl }}/images/pagePareFeu.webp){:width="80%"}

4. Sélectionnez "Port" puis "TCP ou UDP", sélectionnez ensuite "Ports locaux spécifiques", entrez ensuite le ou les numéros de ports que vous souhaitez ouvrir (vous pouvez séparer les ports par des virgules). Vous pouvez aussi sélectionner "Tous les ports" pour ouvrir tous les ports. Appuyez ensuite sur "Suivant".

![Screen page Pare-Feu Protocoles et ports]({{ site.baseurl }}/images/ProtocoleEtPortsPareFeu.webp){:width="80%"}

5. Sélectionnez "Autoriser la connexion" puis appuyez sur "Suivant"

![Screen page Pare-Feu menu action]({{ site.baseurl }}/images/ActionPareFeu.webp){:width="80%"}

6. Sélectionnez toutes les cases puis appuyez sur "Suivant"

![Screen page Pare-Feu Profile]({{ site.baseurl }}/images/ProfilPareFeu.webp){:width="80%"}

7. Entrez un nom pour la règle qui vous servira à retenir quel service est concerné par cette règle. Appuyez ensuite sur "Terminer".

**Le port est maintenant ouvert !**

### Méthode 2 : (Par le PowerShell)

1. Ouvrez PowerShell **en tant qu'Administrateur** en tapant "PowerShell" dans la barre de recherche de Windows.

2. Tapez la commande suivante en remplaçant les valeurs entre crochets par les valeurs correspondantes :

```powershell
New-NetFirewallRule -DisplayName "[Nom de la règle]" -Direction Inbound -Action Allow -Protocol TCP -LocalPort [Port] -Profile Any
```

Pour ouvrir plusieurs ports, répétez la commande en remplaçant le port par les ports que vous souhaitez ouvrir.

> Attention, la commande ci-dessus ouvre le port sur le protocole TCP, pour ouvrir le port sur le protocole UDP, remplacez "TCP" par "UDP" dans la commande.

> Si vous avez le message "Accès refusé" lorsque vous exécutez la commande, vérifiez que vous avez bien ouvert PowerShell en tant qu'Administrateur.

### Méthode 3 : (Par le CMD)

1. Ouvrez l'invite de commande **en administrateur** en tapant "CMD" dans la barre de recherche de Windows.

2. Tapez la commande suivante en remplaçant les valeurs entre crochets par les valeurs correspondantes :

```cmd
netsh advfirewall firewall add rule name="[Nom de la règle]" dir=in action=allow protocol=TCP localport=[Port] profile=any
```

Pour ouvrir plusieurs ports, répétez la commande en remplaçant le port par les ports que vous souhaitez ouvrir.

> Attention, la commande ci-dessus ouvre le port sur le protocole TCP, pour ouvrir le port sur le protocole UDP, remplacez "TCP" par "UDP" dans la commande.

> Si vous avez le message "Accès refusé" lorsque vous exécutez la commande, vérifiez que vous avez bien ouvert CMD en tant qu'Administrateur.

## Vérifier si le port est ouvert

Vous pouvez vérifier si le port est ouvert en utilisant un site comme [canyouseeme.org](https://canyouseeme.org) ou [portchecker.co](https://portchecker.co).

## Re fermer les ports (Supprimer la règle)

### Méthode 1 : (Par l'interface graphique)

1. Ouvrez "Pare-feu Windows Defender avec fonctions avancées de sécurité" en tapant "Pare-feu" dans la barre de recherche de Windows.

2. Cliquez sur "Régles de traffic entrant".

3. Cliquez sur la règle que vous souhaitez supprimer puis appuyez sur "Supprimer".

### Méthode 2 : (Par le PowerShell)

1. Ouvrez PowerShell **en tant qu'Administrateur** en tapant "PowerShell" dans la barre de recherche de Windows.

2. Tapez la commande suivante en remplaçant les valeurs entre crochets par les valeurs correspondantes :

```powershell
Remove-NetFirewallRule -DisplayName "[Nom de la règle]"
```

### Méthode 3 : (Par le CMD)

1. Ouvrez l'invite de commande **en administrateur** en tapant "CMD" dans la barre de recherche de Windows.

2. Tapez la commande suivante en remplaçant les valeurs entre crochets par les valeurs correspondantes :

```cmd
netsh advfirewall firewall delete rule name="[Nom de la règle]"
```
