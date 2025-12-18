# Actividad 1: Práctica de Servicios en Red

**Nombre del estudiante:** Mohamed Kamil El Kouarti  
**Fecha:** 18/12/2025  
**Dominio utilizado:** mohamedcamil.es (registrado previamente, pero implementado en entorno local como mohamedkamil.local para simulación)  

## Introducción

Al no disponer de un VPS ni de un servidor accesible desde Internet, he implementado la práctica en un entorno local mediante una máquina virtual (utilizando VirtualBox con Ubuntu Server). Para simular un entorno real de producción, he utilizado el dominio local **mohamedkamil.local** junto con el servicio BIND9 y el archivo `/etc/hosts` en el cliente, tal como permite el enunciado de la actividad. Esto permite resolver los subdominios sin necesidad de un dominio público accesible.

El sistema operativo utilizado es Ubuntu Server, con acceso sudo y conectividad a Internet para instalaciones. He configurado BIND9 como servidor DNS, Apache con Virtual Hosts, certificados autofirmados (dado el entorno local), un servidor FTP seguro (vsftpd), y he instalado WordPress y PrestaShop. Además, he generado una página principal estática con IA sobre un hobby personal (juegos, específicamente un tema relacionado con un videojuego).

A continuación, detallo cada sección con los comandos utilizados, fragmentos de configuración (mostrados en capturas y explicados), logs relevantes y evidencias gráficas. Todas las pruebas se han realizado con HTTPS activado.

## Configuración del servidor DNS (BIND9)

He configurado BIND9 para resolver el dominio local **mohamedkamil.local** y sus subdominios: **blog.mohamedkamil.local** y **tienda.mohamedkamil.local**. Incluí un registro TXT en el dominio principal con el mensaje "Actividad 1 SER completada por Mohamed Kamil El Kouarti".

### Comandos utilizados:
- Instalación: `sudo apt update && sudo apt install bind9`
- Edición de configuración: `sudo nano /etc/bind/named.conf.local` (añadí la zona para mohamedkamil.local)
- Edición de la zona: `sudo nano /etc/bind/db.mohamedkamil.local` (definí registros A para el dominio y subdominios, y el TXT)
- Reinicio del servicio: `sudo systemctl restart bind9`
- Verificación de estado: `sudo systemctl status bind9`
- Pruebas de resolución: `ping mohamedkamil.local`, `dig mohamedkamil.local`, `dig blog.mohamedkamil.local`, `dig tienda.mohamedkamil.local`, `dig mohamedkamil.local TXT`, `nslookup mohamedkamil.local`, `host mohamedkamil.local`
- Para resolución desde otro host: Edité `/etc/hosts` en el cliente y abrí el puerto 53 en el firewall del servidor con `sudo ufw allow 53`
- Logs: `sudo grep named /var/log/syslog | tail -n 20`

### Fragmentos de configuración:
El archivo `/etc/bind/named.conf.local` incluye la definición de la zona:
![Imagen](../fotos/Pasted%20image%2020251218105942.png)

El archivo `/etc/bind/db.mohamedkamil.local` define los registros (serial actualizado, registros A y TXT):
![Imagen](../fotos/Pasted%20image%2020251218110147.png)

### Evidencias y pruebas:
- Ping al dominio después de editar `/etc/hosts`:
![Imagen](../fotos/Pasted%20image%2020251218104529.png)
- Estado del servicio BIND9 activo:
![Imagen](../fotos/Pasted%20image%2020251218105149.png)
- Resolución con `dig` (dos capturas):
![Imagen](../fotos/Pasted%20image%2020251218105346.png)
![Imagen](../fotos/Pasted%20image%2020251218105406.png)
- Resolución desde otro host con `nslookup` (permitiendo puerto 53):
![Imagen](../fotos/Pasted%20image%2020251218110324.png)
![Imagen](../fotos/Pasted%20image%2020251218111852.png)
- Registro TXT con `dig`:
![Imagen](../fotos/Pasted%20image%2020251218154536.png)
![Imagen](../fotos/Pasted%20image%2020251218160005.png)
- Otras comprobaciones de resolución (`dig`, `host`, `nslookup` para todos los subdominios):
![Imagen](../fotos/Pasted%20image%2020251218155721.png)
![Imagen](../fotos/Pasted%20image%2020251218155911.png)
- Logs de BIND9:
![Imagen](../fotos/Pasted%20image%2020251218155153.png)
![Imagen](../fotos/Pasted%20image%2020251218155514.png)

## Configuración del servidor Apache (Virtual Hosts)

He configurado Apache con tres Virtual Hosts para los subdominios. Cada uno apunta a un directorio diferente en `/var/www/html/`.

### Comandos utilizados:
- Instalación: `sudo apt install apache2`
- Creación de directorios: `sudo mkdir -p /var/www/html/mohamedkamil.local`, etc.
- Configuración de Virtual Hosts: `sudo nano /etc/apache2/sites-available/mohamedkamil.local.conf`, y similares para blog y tienda.
- Activación: `sudo a2ensite mohamedkamil.local.conf`, `sudo systemctl reload apache2`
- Verificación: `sudo systemctl status apache2`, `curl http://mohamedkamil.local`
- Pruebas de acceso: Acceso vía navegador a http://mohamedkamil.local, etc.

### Fragmentos de configuración:
Archivo para el dominio principal (`/etc/apache2/sites-available/mohamedkamil.local.conf`):
![Imagen](../fotos/Pasted%20image%2020251218135597.png)
![Imagen](../fotos/Pasted%20image%2020251218160129.png)

Archivo para blog (`/etc/apache2/sites-available/blog.mohamedkamil.local.conf` – solo cambié ServerName y DocumentRoot):
![Imagen](../fotos/Pasted%20image%2020251218160226.png)

Archivo para tienda (`/etc/apache2/sites-available/tienda.mohamedkamil.local.conf` – similar):
![Imagen](../fotos/Pasted%20image%2020251218160703.png)

### Evidencias y pruebas:
- Estado del servicio Apache activo:
![Imagen](../fotos/Pasted%20image%2020251218110548.png)
![Imagen](../fotos/Pasted%20image%2020251218155010.png) (incluye BIND9)
- Acceso a http://192.168.1.220/ (IP del servidor):
![Imagen](../fotos/Pasted%20image%2020251218111722.png)
- Prueba con curl:
![Imagen](../fotos/Pasted%20image%2020251218111916.png)
- Acceso a subdominios HTTP:
  - http://tienda.mohamedkamil.local:
  ![Imagen](../fotos/Pasted%20image%2020251218112409.png)
  - http://blog.mohamedkamil.local:
  ![Imagen](../fotos/Pasted%20image%2020251218112434.png)
  - http://mohamedkamil.local:
  ![Imagen](../fotos/Pasted%20image%2020251218112455.png)
- Logs de Apache:
![Imagen](../fotos/Pasted%20image%2020251218160737.png)
![Imagen](../fotos/Pasted%20image%2020251218160911.png)

## Seguridad en la comunicación (Certbot / Let’s Encrypt)

Dado el entorno local, generé certificados autofirmados usando Certbot (o equivalente con OpenSSL para simular). Modifiqué los Virtual Hosts para usar HTTPS.

### Comandos utilizados:
- Instalación de Certbot: `sudo apt install certbot`
- Generación de certificado autofirmado: `sudo certbot certonly --standalone -d mohamedkamil.local --non-interactive --agree-tos --email example@email.com` (adaptado para local; en práctica real usé OpenSSL para autofirmado).
- Modificación de Virtual Hosts: Añadí bloques <VirtualHost *:443> con SSLEngine on, etc.
- Reinicio: `sudo systemctl restart apache2`

### Evidencias:
- Certificados generados:
![Imagen](../fotos/Pasted%20image%2020251218153848.png)
- Acceso HTTPS a tienda.mohamedkamil.local (similar para otros):
![Imagen](../fotos/Pasted%20image%2020251218113446.png)

## Instalación de CMS: WordPress y PrestaShop

### Página principal (mohamedkamil.local)
Generé una página estática con IA (ChatGPT) sobre mi hobby: juegos (temática de un videojuego). Incluye index.html con texto de presentación, imágenes y multimedia.

### Comandos:
- Creación: Usé IA para generar HTML, luego `sudo cp index.html /var/www/html/mohamedkamil.local/`

### Evidencias:
- Generación con IA:
![Imagen](../fotos/Pasted%20image%2020251218114613.png)
- Página en navegador (HTTPS):
![Imagen](../fotos/Pasted%20image%2020251218114639.png)
![Imagen](../fotos/Pasted%20image%2020251218114702.png)

### WordPress (blog.mohamedkamil.local)
Instalé WordPress con base de datos MariaDB.

### Comandos:
- Instalación MariaDB: `sudo apt install mariadb-server`, `sudo mysql_secure_installation`
- Creación BD: `sudo mysql -u root -p` → CREATE DATABASE wordpress; GRANT ALL ON wordpress.* TO 'wpuser'@'localhost' IDENTIFIED BY 'password';
- Descarga: `wget https://wordpress.org/latest.tar.gz`, `tar -xzvf latest.tar.gz`, `sudo mv wordpress /var/www/html/blog.mohamedkamil.local`
- Configuración: Edité wp-config.php, completé instalación vía navegador.

### Evidencias:
- Descarga y extracción:
![Imagen](../fotos/Pasted%20image%2020251218120553.png)
- Asistente de instalación (nota: contraseña eliminada para entrega):
![Imagen](../fotos/Pasted%20image%2020251218121711.png)
- Dashboard:
![Imagen](../fotos/Pasted%20image%2020251218121900.png)
- Página en navegador (HTTPS):
![Imagen](../fotos/Pasted%20image%2020251218122403.png)
- Logs MariaDB:
![Imagen](../fotos/Pasted%20image%2020251218121815.png)

### PrestaShop (tienda.mohamedkamil.local)
Instalé vsftpd para subir archivos con SSL activado, luego PrestaShop con BD.

### Comandos para FTP:
- Instalación: `sudo apt install vsftpd`
- Configuración: `sudo nano /etc/vsftpd.conf` (ssl_enable=YES, etc.)
- Reinicio: `sudo systemctl restart vsftpd`
- Prueba: Con FileZilla desde PC cliente, con cifrado.

### Comandos para PrestaShop:
- Subida: Usé FTP para subir prestashop.zip a /var/www/html/tienda.mohamedkamil.local
- Creación BD: Similar a WordPress.
- Instalación: Vía navegador.

### Evidencias:
- Prueba FTP con cifrado:
![Imagen](../fotos/Pasted%20image%2020251218122809.png)
- Subida de ZIP vía FTP:
![Imagen](../fotos/Pasted%20image%2020251218123923.png)
- Asistente de instalación:
![Imagen](../fotos/Pasted%20image%2020251218144428.png)
- BD conectada:
![Imagen](../fotos/Pasted%20image%2020251218145306.png)
- Instalación completa:
![Imagen](../fotos/Pasted%20image%2020251218151829.png)
- Dashboard back office:
![Imagen](../fotos/Pasted%20image%2020251218152028.png)
- Página en navegador (HTTPS):
![Imagen](../fotos/Pasted%20image%2020251218152533.png)

## Conclusión

Esta práctica me ha permitido profundizar en la configuración de servicios en red, desde DNS hasta CMS seguros. Aprendí a manejar BIND9 para resolución local, Virtual Hosts en Apache, certificados autofirmados y FTP seguro. Los desafíos incluyeron depurar resolución DNS y configurar SSL en local, pero el resultado es un entorno funcional simulado. Recomiendo usar un VPS para producción real. La experiencia fue enriquecedora, reforzando conceptos de seguridad y administración de servidores.