Comment connecter une clé ssh à votre vps ?

Afin de permettre la connexion ssh sans mot de passe, vous devrez créer une paire de clés SSH privée et publique. Pour générer une nouvelle paire de clés :

```
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com" Generating public/private rsa key pair. Enter file in which to save the key (/home/user/.ssh/id_rsa): Enter passphrase (empty for no passphrase): Enter same passphrase again: Your identification has been saved in /home/user/.ssh/id_rsa. Your public key has been saved in /home/user/.ssh/id_rsa.pub. The key fingerprint is: SHA256:gGJtSsV8BM+7w018d39Ji57F8iO6c0N2GZq3/RY2NhI user@localhost The key's randomart image is: +---[RSA 4096]----+ | .oo. | | + . .. | | o + . | | . = E S . | | o B + . .| | + oo..o| +----[SHA256]-----+
```


Le programme ssh-keygen générera une paire de clés rsa publique/privée pour vous et les placera respectivement dans ~/.ssh/id_rsa et ~/.ssh/id_rsa.pub.

Remarque : Si vous ne souhaitez pas saisir de pass word, remplacez -C "votre_email@example.com" par -C "" La commande finale ressemblera alors à ceci : $
