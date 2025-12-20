# Actividad 1: Práctica de Servicios en Red

**Nombre :** Mohamed Kamil El Kouarti  
**Fecha:** 18/12/2025  
**Dominio utilizado:** mohamedcamil.es (implementado en entorno local como mohamedkamil.local)  
**[Repositorio en GitHub](https://github.com/MohamedKamil-hub/segundo-SMR/blob/main/servicios-de-red/Mohamed_Kamil_el_Kouarti_Pr%C3%A1ctica_Servicios_Red.md)**

## Introducción

he configurado un entorno de servicios en red de manera local, ya que no tengo acceso a un VPS o servidor público. Usé una máquina virtual con VirtualBox y Ubuntu Server para simular un entorno real. Para el dominio, partí de mi dominio registrado (mohamedcamil.es), pero lo adapté a un entorno local con **mohamedkamil.local** usando BIND9 como DNS y editando el archivo `/etc/hosts` en el cliente. Esto me permitió resolver los subdominios sin problemas.

El sistema es Ubuntu Server con privilegios sudo y conexión a Internet para descargar paquetes. Configuré DNS con BIND9, un servidor web Apache con Virtual Hosts para tres sitios, certificados SSL autofirmados porque en local no se puede usar Let’s Encrypt realmente, un FTP seguro con vsftpd, y CMS como WordPress y PrestaShop. Para la página principal, usé IA para generar contenido sobre mi hobby favorito , un videojuego llamado bloodborne

A lo largo del informe, explico cada paso, con los comandos que ejecuté, por qué los usé, fragmentos de archivos de configuración, logs relevantes y capturas de pantalla para demostrar que todo funciona. Todas las pruebas incluyen acceso vía HTTPS para verificar la seguridad. 

## Configuración del servidor DNS (BIND9)

Para el DNS, instalé y configuré BIND9 para que resolviera mi dominio local y sus subdominios. Esto simula un servidor DNS real, resolviendo nombres como **mohamedkamil.local**, **blog.mohamedkamil.local** y **tienda.mohamedkamil.local**. Añadí un registro TXT personalizado para identificar la actividad, 

### Comandos utilizados y explicación:
- Actualicé paquetes e instalé BIND9 con `sudo apt update && sudo apt install bind9` para tener el servicio DNS disponible
- Edité la configuración principal: `sudo nano /etc/bind/named.conf.local` definí la zona para mi dominio local, especificando el archivo de zona
- Edité el archivo de zona: `sudo nano /etc/bind/db.mohamedkamil.local` (añadí registros A para apuntar todo a la IP local, y el TXT con mi mensaje ; actualicé el serial para que BIND9 lo reconozca.
- Reinicié el servicio con `sudo systemctl restart bind9` para aplicar cambios
- Verifiqué estado: `sudo systemctl status bind9` para asegurar que corre sin errores.
- Pruebas de resolución hice `ping mohamedkamil.local` después de editar /etc/hosts, `dig mohamedkamil.local` (para ver detalles DNS), `dig blog.mohamedkamil.local`, `dig tienda.mohamedkamil.local`, `dig mohamedkamil.local TXT` para el registro TXT, `nslookup mohamedkamil.local` y `host mohamedkamil.local` herramientas estándar para validar resolución
- Para pruebas desde otro host: Edité `/etc/hosts` en mi máquina cliente y abrí el puerto 53 en el firewall del servidor con `sudo ufw allow 53` ara permitir consultas DNS externas.
- Logs: `sudo grep named /var/log/syslog | tail -n 20` para ver los últimos eventos de BIND9 y depurar si hay errores

### Fragmentos de configuración:
El archivo `/etc/bind/named.conf.local` define la zona principal:
![Imagen](../fotos/Pasted%20image%2020251218105942.png)

El archivo `/etc/bind/db.mohamedkamil.local` incluye los registros A y el TXT "Actividad 1 Servicios en red mohamed kamil"
![Imagen](../fotos/Pasted%20image%2020251218110147.png)

### Evidencias y pruebas:
- Ping al dominio después de editar `/etc/hosts` confirma resolución sin problemas
![Imagen](../fotos/Pasted%20image%2020251218104529.png)
- Estado del servicio BIND9 activo y corriendo sin problemas, excepto unas configuraciones residuales de mohamedkamil.es
![Imagen](../fotos/Pasted%20image%2020251218105149.png)
- Resolución detallada con `dig` muestra respuestas para dominio y subdominios
![Imagen](../fotos/Pasted%20image%2020251218105346.png)
![Imagen](../fotos/Pasted%20image%2020251218105406.png)
- Resolución desde otro host con `nslookup` esto demuestra que funciona más allá del servidor local
![Imagen](../fotos/Pasted%20image%2020251218110324.png)
![Imagen](../fotos/Pasted%20image%2020251218111852.png)
- Registro TXT verificado con `dig` muestra el mensaje personalizado que configure antes
![Imagen](../fotos/Pasted%20image%2020251218154536.png)
![Imagen](../fotos/Pasted%20image%2020251218160005.png)
- Otras comprobaciones de resolución para todos los subdominios mohamedkamil.local, blog y tienda   con los comandos `dig`, `host`, `nslookup`
![Imagen](../fotos/Pasted%20image%2020251218155721.png)
![Imagen](../fotos/Pasted%20image%2020251218155911.png)
- Logs de BIND9 últimos eventos, sin errores graves que envuelvan esta practica de mohamedkamil.local
![Imagen](../fotos/Pasted%20image%2020251218155153.png)
![Imagen](../fotos/Pasted%20image%2020251218155514.png)

## Configuración del servidor Apache (Virtual Hosts)

Apache es el como el corazon del servidor web. Configuré tres Virtual Hosts independientes, cada uno para un subdominio, apuntando a directorios separados en `/var/www/html/`. esto hace posible que Apache sirva sitios diferentes en la misma IP, basado en el nombre del dominio.

### Comandos utilizados y explicación:
- Instalé apache `sudo apt install apache2` base para el servidor web
- Creé directorios para cada sitio `sudo mkdir -p /var/www/html/mohamedkamil.local` y similares para blog y tienda, para organizar archivos
- Configuré Virtual Hosts: `sudo nano /etc/apache2/sites-available/mohamedkamil.local.conf` (definí ServerName, DocumentRoot, .; repetí para blog y tienda, cambiando solo lo anterior en tienda y blog).
- Activé los sitios: `sudo a2ensite mohamedkamil.local.conf` (y para los otros), seguido de `sudo systemctl reload apache2` para cargar sin reiniciar todo.
- Verifiqué: `sudo systemctl status apache2` estado general, `curl http://mohamedkamil.local` prueba simple desde terminal
- Pruebas de acceso: Accedí por navegador firefox a cada subdominio para confirmar que carga  todo el contenido correcto.

### Fragmentos de configuración:
Archivo principal para **mohamedkamil.local.conf** el bloque http es el que pone virtualhost *:80, puerto 80 y https 443


![Imagen](../fotos/Pasted%20image%2020251218135597.png)
![Imagen](../fotos/Pasted%20image%2020251218160129.png)

Archivo para **blog.mohamedkamil.local.conf** solo modifiqué ServerName y DocumentRoot, respecto al mohamedkamil.local y a tienda
![Imagen](../fotos/Pasted%20image%2020251218160226.png)

Archivo para **tienda.mohamedkamil.local.conf** 
![Imagen](../fotos/Pasted%20image%2020251218160703.png)

### Evidencias y pruebas:
- Estado del servicio Apache activo y ademas el chequeo con BIND9
![Imagen](../fotos/Pasted%20image%2020251218110548.png)
![Imagen](../fotos/Pasted%20image%2020251218155010.png)
- Acceso básico a la IP del servidor (http://192.168.1.220/):
![Imagen](../fotos/Pasted%20image%2020251218111722.png)
- Prueba con curl  que confirma respuesta HTTP
![Imagen](../fotos/Pasted%20image%2020251218111916.png)
- Acceso a subdominios vía HTTP esto fue antes del SSL, para verificar los virtualhost
  - http://tienda.mohamedkamil.local:
  ![Imagen](../fotos/Pasted%20image%2020251218112409.png)
  - http://blog.mohamedkamil.local:
  ![Imagen](../fotos/Pasted%20image%2020251218112434.png)
  - http://mohamedkamil.local:
  ![Imagen](../fotos/Pasted%20image%2020251218112455.png)
- Logs de Apache mediante el comando de journalctl y el archivo de logs de errores de apache últimos eventos, mostrando arranques y sin errores
![Imagen](../fotos/Pasted%20image%2020251218160737.png)
![Imagen](../fotos/Pasted%20image%2020251218160911.png)

## Seguridad en la comunicación 

configuré HTTPS para todos los sitios. como lo mio es un entorno local sin dominio público, no pude usar Let’s Encrypt de verdad con Certbot porq requiere validación externa En vez de eso, generé certificados autofirmados con OpenSSL y los integré en los Virtual Hosts. para simula el proceso y permite acceso HTTPS, aunque el navegador muestra advertencia por no ser confiable pero es es normal en local Instalé Certbot por completitud, pero no generó logs  porque no lo usé para obtención real.

### Comandos utilizados y explicación:
- Instalé Certbot `sudo apt install certbot` aunque no lo usé para certificados, lo tengo para futuras extensiones
- Generé certificado autofirmado con OpenSSL: `sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt` que crea clave y certificado válido por un año respondí los prompts con datos inventados para local
- Modifiqué Virtual Hosts Añadí bloques `<VirtualHost *:443>` en cada .conf con `SSLEngine on`, `SSLCertificateFile` y `SSLCertificateKeyFile` apuntando a los archivos generados.
- Habilité módulo SSL`sudo a2enmod ssl` asegura que Apache soporte HTTPS
- Reinicié: `sudo systemctl restart apache2` aplicar cambios
- Verifiqué logs: `sudo tail -n 20 /var/log/apache2/error.log` busca menciones a OpenSSL para confirmar la carga
- Chequeé módulo: `apache2ctl -M | grep ssl` confirma ssl_module activo
- Listado de archivos: `sudo ls -l /etc/ssl/certs/apache-selfsigned.crt /etc/ssl/private/apache-selfsigned.key` verifica existencia y permiso
- Logs de Certbot `journalctl -u certbot` no hay entradas, por que no lo use para la renovación

### Fragmentos de configuración y evidencias:
- Directivas SSL en Virtual Host  mohamedkamil.local.conf, con grep 
![Imagen](../fotos/Pasted%20image%2020251218184622.png)
- Módulo SSL habilitado `sudo a2enmod ssl`
![Imagen](../fotos/Pasted%20image%2020251218185017.png)
- Listado de archivos de certificado autofirmado
![Imagen](../fotos/Pasted%20image%2020251218184328.png)
- Logs de Apache que estan confirmando configuración con OpenSSL
![Imagen](../fotos/Pasted%20image%2020251218184517.png)
- Logs de Certbot no hay entradas, justificado por entorno local):
![Imagen](../fotos/Pasted%20image%2020251218200120.png)  


- Certificados generados y chequeo general con `sudo apachectl -s`
![Imagen](../fotos/Pasted%20image%2020251218153848.png)
- Acceso HTTPS a un ejemplo tienda.mohamedkamil.local; similar para otros, con la advertencia ya aceptada
![Imagen](../fotos/Pasted%20image%2020251218113446.png)

## Instalación de CMS: WordPress y PrestaShop

### Página principal (mohamedkamil.local)
Para el sitio principal, creé una página estática simple sobre mi hobby los videojuegos. Usé Claude como IA para generar el HTML, incluyendo un index.html con texto introductorio  imágenes relacionadas de bloodborne  y algo de multimedia básico ( un enlace a video). Es estático, sin usar CMS

### Comandos utilizados y explicación:
- Generé contenido con IA y copié: `sudo cp index.html /var/www/html/mohamedkamil.local/` subí el archivo generado al directorio del Virtual Host

### Evidencias:
- Proceso de generación con IA copi y pegue el codigo aqui:
![Imagen](../fotos/Pasted%20image%2020251218114613.png)
- Página cargada en navegador con HTTPS, muestra el contenido final la pagina
![Imagen](../fotos/Pasted%20image%2020251218114639.png)
![Imagen](../fotos/Pasted%20image%2020251218114702.png)
- Vista final de mohamedkamil.local:
![Imagen](../fotos/Pasted%20image%2020251218185409.png)

### WordPress (blog.mohamedkamil.local)
Instalé WordPress completo, con base de datos en MariaDB. Es un CMS para blog, configurado en el subdominio blog.mohamedkamil.local

### Comandos utilizados y explicación:
- Instalé MariaDB: `sudo apt install mariadb-server`, seguido de `sudo mysql_secure_installation` eso ultimo para securizar la base de datos
- Creé la base de datos: `sudo mysql -u root -p` y ejecuté dentro lo siguiente:
`CREATE DATABASE wordpress;`
`GRANT ALL ON wordpress.* TO 'wpuser'@'localhost' IDENTIFIED BY 'password';` 
esto crea BD y usuario con permisos

- Descargué y extraje el wordpress `wget https://wordpress.org/latest.tar.gz`, `tar -xzvf latest.tar.gz`, `sudo mv wordpress /var/www/html/blog.mohamedkamil.local` 
y luego use mv para colocar los archivos en el directorio
- Edité `wp-config.php` con datos de BD, luego completé la instalación vía navegador

### Evidencias:
- Descarga y extracción de WordPress
![Imagen](../fotos/Pasted%20image%2020251218120553.png)
- Asistente de instalación de wordpress
![Imagen](../fotos/Pasted%20image%2020251218121711.png)
- Panel de administración, el dashboard de wordpress
![Imagen](../fotos/Pasted%20image%2020251218121900.png)
- Página del blog en el modo edicion de wordpress en navegador con HTTPS
![Imagen](../fotos/Pasted%20image%2020251218122403.png)
- Logs de MariaDB con journalctl y muestra conexiones exitosas
![Imagen](../fotos/Pasted%20image%2020251218121815.png)
- Vista final de blog.mohamedkamil.local:
![Imagen](../fotos/Pasted%20image%2020251218185435.png)

### PrestaShop (tienda.mohamedkamil.local)
Usé vsftpd con SSL para subir archivos, y 
configuré PrestaShop con su propia base de datos

### Comandos utilizados para FTP y explicación:
- Instalé vsftpd `sudo apt install vsftpd` servidor FTP
- Configuré: `sudo nano /etc/vsftpd.conf` activé `ssl_enable=YES` para cifrado, y otros ajustes para seguridad
- Reinicié con `sudo systemctl restart vsftpd` aplica cambios
- Probé: Usé WinSCP desde mi PC con cifrado TLS explicito.

### Comandos utilizados para PrestaShop y explicación:
- Subí archivos: Via FTP, transferí prestashop.zip a `/var/www/html/tienda.mohamedkamil.local`.
- Creé la base de datos parecido a como lo hice con  WordPress, con `CREATE DATABASE prestashop;` etc...
- Instalé y Completé el asistente vía navegador.

### Evidencias:
- Prueba de FTP con cifrado conexión segura desde cliente
![Imagen](../fotos/Pasted%20image%2020251218122809.png)
- Subida del ZIP vía FTP
![Imagen](../fotos/Pasted%20image%2020251218123923.png)
- Asistente de instalación de prestashop
![Imagen](../fotos/Pasted%20image%2020251218144428.png)
- Conexión a base de datos funcional durante instalación:
![Imagen](../fotos/Pasted%20image%2020251218145306.png)
- Instalación completada:
![Imagen](../fotos/Pasted%20image%2020251218151829.png)
- Dashboard de back office:
![Imagen](../fotos/Pasted%20image%2020251218152028.png)
- Página de la tienda en navegador con HTTPS
![Imagen](../fotos/Pasted%20image%2020251218152533.png)
- Vista final de la tienda.mohamedkamil.local:
![Imagen](../fotos/Pasted%20image%2020251218185504.png)

## Conclusión

Esta práctica ha sido una gran oportunidad para aprender servicios en red de forma práctica. Empecé desde cero con DNS en BIND9, que me costó un poco depurar para que resolviera bien localmente. Luego, Apache con Virtual Hosts fue más fluido, pero integrar SSL en local requirió investigar OpenSSL porque Certbot no aplica directamente. WordPress y PrestaShop me enseñaron a manejar el sistema de gestion de contenidos con bases de datos y FTP seguro, con  ideas de seguridad como cifrado en tránsito.

Los desafíos principales para mi fueron la simulación local pero el resultado es un setup funcional que imita a una producción.  la experiencia me ha hecho estar más cómodo con administración de servidores, sobretodo de logs y depuración , conceptos clave para redes. 

