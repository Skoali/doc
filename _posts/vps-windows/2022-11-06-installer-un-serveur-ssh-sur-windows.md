---
layout: post
title: "Installer un serveur SSH (OpenSSH) sur Windows."
description: "Installer un serveur OpenSSH sur Windows (Par l'interface graphique et le PowerShell)"
date: 2022-11-06 14:22:39 +0100
category: vps-windows
---

## Pourquoi installer un serveur SSH ?

Le serveur SSH est un service permettant d'accéder au terminal d'un serveur à distance. Il est utilisé pour effectuer des tâches administratives sur un serveur.

## Installer le serveur SSH

### Méthode 1 : (Par l'interface graphique)

- Ouvrez "Ajouter une fonctionnalité facultative" en tapant "fonctionnalité facultative" dans la barre de recherche de Windows.

![Screen Recherche fonctionnalité facultative]({{ site.baseurl }}/images/rechercheFonctionnaliteFacultative.webp){:width="80%"}

- Cliquez sur "Fonctionnalités Windows" puis sur "Fonctionnalités Windows facultatives".

![Screen page fonctionnalité facultative]({{ site.baseurl }}/images/pageFonctionnaliteFacultativeInstaller.webp){:width="80%"}

- Cochez la case "Serveur OpenSSH" puis cliquez sur "Installer".

![Screen page fonctionnalité facultative]({{ site.baseurl }}/images/serveurOpenSSH.webp){:width="80%"}

## Méthode 2 : (Par le PowerShell)

- Ouvrez le PowerShell en tant qu'administrateur.

- Tapez la commande suivante : `Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0`

> Si vous avez l'erreur "L'opération demandée nécessite une élévation" c'est que vous n'aviez pas lancé le PowerShell en tant qu'administrateur.

## Activer le serveur SSH

### Méthode 1 : (Par l'interface graphique)

- Ouvrez "Services" en tapant "services" dans la barre de recherche de Windows.

![Screen Recherche services]({{ site.baseurl }}/images/rechercheServices.webp){:width="80%"}

- Cliquez sur "Services" puis sur "OpenSSH Server".

![Screen page services]({{ site.baseurl }}/images/pageServicesOpenSSH.webp){:width="80%"}

- Cliquez sur "Démarrer" puis sur "Activer".

> Pour qu'il se lance au démarrage de Windows, double-cliquez sur le service puis cochez la case "Démarrage automatique". Cliquez sur "Appliquer" puis sur "OK".

### Méthode 2 : (Par le PowerShell)

- Ouvrez le PowerShell en tant qu'administrateur.

- Tapez la commande suivante : `Start-Service sshd`

> Pour qu'il se lance au démarrage de Windows, tapez la commande suivante : `Set-Service -Name sshd -StartupType 'Automatic'`

## Définir le terminal par défaut sur PowerShell

Par défaut, les sessions OpenSSH s'ouvrent sur le CMD. Pour le changer, il faut modifier la valeur de la clé de registre suivante :

### Méthode 1 : (Par l'interface graphique)

- Ouvrez "Registre" en tapant "registre" dans la barre de recherche de Windows.

![Screen Recherche registre]({{ site.baseurl }}/images/rechercheRegistre.webp){:width="80%"}

- Cliquez sur "Registre" puis sur "HKEY_LOCAL_MACHINE\SOFTWARE\OpenSSH".

- Double-cliquez sur "DefaultShell" puis sur "Changer la valeur de la chaîne".

![Screen page registre]({{ site.baseurl }}/images/pageRegistreDefaultShell.webp){:width="80%"}

- Tapez `powershell.exe` puis cliquez sur "OK".

### Méthode 2 : (Par le PowerShell)

- Ouvrez le PowerShell en tant qu'administrateur.

- Tapez la commande suivante : `Set-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"`

> Pour revenir au CMD, tapez la commande suivante : `Set-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\cmd.exe"`

> Si vous avez l'erreur "Accès au registre demandé non autorisé." c'est que vous n'aviez pas lancé le PowerShell en tant qu'administrateur.

## Redémarrer le service OpenSSH

### Méthode 1 : (Par l'interface graphique)

- Ouvrez "Services" en tapant "services" dans la barre de recherche de Windows.

![Screen Recherche services]({{ site.baseurl }}/images/rechercheServices.webp){:width="80%"}

- Cliquez sur "Services" puis sur "OpenSSH Server".

![Screen page services]({{ site.baseurl }}/images/pageServicesOpenSSH.webp){:width="80%"}

- Cliquez sur "Arrêter" puis sur "Démarrer".

### Méthode 2 : (Par le PowerShell)

- Ouvrez le PowerShell en tant qu'administrateur.

- Tapez la commande suivante : `Restart-Service sshd`

> Si vous avez l'erreur "Restart-Service : Le service «OpenSSH SSH Server (sshd)» ne peut pas être arrêté en raison de l'erreur suivante: Impossible d'ouvrir le service sshd sur l'ordinateur" c'est que vous n'aviez pas lancé le PowerShell en tant qu'administrateur.

## Désinstaller le serveur SSH

### Méthode 1 : (Par l'interface graphique)

- Ouvrez "Ajouter une fonctionnalité facultative" en tapant "fonctionnalité facultative" dans la barre de recherche de Windows.

![Screen Recherche fonctionnalité facultative]({{ site.baseurl }}/images/rechercheFonctionnaliteFacultative.webp){:width="80%"}

- Cliquez sur "Fonctionnalités Windows" puis sur "Fonctionnalités Windows facultatives".

- Cliquez sur "Serveur OpenSSH" puis sur "Désinstaller".

![Screen page fonctionnalité facultative]({{ site.baseurl }}/images/serveurOpenSSHDesinstallerFonctionnalitesFacultatives.webp){:width="80%"}

### Méthode 2 : (Par le PowerShell)

- Ouvrez le PowerShell en tant qu'administrateur.

- Tapez la commande suivante : `Remove-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0`

> Si vous avez l'erreur "L'opération demandée nécessite une élévation" c'est que vous n'aviez pas lancé le PowerShell en tant qu'administrateur.