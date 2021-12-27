# Changer l'heure (la timezone) d'un vps

Pour vérifier la timezone de votre machine, effectuez `timedatectl`

Pour lister toutes les timezone disponibles, faites `timedatectl list-timezones`

Pour changer celle-ci, faites : `sudo timedatectl set-timezone [La timezone de votre choix, par exemple Europe/Paris]`

Vérifiez qu’elle a bien été changée en faisant `timedatectl`
