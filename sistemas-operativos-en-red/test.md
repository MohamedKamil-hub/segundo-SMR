P: (Tema 2) ¿Qué es VirtualBox?
A) Un editor de texto
B) Un hipervisor para crear y ejecutar máquinas virtuales *
C) Un navegador web

P: (Tema 2) ¿Para qué se recomienda usar una IP estática en servidores?
A) Para que cambie cada vez que reinicias
B) Para que siempre tengan la misma dirección y sean fáciles de localizar *
C) Para conectarse más rápido a Internet

P: (Tema 2) ¿Qué servicio debes habilitar en Ubuntu para permitir conexiones remotas por terminal?
A) FTP
B) SSH *
C) RDP

P: (Tema 2) Desde un PC cliente Windows, ¿con qué programa te conectas por SSH al Ubuntu Server?
A) Bloc de notas
B) PuTTY *
C) Paint

P: (Tema 2) Desde un PC con Linux, ¿cómo te conectarías al servidor Ubuntu por SSH?
A) ping usuario@ip_del_servidor
B) ssh usuario@ip_del_servidor *
C) rdp usuario@ip_del_servidor

P: (Tema 2) En tu Windows Server, ¿qué funcionalidad debes habilitar para conectarte con Escritorio Remoto?
A) Compartir archivos
B) Escritorio Remoto en las propiedades del sistema *
C) Hyper-V

P: (Tema 2) ¿Cómo se llama la herramienta de cliente para conectarte al Escritorio Remoto en Windows?
A) Conexión a Escritorio Remoto (mstsc) *
B) Conexión SSH
C) Conexión Telnet

P: (Tema 2) ¿Qué requisito básico debe cumplirse para que el cliente pueda conectarse por Escritorio Remoto al servidor?
A) Tener un navegador instalado
B) Estar en la misma red o tener conectividad IP con el servidor *
C) Que el servidor tenga WiFi

P: (Tema 3) ¿Qué rol debes instalar en Windows Server para crear un dominio de Active Directory?
A) Servicios de Escritorio Remoto
B) Servicios de dominio de Active Directory *
C) Servicios de archivos e impresión

P: (Tema 3) Después de instalar “Servicios de dominio de Active Directory”, el siguiente paso es:
A) Formatear el disco
B) Promover el servidor a Controlador de Dominio *
C) Instalar un navegador web

P: (Tema 3) ¿Qué es un Controlador de Dominio (Domain Controller)?
A) Un servidor que almacena copias de seguridad
B) Un servidor que gestiona usuarios, grupos y la autenticación del dominio *
C) Un servidor dedicado solo a impresión

P: (Tema 3) ¿Para qué sirve crear usuarios y grupos en Active Directory?
A) Para organizar mejor los cables de red
B) Para administrar permisos y accesos de forma centralizada *
C) Solo para cambiar el fondo de pantalla a los usuarios

P: (Tema 3) En Linux, el comando sudo useradd juan sirve para:
A) Crear una carpeta compartida
B) Crear un nuevo usuario llamado juan *
C) Cambiar la contraseña del usuario juan

P: (Tema 3) ¿Qué hace el comando sudo passwd juan?
A) Elimina al usuario juan
B) Cambia o asigna la contraseña al usuario juan *
C) Mueve al usuario juan a otro grupo

P: (Tema 3) ¿Para qué sirve el comando sudo usermod -aG sudo juan?
A) Añadir al usuario juan al grupo de administradores (sudo) *
B) Borrar todos los grupos del usuario juan
C) Cambiar el nombre del usuario juan

P: (Tema 3) Después de ejecutar sudo usermod -aG sudo juan, el usuario juan podrá:
A) Apagar el sistema únicamente
B) Ejecutar comandos como administrador usando sudo *
C) Solo cambiar su contraseña

P: (Tema 3) ¿Qué diferencia principal hay entre crear usuarios en Active Directory y en Linux localmente (como juan)?
A) En AD el usuario solo existe en el navegador
B) En AD el usuario es del dominio y en Linux el usuario es local al servidor *
C) No hay ninguna diferencia

P: (Tema 4) ¿Dónde se configura una IP estática en Windows Server?
A) En el Bloc de notas
B) En el “Centro de redes y recursos compartidos” *
C) En el Visor de eventos

P: (Tema 4) ¿Qué archivo debes editar en Ubuntu Server para configurar una IP estática con Netplan?
A) /etc/network/interfaces
B) /etc/netplan/*.yaml *
C) /etc/sysconfig/network

P: (Tema 4) ¿Qué comando te permite comprobar la conectividad entre máquinas?
A) test
B) ping *
C) dir

P: (Tema 4) Si un cliente Windows 10 está configurado en modo DHCP, debería obtener su IP desde:
A) El propio ordenador
B) El servidor DHCP de la red *
C) No se puede, tienes que poner la IP a mano

P: (Tema 4) Cuando un cliente recibe IP por DHCP, normalmente obtiene también:
A) Fecha y hora
B) Información de CPU
C) Puerta de enlace y DNS *

P: (Tema 4) ¿Qué rol debes instalar en Windows Server para gestionar resolución de nombres?
A) DHCP
B) DNS *
C) Hyper-V

P: (Tema 4) ¿Qué tipo de registro DNS se usa para asignar un nombre (p. ej. server1.smr.local) a una IP?
A) Registro MX
B) Registro CNAME
C) Registro A *

P: (Tema 4) En Linux, el servidor DNS más usado y que instalas con apt install es:
A) Apache
B) BIND9 *
C) MariaDB

P: (Tema 4) El archivo donde se declaran las zonas DNS en BIND9 es:
A) /etc/bind/named.conf.local *
B) /etc/bind/resolv.conf
C) /etc/dns/zones.txt

P: (Tema 4) ¿Qué comando puedes usar desde Windows o Linux para comprobar que el DNS funciona?
A) dns-check
B) nslookup *
C) resolver-test

P: (Tema 4) Si nslookup servidor.smr.local responde con la IP correcta, significa que:
A) El ping funciona más rápido
B) El DNS está resolviendo correctamente *
C) El equipo tiene activado el proxy

P: (Tema 4) Para que un cliente Windows obtenga IP automáticamente, debes configurarlo como:
A) “Usar la siguiente dirección IP”
B) “Obtener una dirección IP automáticamente (DHCP)” *
C) “Modo puente”

P: (Tema 4) ¿Qué indica si un cliente Windows recibe una IP 169.254.x.x?
A) Todo está funcionando bien
B) No ha encontrado un servidor DHCP *
C) El DNS está caído

P: (Tema 4) Cuando creas una zona en Windows DNS, debes especificar:
A) Un dominio (p. ej., smr.local) *
B) El nombre del procesador del servidor
C) La versión de Windows

P: (Tema 4) ¿Qué deben resolver correctamente tanto Windows DNS como BIND9 en la práctica?
A) Cuentas de usuario
B) Nombres de dominio y sus direcciones IP *
C) Tamaño de disco

P: (Tema 5) ¿Qué es Samba en Linux?
A) Un editor de vídeo
B) Una implementación libre del protocolo SMB/CIFS para compartir archivos e impresoras *
C) Un antivirus

P: (Tema 5) ¿Para qué sirve crear la carpeta /srv/docs?
A) Para instalar programas
B) Para usarla como carpeta compartida de documentos *
C) Para guardar copias de seguridad del sistema

P: (Tema 5) El comando sudo apt install samba -y sirve para:
A) Instalar el navegador web
B) Instalar el servidor Samba *
C) Instalar el servidor DHCP

P: (Tema 5) ¿Por qué se ejecuta sudo chown :grupo_docs /srv/docs?
A) Para cambiar el dueño de la carpeta a root
B) Para asignar el grupo grupo_docs como grupo propietario de /srv/docs *
C) Para borrar la carpeta /srv/docs

P: (Tema 5) El usuario usuario1 se crea con:
A) sudo useradd -m usuario1 *
B) sudo newuser usuario1
C) sudo mkuser usuario1

P: (Tema 5) ¿Qué función tiene sudo smbpasswd -a usuario1?
A) Crear la carpeta compartida en Samba
B) Dar de alta a usuario1 en Samba y asignarle una contraseña para el recurso compartido *
C) Reiniciar el servicio smbd

P: (Tema 5) En el bloque [docs] de /etc/samba/smb.conf, la línea path = /srv/docs indica:
A) El nombre del usuario que puede acceder
B) La ruta en el sistema de archivos donde está la carpeta que se compartirá *
C) El nombre del dominio

P: (Tema 5) En la configuración de Samba, valid users = @grupo_docs significa que:
A) Solo puede entrar el usuario root
B) Pueden acceder todos los usuarios del sistema
C) Solo pueden acceder los usuarios que pertenezcan al grupo grupo_docs *

P: (Tema 5) ¿Cómo se accede desde Windows a la carpeta compartida docs del servidor Samba?
A) Escribiendo C:\docs en el explorador
B) Escribiendo <IP_DEL_SERVIDOR>\docs en el explorador de archivos *
C) Escribiendo http://<IP_DEL_SERVIDOR>/docs en el navegador

P: (Tema 5) ¿Por qué se ejecuta sudo systemctl restart smbd tras cambiar smb.conf?
A) Para apagar el servidor
B) Para que Samba lea la nueva configuración y la aplique *
C) Para actualizar el sistema operativo

P: (Tema 5) ¿Qué requisito básico debe cumplirse para que un equipo Windows pueda conectar con <IP_DEL_SERVIDOR>\docs?
A) Que el servidor tenga instalado un navegador
B) Que exista conectividad de red (IP) entre el cliente y el servidor *
C) Que el cliente tenga dos tarjetas de red

P: (Tema 5) Si desde Windows, al intentar entrar en <IP_DEL_SERVIDOR>\docs, pide usuario y contraseña, ¿qué credenciales debes usar?
A) Cualquier usuario de Windows
B) El usuario y contraseña configurados en Samba (por ejemplo, usuario1 y su clave de smbpasswd) *
C) El usuario “admin” sin contraseña

P: (Tema 6) ¿Qué es una GPO en un entorno de Active Directory?
A) Un programa de copia de seguridad
B) Un conjunto de directivas que se aplican a usuarios y equipos del dominio *
C) Un tipo de cuenta de usuario

P: (Tema 6) ¿Para qué sirve establecer una longitud mínima de contraseña en una GPO?
A) Para que las contraseñas se recuerden mejor
B) Para aumentar la seguridad de las cuentas del dominio *
C) Para acelerar el inicio de sesión

P: (Tema 6) ¿Qué herramienta de Linux se usa para gestionar el cortafuegos de forma sencilla?
A) iptables directamente
B) ufw *
C) nmap

P: (Tema 6) ¿Qué hace la regla sudo ufw default deny incoming?
A) Bloquea todo el tráfico saliente
B) Bloquea por defecto todas las conexiones entrantes *
C) Permite todas las conexiones entrantes

P: (Tema 6) ¿Qué cambio permite bloquear las peticiones de ping entrantes?
A) Cambiar ACCEPT por DROP en la regla ICMP echo-request *
B) Cambiar TCP por UDP
C) Eliminar el servicio SSH

P: (Tema 6) ¿Qué herramienta integrada en Windows Server permite hacer un backup del estado del sistema?
A) Copias de seguridad de Windows Server *
B) Administrador de discos
C) Visor de eventos

P: (Tema 6) ¿Qué es un snapshot en VirtualBox?
A) Una copia de seguridad externa
B) Un punto de guardado del estado de una máquina virtual *
C) Un archivo de configuración de red

P: (Tema 6) ¿Para qué sirve revertir a un snapshot?
A) Actualizar el sistema operativo
B) Volver la máquina virtual a un estado anterior *
C) Aumentar el espacio en disco

P: (Tema 6) ¿Qué ventaja tienen los snapshots en entornos de laboratorio?
A) Sustituyen al antivirus
B) Permiten experimentar sin miedo a romper el sistema *
C) Aceleran la CPU de la VM

P: (Tema 7) ¿Para qué sirve crontab en Linux?
A) Para instalar programas
B) Para programar la ejecución automática de tareas *
C) Para gestionar usuarios

P: (Tema 7) ¿Qué herramienta se utiliza en Windows para programar tareas automáticamente?
A) Administrador de dispositivos
B) Programador de tareas *
C) Visor de eventos

P: (Tema 7) Si quieres que un script se ejecute todas las noches en Linux, ¿qué usarías?
A) Un servicio systemd manual
B) Una entrada en crontab *
C) Un archivo de texto en /home

P: (Tema 7) ¿Qué comando permite editar las tareas programadas del usuario actual en Linux?
A) crones -e
B) crontab -e *
C) taskschd2

P: (Tema 7) En una práctica donde usas tar para comprimir /home, ¿para qué sirve automatizarlo con cron?
A) Para liberar memoria RAM
B) Para hacer copias de seguridad periódicas sin intervención del usuario *
C) Para acelerar el arranque del sistema

P: ¿Qué se entiende por scripting en administración de sistemas?  
A) Usar interfaces gráficas para configurar el sistema  
B) Automatizar tareas mediante scripts *  
C) Instalar sistemas operativos

P: ¿Para qué se utiliza PowerShell en entornos Windows?  
A) Para navegar por Internet  
B) Para automatizar y administrar el sistema mediante comandos y scripts *  
C) Para editar documentos

P: ¿Qué lenguaje de scripting se usa habitualmente en sistemas Linux?  
A) PowerShell  
B) Bash *  
C) HTML

P: ¿Qué ocurre si ejecutas un script Bash de creación de usuarios sin permisos suficientes?  
A) Se crean los usuarios igualmente  
B) Falla la creación de usuarios por falta de privilegios *  
C) Se reinicia el sistema

P: ¿Qué herramienta de Windows permite ejecutar scripts automáticamente a una hora concreta?  
A) Administrador de dispositivos  
B) Programador de Tareas *  
C) Editor del Registro

P: Si programas una tarea en Windows para las 22:00 todos los días, esta se ejecutará:  
A) Solo una vez  
B) Cada día a las 10 PM *  
C) Cada vez que se reinicie el equipo

P: ¿Qué comando se utiliza en Linux para editar las tareas programadas del usuario?  
A) cron -e  
B) crontab -e *  
C) schedule -e

P: ¿Qué ventaja tiene calcular hashes de procesos o de archivos?  
A) Reduce el uso de memoria  
B) Permite detectar cambios o manipulaciones *  
C) Mejora la velocidad de red

P: En Active Directory, ¿qué ventaja tiene crear usuarios leyendo desde un fichero?  
A) Es más lento que hacerlo a mano  
B) Permite crear muchos usuarios de forma automatizada *  
C) Solo sirve para un usuario

P: ¿Qué es una OU (Unidad Organizativa) en Active Directory?  
A) Un disco duro virtual  
B) Un contenedor lógico para organizar usuarios y equipos *  
C) Un tipo de grupo de seguridad

P: ¿Por qué es importante definir una estructura de OU en Active Directory?  
A) Para cambiar el idioma del sistema  
B) Para organizar objetos y aplicar GPO de forma controlada *  
C) Para aumentar el espacio en disco

P: ¿Qué es Docker Desktop?  
A) Un editor de texto para contenedores  
B) Una aplicación para ejecutar y gestionar contenedores en tu máquina *  
C) Un antivirus para Windows

P: ¿Qué hace el comando docker run?  
A) Detiene un contenedor  
B) Crea y ejecuta un contenedor a partir de una imagen *  
C) Cambia la IP del equipo

P: En -p 8080:80, el puerto 8080 corresponde a:  
A) El puerto del contenedor  
B) El puerto del host (tu máquina) *  
C) Un puerto reservado para DNS

P: En -p 8080:80, el puerto 80 corresponde a:  
A) El puerto del host  
B) El puerto del contenedor donde escucha Apache *  
C) El puerto de SSH

P: Si el contenedor está funcionando, ¿qué deberías ver al abrir [http://localhost:8080](http://localhost:8080)?  
A) Un mensaje de error de DNS  
B) La página de bienvenida del servidor Apache *  
C) La consola de Docker

P: ¿Por qué se usa localhost en la URL [http://localhost:8080](http://localhost:8080)?  
A) Porque apunta al servidor remoto  
B) Porque apunta a tu propia máquina (host) *  
C) Porque es un dominio público de Docker

P: Si al entrar en [http://localhost:8080](http://localhost:8080) no carga nada, una comprobación básica sería:  
A) Ejecutar ping localhost para ver si Internet funciona  
B) Ver si el contenedor está en ejecución con docker ps *  
C) Cambiar el usuario del sistema

P: ¿Qué ocurre si el puerto 8080 ya está siendo usado por otro programa en tu host?  
A) Docker ignora el conflicto y funciona igual  
B) El contenedor no podrá publicar el puerto y el comando puede fallar *  
C) Se cambia automáticamente al puerto 8081

P: ¿Qué significa que el contenedor “escuche” en el puerto 80?  
A) Que solo acepta conexiones SSH  
B) Que el servicio web está disponible dentro del contenedor en ese puerto *  
C) Que el contenedor tiene sonido activado










