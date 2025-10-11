# Unidad 2  Instalación  y configuración de sistemas operativos en red


**Instalación de Windows Server y Linux Server en máquinas virtuales. Configuración básica inicial**

Los dos grandes mundos con los que te encontrarás son:

**Windows Server**
Interfaz gráfica intuitiva
integra servicios como Active Directory, DNS o DHCP
facilidad de uso y compatibilidad con aplicaciones empresariales propietarias.

**Linux Server**
(Ubuntu Server, CentOS, Debian, ...)
ligero, robusto, de código abierto y gratuito. 
su instalación y configuración se basan principalmente en la línea de comandos.


**En ambos casos se requiere definir :**
- **Nombre del equipo,** para identificarlo dentro de la red
- **IP estática,** para que el servidor sea siempre accesible desde la misma dirección
- **Zona horaria,** para la sincronización de servicios, logs y políticas de seguridad
- **Cuentas de administración,** determinarán quién y cómo podrá gestionar el sistema

**Esquema** 
![[Pasted image 20251008165719.png]]

**Caso de estudio:**
Cada aula tenía ordenadores independientes, lo que causaba problemas de seguridad, duplicación de tareas y alto coste de mantenimiento.

Se instaló **Ubuntu Server 20.04 LTS** como servidor principal por su estabilidad, gratuidad y compatibilidad con Windows y Linux.
- Configuración clave:
    
    - IP estática: **192.168.100.1**
        
    - Nombre del servidor: **servidor-aula**
        
    - Cuenta administrativa con privilegios **sudo**
        
- Se añadió un **Windows Server 2022** en máquina virtual para gestionar **Active Directory**, **DHCP** y **DNS** de los PCs con Windows 10/11.


## Herramientas y consejos
- Usa siempre ISOs oficiales
- Herramientas de instalación en hardware físico (Rufus y balenaEtcher)
- Buenas prácticas
	durante la instalación Documenta cada paso que realices.
	Configura siempre una IP estática para servidores.
	Establece contraseñas robustas desde el inicio.
- Gestión de entornos virtuales
    toma snapshots en cada fase, para volver atrás si algo falla.


**Resumen final para el examen**
Windows Server: interfaz gráfica + Active Directory.
Linux Server: gratuito, ligero, basado en línea de comandos.
Configuración inicial crítica: IP estática, nombre, zona horaria y usuarios admin.
Máquinas virtuales permiten montar laboratorios seguros y flexibles.
Documentar cada paso es esencial para evitar errores futuros.

## Configuración de hardware, drivers, actualizaciones y acceso remoto (SSH, RDP)

El s. o. servidor está instalado, comienza una fase crítica: la configuración post-instalación. 
Los tres pilares fundamentales de esta fase son:

**Drivers de hardware**
Los controladores son los "traductores" que permiten al SO comunicarse con el hardware fisico.
Instalación y prueba de controladores

**Actualizaciones de seguridad**
Mantener el sistema actualizado es vital para protegerlo frente a vulnerabilidades . 
Parches de seguridad y mantenimiento

**Acceso remoto seguro**
En Linux, la herramienta estándar es SSH (Secure Shell), proporciona un acceso cifrado por línea de comandos.
En Windows, el protocolo habitual es RDP (Remote Desktop Protocol), acceso remoto gráfico. 


**Esquema visual**
![[Pasted image 20251008172158.png]]








## Herramientas y consejos
**Clientes SSH:**
En Windows, se usa  PuTTY, aunque también se puede el cliente SSH en PowerShell.

**Herramientas para RDP:**
Windows incluye la aplicación Conexión a Escritorio Remoto.
En Linux, programas como Remmina permiten acceder a sesiones RDP .

**Gestión de actualizaciones:**
En Windows Server, utiliza Windows Update o WSUS
En Linux, varían según la distro:

Ubuntu/Debian: 
`sudo apt update && sudo apt upgrade`
CentOS/RHEL: 
`sudo yum update`

**Consejos prácticos:**
Cambia los puertos por defecto: el 22 en SSH y el 3389 en RDP son objetivos habituales de ataques automatizados. Configura puertos alternativos.
Configura firewalls locales para limitar el acceso remoto únicamente a las IPs autorizadas.
Activa la autenticación de clave pública en SSH, más segura que las contraseñas.

**Resumen final**
Post-instalación = drivers + actualizaciones + acceso remoto. Drivers garantizan compatibilidad y
rendimiento. Actualizaciones corrigen vulnerabilidades críticas. SSH (Linux) y RDP (Windows) son
esenciales para administración remota. Seguridad: usar claves, cambiar puertos, restringir acceso porfirewall. 