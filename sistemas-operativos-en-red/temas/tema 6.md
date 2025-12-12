# Unidad 6:Seguridad en sistemas operativos en red

#### Sesión 10: Políticas de seguridad en Windows Server (GPO). Firewall en Windows y Linux (iptables/ufw)

**Firewalls de Host**
Windows Defender Firewall en sistemas Windows y herramientas como iptables o ufw en Linux forman parte de la estrategia de defensa en profundidad.

**En entornos basados en Windows Server,**
esta gobernanza se articula a través de las Políticas de Grupo o GPO (Group Policy Objects), mientras que la protección del tráfico de red se asegura mediante firewalls de host: Windows Defender Firewall en sistemas Windows y herramientas como iptables o ufw en Linux. 

**Windows Server: GPO** permiten gestionar miles de configuraciones en todos los equipos de un dominio desde un solo lugar:
seguridad de contraseñas, restricciones de software, auto-actualizaciones, bloqueo de dispositivos externos, políticas de escritorio, scripts, directivas de auditoría 
son la herramienta para asegurar que cada equipo sigue las mismas normas sin depender del usuario. Son la manera de automatizar la seguridad a escala.

**protección a nivel de tráfico**
firewalls de host, Aunque exista un firewall perimetral en la red, cada servidor debe tener su propia capa de filtrado. 
Un firewall de host bien configurado puede impedir que un atacante que ha logrado entrar a
la red pueda comunicarse con otros servidores o acceder a servicios internos.

**Windows**
Windows Defender Firewall permite filtrar tráfico entrante y saliente según reglas específicas: puertos, aplicaciones, perfiles de red o rangos IP.

**Linux**
iptables es potente pero complejo. ufw (Uncomplicated Firewall) da una interfaz simplificada sin renunciar a la fortaleza de iptables.

**Estos componentes GPO y firewalls no resuelven problemas aislados: se complementan.**
Las GPO definen el comportamiento interno de los equipos, y los firewalls controlan qué tráfico puede llegar o salir. reducen la superficie de ataque, limitan acciones no deseadas y garantizan que todos los equipos del dominio se comportan conforme a las políticas corporativas.

esquema

![[../../fotos/Pasted image 20251204121813.png]]

Herramientas y Consejos para tu Futuro Profesional
Herramientas específicas
![[../../fotos/Pasted image 20251204122047.png]]

***Consejos prácticos***

Denegar todo y permitir solo lo necesario Esto reduce la superficie de ataque.

Mapea puertos y servicios críticos. No abras un puerto sin necesidad 

Revisa las GPO  muchas empresas acumulan políticas sin ver si pueden generar conflictos.

Separa roles por unidades organizativas (OU). No aplicas la misma política a un
desarrollador que a un servidor de bases de datos.

Documenta cada regla de firewall. 

**Mitos y Realidades**
"Con el firewall perimetral es suficiente; no necesito uno en cada servidor."
El firewall perimetral protege la red desde el exterior, pero si un atacante entra, solo el firewall de host puede detenerlo antes de comprometer el sistema.

**Resumen Final (para examen)**
Las GPO permiten estandarizar políticas de seguridad en Windows Server de
forma centralizada.
Un firewall de host es imprescindible incluso si existe un firewall de red.
En Windows se usa Windows Defender Firewall; en Linux, iptables y ufw.
La estrategia recomendada del firewall es denegar todo y permitir solo lo
necesario.
GPO + firewall = combinación clave en entornos corporativos seguros.


#### Sesión 11: Copias de seguridad, recuperación del sistema y snapshots en entornos virtualizados

**Copia completa**
guarda todos los datos cada vez que se ejecuta.
Es la más sencilla de entender y confiable, pero también la que más espacio y tiempo requiere.

**Copia incremental**
solo guarda lo que ha cambiado desde la última copia de cualquier tipo.
Es rápida y eficiente en espacio, aunque la restauración requiere reconstruir la cadena completa.

**Copia diferencial**
guarda los cambios desde la última copia completa.
Es un punto intermedio: ocupa más que la incremental, pero es más fácil de restaurar.


**Regla 3-2-1**
Debes tener 3 copias de los datos, en 2 medios distintos (por ejemplo, servidor local y
NAS), y 1 copia off-site (nube, centro de datos externo).

**una buena estrategia de backup combina:**
un sistema automatizado de copias (Windows Server Backup, rsync, Veeam, etc.),
pruebas regulares de recuperación, almacenamiento distribuido y seguro, y snapshots usados únicamente como herramienta táctica a corto plazo.


Esquema Visual
![[../../fotos/Pasted image 20251204124408.png]]


**Herramientas y Consejos para tu Futuro Profesional**

Windows Server Backup
herramienta nativa para copias completas, del estado del sistema o de apps como Active Directory.

Veeam Backup & Replication
estándar del sector para virtualización (Hyper-V y VMware).

Linux
rsync: ideal para copias incrementales eficientes.
tar: para empaquetar directorios en un único archivo.
cron: para programar tareas automáticas.

Plataformas cloud
Microsoft Azure Backup AWS Backup Backblaze B2

Automatiza todo
Un backup manual es un backup que tarde o temprano dejará de hacerse.

Comprueba la restauración

Aísla las copias, No las guardes en el server que proteges o en una ruta accesible desde el dominio.

Controla las retenciones, muchas copias sin política de borrado solo llena discos y complica la gestión.

Usa snapshots solo para lo que son, pruebas rápidas antes de cambiosdelicados.

**Mitos y Realidades**

**Mito: "Los snapshots son mi sistema de backup."**
Un snapshot depende del disco original. Si ese disco se corrompe o es cifrado por ransomware, el snapshot también queda comprometido. acumular snapshots durante semanas degrada el rendimiento de la VM.

**Mito: "RAID es un sistema de copias de seguridad."**
RAID protege contra fallos físicos de un disco, pero no evita eliminaciones accidentales, errores humanos, corrupción de datos, malware, ni ransomware. RAID da alta disponibilidad, no recuperación ante desastres.

Resumen Final para Examen
Existen tres tipos principales de backup: completo, incremental y diferencial.
Los snapshots NO son copias de seguridad, solo sirven para revertir cambios a
corto plazo.
La regla 3-2-1 es la base de toda estrategia profesional de protección de datos.
RAID no reemplaza a un sistema de backup.
La recuperación es tan importante como la copia: probar la restauración es
obligatorio.14