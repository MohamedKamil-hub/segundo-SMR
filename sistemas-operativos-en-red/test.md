P: ¿Para qué se recomienda usar una IP estática en servidores?
A) Para que cambie cada vez que reinicias
B) Para que siempre tengan la misma dirección y sean fáciles de localizar *
C) Para conectarse más rápido a Internet
D) Para que el servidor se apague menos

P: ¿Qué servicio debes habilitar en Ubuntu para permitir conexiones remotas por terminal?
A) FTP
B) SSH *
C) RDP
D) HTTP

P: Desde un PC cliente Windows, ¿con qué programa te conectas por SSH al Ubuntu Server?
A) Bloc de notas
B) PuTTY *
C) Paint
D) Calculadora

P: En tu Windows Server, ¿qué funcionalidad debes habilitar para conectarte con Escritorio Remoto?
A) Compartir archivos
B) Escritorio Remoto en las propiedades del sistema *
C) Hyper-V
D) IIS

P: ¿Cómo se llama la herramienta de cliente para conectarte al Escritorio Remoto en Windows?
A) Conexión a Escritorio Remoto (mstsc) *
B) Conexión SSH
C) Conexión Telnet
D) Administrador del servidor

P: ¿Qué requisito básico debe cumplirse para que el cliente pueda conectarse por Escritorio Remoto al servidor?
A) Tener un navegador instalado
B) Estar en la misma red o tener conectividad IP con el servidor *
C) Que el servidor tenga WiFi
D) Tener una impresora instalada

P: ¿Qué rol debes instalar en Windows Server para crear un dominio de Active Directory?
A) Servicios de Escritorio Remoto
B) Servicios de dominio de Active Directory *
C) Servicios de archivos e impresión
D) Servicios Web (IIS)

P: Después de instalar “Servicios de dominio de Active Directory”, el siguiente paso es:
A) Formatear el disco
B) Promover el servidor a Controlador de Dominio *
C) Instalar un navegador web
D) Reiniciar el router

P: ¿Qué es un Controlador de Dominio (Domain Controller)?
A) Un servidor que almacena copias de seguridad
B) Un servidor que gestiona usuarios, grupos y la autenticación del dominio *
C) Un servidor dedicado solo a impresión
D) Un equipo cliente del dominio

P: ¿Para qué sirve crear usuarios y grupos en Active Directory?
A) Para organizar mejor los cables de red
B) Para administrar permisos y accesos de forma centralizada *
C) Solo para cambiar el fondo de pantalla a los usuarios
D) Para mejorar el rendimiento del servidor

P: En Linux, el comando sudo useradd juan sirve para:
A) Crear una carpeta compartida
B) Crear un nuevo usuario llamado juan *
C) Cambiar la contraseña del usuario juan
D) Crear un grupo llamado juan

P: ¿Qué hace el comando sudo passwd juan?
A) Elimina al usuario juan
B) Cambia o asigna la contraseña al usuario juan *
C) Mueve al usuario juan a otro grupo
D) Muestra los grupos del usuario juan

P: ¿Para qué sirve el comando sudo usermod -aG sudo juan?
A) Añadir al usuario juan al grupo de administradores (sudo) *
B) Borrar todos los grupos del usuario juan
C) Cambiar el nombre del usuario juan
D) Bloquear la cuenta del usuario juan

P: Después de ejecutar sudo usermod -aG sudo juan, el usuario juan podrá:
A) Apagar el sistema únicamente
B) Ejecutar comandos como administrador usando sudo *
C) Solo cambiar su contraseña
D) Instalar un antivirus en Linux

P: ¿Qué diferencia principal hay entre crear usuarios en Active Directory y en Linux localmente (como juan)?
A) En AD el usuario solo existe en el navegador
B) En AD el usuario es del dominio y en Linux el usuario es local al servidor *
C) No hay ninguna diferencia
D) En Linux el usuario se guarda en un USB externo

P: ¿Dónde se configura una IP estática en Windows Server?
A) En el Bloc de notas
B) En el “Centro de redes y recursos compartidos” *
C) En el Visor de eventos
D) En el Administrador de tareas

P: ¿Qué archivo debes editar en Ubuntu Server para configurar una IP estática con Netplan?
A) /etc/network/interfaces
B) /etc/netplan/*.yaml *
C) /etc/sysconfig/network
D) /etc/hosts

P: Si un cliente Windows 10 está configurado en modo DHCP, debería obtener su IP desde:
A) El propio ordenador
B) El servidor DHCP de la red *
C) No se puede, tienes que poner la IP a mano
D) El servidor DNS automáticamente

P: Cuando un cliente recibe IP por DHCP, normalmente obtiene también:
A) Fecha y hora
B) Información de CPU
C) Puerta de enlace y DNS *
D) El nombre del usuario administrador

P: ¿Qué rol debes instalar en Windows Server para gestionar resolución de nombres?
A) DHCP
B) DNS *
C) Hyper-V
D) Active Directory Users and Computers

P: ¿Qué tipo de registro DNS se usa para asignar un nombre (p. ej. server1.smr.local) a una IP?
A) Registro MX
B) Registro CNAME
C) Registro A *
D) Registro TXT

P: En Linux, el servidor DNS más usado y que instalas con apt install es:
A) Apache
B) BIND9 *
C) MariaDB
D) OpenSSH

P: El archivo donde se declaran las zonas DNS en BIND9 es:
A) /etc/bind/named.conf.local *
B) /etc/bind/resolv.conf
C) /etc/dns/zones.txt
D) /etc/bind/hosts

P: ¿Qué comando puedes usar desde Windows o Linux para comprobar que el DNS funciona?
A) dns-check
B) nslookup *
C) resolver-test
D) ipconfig

P: Si nslookup servidor.smr.local responde con la IP correcta, significa que:
A) El ping funciona más rápido
B) El DNS está resolviendo correctamente *
C) El equipo tiene activado el proxy
D) El firewall está desinstalado

P: Para que un cliente Windows obtenga IP automáticamente, debes configurarlo como:
A) “Usar la siguiente dirección IP”
B) “Obtener una dirección IP automáticamente (DHCP)” *
C) “Modo puente”
D) “Solo IPv6”

P: ¿Qué indica si un cliente Windows recibe una IP 169.254.x.x?
A) Todo está funcionando bien
B) No ha encontrado un servidor DHCP *
C) El DNS está caído
D) El servidor tiene demasiada RAM

P: Cuando creas una zona en Windows DNS, debes especificar:
A) Un dominio (p. ej., smr.local) *
B) El nombre del procesador del servidor
C) La versión de Windows
D) La dirección MAC del router

P: ¿Qué deben resolver correctamente tanto Windows DNS como BIND9 en la práctica?
A) Cuentas de usuario
B) Nombres de dominio y sus direcciones IP *
C) Tamaño de disco
D) Versiones de Office instaladas

P: ¿Qué es Samba en Linux?
A) Un editor de vídeo
B) Una implementación libre del protocolo SMB/CIFS para compartir archivos e impresoras *
C) Un antivirus
D) Un gestor de particiones

P: ¿Para qué sirve crear la carpeta /srv/docs?
A) Para instalar programas
B) Para usarla como carpeta compartida de documentos *
C) Para guardar copias de seguridad del sistema
D) Para guardar drivers de la tarjeta gráfica

P: El comando sudo apt install samba -y sirve para:
A) Instalar el navegador web
B) Instalar el servidor Samba *
C) Instalar el servidor DHCP
D) Desinstalar Samba

P: ¿Por qué se ejecuta sudo chown :grupo_docs /srv/docs?
A) Para cambiar el dueño de la carpeta a root
B) Para asignar el grupo grupo_docs como grupo propietario de /srv/docs *
C) Para borrar la carpeta /srv/docs
D) Para cifrar la carpeta /srv/docs

P: El usuario usuario1 se crea con:
A) sudo useradd -m usuario1 *
B) sudo newuser usuario1
C) sudo mkuser usuario1
D) sudo adduser1 usuario1

P: ¿Qué función tiene sudo smbpasswd -a usuario1?
A) Crear la carpeta compartida en Samba
B) Dar de alta a usuario1 en Samba y asignarle una contraseña para el recurso compartido *
C) Reiniciar el servicio smbd
D) Cambiar el nombre del servidor Samba

P: En el bloque [docs] de /etc/samba/smb.conf, la línea path = /srv/docs indica:
A) El nombre del usuario que puede acceder
B) La ruta en el sistema de archivos donde está la carpeta que se compartirá *
C) El nombre del dominio
D) El tipo de sistema de archivos del servidor

P: En la configuración de Samba, valid users = @grupo_docs significa que:
A) Solo puede entrar el usuario root
B) Pueden acceder todos los usuarios del sistema
C) Solo pueden acceder los usuarios que pertenezcan al grupo grupo_docs *
D) Solo accede el usuario invitado (guest)

P: ¿Cómo se accede desde Windows a la carpeta compartida docs del servidor Samba?
A) Escribiendo C:\docs en el explorador
B) Escribiendo \\<IP_DEL_SERVIDOR>\docs en el explorador de archivos *
C) Escribiendo http://<IP_DEL_SERVIDOR>/docs en el navegador
D) Escribiendo ftp://<IP_DEL_SERVIDOR>/docs en el navegador

P: ¿Por qué se ejecuta sudo systemctl restart smbd tras cambiar smb.conf?
A) Para apagar el servidor
B) Para que Samba lea la nueva configuración y la aplique *
C) Para actualizar el sistema operativo
D) Para limpiar la caché de navegador

P: ¿Qué requisito básico debe cumplirse para que un equipo Windows pueda conectar con \\<IP_DEL_SERVIDOR>\docs?
A) Que el servidor tenga instalado un navegador
B) Que exista conectividad de red (IP) entre el cliente y el servidor *
C) Que el cliente tenga dos tarjetas de red
D) Que el cliente use Firefox

P: Si desde Windows, al intentar entrar en \\<IP_DEL_SERVIDOR>\docs, pide usuario y contraseña, ¿qué credenciales debes usar?
A) Cualquier usuario de Windows
B) El usuario y contraseña configurados en Samba (por ejemplo, usuario1 y su clave de smbpasswd) *
C) El usuario “admin” sin contraseña
D) La cuenta Microsoft del alumno

P: ¿Qué es una GPO en un entorno de Active Directory?
A) Un programa de copia de seguridad
B) Un conjunto de directivas que se aplican a usuarios y equipos del dominio *
C) Un tipo de cuenta de usuario
D) Un antivirus corporativo

P: ¿Qué herramienta de Linux se usa para gestionar el cortafuegos de forma sencilla?
A) iptables directamente
B) ufw *
C) nmap
D) wireshark

P: ¿Qué hace la regla sudo ufw default deny incoming?
A) Bloquea todo el tráfico saliente
B) Bloquea por defecto todas las conexiones entrantes *
C) Permite todas las conexiones entrantes
D) Abre automáticamente el puerto 3389

P: ¿Qué cambio permite bloquear las peticiones de ping entrantes?
A) Cambiar ACCEPT por DROP en la regla ICMP echo-request *
B) Cambiar TCP por UDP
C) Eliminar el servicio SSH
D) Cambiar el puerto del servidor DNS

P: ¿Qué herramienta integrada en Windows Server permite hacer un backup del estado del sistema?
A) Copias de seguridad de Windows Server *
B) Administrador de discos
C) Visor de eventos
D) Administrador de tareas

P: ¿Qué es un snapshot en VirtualBox?
A) Una copia de seguridad externa
B) Un punto de guardado del estado de una máquina virtual *
C) Un archivo de configuración de red
D) Un registro DNS

P: ¿Para qué sirve revertir a un snapshot?
A) Actualizar el sistema operativo
B) Volver la máquina virtual a un estado anterior *
C) Aumentar el espacio en disco
D) Cambiar la contraseña del administrador

P: ¿Qué ventaja tienen los snapshots en entornos de laboratorio?
A) Sustituyen al antivirus
B) Permiten experimentar sin miedo a romper el sistema *
C) Aceleran la CPU de la VM
D) Desactivan automáticamente el firewall

P: ¿Para qué sirve crontab en Linux?
A) Para instalar programas
B) Para programar la ejecución automática de tareas *
C) Para gestionar usuarios
D) Para reiniciar el servidor cada minuto

P: En una práctica donde usas tar para comprimir /home, ¿para qué sirve automatizarlo con cron?
A) Para liberar memoria RAM
B) Para hacer copias de seguridad periódicas sin intervención del usuario *
C) Para acelerar el arranque del sistema
D) Para mejorar la velocidad del WiFi

P: ¿Qué ocurre si ejecutas un script Bash de creación de usuarios sin permisos suficientes?
A) Se crean los usuarios igualmente
B) Falla la creación de usuarios por falta de privilegios *
C) Se reinicia el sistema
D) Se instala automáticamente sudo

P: ¿Qué herramienta de Windows permite ejecutar scripts automáticamente a una hora concreta?
A) Administrador de dispositivos
B) Programador de Tareas *
C) Editor del Registro
D) Monitor de rendimiento

P: ¿Qué comando se utiliza en Linux para editar las tareas programadas del usuario?
A) cron -e
B) crontab -e *
C) schedule -e
D) cronjob -edit

P: ¿Qué ventaja tiene calcular hashes de procesos o de archivos?
A) Reduce el uso de memoria
B) Permite detectar cambios o manipulaciones *
C) Mejora la velocidad de red
D) Comprime los archivos automáticamente

P: En Active Directory, ¿qué ventaja tiene crear usuarios leyendo desde un fichero?
A) Es más lento que hacerlo a mano
B) Permite crear muchos usuarios de forma automatizada *
C) Solo sirve para un usuario
D) Reduce el tamaño de la base de datos de AD

P: ¿Qué es una OU (Unidad Organizativa) en Active Directory?
A) Un disco duro virtual
B) Un contenedor lógico para organizar usuarios y equipos *
C) Un tipo de grupo de seguridad
D) Una copia de seguridad del dominio

P: ¿Por qué es importante definir una estructura de OU en Active Directory?
A) Para cambiar el idioma del sistema
B) Para organizar objetos y aplicar GPO de forma controlada *
C) Para aumentar el espacio en disco
D) Para acelerar la CPU del servidor

P: ¿Qué es Docker Desktop?
A) Un editor de texto para contenedores
B) Una aplicación para ejecutar y gestionar contenedores en tu máquina *
C) Un antivirus para Windows
D) Un sistema operativo para contenedores

P: ¿Qué hace el comando docker run?
A) Detiene un contenedor
B) Crea y ejecuta un contenedor a partir de una imagen *
C) Cambia la IP del equipo
D) Elimina todas las imágenes

P: En -p 8080:80, el puerto 8080 corresponde a:
A) El puerto del contenedor
B) El puerto del host (tu máquina) *
C) Un puerto reservado para DNS
D) El puerto del router

P: En -p 8080:80, el puerto 80 corresponde a:
A) El puerto del host
B) El puerto del contenedor donde escucha Apache *
C) El puerto de SSH
D) El puerto del firewall

P: Si el contenedor está funcionando, ¿qué deberías ver al abrir http://localhost:8080?
A) Un mensaje de error de DNS
B) La página de bienvenida del servidor Apache *
C) La consola de Docker
D) La configuración de red del host

P: ¿Por qué se usa localhost en la URL http://localhost:8080?
A) Porque apunta al servidor remoto
B) Porque apunta a tu propia máquina (host) *
C) Porque es un dominio público de Docker
D) Porque fuerza el uso de HTTPS

P: Si al entrar en http://localhost:8080 no carga nada, una comprobación básica sería:
A) Ejecutar ping localhost para ver si Internet funciona
B) Ver si el contenedor está en ejecución con docker ps *
C) Cambiar el usuario del sistema
D) Reiniciar el equipo

P: ¿Qué ocurre si el puerto 8080 ya está siendo usado por otro programa en tu host?
A) Docker ignora el conflicto y funciona igual
B) El contenedor no podrá publicar el puerto y el comando puede fallar *
C) Se cambia automáticamente al puerto 8081
D) Se apaga el contenedor anterior automáticamente

P: ¿Qué significa que el contenedor “escuche” en el puerto 80?
A) Que solo acepta conexiones SSH
B) Que el servicio web está disponible dentro del contenedor en ese puerto *
C) Que el contenedor tiene sonido activado
D) Que el contenedor solo funciona sin Internet

P: ¿Qué se hace en la fase de 'Post-instalación'?
A) Elegir el nombre del dominio de la empresa.
B) Drivers, actualizaciones y acceso remoto. *
C) Formatear el disco duro por segunda vez.
D) Comprar el hardware físico del servidor.

P: ¿Qué recurso gestiona un SON además de los archivos?
A) Impresoras, aplicaciones y comunicaciones. *
B) Únicamente el acceso al navegador web.
C) La temperatura física de la sala de servidores.
D) El cableado estructurado de las oficinas.

P: ¿Cuál es un beneficio de usar VMware sobre VirtualBox?
A) Es totalmente gratuito para todas las empresas.
B) Ofrece un mayor rendimiento, aunque sea de pago. *
C) No requiere activar la virtualización en la BIOS.
D) Solo puede ejecutar sistemas operativos Windows.

P: ¿Qué permiso NTFS permite cambiar los permisos de otros?
A) Modificar.
B) Control total. *
C) Escritura.
D) Lectura y ejecución.

P: ¿Qué rol cumple un equipo que solicita una carpeta compartida?
A) Rol de servidor de archivos.
B) Rol de cliente de red. *
C) Rol de administrador de dominio.
D) Rol de puerta de enlace predeterminada.

P: ¿Qué diferencia fundamental existe entre un SO cliente y un SO servidor?
A) El cliente consume recursos y el servidor los provee. *
B) El servidor solo puede ser utilizado por una persona.
C) El cliente gestiona la seguridad de toda la empresa.
D) No existe diferencia técnica, solo de licencia comercial.

P: ¿Cuál es el objetivo de las cuotas de disco?
A) Aumentar la velocidad del disco duro.
B) Limitar el espacio que usa cada usuario. *
C) Impedir que se borren archivos antiguos.
D) Dividir el disco en muchas particiones.

P: ¿Qué principio de seguridad se debe aplicar al dar permisos?
A) Principio de máximo acceso.
B) Principio de mínimo privilegio. *
C) Principio de rotación de usuarios.
D) Principio de libertad de carpetas.

P: ¿Cuál es la función principal de un Sistema Operativo en Red (SON)?
A) Gestionar el hardware de un equipo monousuario.
B) Coordinar usuarios, equipos y servicios en una red. *
C) Aumentar la velocidad de descarga de Internet.
D) Sustituir la necesidad de un router físico.

P: ¿Qué ventaja tiene asignar permisos a grupos en lugar de a personas?
A) Los permisos funcionan mucho más rápido.
B) Facilita la administración a gran escala. *
C) Evita tener que crear cuentas de usuario.
D) Ocupa menos espacio en el registro de AD.

P: ¿Cómo se llama el modelo de permisos avanzado de Windows?
A) FAT32.
B) NTFS. *
C) EXT4.
D) BTRFS.

P: ¿Qué servicio centraliza la autenticación en Windows?
A) Google Auth.
B) Active Directory (AD). *
C) Sudo Windows.
D) NFS Server.

P: ¿Qué sucede si un usuario agota su cuota de disco?
A) El servidor se reinicia automáticamente.
B) No podrá guardar más archivos nuevos. *
C) Se borran sus archivos más antiguos.
D) Su cuenta de usuario queda bloqueada.

P: ¿Qué significan las siglas 'rwx' en los permisos de Linux?
A) Reset, Write, X-ray.
B) Read, Write, Execute. *
C) Remote, Web, XML.
D) Run, Wait, Exit.

P: ¿A quién se aplican los permisos en el modelo de Linux?
A) Dueño, Grupo y Otros. *
B) Solo al usuario Administrador.
C) Invitados, Usuarios y Root.
D) Local, Red y Remoto.

P: ¿Qué significa que un servidor debe asegurar la 'disponibilidad'?
A) Que debe estar accesible siempre que se necesite. *
B) Que debe tener mucha capacidad de disco duro.
C) Que debe poder conectarse a redes Wi-Fi públicas.
D) Que el código fuente debe ser abierto y gratuito.

P: ¿Qué indica el bit 'x' en un archivo en Linux?
A) Que el archivo está oculto.
B) Que el archivo es ejecutable. *
C) Que el archivo ha sido borrado.
D) Que el archivo es solo de lectura.

P: ¿Qué comando cambia los permisos en Linux?
A) chown
B) chmod *
C) ls -l
D) usermod

P: ¿Cuál es el puerto estándar para SSH?
A) 21
B) 22 *
C) 23
D) 25

P: ¿Qué identifica un equipo en una red de forma única?
A) La máscara de subred.
B) La dirección IP. *
C) La puerta de enlace.
D) El servidor DNS.

P: ¿Para qué sirven las instantáneas (snapshots) en virtualización?
A) Para aumentar la potencia del procesador virtual.
B) Para guardar un estado y volver a él tras un error. *
C) Para comprimir el disco duro de la máquina virtual.
D) Para clonar la dirección MAC de la tarjeta de red.

P: ¿Cuántos bits tiene una dirección IPv4?
A) 16 bits.
B) 32 bits. *
C) 64 bits.
D) 128 bits.

P: ¿Qué facilita implementar una copia de seguridad eficiente?
A) Tener un entorno de pruebas previo. *
B) Instalar muchos programas en el cliente.
C) No usar nunca la virtualización.
D) Asignar solo 512 MB de RAM al servidor.

P: ¿Qué se recomienda hacer con los puertos 22 y 3389?
A) Abrirlos para todo el tráfico de Internet.
B) Cambiarlos por puertos alternativos. *
C) Desactivarlos permanentemente del servidor.
D) No usarlos nunca dentro de la red local.

P: ¿Qué sucede si dos equipos tienen la misma IP?
A) La velocidad de Internet se duplica.
B) Hay conflicto y pérdida de conectividad. *
C) El router se apaga por seguridad.
D) Los equipos comparten el mismo disco.

P: ¿En qué se diferencia el uso de archivos en un SON frente a un SO normal?
A) En el SON los archivos no se pueden borrar.
B) En el SON se gestionan recursos compartidos. *
C) En el SON los archivos ocupan menos espacio.
D) No hay diferencia en la gestión de archivos.

P: ¿Qué estructura de AD refleja los departamentos de una empresa?
A) Grupos de distribución.
B) Unidades Organizativas (OUs). *
C) Permisos de escritura.
D) Cuotas de disco rígido.

P: ¿Qué garantiza la instalación de drivers tras el SO?
A) La compatibilidad y rendimiento del hardware. *
B) La creación automática de usuarios de red.
C) La conexión inmediata con el servidor DNS.
D) Que el servidor sea inmune a virus externos.

P: ¿Para qué sirve la máscara de subred?
A) Para ocultar la IP a los hackers.
B) Para diferenciar parte de red y parte de host. *
C) Para aumentar el número de puertos SSH.
D) Para cifrar el tráfico de correo electrónico.

P: ¿Cuál es el puerto por defecto para el acceso remoto mediante RDP?
A) 22
B) 80
C) 3389 *
D) 443

P: ¿Qué comando actualiza la lista de paquetes en Ubuntu Server?
A) sudo apt upgrade
B) sudo apt update *
C) sudo yum update
D) sudo apt install

P: ¿Qué herramienta se debe usar para editar el archivo sudoers?
A) nano
B) visudo *
C) gedit
D) notepad

P: ¿Qué comando de Linux instala realmente las actualizaciones?
A) sudo apt update
B) sudo apt upgrade *
C) sudo apt search
D) sudo apt remove

P: ¿Qué indica un permiso 777 en Linux?
A) Seguridad máxima en todo el sistema.
B) Acceso total para todos (poco seguro). *
C) Acceso solo para el usuario root.
D) Que el archivo está cifrado por el SO.

P: ¿Qué permite la autenticación por clave pública en SSH?
A) Acceder sin necesidad de tener un usuario.
B) Mayor seguridad que el uso de contraseñas. *
C) Que cualquier persona pueda entrar al servidor.
D) Reducir el consumo de CPU durante la conexión.

P: ¿Qué comando se usa en CentOS/RHEL para actualizar?
A) sudo apt update
B) sudo yum update * 
C) sudo install upgrade
D) sudo get update

P: ¿Qué riesgo tiene dejar el puerto 3389 por defecto?
A) Que la velocidad de red baje un 50%.
B) Sufrir ataques automatizados constantes. *
C) Que el monitor del servidor se apague solo.
D) No existe ningún riesgo si la clave es larga.

P: ¿Cuál es la función del Firewall local en un servidor?
A) Acelerar la conexión a la base de datos.
B) Limitar el acceso remoto a IPs autorizadas. *
C) Almacenar las contraseñas de los usuarios.
D) Instalar actualizaciones de seguridad críticas.

P: ¿Qué herramienta de Windows Server gestiona actualizaciones?
A) WSUS. *
B) Active Directory.
C) BitLocker.
D) PowerShell Core.

P: ¿Qué permite registrar 'sudo'?
A) Todas las acciones realizadas por el usuario. *
B) La cantidad de RAM que consume el script.
C) Las páginas web que visita el administrador.
D) El tiempo que el equipo lleva encendido.

P: ¿Qué política obliga a usar claves complejas?
A) Política de contraseñas. *
B) Política de cuotas.
C) Política de firewall.
D) Política de DNS.

P: ¿Qué protocolo es ideal para redes solo de Linux/Unix?
A) Samba.
B) NFS. *
C) NTFS.
D) CUPS.

P: ¿Por qué es útil fstab para recursos de red?
A) Porque los borra después de usarlos.
B) Porque los monta de forma automática. *
C) Porque les pone una contraseña nueva.
D) Porque los oculta a los demás usuarios.

P: ¿Qué es CIFS?
A) Un virus que cifra los archivos.
B) Una versión pública del protocolo SMB. *
C) Un tipo de cable de red blindado.
D) Un servidor de nombres de Linux.

P: ¿Qué establece la regla 3-2-1 de backup?
A) 3 nubes, 2 discos, 1 clave.
B) 3 copias, 2 soportes, 1 fuera de sede. *
C) 3 servidores, 2 routers, 1 firewall.
D) 3 días, 2 semanas, 1 mes de espera.

P: ¿Qué protocolo nativo usa Windows para compartir archivos?
A) NFS.
B) SMB/CIFS. *
C) HTTP.
D) SSH.

P: ¿Qué software permite a Linux hablar SMB con Windows?
A) Apache.
B) Samba. *
C) Postfix.
D) Bind9.

P: ¿Qué registro DNS apunta a un servidor de correo?
A) Registro A.
B) Registro MX. *
C) Registro PTR.
D) Registro CNAME.

P: ¿Qué permite gestionar GPO en Windows Server?
A) Miles de configuraciones centralizadas. *
B) La temperatura física del servidor.
C) El precio de las licencias de Office.
D) La velocidad de giro de los ventiladores.

P: ¿Qué sucede si compartes una impresora desde un PC?
A) Funciona mejor que un servidor.
B) Si el PC se apaga, nadie puede imprimir. *
C) La impresora imprime mucho más rápido.
D) No se pueden configurar permisos.

P: ¿Es el RAID un sistema de backup?
A) Sí, es el más seguro de todos.
B) No, protege contra fallos físicos, no borrados. *
C) Solo si se usan discos de tipo SSD.
D) Sí, pero solo para archivos muy pequeños.

P: ¿Qué riesgo tiene acumular snapshots durante semanas?
A) Que el servidor se vuelva más rápido.
B) Que se degrade el rendimiento de la VM. *
C) Que la dirección IP cambie sola.
D) No hay ningún riesgo técnico.

P: ¿Qué herramienta de seguridad gestiona contraseñas en Windows?
A) BitLocker.
B) GPO. *
C) iptables.
D) Task Scheduler.

P: ¿Qué tipo de backup copia todo cada vez?
A) Backup incremental.
B) Backup diferencial.
C) Backup completo. *
D) Backup fantasma.

P: ¿Qué rango de IP es privado según RFC1918?
A) 8.8.8.8
B) 192.168.0.0/16 *
C) 200.15.10.1
D) 1.1.1.1

P: ¿Qué sistema operativo puede usar tanto NFS como SMB?
A) Windows 95.
B) macOS. *
C) MS-DOS.
D) Android 1.0.

P: ¿Qué registro asocia un nombre a una dirección IPv6?
A) Registro A.
B) Registro AAAA. *
C) Registro NS.
D) Registro SOA.

P: ¿Qué hace una zona de búsqueda inversa?
A) Traducir una IP a un nombre. *
B) Traducir un nombre a una IP.
C) Traducir IPv4 a direcciones IPv6.
D) Borrar los registros antiguos del DNS.

P: ¿Qué es la 'defensa en profundidad'?
A) Poner muchas capas de seguridad. *
B) Enterrar los servidores bajo tierra.
C) Usar solo un firewall muy potente.
D) No conectar nunca el servidor a red.

P: ¿Cuál es la función de una GPO?
A) Actualizar el hardware del cliente.
B) Definir reglas y configuraciones en red. *
C) Aumentar el brillo del monitor del PC.
D) Crear copias de seguridad en DVD.

P: ¿Qué ventaja tiene el backup incremental?
A) Es el más lento de restaurar.
B) Solo copia lo que ha cambiado desde ayer. *
C) Copia todo el disco cada vez.
D) No ocupa espacio en el servidor.

P: ¿Qué sucede si el ransomware cifra un disco con RAID?
A) El RAID descifra los archivos solo.
B) Los datos se cifran en todos los discos. *
C) Solo se cifra el disco número 1.
D) El RAID bloquea el acceso al virus.

P: ¿Por qué no se deben usar snapshots como backup?
A) Porque dependen del disco original. *
B) Porque son demasiado rápidos de hacer.
C) Porque no se pueden borrar nunca.
D) Porque solo funcionan en Windows.

P: ¿Qué sistema de impresión es común en Linux?
A) SPOOL.
B) CUPS. *
C) GDI.
D) PCL.

P: ¿Dónde no se deben guardar las copias de seguridad?
A) En el mismo servidor que se protege. *
B) En una unidad de cinta externa.
C) En un servicio de almacenamiento cloud.
D) En un disco duro fuera de la oficina.

P: ¿Qué comando consulta los trabajos de impresión en CUPS?
A) lpstat *
B) ps aux
C) grep
D) cat

P: ¿Qué ofrece RAID frente a fallos de hardware?
A) Backup automático en la nube.
B) Alta disponibilidad. *
C) Eliminación de virus en tiempo real.
D) Cifrado de grado militar.

P: ¿Cuál es una buena práctica para las retenciones de backup?
A) Guardar 500 copias sin borrar ninguna.
B) Definar una política de borrado periódica. *
C) Borrar el backup completo cada semana.
D) No hacer nunca más de dos copias.

P: ¿Qué registro se usa para crear alias de nombres?
A) Registro A.
B) Registro CNAME. *
C) Registro PTR.
D) Registro MX.

P: ¿Es lo mismo un disco en el router que un servidor Samba?
A) Sí, tienen las mismas funciones.
B) No, el servidor ofrece control granular. *
C) Sí, pero el router es más rápido.
D) No, el router no permite guardar archivos.

P: ¿Cuántos campos de tiempo tiene la sintaxis de cron?
A) 3 campos.
B) 5 campos. *
C) 7 campos.
D) 1 campo.

P: ¿Qué ventaja tiene NFS sobre SMB en Linux?
A) Es mucho más fácil de configurar en Windows.
B) Es más eficiente y estable en sistemas Unix. *
C) Permite imprimir en color sin drivers.
D) No necesita dirección IP para funcionar.

P: ¿Cuál es la función del registro PTR?
A) Asignar una IP a un nombre.
B) Asignar un nombre a una IP (inverso). *
C) Indicar el servidor de nombres.
D) Definir el tiempo de vida (TTL).

P: ¿Qué diferencia a PowerShell de Bash?
A) PowerShell solo funciona en modo gráfico.
B) PowerShell maneja objetos, Bash maneja texto. *
C) Bash es mucho más moderno que PowerShell.
D) Bash no permite usar variables ni bucles.

P: ¿Qué comando muestra las conexiones Samba activas?
A) lsblk
B) smbstatus *
C) top
D) df -h

P: ¿Qué permite CUPS mediante su interfaz web?
A) Instalar programas de diseño gráfico.
B) Administrar impresoras remotamente. *
C) Hackear otras impresoras de la red.
D) Navegar por Internet a alta velocidad.

P: ¿Para qué sirve el comando 'dig' en Linux?
A) Para formatear discos duros.
B) Para consultas DNS avanzadas. *
C) Para ver la temperatura del PC.
D) Para instalar el servidor BIND9.

P: ¿Qué tipo de dirección es 10.0.0.5?
A) Dirección IP pública.
B) Dirección IP privada. *
C) Dirección de Gateway universal.
D) Dirección de servidor DNS raíz.

P: ¿Qué registro indica quién es el servidor DNS primario?
A) Registro MX.
B) Registro NS. *
C) Registro A.
D) Registro CNAME.

P: ¿Cuál es un beneficio de las zonas inversas?
A) Validación de servidores de correo. *
B) Aumento de la velocidad de navegación.
C) Ocultación de la IP pública.
D) Compartición de archivos más rápida.

P: ¿Cómo se llama el programador de tareas en Linux?
A) Task Scheduler.
B) cron. *
C) systemd.
D) at.

P: ¿Qué archivo de Linux monta recursos automáticamente?
A) /etc/passwd
B) /etc/fstab *
C) /etc/hosts
D) /etc/resolv.conf

P: ¿Qué permisos hay que considerar en un recurso compartido?
A) Solo los permisos del firewall.
B) Los del sistema de archivos y del recurso. *
C) Únicamente los permisos de Active Directory.
D) Solo los permisos de lectura física.

P: ¿Qué es un 'cmdlet' en PowerShell?
A) Un tipo de cable de red.
B) Un comando especializado de una sola función. *
C) Una carpeta con permisos especiales.
D) Un virus que borra archivos de Windows.

P: ¿Para qué se usa '>>' en un script de Linux?
A) Para borrar un archivo.
B) Para añadir la salida a un log sin borrarlo. *
C) Para comparar dos números enteros.
D) Para saltar a la siguiente línea del script.

P: ¿Qué sucede con las tareas de cron si se reinicia el servidor?
A) Se borran y hay que crearlas de nuevo.
B) Se reactivan solas desde sus archivos. *
C) Se ejecutan todas a la vez al arrancar.
D) El servidor no arranca hasta borrarlas.

P: ¿Por qué usar rutas absolutas en cron?
A) Para que el script sea más corto.
B) Porque cron no conoce tu entorno de usuario. *
C) Para que el script no necesite permisos.
D) Es indiferente usar rutas relativas.

P: ¿Qué indica el primer campo en una línea de cron?
A) La hora.
B) El minuto. *
C) El día del mes.
D) El comando a ejecutar.

P: ¿Qué permite PowerShell Out-File?
A) Borrar archivos del sistema.
B) Enviar la salida de un comando a un archivo. *
C) Instalar una actualización de red.
D) Cambiar el nombre del servidor.

P: ¿Qué se debe hacer antes de programar una tarea?
A) Probar el script manualmente. *
B) Reiniciar el servidor tres veces.
C) Cambiar la contraseña de root.
D) Desinstalar el antivirus del servidor.

P: ¿Qué es Proxmox VE?
A) Un sistema de archivos para Windows.
B) Una solución de virtualización de código abierto. *
C) Un tipo de servidor de correo electrónico.
D) Una marca de tarjetas de red de alta velocidad.

P: ¿Qué usa Proxmox para máquinas virtuales completas?
A) LXC.
B) KVM. *
C) Docker.
D) Hyper-V.

P: ¿Qué usa Proxmox para contenedores ligeros?
A) KVM.
B) LXC. *
C) VMware.
D) VirtualBox.

P: ¿Qué diferencia a Docker de una VM?
A) Docker emula todo el hardware físico.
B) Docker comparte el kernel del host. *
C) Docker es mucho más pesado que una VM.
D) Docker solo funciona en ordenadores Apple.

P: ¿Cuál es la principal ventaja de los contenedores Docker?
A) Soportan cualquier hardware antiguo.
B) Son muy eficientes para despliegues masivos. *
C) Cifran los datos de forma irrompible.
D) No requieren una dirección IP propia.

P: ¿Qué caracteriza a un contenedor Docker?
A) Incluye solo lo esencial para ejecutar la app. *
B) Incluye un Windows Server completo dentro.
C) Ocupa siempre más de 50 GB de disco.
D) Solo puede ejecutar bases de datos SQL.

P: ¿Qué permite Docker a los desarrolladores?
A) Comprar servidores más baratos.
B) Empaquetar apps con sus dependencias. *
C) Aumentar la velocidad del procesador.
D) Borrar el sistema operativo del host.

P: ¿Por qué las pymes usan la nube?
A) Porque es obligatorio por ley en la UE.
B) Porque evita grandes inversiones iniciales. *
C) Porque los servidores cloud nunca fallan.
D) Porque es más difícil de configurar que lo local.

P: ¿Para qué sirve LXC en Proxmox?
A) Para ejecutar Windows de forma rápida.
B) Para crear entornos ligeros y eficientes. *
C) Para gestionar las copias en cinta.
D) Para cifrar el tráfico de la interfaz web.

P: ¿Qué tecnología de Proxmox da aislamiento total?
A) LXC.
B) KVM. *
C) Docker.
D) NFS.

P: ¿Qué actúa como tu 'centro de datos privado'?
A) VirtualBox instalado en el cliente.
B) Proxmox VE gestionando varios servidores. *
C) Una cuenta gratuita de Google Drive.
D) Un disco duro externo compartido por USB.

¡Tienes razón, perdona! Aquí están las preguntas del documento formateadas según tu formato:

---

P: ¿En qué directorio del servidor se almacenan típicamente los archivos que se desean compartir mediante Samba?
A) En /var/log
B) En /home/user
C) En /etc/samba
D) En /srv/docs *

P: Una vez instalado el rol de Servicios de dominio de Active Directory en Windows Server, ¿cuál es el siguiente paso crítico en la configuración?
A) Realizar copia de seguridad inmediata
B) Crear automáticamente grupos de seguridad
C) Distribuir licencias a clientes
D) Ejecutar el asistente de promoción a controlador de dominio *

P: ¿Cuál es el comando correcto para descargar e instalar el paquete Samba sin requerir confirmación interactiva?
A) apt search samba
B) apt remove samba
C) apt install -y samba *
D) apt update samba -f

P: En la configuración de BIND en Linux, ¿en qué archivo se definen típicamente las zonas locales?
A) /etc/bind/db.root
B) /var/cache/bind/zones
C) /etc/resolv.conf
D) /etc/bind/named.conf.local *

P: ¿Qué requisito previo es necesario para usar Escritorio Remoto entre dos equipos Windows?
A) Es necesario tener instalada una tarjeta de red de marca específica
B) El servicio RDP debe estar activo en el equipo servidor *
C) Solo se requiere instalar Windows en ambas máquinas
D) Ambos equipos deben estar en la misma subred de red

P: ¿Cuál es el propósito principal de configurar una carpeta compartida en /srv/docs en un servidor de red?
A) Instalar paquetes de software del sistema
B) Almacenar drivers de dispositivos
C) Guardar archivos de configuración del kernel
D) Facilitar la distribución de documentos a través de la red *

P: En el archivo de configuración smb.conf, ¿qué indica la directiva 'path = /srv/datos'?
A) El nombre de dominio del servidor
B) La dirección IP del cliente
C) La ubicación física en el servidor del recurso compartido *
D) La ruta del servidor DNS

P: ¿Qué herramienta de diagnóstico permite consultar desde la consola si una dirección IP se resuelve correctamente desde el DNS?
A) tracert
B) nslookup *
C) arp -a
D) ifconfig

P: ¿Cuál es el nombre del cliente nativo de Windows que permite conectarse mediante protocolo RDP?
A) Conexión a Escritorio Remoto (Remote Desktop Connection / mstsc.exe) *
B) PuTTY Remote Desktop
C) Windows Remote Assistance Manager
D) Network Connections Protocol

P: ¿Qué modificación realiza el comando 'sudo chown :grupo_documentos /srv/docs'?
A) Cambia el usuario propietario a root
B) Modifica los permisos de lectura únicamente
C) Cifra el contenido del directorio
D) Asigna la propiedad de grupo al directorio *

P: Después de instalar los Servicios de dominio de Active Directory en Windows Server, ¿qué proceso es esencial ejecutar?
A) Cambiar el nombre del equipo a "Dominio"
B) Reinstalar completamente el sistema operativo
C) Promover el servidor a controlador de dominio mediante la asistente de configuración de AD *
D) Desinstalar todas las actualizaciones de seguridad

P: En una distribución Ubuntu moderna, ¿qué formato utilizan los archivos de configuración de red en Netplan?
A) Archivos XML en /etc/network/config
B) Archivos de configuración en /etc/sysconfig/network
C) Archivos YAML en /etc/netplan/ *
D) Scripts bash en /etc/init.d/network

P: ¿Cuál es la diferencia principal entre usuarios de dominio y usuarios locales en una infraestructura Windows?
A) No hay diferencia funcional entre ambos tipos de usuarios
B) Los usuarios locales nunca pueden conectarse a servidores remotos
C) Los usuarios de dominio son autenticados centralmente por el Domain Controller; los locales existen solo en equipos específicos *
D) Los usuarios de dominio tienen acceso automático a todos los equipos sin autenticación

P: Una máquina que obtiene una dirección IP del rango 169.254.0.0/16 generalmente ha experimentado:
A) Una sobrecarga en el firewall del sistema
B) Un fallo en la obtención de dirección mediante DHCP *
C) Una configuración estática correcta
D) Una activación correcta del servidor DNS

P: ¿Cuál es la función principal de un Domain Controller en una red Windows?
A) Gestionar exclusivamente los permisos de acceso a impresoras
B) Almacenar y replicar la base de datos de Active Directory, autenticando usuarios y equipos del dominio *
C) Distribuir direcciones IP a los clientes de forma automática
D) Bloquear conexiones de internet no autorizadas

P: ¿Qué protocolo y servicio debe estar activo en un servidor Linux para permitir administración remota por consola de forma segura?
A) HTTP con cifrado básico
B) POP3
C) Telnet
D) SSH (Secure Shell) *

P: Para definir una configuración estática de dirección IP en Ubuntu utilizando Netplan, ¿en qué directorio se ubican los archivos de configuración?
A) /etc/network/interfaces.d
B) /etc/netplan/ *
C) /etc/hosts.config
D) /etc/sysconfig/network-scripts

P: ¿Qué pasos esenciales deben realizarse para habilitar Escritorio Remoto en Windows Server?
A) Crear un usuario de dominio y asignarle permisos de lectura
B) Desactivar el cortafuegos y cambiar la contraseña de administrador
C) Instalar Internet Explorer y reiniciar el servidor
D) Habilitar el servicio RDP en Configuración del Sistema y permitir la excepción en cortafuegos *

P: ¿Cuál es la sintaxis correcta para crear un usuario del sistema Linux con directorio home?
A) sudo createuser -h usuario2
B) sudo adduser usuario2 *
C) sudo useradd -m usuario2
D) sudo newuser -d usuario2

P: ¿Qué rol debe instalarse en Windows Server para crear y gestionar un dominio corporativo?
A) Remote Desktop Services
B) Active Directory Domain Services (AD DS) *
C) Dynamic Host Configuration Protocol Server
D) Internet Information Services (IIS)

P: ¿Por qué es necesario reiniciar el servicio 'smbd' después de modificar la configuración en smb.conf?
A) Para que el demonio de Samba lea y aplique los nuevos parámetros *
B) Para actualizar automáticamente el sistema operativo
C) Para resetear las conexiones de clientes antiguos
D) Para desfragmentar el disco duro

