# Unidad 5: Recursos compartidos y servicios de impresión
**Compartición de archivos (Samba, NFS, carpetas compartidas en Windows). Configuración de servidores de impresión en red**


**Compartición de archivos**
Cada sistema operativo implementa su propio protocolo para compartir archivos:
**Windows**  utiliza SMB/CIFS (Server Message Block / Common Internet File System), un protocolo que permite acceder a carpetas y archivos remotos como si estuvieran en el propio equipo.
**Linux/Unix** utiliza NFS (Network File System), diseñado para entornos de red homogéneos
**macOS**, al estar basado en Unix, puede comunicarse tanto mediante NFS como mediante SMB,


**Servidores de impresión en red**
un servidor de impresión permite que múltiples usuarios envíen documentos a una cola central,
administrada por el servidor, se encarga de:
- Priorizar trabajos según reglas o usuarios.
- Gestionar controladores de impresora (drivers).
- Registrar y auditar el uso de cada dispositivo.
- Evitar dependencias (ej. la impresora no disponible si el PC que la compartía se apaga).


Para permitir la interoperabilidad entre sistemas, Linux implementa el protocolo SMB
mediante el servicio Samba, que actúa como un "traductor" entre mundos Windows y Unix.

ej. un Windows puede acceder a una carpeta compartida en un servidor Linux usando \\servidor\\proyectos, y un equipo Linux puede montar ese recurso mediante mount -t cifs.1


En Linux, el sistema más utilizado es CUPS (Common Unix Printing System), da compatibilidad con impresoras locales y en red, y una interfaz web de gestión muy práctica (http://localhost:631).

compartir recursos de forma centralizada permite simplificar la administración, reducir costes y mejorar la seguridad, al tener un punto de control único para los usuarios.


Esquema visual
´![[Pasted image 20251204114003.png]]
El tráfico generado por los equipos de la red interna (192.168.1.0/24) pasa por la
pasarela, que realiza tres funciones:
NAT/PAT: Traducción de direcciones privadas a una IP pública.
Proxy: Control y registro de accesos, y almacenamiento en caché.
Enrutamiento: Selección del camino adecuado entre las interfaces LAN y WAN.

los usuarios internos navegan por Internet utilizando la IP pública del
gateway, mientras el proxy optimiza el rendimiento y aplica las políticas de seguridad.

**Herramientas y Consejos**
![[Pasted image 20251204114125.png]]


#### Consejos Prácticos

Verifica siempre las dos capas de permisos
Un user debe tener permisos en el sistema de archivos (NTFS o Linux) y en el recurso compartido. 

Documenta los recursos compartidos
Mantén una lista actualizada con el nombre del recurso, ruta física y permisos asociados.

Configura nombres NetBIOS simples
En Samba, define netbios name = SERVIDOR para facilitar el acceso desde Windows.

Centraliza las impresoras
Instala y comparte las impresoras en un servidor CUPS o Windows Print Server, no desde PCs individuales.

Automatiza el montaje de recursos
En Linux, usa /etc/fstab para montar NFS  o CIFS automáticamente al iniciar.
ej. //192.168.1.10/proyectos /mnt/proyectos cifs username=usuario,password=1234 0 0

Monitorea el uso de recursos
Utiliza herramientas como smbstatus (para ver conexiones Samba activas) o lpstat (para trabajos de impresión en CUPS).


Mitos y Realidades
Mito 1: "Es más fácil conectar la impresora a un PC y compartirla desde ahí."
Esto genera dependencia: si ese PC se apaga, nadie puede imprimir. Unservidor de impresión dedicado garantiza disponibilidad continua, permite controlar colas, permisos y registros, y evita
conflictos de drivers.


![[Pasted image 20251204114629.png]]