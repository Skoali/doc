# Rediriger un sous domaine a un serveur Minecraft sans avoir le port.

### Paramétrage d'un pointeur SRV


Créez une redirection de type SRV chez votre fournisseur de nom de domaine et indiquez les informations suivantes :

```
Sous-domaine : _minecraft._tcp.serveur
Priorité : 3600
Poids : 5
Port : XXXXX (Votre port (le :XXXXX) aprés l'ip)
Cible : srvXX.skoa.li (Le début de votre ip dans le port)
```

*La redirection peut prendre quelques heures avant de fonctionner.*
