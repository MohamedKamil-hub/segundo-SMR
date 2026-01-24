**VirtualBox** es un hipervisor para crear y ejecutar maquinas virtuales.
**IP estatica** para que los servidores tengan siempre la misma direccion y sean faciles de localizar.
**para conectarte a excritorio remoto** habilita escritotio remoto en propiedades del sistema

**herramienta de cliente para conectarte a escritorio remoto** Conexion a escritorio remoto (mstsc)
**rol para crear un dominio en active directory** Servicios de dominio de Active Directory
despues de instalar eso, lo siguiente es promover el servidor a controlador de dominio.
**controlador de dominio** que es un servidor que gestiona usuarios, grupos y la autenticacion del dominio, inicios de sesion y controla quien puede ver que,  a veces hay uno secundario por si acaso.

**se crean usuarios y grupos de active directory** Para administrar permisos y accesos de forma centralizada

**useradd juan** solo crea un usuario llamado juan para que sea mas completo se usaria adduser
**sudo passwd juan** cambia o asigna contraseña a juan

**sudo usermod -aG sudo juan**  
	sudo=yo soy jefe de la manada, por un momento
	usermod=agarra a algun orangutan  y le cambia sus permisos o estatus
	-a=agregar -G=grupo  == -aG agregar a un grupo sin quitar de los que ya estaban
	sudo(segunda vez)=nombre del grupo de orangutanes que pueden ser jefes temporales
	juan=nombre del orangutan
agrega a juan al grupo sudo, ahora podra usar comandos como jefe temporal, pero sigue siendo miembro de otros grupos


**la diferencia principal hay entre crear usuarios en Active Directory y en Linux localmente**
en Active Directory  el usuario es local al servidor,el controlador de dominio lo reconoce en cualquier sitio.
En Linux, el usuario sirve solo para esa maquina .

**para configurar IP estatica con Netplan** configura el fichero **/etc/netplan/*.yaml**

**el modo DHCP** permite obtener la IP del servidor DHCP de la red y cuando obtiene la IP tambien obtiene normalmente puerta de enlace y DNS.

**DNS** resolucion de nombres

**Registro DNS**
- **Registro A** asigna un nombre a una IPv4 (`server1.smr.local` → `192.168.1.10`), el AAAA hace lo mismo con IPv6
- **Registro CNAME** es el apodo , se usa para redirigir de un nombre a otro, es como un orangutan llamadoElGranJefe pero todos le llaman Jefazo que es mas corto  asi cuando pregunten por Jefazo en verdad reciben la direccion de ElGranJefe
- **Registro MX** indica que servidor se encarga del correo de ese dominio
- **Registro TXT** notas escritas en la corteza del arbol
- **Registro NS**  servidor DNS que tiene autoridad sobre ese dominio
- **Registro PTR** hace lo contrario que el registro A, Ttraduce de IP a nombre


el servidor de DNS mas usado es **BIND9**
sus zonas DNS se declaran en **/etc/bind/named.conf.local**

para ver que el DNS funciona usa nslookup, que pregunta donde vive google.com?
si la respuesta es correcta significa que  el DNS resuelve de manera correcta.

si recibes una IP en formato **169.254.x.x** , significa que  no hay DHCP, entonces tu windows se aussta  y se inventa una direccion temporal con ese prefijo meidante APIPA, solo ves a otro que tambien tengan 169.254.x.x


cuando creas una zona en Windows DNS, debes especificar un dominio como smr.local
tanto Windows DNS como BIND9 deben resolver nombres de usuario y direcciones IP

**SAMBA** es una implementacion del protocolo SMB/CIFS para compartir archivos e impresoras

****`/srv/docs/`** es una carpeta compartida de documentos, srv, es el area comunitaria en linux


**`sudo chown :grupo_docs /srv/docs`**
	**chown** cambia propietario/grupo de un archivo o/y directorio
	suele ser dueño:grupo pero si solo quieres cambiar el grupo usa :grupo


**`sudo smbpasswd -a usuario1`**
	**smbpasswd** se usa para gestionar contraseñas de samba
	 **-a** es añadir una entrda para el usuario osea pide una contraseña para usuario1
da de alta a usuario1 en Samba y le asigna una contraeña para el recurso compartido

**En el bloque [docs] de /etc/samba/smb.conf,** **la línea path = /srv/docs indica:** La ruta en el sistema de archivos donde está la carpeta que se compartirá c) El nombre del dominio
path= es "direccion exacta del tesoro en la jungla"



**valid users = @grupo_docs**
valid users controla quien puede acceder a un recurso compartido
@ indica que se ve a referir a un grupo
grupo_docs significa que todos los usuarios que pertenezcan al grupo grupo_docs tienen acceso.

para acceder desde windows a una carpeta compartida docs del servidor Samba se escribe ****`\\<IP_DEL_SERVIDOR>\docs`**** en el explorador de archivos
- `\\` = Señal de que vas a **cruzar a otra jungla** (red/recursos de red).
- `<IP_DEL_SERVIDOR>` = **La dirección del puente** (la IP de tu servidor Linux).
- `\docs` = **El nombre del árbol específico** (el recurso compartido configurado en Samba).
una vez hayas puesto esto tienes que usar las credenciales configurados en Samba.

y el requsisto para que esta conexion sea fructuosa es que haya conectividad IP entre cliente y servidor.


una **GPO** en active directory son las politicas de grupo, directivas que aplican a usuarios y equipos del dominio,  es como manual de leyes en la jungla .
tambien se puede aplicar a las unidades organizativas


**gestion de cortafuegos**
**ufw** uncomplicated firewall , 
**iptables** funciona, pero es facil equivocarse.

**la regla regla sudo `ufw default deny incoming`** bloquea por defecto todas la conexiones entrantes.

**cambiar ACCEPT por DROP en la regla ICMP echo-request** permite bloquear peticiones ping entrantes.

**un snapshot en VirtualBox** es un punto de guardado del estado de una maquina virtual, si la reviertes vuelves la maquina virtual a un estado anterior. lo que permite experimentar sin miedo a romper el sistema.

**crontab** programa la ejecucion automatica de tareas, su equivalente en windows es **programador de tareas**
en Linux puedes crear una entrada en crontab para que un script se ejecute todas las noches 
para crear o editar las tareas programadas del usuario actual usa **contab -e**

puedes tambien hacer copias de seguridad periodicas sin intervencion del usuario  , automatizando con cron la compresion de /home con tar .