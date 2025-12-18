tarea ftp ssh http virtual host s encrypt  CMS pagina hecha con IA wordpress prestashop

# primer trimestre
## 2-10-2025
DNS bind9
gestionar dns’s


[ver video](https://www.youtube.com/watch?v=ogGBMKURUg4)




el ISP cambia el DNS es el encargado

servidor web

cloudflare
quad9

file:///home/user-pc/Descargas/f17025d0-57f1-4609-9668-14587530f785.pdf

comprar dominio


https://root-servers.org/ 
https://www.iana.org/domains/root/db 
https://reticulum.network/ 


## 9-10-2025
NS

Hemos explicado el concepto del DNS y cómo funciona en un entorno real con el dominio. Web's que hemos visto: IANA Root Servers – Muestra la lista oficial de servidores raíz del DNS gestionados por IANA, base del sistema de nombres de Internet. [https://www.iana.org/domains/root/servers](https://www.iana.org/domains/root/servers) Enlaces a un sitio externo. GoDaddy Domain Search – Permite buscar y registrar nombres de dominio, por ejemplo damian.abogado. [https://www.godaddy.com/es-es/domainsearch/find?domainToCheck=damian.abogado](https://www.godaddy.com/es-es/domainsearch/find?domainToCheck=damian.abogado) Enlaces a un sitio externo. Sedo – Plataforma para comprar o vender dominios, como los relacionados con “golf”. [https://sedo.com/search/?keyword=golf](https://sedo.com/search/?keyword=golf) Enlaces a un sitio externo. Root-Servers.org – Información técnica y en tiempo real sobre los 13 servidores raíz del DNS mundial. [https://root-servers.org](https://root-servers.org) Enlaces a un sitio externo. WhatsMyDNS – Comprueba la propagación de registros DNS en distintos países. [https://www.whatsmydns.net](https://www.whatsmydns.net) Enlaces a un sitio externo. Quad9 – DNS gratuito que bloquea sitios maliciosos y mejora la seguridad al navegar.mhttps://quad9.net/es/ Enlaces a un sitio externo. 1.1.1.1 (Cloudflare) – DNS rápido y privado que protege la información del usuario. [https://one.one.one.one](https://one.one.one.one) Enlaces a un sitio externo. Además os mando las presentaciones que hemos trabajado en: [https://prezi.com/p/b_o3acnm7hv1/](https://prezi.com/p/b_o3acnm7hv1/) Enlaces a un sitio externo. [https://prezi.com/p/mdceijea5lis/](https://prezi.com/p/mdceijea5lis/) Enlaces a un sitio externo.

[https://www.icann.org/es/contracted-parties/accredited-registrars/list-of-accredited-registrars?page=1&sort-param=iana-number&sort-direction=asc&iana-number=83](https://www.icann.org/es/contracted-parties/accredited-registrars/list-of-accredited-registrars?page=1&sort-param=iana-number&sort-direction=asc&iana-number=83) 


[https://punycode.es](https://punycode.es)

https://www.youtube.com/watch?v=tTpSUgFk-Wg



un dominio  es la terminacion como .com y el nombre de dominio es lo que va antes

gTLD
country code ccTLD
TLD

## 16-10-2025
Acceso remoto ssh
criptografia asimetrica
servicio de directorios
LDAP

SSH version encriptada del telnete que se puede bastionar mas osea dentro de el lo puedes hacer mas chungo
SFTP protocolo que va a la vez de que el SSH y funciona sobre el que pasa info de manera encriptada
![[{577A5A6F-0332-4FE3-92BC-37FAC1F51F5C}.png]]

criptografia clave publica y privada
 una para todo el mundo y otra solo para ti


cleopatra


**PRACTICA**
crear llave publica y privada  con sshkeygen
eliminar la contraseñá para acceder al server y que solo se pueda hacer con llave privada


https://www.youtube.com/watch?v=tTpSUgFk-Wg


alquilar dominio que apunte a servidor linux 
mohamedkamil.es







nombre mohamed
nombre servidor mohamedserver
user mohamedkamil

`mohamedkamil@mohamedserver:~$ curl ifconfig.me`
`94.73.34.186mohamedkamil@mohamedserver:~$ ping mohamedkamil.es`
`PING mohamedkamil.es (94.73.34.186) 56(84) bytes of data.`
`64 bytes from 94.73.34.186: icmp_seq=1 ttl=62 time=13.7 ms`
`64 bytes from 94.73.34.186: icmp_seq=2 ttl=62 time=14.1 ms`
`64 bytes from 94.73.34.186: icmp_seq=3 ttl=62 time=12.8 ms`
`64 bytes from 94.73.34.186: icmp_seq=4 ttl=62 time=14.4 ms`
`^C`
`--- mohamedkamil.es ping statistics ---`
`4 packets transmitted, 4 received, 0% packet loss, time 3021ms`
`rtt min/avg/max/mdev = 12.811/13.764/14.440/0.611 ms`
`mohamedkamil@mohamedserver:~$ nslookup mohamedkamil.es`
`Server:         127.0.0.53`
`Address:        127.0.0.53#53`

`Non-authoritative answer:`
`Name:   mohamedkamil.es`
`Address: 94.73.34.186`




 apt install bind9 -y
nano /etc/resolv.conf

cambiar por ip propia






`root@mohamedserver:/home/mohamedkamil# cd /etc/bind`
`root@mohamedserver:/etc/bind# ls`
`bind.keys  db.255    named.conf                named.conf.options`
`db.0       db.empty  named.conf.default-zones  rndc.key`
`db.127     db.local  named.conf.local          zones.rfc1918`
`root@mohamedserver:/etc/bind# nano named.conf.local`
`root@mohamedserver:/etc/bind# cat named.conf.local`
`//`
`// Do any local configuration here`
`//`

`// Consider adding the 1918 zones here, if they are not used in your`
`// organization`
`//include "/etc/bind/zones.rfc1918";`

`zone "mohamedkamil.es" {`
    `type master;`
    `file "/etc/bind/db.mohamedkamil.es";`
`};`

`// (ZONA INVERSA) Archivo para búsquedas inversas`
`zone "1.168.192.in-addr.arpa" {`
    `type master;`
    `file "/etc/bind/db.1.168.192";`
`};`
`root@mohamedserver:/etc/bind# named-checkconf`
`root@mohamedserver:/etc/bind# ls`
`bind.keys  db.255    named.conf                named.conf.options`
`db.0       db.empty  named.conf.default-zones  rndc.key`
`db.127     db.local  named.conf.local          zones.rfc1918`
`root@mohamedserver:/etc/bind# cp db.empty db.mohamedkamil.es`
`root@mohamedserver:/etc/bind# ls`
`bind.keys  db.empty            named.conf.default-zones  zones.rfc1918`
`db.0       db.local            named.conf.local`
`db.127     db.mohamedkamil.es  named.conf.options`
`db.255     named.conf          rndc.key`
`root@mohamedserver:/etc/bind# nano db.mohamedkamil.es`
`root@mohamedserver:/etc/bind# cat db.mohamedkamil.es`
`; BIND reverse data file for empty rfc1918 zone`
`;`
`; DO NOT EDIT THIS FILE - it is used for multiple zones.`
`; Instead, copy it, edit named.conf, and use that copy.`
`;`
`$TTL    86400`
`@       IN      SOA     ns1.mohamedkamil.es. root.mohamedkamil.es. (`
                              `1         ; Serial`
                         `604800         ; Refresh`
                          `86400         ; Retry`
                        `2419200         ; Expire`
                          `86400 )       ; Negative Cache TTL`
`;`
`@       IN      NS      ns1.mohamedkamil.es.`
`ns1     IN      A       192.168.1.220`
`@       IN      A       192.168.1.220`
`fruta   IN      A       192.168.1.220`
`blog    IN      A       94.73.34.186`
`@       IN      TXT     "HOLA"`
`mail    IN      A       192.168.1.220`
`@       IN      MX      10      mail.mohamedkamil.es.`

`root@mohamedserver:/etc/bind# named-checkzone mohamedkamil.es db.mohamedkamil.es`
`zone mohamedkamil.es/IN: loaded serial 1`
`OK`
`root@mohamedserver:/etc/bind# cp db.127 db.1.168.192`
`root@mohamedserver:/etc/bind# nanp db.1.168.192`
`Command 'nanp' not found, did you mean:`
  `command 'nano' from snap nano (7.2+pkg-4057)`
  `command 'nap' from snap nap-snippets (0.1.1)`
  `command 'nano' from deb nano (7.2-2ubuntu0.1)`
`See 'snap info <snapname>' for additional versions.`
`root@mohamedserver:/etc/bind# nano db.1.168.192`
`root@mohamedserver:/etc/bind# named-checkzone mohamedkamil.es db.1.168.192`
`zone mohamedkamil.es/IN: NS 'ns1.mohamedkamil.es' has no address records (A or AAAA)`
`zone mohamedkamil.es/IN: not loaded due to errors.`
`root@mohamedserver:/etc/bind# cat db.1.168.192`
`;`
`; BIND reverse data file for local loopback interface`
`;`
`$TTL    604800`
`@       IN      SOA     ns1.mohamedkamil.es. root.mohamedkamil.es. (`
                              `1         ; Serial`
                         `604800         ; Refresh`
                          `86400         ; Retry`
                        `2419200         ; Expire`
                         `604800 )       ; Negative Cache TTL`
`;`
`@       IN      NS      ns1.mohamedkamil.es.`
`220     IN      PTR     mohamedkamil.es.`
`220     IN      PTR     ns1.mohamedkamil.es.`
`220     IN      PTR     ftuta.mohamedkamil.es.`
`220     IN      PTR     mail.mohamedkamil.es.`
`220     IN      PTR     hola.mohamedkamil.es.`
`root@mohamedserver:/etc/bind# named-checkzone 192.168.1.220 db.1.168.192`
`zone 192.168.1.220/IN: loaded serial 1`
`OK`
`root@mohamedserver:/etc/bind# host -ns mohamedkamil.es`
`Host mohamedkamil.es not found: 2(SERVFAIL)`
`root@mohamedserver:/etc/bind# sudo systemctl restart bind9`
`root@mohamedserver:/etc/bind# sudo systemctl status bind9`
`● named.service - BIND Domain Name Server`
     `Loaded: loaded (/usr/lib/systemd/system/named.service; enabled; preset>`
     `Active: active (running) since Sun 2025-10-19 15:19:59 UTC; 6s ago`
       `Docs: man:named(8)`
   `Main PID: 1914 (named)`
     `Status: "running"`
      `Tasks: 8 (limit: 4644)`
     `Memory: 23.4M (peak: 23.9M)`
        `CPU: 31ms`
     `CGroup: /system.slice/named.service`
             `└─1914 /usr/sbin/named -f -u bind`

`oct 19 15:19:59 mohamedserver named[1914]: network unreachable resolving '.>`
`oct 19 15:19:59 mohamedserver named[1914]: network unreachable resolving '.>`
`oct 19 15:19:59 mohamedserver named[1914]: network unreachable resolving '.>`
`oct 19 15:19:59 mohamedserver named[1914]: network unreachable resolving '.>`
`oct 19 15:19:59 mohamedserver named[1914]: network unreachable resolving '.>`
`oct 19 15:19:59 mohamedserver named[1914]: network unreachable resolving '.>`
`oct 19 15:19:59 mohamedserver named[1914]: network unreachable resolving '.>`
`oct 19 15:19:59 mohamedserver named[1914]: network unreachable resolving '.>`
`oct 19 15:19:59 mohamedserver named[1914]: managed-keys-zone: Key 20326 for>`
`oct 19 15:19:59 mohamedserver named[1914]: managed-keys-zone: Key 38696 for>`
`root@mohamedserver:/etc/bind# host -ns mohamedkamil.es`
`mohamedkamil.es has address 192.168.1.220`
`mohamedkamil.es mail is handled by 10 mail.mohamedkamil.es.`
`root@mohamedserver:/etc/bind# host mohamedkamil.es`
`mohamedkamil.es has address 192.168.1.220`
`mohamedkamil.es mail is handled by 10 mail.mohamedkamil.es.`
`root@mohamedserver:/etc/bind# host hola.mohamedkamil.es`
`Host hola.mohamedkamil.es not found: 3(NXDOMAIN)`
`root@mohamedserver:/etc/bind# host -t hola.mohamedkamil.es`
`host: invalid type: hola.mohamedkamil.es`

![[{3F41DE18-15E5-4975-B2D2-C105B95D8ECC} 1.png]]

![[{3F41DE18-15E5-4975-B2D2-C105B95D8ECC}.png]]

## 23-10-2025
**bastionar el ssh** para protegerlo lo maximo posible ya que es la unica entrada al servidor.
nunca entre el root

```bash
sudo adduser prometeo
sudo usermod -aG sudo prometeo
su prometeo
ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/mohamedkamil/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/mohamedkamil/.ssh/id_rsa
Your public key has been saved in /home/mohamedkamil/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:wfXhkNGSTMs8AXXSYJmFsBnvgjxCTpW2AvUxU8TQG3k mohamedkamil@mohamedserver
The key's randomart image is:
+---[RSA 3072]----+
|   .. *B*B@%+    |
|  .  oo==XEOo.   |
|   .o...=+*.o    |
|   +.....o .     |
|    o.+ S .      |
|     . . .       |
|                 |
|                 |
|                 |
+----[SHA256]-----+




-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAACmFlczI1Ni1jdHIAAAAGYmNyeXB0AAAAGAAAABCvxugAqD
2habuu0Nt6P6/kAAAAGAAAAAEAAAAzAAAAC3NzaC1lZDI1NTE5AAAAINmguQ6SpJOpOzNc
4ROzRM4mApewJ4e0oZ7LAUYGdC+OAAAAoFKbwKagCrW+swgvAbS2Ap6UasSRMIKT/ahwJz
aHbjILOpEosSJSkJeaqKifaPB2SBS7BDQHGvyR58DmruinhQXuwu6gZJJYSnIgolflAaA8
JV+TWAP9wOhmLaJcLc7aXAI9DVyU8Q57f7A6+SuJHAbsyBA5X/7o0eWDSDJS1tJnNV1/vr
i2RjuOTOZ+2Wu9ib3Ht1Gah0jXeLiFss1tMF0=
-----END OPENSSH PRIVATE KEY-----


ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINmguQ6SpJOpOzNc4ROzRM4mApewJ4e0oZ7LAUYGdC+O prometeo@mohamedserver


sudo nano sshd_config

quitar el root login
password authentication no
userpam yes


```



bloquear clave con contradeña
clave publica si 


## 30-10-2025

protocolos

primero enable y luego start el ssh en systemctl 
instalar apache2
configurar archivo configuracion sitesponer el pagina.conf
decir document host virtualhost
decir alias errrores
`crear sitio de de sitio web document root` 
`a2insite`

`miguel.alayon@thepower.education`

`mohamedkamil@mohamedserver:~$ cd /etc/apache2/`
`mohamedkamil@mohamedserver:/etc/apache2$ ls`
`apache2.conf    magic           sites-available`
`conf-available  mods-available  sites-enabled`
`conf-enabled    mods-enabled`
`envvars         ports.conf`
`mohamedkamil@mohamedserver:/etc/apache2$ nano apache2.conf`
`mohamedkamil@mohamedserver:/etc/apache2$ lcd sites-enabled/`
`Command 'lcd' not found, but there are 16 similar ones.`
`mohamedkamil@mohamedserver:/etc/apache2$ ls`
`apache2.conf    magic           sites-available`
`conf-available  mods-available  sites-enabled`
`conf-enabled    mods-enabled`
`envvars         ports.conf`
`mohamedkamil@mohamedserver:/etc/apache2$ cd sites-available/`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ ls`
`000-default.conf  default-ssl.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo nano default-ssl.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ touch santander.conf`
`touch: cannot touch 'santander.conf': Permission denied`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo santander.conf`
`sudo: santander.conf: command not found`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo touch santander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo nano sandander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ cat santander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ ls`
`000-default.conf  sandander.conf`
`default-ssl.conf  santander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ cd santander.conf`
`-bash: cd: santander.conf: Not a directory`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ cat santander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ nano santander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo nano santander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo nano sandander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ ls`
`000-default.conf  sandander.conf`
`default-ssl.conf  santander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo nano sandander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ rm santander.conf`
`rm: remove write-protected regular empty file 'santander.conf'?`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ rm santander.conf`
`rm: remove write-protected regular empty file 'santander.conf'?`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ rm santander.conf`
`rm: remove write-protected regular empty file 'santander.conf'?`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ ls`
`000-default.conf  sandander.conf`
`default-ssl.conf  santander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo rm santander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ ls`
`000-default.conf  default-ssl.conf  sandander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ nano sandander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ ls`
`000-default.conf  default-ssl.conf  sandander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ cd ..`
`mohamedkamil@mohamedserver:/etc/apache2$ cd /var/www/santander`
`-bash: cd: /var/www/santander: No such file or directory`
`mohamedkamil@mohamedserver:/etc/apache2$ cd /var/www`
`mohamedkamil@mohamedserver:/var/www$ mkdir santander`
`mkdir: cannot create directory ‘santander’: Permission denied`
`mohamedkamil@mohamedserver:/var/www$ sudo mkdir santander`
`mohamedkamil@mohamedserver:/var/www$ cd santander/`
`mohamedkamil@mohamedserver:/var/www/santander$ touch index.html`
`touch: cannot touch 'index.html': Permission denied`
`mohamedkamil@mohamedserver:/var/www/santander$ sudo touc`
`h index.html`
`mohamedkamil@mohamedserver:/var/www/santander$ sudo a2en`
`site santander.local`
`ERROR: Site santander.local does not exist!`
`mohamedkamil@mohamedserver:/var/www/santander$ sudo nano index.html`
`mohamedkamil@mohamedserver:/var/www/santander$ cd ..`
`mohamedkamil@mohamedserver:/var/www$ ls`
`html  santander`
`mohamedkamil@mohamedserver:/var/www$ cd html/`
`mohamedkamil@mohamedserver:/var/www/html$ ls`
`index.html`
`mohamedkamil@mohamedserver:/var/www/html$ cd /etc/apache2/sites-available/`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ ls`
`000-default.conf  default-ssl.conf  sandander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ cat default-ssl.conf`
`<VirtualHost *:443>`
        `ServerAdmin webmaster@localhost`

        `DocumentRoot /var/www/html`

        `# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,`
        `# error, crit, alert, emerg.`
        `# It is also possible to configure the loglevel for particular`
        `# modules, e.g.`
        `#LogLevel info ssl:warn`

        `ErrorLog ${APACHE_LOG_DIR}/error.log`
        `CustomLog ${APACHE_LOG_DIR}/access.log combined`

        `# For most configuration files from conf-available/, which are`
        `# enabled or disabled at a global level, it is possible to`
        `# include a line for only one particular virtual host. For example the`
        `# following line enables the CGI configuration for this host only`
        `# after it has been globally disabled with "a2disconf".`
        `#Include conf-available/serve-cgi-bin.conf`

        `#   SSL Engine Switch:`
        `#   Enable/Disable SSL for this virtual host.`
        `SSLEngine on`

        `#   A self-signed (snakeoil) certificate can be created by installing`
        `#   the ssl-cert package. See`
        `#   /usr/share/doc/apache2/README.Debian.gz for more info.`
        `#   If both key and certificate are stored in the same file, only the`
        `#   SSLCertificateFile directive is needed.`
        `SSLCertificateFile      /etc/ssl/certs/ssl-cert-snakeoil.pem`
        `SSLCertificateKeyFile   /etc/ssl/private/ssl-cert-snakeoil.key`

        `#   Server Certificate Chain:`
        `#   Point SSLCertificateChainFile at a file containing the`
        `#   concatenation of PEM encoded CA certificates which form the`
        `#   certificate chain for the server certificate. Alternatively`
        `#   the referenced file can be the same as SSLCertificateFile`
        `#   when the CA certificates are directly appended to the server`
        `#   certificate for convinience.`
        `#SSLCertificateChainFile /etc/apache2/ssl.crt/server-ca.crt`

        `#   Certificate Authority (CA):`
        `#   Set the CA certificate verification path where to find CA`
        `#   certificates for client authentication or alternatively one`
        `#   huge file containing all of them (file must be PEM encoded)`
        `#   Note: Inside SSLCACertificatePath you need hash symlinks`
        `#         to point to the certificate files. Use the provided`
        `#         Makefile to update the hash symlinks after changes.`
        `#SSLCACertificatePath /etc/ssl/certs/`
        `#SSLCACertificateFile /etc/apache2/ssl.crt/ca-bundle.crt`

        `#   Certificate Revocation Lists (CRL):`
        `#   Set the CA revocation path where to find CA CRLs for client`
        `#   authentication or alternatively one huge file containing all`
        `#   of them (file must be PEM encoded)`
        `#   Note: Inside SSLCARevocationPath you need hash symlinks`
        `#         to point to the certificate files. Use the provided`
        `#         Makefile to update the hash symlinks after changes.`
        `#SSLCARevocationPath /etc/apache2/ssl.crl/`
        `#SSLCARevocationFile /etc/apache2/ssl.crl/ca-bundle.crl`

        `#   Client Authentication (Type):`
        `#   Client certificate verification type and depth.  Types are`
        `#   none, optional, require and optional_no_ca.  Depth is a`
        `#   number which specifies how deeply to verify the certificate`
        `#   issuer chain before deciding the certificate is not valid.`
        `#SSLVerifyClient require`
        `#SSLVerifyDepth  10`

        `#   SSL Engine Options:`
        `#   Set various options for the SSL engine.`
        `#   o FakeBasicAuth:`
        `#    Translate the client X.509 into a Basic Authorisation.  This means that`
        `#    the standard Auth/DBMAuth methods can be used for access control.  The`
        `#    user name is the `one line' version of the client's X.509 certificate.`
        `#    Note that no password is obtained from the user. Every entry in the user`
        `#    file needs this password: `xxj31ZMTZzkVA'.`
        `#   o ExportCertData:`
        `#    This exports two additional environment variables: SSL_CLIENT_CERT and`
        `#    SSL_SERVER_CERT. These contain the PEM-encoded certificates of the`
        `#    server (always existing) and the client (only existing when client`
        `#    authentication is used). This can be used to import the certificates`
        `#    into CGI scripts.`
        `#   o StdEnvVars:`
        `#    This exports the standard SSL/TLS related `SSL_*' environment variables.`
        `#    Per default this exportation is switched off for performance reasons,`
        `#    because the extraction step is an expensive operation and is usually`
        `#    useless for serving static content. So one usually enables the`
        `#    exportation for CGI and SSI requests only.`
        `#   o OptRenegotiate:`
        `#    This enables optimized SSL connection renegotiation handling when SSL`
        `#    directives are used in per-directory context.`
        `#SSLOptions +FakeBasicAuth +ExportCertData +StrictRequire`
        `<FilesMatch "\.(?:cgi|shtml|phtml|php)$">`
                `SSLOptions +StdEnvVars`
        `</FilesMatch>`
        `<Directory /usr/lib/cgi-bin>`
                `SSLOptions +StdEnvVars`
        `</Directory>`
`</VirtualHost>`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ cat sandander.conf`
`<VirtualHost *:80>`
        `ServerAdmin webmaster@santander.local`
        `ServerName santander.local`
        `ServerAlias www.santander.local`
        `DocumentRoot /var/www/santander`
        `ErrorLog ${APACHE_LOG_DIR}/error.log`
        `CustomLog ${APACHE_LOG_DIR}/access.log combined`
`</VirtualHost>`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ ls`
`000-default.conf  default-ssl.conf  sandander.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo mv santander.conf santander.local.conf`
`mv: cannot stat 'santander.conf': No such file or directory`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo chmod 777 sandande`
`r.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo mv santander.conf santander.local.conf`
`mv: cannot stat 'santander.conf': No such file or directory`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo mv sandander.conf santander.local.conf`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo nano /etc/hosts`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ systemctl restart apache2`
`==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ====`
`Authentication is required to restart 'apache2.service'.`
`Multiple identities can be used for authentication:`
 1.  `mohamed (mohamedkamil)`
 2.  `,,, (prometeo)`
`Choose identity to authenticate as (1-2): 1`
`Password:`
`==== AUTHENTICATION COMPLETE ====`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ systemctl status apache`
`2`
`● apache2.service - The Apache HTTP Server`
     `Loaded: loaded (/usr/lib/systemd/system/apache2.service; enabled; preset: >`
     `Active: active (running) since Thu 2025-10-30 15:54:48 UTC; 9s ago`
       `Docs: https://httpd.apache.org/docs/2.4/`
    `Process: 1915 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SU>`
   `Main PID: 1920 (apache2)`
      `Tasks: 55 (limit: 4644)`
     `Memory: 5.3M (peak: 5.5M)`
        `CPU: 18ms`
     `CGroup: /system.slice/apache2.service`
             `├─1920 /usr/sbin/apache2 -k start`
             `├─1922 /usr/sbin/apache2 -k start`
             `└─1923 /usr/sbin/apache2 -k start`

`oct 30 15:54:48 mohamedserver systemd[1]: Starting apache2.service - The Apache>`
`oct 30 15:54:48 mohamedserver apachectl[1919]: AH00558: apache2: Could not reli>`
`oct 30 15:54:48 mohamedserver systemd[1]: Started apache2.service - The Apache >`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ curl santander.local`
`<h1>Hola, MohamedKamil\!</h1>`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ cat santander.local.conf`
`<VirtualHost *:80>`
        `ServerAdmin webmaster@santander.local`
        `ServerName santander.local`
        `ServerAlias www.santander.local`
        `DocumentRoot /var/www/santander`
        `ErrorLog ${APACHE_LOG_DIR}/error.log`
        `CustomLog ${APACHE_LOG_DIR}/access.log combined`
`</VirtualHost>`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ cat /var/www/santander/index.html`
`<h1> santander </h1>`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo a2dissite 000-default.conf`
`Site 000-default disabled.`
`To activate the new configuration, you need to run:`
  `systemctl reload apache2`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo a2ensite santander.local.conf`
`Enabling site santander.local.`
`To activate the new configuration, you need to run:`
  `systemctl reload apache2`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo systemctl reload apache2`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ sudo nano /etc/hosts`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ curl santander.local`
`<h1> santander </h1>`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$ ip a`
`1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000`
    `link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00`
    `inet 127.0.0.1/8 scope host lo`
       `valid_lft forever preferred_lft forever`
    `inet6 ::1/128 scope host noprefixroute`
       `valid_lft forever preferred_lft forever`
`2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000`
    `link/ether 08:00:27:3a:87:c1 brd ff:ff:ff:ff:ff:ff`
    `inet 192.168.1.220/24 brd 192.168.1.255 scope global enp0s3`
       `valid_lft forever preferred_lft forever`
    `inet6 fe80::a00:27ff:fe3a:87c1/64 scope link`
       `valid_lft forever preferred_lft forever`
`mohamedkamil@mohamedserver:/etc/apache2/sites-available$`


## 06-11-2025

![[Pasted image 20251106161434.png]]

servidor web
pones dominio ip te vas a apache y te devuelve carpetas que luego se interpreta por el navegador
virtualhost

sudo apt install apache2 -y
cd /var/www/html/




telnet desplegando123.com 80

virtualhost distintos dominios que apuntan a carpetas dentro del servidor

tantos .conf como dominios a gestionar


![[Pasted image 20251106164813.png]]
[https://http.dev/1.1](https://http.dev/1.1)



![[Pasted image 20251106164949.png]]


https://cftic.centrosdeformacion.empleo.madrid.org/ficha-curso-administracion-de-sistemas-operativos-linux-lpic-1-y-2

redhat
lp

i[https://www.getsinglefile.com/](https://www.getsinglefile.com/)


[https://certbot.eff.org/](https://certbot.eff.org/)



## 13-11-2025
apache2
tener distintos dominios para apunatr alli
instalar wordpress y ec2

moodle

## 20-11-2025
moodle 
permite crear sistemas de aprendizaje LMS

instalar joomla y prestasho

bastionado

servicio mail
**servidor de correo**
servicio imap pop smtp (mas viejo)
pop y imap para autenticacion y recogeimiento correos
nunca se monta smtp de 0 por motivos de seguridad


"El correo se envía desde un MUA como Gmail. Gmail se conecta a un servidor SMTP. Ese servidor SMTP consulta el DNS del dominio del destinatario, mira el registro MX y obtiene el nombre del servidor que recibe el correo. Luego resuelve su registro A para saber la IP. Después, el servidor SMTP de origen se comunica con el servidor SMTP de destino. Son dos servidores SMTP hablando entre sí. y ese correo llega a otro smtp 

recogemos el correo con pop3 lo quitas del servidor y lo pones en tu cliente de correo e imap se conectsa directamente al servidor y comprueba lo que hay

POP3 e IMAP no intervienen en el envío, solo en la **recepción** cuando el usuario quiere leer el correo."

**Puntos importantes corregidos:**  
• Gmail (la web y la app) = MUA  
• El envío siempre es por SMTP  
• El servidor consulta el MX y luego su A/AAAA  
• POP3/IMAP se usan para leer, no para enviar

https://asir.damiansu.com/mod/book/view.php?id=8&chapterid=21

https://prezi.com/view/PJYUmgBeea8q0sti1Ik2/?referral_token=o0JA0flnB3FN


practica

preparar dns y mx que apunte a un registro a a

![[Pasted image 20251127163737.png]]mohamedkamil@mohamedserver:~$ host mohamedkamil.es
mohamedkamil.es has address 94.73.34.186
mohamedkamil.es mail is handled by 10 mx00.ionos.es.
mohamedkamil.es mail is handled by 10 mx01.ionos.es.
mohamedkamil@mohamedserver:~$ host -t ns mohamedkamil.es
mohamedkamil.es name server ns1037.ui-dns.biz.
mohamedkamil.es name server ns1117.ui-dns.com.
mohamedkamil.es name server ns1100.ui-dns.org.
mohamedkamil.es name server ns1111.ui-dns.de.
mohamedkamil@mohamedserver:~$


mx @ mail.mohamedkamil.es

![[Pasted image 20251127164339.png]]


activar smtp por telefono

preparar ionos ativar firewalñl host funcione bien



## 04-12-2025
https://asir.damiansu.com/

https://asir.damiansu.com/mod/book/view.php?id=8&chapterid=21#mod_book-chapter

sudo apt update -y
sudo apt install postfix -y
autenticacion atraves del doble con 

apt install sasl2-bin -y

dic 04 15:38:36 mohamedserver systemd[1]: Starting postfix.service - Postfix Mail Transport Agent...
dic 04 15:38:36 mohamedserver systemd[1]: Finished postfix.service - Postfix Mail Transport Agent.
mohamedkamil@mohamedserver:~$ sudo nano /etc/postfix/virtual-mailbox
mohamedkamil@mohamedserver:~$ postmap /etc/postfix/virtual-mailbox
postmap: fatal: open database /etc/postfix/virtual-mailbox.db: Permission denied
mohamedkamil@mohamedserver:~$ sudo postmap /etc/postfix/virtual-mailbox
mohamedkamil@mohamedserver:~$ postmap /etc/postfix/virtual-mailbox
postmap: fatal: open /etc/postfix/virtual-mailbox.db: Permission denied
mohamedkamil@mohamedserver:~$ sudo postmap /etc/postfix/virtual-mailbox
mohamedkamil@mohamedserver:~$ sudo doveadm pw -s CRAM-MD5
Enter new password:
Retype new password:
{CRAM-MD5}dd59f669267e9bb13d42a1ba57c972c5b13a4b2ae457c9ada8035dc7d8bae41b
mohamedkamil@mohamedserver:~$

pacitochocolatero@desplegando123.com



## 11-12-2025
dominio y contraseña
ssh superseguro apache 3 paginas pagina virtualhost otra wordpress otra moodle o prestashop montar ftp y subir y bajar archivos


virtualhost
indicar como hacerlo en un servidor
instalar ftp que herramientas necesitas

## 18/12/2025
webmin
dms
https://www.softaculous.com/apps/ecommerce
https://rustdesk.com/es/
jellyfin