**SMTP** se utiliza para **enviar** correos de cliente a servidor
funciona en el puerto 25 en modo normal y puerto 587  con STARTTLS , que convierte una conexion normal en una cifrada  (TLS) durante la comunicacion

**POP3** solo recibe correos del servidor
puerto 110 en modo normal y 995 en modo seguro (SSL)

**IMAP** recibe, gestiona y **sincroniza** correos del servidor
puerto 143 en modo normal y 993 en modo seguro




**MIME** define el formato de los correos y adjuntos, asi puedes enviar mas cosas aparte de texto, (imagenes, audio, archivos...)
por ejemplo el estandar MIME para json es application/json,        text/html  para páginas web .
image/png para imágenes PNG. y video/mp4 para videos en MP4.



**Dovecot** gestiona el acceso a buzones en un servidor de correo, perro guardian del buzon
formatos de buzon 
- mbox , almacena todos los correos juntos en una caja
- maildir, almacena cada correo como un archivo individual

**Postfix** recibe correo, decide si aceptarlo, y lo entrega, cartero que habla SMTP, usa           `systemctl status postfix` para ver si esta activo


---




**FTP** transfiere archivos, no los cifra por defecto
funciona en el **puerto 21** para el canal de control
	el **modo pasivo** de FTP es mas compatible en redes con firewall, ya que usa el puerto 21 para controlar y recibir comandos, y  necesita otro `rango de puertos pasivos` para transferir datos, es como si tu sales de tu casa a recoger el paquete, el portero (firewall) te ve salir
	.
	Mientras que el **modo activo** es como si un extraño tocara tu puerta para 
	recoger el paquete, el portero (firewall) podria rechzarlo
el usuario con mas riesgo en una comunicacion no cifrada es el usuario autenticado ya que tiene mas cosas que perder.


**SFTP** es FTP funcionando sobre SSH, cifrando la comunicacion, por eso la S va al principio porque primero tienes SSH y luego le añades FTP
funciona en el **puerto 22** que es el puerto de SSH, ya que SFTP es nativo de SSH, esta integrado en el.


**FTPS** añade cifrado TLS/SSL a FTP, por eso la S va al final de FTP porque se le añade a FTP la S de secure, **puerto 21 o 990** 




**vsftpd** es un camarero del servidor que envia y recibe archivos cuando tu lo pides desde ftp
es un orangutan (servidor) que pasa platanos (archivos) de manera segura

su **archivo de configuracion** es `/etc/vsftpd.conf`
**guarda los logs en** `/var/log/vsftpd.log`

su tipo de usuario que no existe como cuenta del sistema es el **usuario virtual** , el local, root, administrador son cuentas del sistema pero un usuario  virtual solo existe dentro de la base de autenticacion de vsftpd
**chroot_local_user** es una directiva de vsftpd , que encierra a los usuarios FTP en su directorio persona es como una jaula virtual
**anonymous_enable=NO** desactiva el acceso anonimo en vsftpd 

**scp** se usa para transferir o copiar archivos de froma segura desde consola , entre servidores de manera encriptada.


---


**HTTPS** funciona en el puerto 443
**HTTP** funciona en el puerto 80, base del funcionamiento de la web
**metodos HTTP**
- **GET** solicita un recurso y descarga todo su contenido
- **POST** envia datos (ej. formularios) al servidor
- **PUT** sube o actualiza un recurso existente en el servidor
- **HEAD** solicita un recurso (solo los encabezados) sin descargar su contenido, para ver su fecha tamaño, etc... usa `curl -l` para ver las cabezeras desde terminal
- **DELETE** elimina un recurso

**codigos HTTP**
- **2xx** todo correcto (200 OK)
- **3xx** redirecciones (301 redireccion permanente a otra URL)
- **4xx** error del cliente (404 indica que un recurso no existe en el servidor, 403 acceso prohibido)
- **5xx** error del servidor


mod_ssl activa HTTPS


---

****`DocumentRoot`** especifica el directorio en el sistema de archivos donde se almacenan los archivos del sitio web

**/etc/apache2/apache2.conf** es el archivo que contiene la configuracion principal de Apache
contiene reglas y define modulos, directorios y normas.

**var/www/html** contiene enl contenido web

usa `apachectl configtest` para comprobar la sintaxis de Apache

**archivos**
- **.htaccess** reglas locales
- **apache2.conf** reglas globales de apache
- **sites-snabled** carpeta con enlaces a reglas de cada sitio
- **index.html** es la hoja de bienvenida

usa `systemctl restart apache2` para reiniciarlo

---

**DNS** resuelve nombres de dominio a IPs

---
**Certbot** se usa para obtener certificados gratuitos de  Let’s Encrypt
**Fail2ban** bloquea IPs tras intentos fallidos de acceso.
**SpamAssassin** literalmente mata spam, bueno, filtra.
**Postman** permite probar APIs de forma grafica.
**openssl** analiza certificados TLS desde la terminal
