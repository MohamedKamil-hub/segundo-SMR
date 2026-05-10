# 🖥️ Guía Definitiva: Sistemas Operativos en Red — 2º SMR

> [!NOTE] ¿Cómo usar estos apuntes? Optimizados para **Obsidian**. Los callouts `[!IMPORTANT]` son definiciones clave, `[!TIP]` son trucos de examen, `[!WARNING]` son errores frecuentes y `[!NOTE]` son aclaraciones técnicas. Las tablas comparativas y la sección de **conceptos trampa** al final son las más útiles el día del examen.

---

## Índice de Contenidos

1. [[#Bloque 1 — Conceptos Fundamentales de Sistemas en Red]]
2. [[#Bloque 2 — Virtualización: VirtualBox, VMware y Proxmox]]
3. [[#Bloque 3 — Configuración de Red (IP, DHCP, DNS)]]
4. [[#Bloque 4 — Acceso Remoto (SSH y RDP)]]
5. [[#Bloque 5 — Active Directory y Windows Server]]
6. [[#Bloque 6 — Gestión de Usuarios y Permisos]]
7. [[#Bloque 7 — Compartición de Archivos (Samba, NFS, SMB)]]
8. [[#Bloque 8 — Copias de Seguridad y RAID]]
9. [[#Bloque 9 — Automatización: Cron, PowerShell y Scripts]]
10. [[#Bloque 10 — Contenedores Docker]]
11. [[#Bloque 11 — Impresión en Red (CUPS)]]
12. [[#Bloque 12 — Seguridad en Sistemas en Red]]
13. [[#Resumen de Conceptos Trampa]]
14. [[#Glosario de Siglas y Términos Clave]]

---

## Bloque 1 — Conceptos Fundamentales de Sistemas en Red

### SO Cliente vs SO Servidor

> [!IMPORTANT] Diferencia fundamental
> 
> ||SO Cliente|SO Servidor|
> |---|---|---|
> |**Función**|Consume recursos|**Provee recursos**|
> |**Usuarios**|Generalmente uno|Múltiples simultáneos|
> |**Ejemplo**|Windows 10/11|Windows Server, Ubuntu Server|

---

### Sistema Operativo en Red (SON)

> [!IMPORTANT] ¿Qué es un SON? Un sistema operativo diseñado para **coordinar usuarios, equipos y servicios en una red**. Gestiona recursos compartidos: archivos, impresoras, aplicaciones y comunicaciones.

**Recursos que gestiona un SON:**

- Archivos y carpetas compartidas
- Impresoras en red
- Aplicaciones
- Comunicaciones entre equipos

> [!NOTE] En un SON los archivos se gestionan como **recursos compartidos**, no como recursos locales de un solo equipo.

---

### Principios de Seguridad Fundamentales

|Principio|Descripción|
|---|---|
|**Mínimo privilegio**|Dar solo los permisos estrictamente necesarios para cada tarea|
|**Disponibilidad**|El servidor debe estar accesible siempre que se necesite|
|**Defensa en profundidad**|Aplicar **múltiples capas de seguridad** (no confiar en una sola barrera)|

> [!TIP] El principio de mínimo privilegio aparece mucho en los exámenes. La respuesta siempre será la opción que "da solo lo necesario", nunca la que "da acceso total".

---

## Bloque 2 — Virtualización: VirtualBox, VMware y Proxmox

### Conceptos de Virtualización

> [!IMPORTANT] ¿Qué es un hipervisor? Software que permite **crear y ejecutar máquinas virtuales** sobre un hardware físico. **VirtualBox** es el ejemplo más común en el módulo.

---

### Comparativa de Plataformas de Virtualización

|Plataforma|Tipo|Coste|Característica principal|
|---|---|---|---|
|**VirtualBox**|Tipo 2 (sobre SO)|Gratuito|Ideal para laboratorio personal y prácticas|
|**VMware**|Tipo 1/2|De pago|**Mayor rendimiento** que VirtualBox|
|**Proxmox VE**|Tipo 1 (bare metal)|Open Source|Solución empresarial, gestiona varios servidores|
|**Hyper-V**|Tipo 1|Incluido en Windows Server|Virtualización nativa de Microsoft|

> [!TIP] Pregunta trampa: ¿Ventaja de VMware sobre VirtualBox? **Mayor rendimiento, aunque sea de pago**. No es gratuito para empresas y no es exclusivo de Windows.

---

### Proxmox VE — La Solución Empresarial

> [!IMPORTANT] Proxmox VE Solución de virtualización de **código abierto** que actúa como tu "centro de datos privado". Gestiona múltiples servidores desde una interfaz web.

**Tecnologías que usa Proxmox:**

|Tecnología|Para qué sirve|
|---|---|
|**KVM**|Máquinas virtuales completas con **aislamiento total**|
|**LXC**|Contenedores ligeros y eficientes (comparten kernel del host)|

> [!TIP] KVM = VMs completas (aislamiento total). LXC = contenedores ligeros (eficientes).

---

### Snapshots en VirtualBox

> [!IMPORTANT] ¿Qué es un snapshot? Un **punto de guardado del estado de una máquina virtual** en un momento concreto. Permite volver a ese estado exacto si algo sale mal.

**Ventajas:**

- Permiten **experimentar sin miedo** a romper el sistema
- Facilita implementar copias de seguridad eficientes con un entorno de pruebas previo

> [!WARNING] Riesgos de los snapshots
> 
> - **No son un backup**: dependen del disco original de la VM. Si el disco falla, el snapshot también se pierde.
> - Acumular snapshots durante semanas **degrada el rendimiento** de la VM.
> - Si el ransomware cifra el disco → **los datos se cifran en todos los discos** (incluidos los del snapshot).

---

### Tipos de Adaptador de Red en VirtualBox

|Modo|Comportamiento|Uso típico|
|---|---|---|
|**NAT**|La VM comparte la IP del host para salir a Internet|Acceso a Internet desde la VM|
|**Red interna**|Las VMs se comunican entre sí sin acceso al host ni Internet|Laboratorios aislados|
|**Adaptador puente**|La VM obtiene IP de la red real como si fuera un equipo más|Servidores que necesitan IP real|
|**Solo anfitrión**|Comunicación solo entre VM y host|Pruebas de servicios locales|

---

## Bloque 3 — Configuración de Red (IP, DHCP, DNS)

### Parámetros de Red Básicos

|Parámetro|Función|
|---|---|
|**Dirección IP**|**Identifica un equipo de forma única** en la red|
|**Máscara de subred**|**Diferencia la parte de red y la parte de host** de una IP|
|**Puerta de enlace (Gateway)**|Salida de la red local hacia el exterior|
|**Servidor DNS**|Resuelve nombres de dominio a IPs|
|**MAC**|Identificador físico único de la tarjeta de red|

> [!IMPORTANT] IPv4 = 32 bits Una dirección IPv4 tiene **32 bits** (4 octetos de 8 bits). Una IPv6 tiene 128 bits.

> [!WARNING] Conflicto de IP Si dos equipos tienen la misma IP → **hay conflicto y pérdida de conectividad**. La red no funciona correctamente para ninguno de los dos.

---

### IP Estática vs DHCP

|                | IP Estática                                              | DHCP (Automática)              |
| -------------- | -------------------------------------------------------- | ------------------------------ |
| **Asignación** | Manual, configurada por el administrador                 | Automática desde servidor DHCP |
| **¿Cambia?**   | No cambia al reiniciar                                   | Puede cambiar                  |
| **Uso**        | **Servidores** (siempre la misma IP, fácil de localizar) | Clientes (PCs de usuarios)     |

> [!TIP] Los servidores usan IP **estática** para que siempre tengan la misma dirección y sean fáciles de localizar. Los clientes usan DHCP.

**IP 169.254.x.x — ¿Qué significa?**

> Si un cliente Windows recibe una IP **169.254.x.x** es porque **no ha encontrado un servidor DHCP**. Es una IP de auto-configuración (APIPA) que indica problema con el servidor DHCP.

---

### Configuración de IP Estática

**En Windows Server:**

> Centro de redes y recursos compartidos → Propiedades del adaptador → IPv4

**En Ubuntu Server (Netplan):**

```yaml
# Editar el archivo /etc/netplan/*.yaml
network:
  version: 2
  ethernets:
    ens33:
      addresses:
        - 192.168.1.10/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses: [192.168.1.1, 8.8.8.8]
      dhcp4: false
```

```bash
# Aplicar la configuración
sudo netplan apply
```

---

### DHCP en Windows Server

**Proceso DORA (repaso):**

> **D**iscover → **O**ffer → **R**equest → **A**ck

**Discover** cliente emite un broadcast a todo el mundo  pidiendo una IP
**Offer** el servidor dhcp recibe el broadcast y le dice oye tengo esta Ip libre por si la quieres
**Request** el cliente acepta la IP y emite un broadcast diciendo me quedo con ella para que otros servidores dhcp  lo sepan
**Ack** el servidor DHCP se la concede la IP, puerta de enlace, DBS y mascara de subred

Cuando un cliente recibe IP por DHCP también obtiene:

- **Puerta de enlace (Gateway)**
- **Servidor DNS**
- Máscara de subred

---

### DNS — Servidor de Nombres

> [!IMPORTANT] DNS en Windows Server Para gestionar resolución de nombres debes instalar el **rol DNS** en Windows Server.

**Tipos de registros DNS más usados en el módulo:**

| Registro  | Función                                                                  |
| --------- | ------------------------------------------------------------------------ |
| **A**     | **Nombre → IP (IPv4)** — el más básico y usado                           |
| **AAAA**  | Nombre → IPv6 mas As porque es mas largo                                 |
| **CNAME** | **Alias** de un nombre existente                                         |
| **MX**    | **Servidor de correo** del dominio                                       |
| **NS**    | **Servidor DNS primario** de la zona                                     |
| **PTR**   | IP → nombre (resolución **inversa**) pregunta a quien pertenece esta IP? |
| **SOA**   | Datos de autoridad de la zona                                            |

**Zona de búsqueda inversa:**

> Traduce una **IP a un nombre**. Es útil para **validar servidores de correo** (verificar que la IP pertenece al dominio que dice ser).

---

### BIND9 — Servidor DNS en Linux

> [!IMPORTANT] BIND9 El servidor DNS más usado en Linux. Se instala con `apt install bind9`.

**Archivos clave de BIND9:**


**Archivo donde se declaran las zonas , nombras que dominios tienes**
/etc/bind/named.conf.local

 **Archivo de zona : aqui es donde declaras los registros del dominio un db para cada dominio**
/etc/bind/db.smr.local




**Comando para comprobar DNS:**

```bash
# Desde Windows o Linux
nslookup servidor.smr.local

# Si responde con la IP correcta → DNS funcionando
```

```bash
# Consultas DNS avanzadas en Linux
dig servidor.smr.local
```

---

### Rangos de IP Privadas (RFC 1918)

| Rango            | Descripción                                                                                                     |
| ---------------- | --------------------------------------------------------------------------------------------------------------- |
| `10.0.0.0/8`     | Red privada clase A permite muchisimos dispositivos ya que solo 8 bits son de red y lo demas es de dispositivo  |
| `172.16.0.0/12`  | Red privada clase B                                                                                             |
| `192.168.0.0/16` | **Red privada clase C** (la más común en laboratorio)                                                           |

> [!NOTE] Las IPs como 10.0.0.5 o 192.168.x.x son **IPs privadas**. Las IPs como 8.8.8.8 o 1.1.1.1 son **públicas**.

---

## Bloque 4 — Acceso Remoto (SSH y RDP)

### SSH — Linux/Ubuntu Server

> [!IMPORTANT] SSH (Secure Shell) Protocolo para acceso remoto en modo **texto/terminal** al servidor Linux. Puerto **22**.

**Instalación y conexión:**

```bash
# Instalar el servidor SSH en Ubuntu
sudo apt install openssh-server

# Conectarse desde Linux al servidor
ssh usuario@ip_del_servidor

# Conectarse desde Windows → usar PuTTY
```

**Archivos de configuración SSH:**

|Archivo|Función|
|---|---|
|`/etc/ssh/sshd_config`|Configuración del **servidor** SSH|
|`~/.ssh/authorized_keys`|Claves públicas autorizadas en el servidor|
|`~/.ssh/known_hosts`|Servidores conocidos por el cliente|

**Directivas de seguridad en sshd_config:**

```ini
# Prohibir acceso root (MUY IMPORTANTE)
PermitRootLogin no

# Desactivar autenticación por contraseña
PasswordAuthentication no

# Cambiar el puerto por defecto
Port 2222

# Limitar qué usuarios pueden conectar
AllowUsers usuario1 usuario2
```

> [!IMPORTANT] Autenticación por clave pública Es **más segura que las contraseñas**. Se genera un par de claves (pública/privada) y se pone la pública en `authorized_keys` del servidor.

```bash
# Generar par de claves
ssh-keygen -t ed25519

# Copiar clave pública al servidor
ssh-copy-id usuario@ip_servidor
```

---

### RDP — Windows Server

> [!IMPORTANT] RDP (Remote Desktop Protocol) Protocolo de Microsoft para acceso remoto con **interfaz gráfica completa**. Puerto **3389**.

**Requisitos:**

1. Habilitar **Escritorio Remoto** en las propiedades del sistema del servidor
2. El cliente debe tener **conectividad IP** con el servidor (estar en la misma red o tener acceso)

**Herramienta cliente:** `mstsc` (Conexión a Escritorio Remoto)

> [!WARNING] Riesgo del puerto 3389 por defecto Dejarlo expuesto a Internet provoca **ataques automatizados constantes**. Se recomienda **cambiarlo por un puerto alternativo** y limitar el acceso a IPs autorizadas mediante firewall.

> [!TIP] Regla de seguridad para puertos 22 y 3389 Se recomienda **cambiarlos por puertos alternativos** para dificultar los ataques de bots que escanean los puertos estándar.

---

### Comparativa SSH vs RDP

| SSH                 | SSH              | RDP                                  |
| ------------------- | ---------------- | ------------------------------------ |
| **Sistema**         | Linux/Unix       | Windows                              |
| **Interfaz**        | Terminal (texto) | Escritorio gráfico completo          |
| **Puerto**          | 22               | 3389                                 |
| **Protocolo**       | SSH              | RDP (Microsoft)                      |
| **Cliente Windows** | PuTTY            | mstsc (Conexión a Escritorio Remoto) |
| **Cliente Linux**   | `ssh usuario@ip` | Remmina, xfreerdp                    |

---

## Bloque 5 — Active Directory y Windows Server

### Active Directory (AD)

> [!IMPORTANT] ¿Qué es Active Directory? Servicio de Microsoft que **centraliza la autenticación y autorización** en un dominio Windows. Gestiona usuarios, grupos, equipos y políticas de forma centralizada.

---

### Instalación del Dominio

**Pasos para crear un dominio:**

```
1. Instalar rol: "Servicios de dominio de Active Directory"
      ↓
2. Promover el servidor a Controlador de Dominio
      ↓
3. Definir el nombre del dominio (ej: smr.local)
      ↓
4. Reiniciar
```

> [!IMPORTANT] Controlador de Dominio (Domain Controller) Servidor que **gestiona usuarios, grupos y la autenticación** del dominio. Es el "cerebro" del Active Directory.

---

### Estructura de Active Directory

|Elemento|Descripción|
|---|---|
|**Dominio**|La unidad principal de organización (ej: `smr.local`)|
|**OU (Unidad Organizativa)**|**Contenedor lógico** para organizar usuarios y equipos por departamento|
|**Usuario**|Cuenta de acceso al dominio|
|**Grupo**|Conjunto de usuarios para aplicar permisos de forma colectiva|
|**GPO**|Directiva aplicada a usuarios/equipos de una OU|

> [!IMPORTANT] OU — Unidad Organizativa Refleja la **estructura de departamentos de una empresa**. Permite organizar objetos y **aplicar GPO de forma controlada**. Ejemplo: OU_Ventas, OU_IT, OU_Administración.

---

### Gestión de Usuarios en Active Directory

**Ventajas de AD vs usuarios locales Linux:**

|                    | Active Directory                                                                | Linux local                              |
| ------------------ | ------------------------------------------------------------------------------- | ---------------------------------------- |
| **Alcance**        | Usuario de **dominio** (accede desde cualquier PC del dominio)                  | Usuario **local** (solo en ese servidor) |
| **Gestión**        | Centralizada                                                                    | Distribuida                              |
| **Automatización** | Se pueden crear desde un fichero (scripts) → **crear muchos usuarios a la vez** | Comando por comando                      |

---

### GPO — Directivas de Grupo

> [!IMPORTANT] ¿Qué es una GPO? Un **conjunto de directivas** (reglas de configuración) que se aplican automáticamente a usuarios y equipos del dominio. Permite gestionar **miles de configuraciones centralizadas**.

**Ejemplos de GPO:**

- Longitud mínima de contraseña → **aumenta la seguridad de las cuentas**
- Política de contraseñas complejas
- Fondos de pantalla corporativos
- Restricción de aplicaciones
- Configuración de firewall

> [!TIP] GPO vs Política de contraseñas
> 
> - **GPO** = herramienta para aplicar configuraciones masivas
> - **Política de contraseñas** = un tipo concreto de GPO que obliga a usar claves complejas

---

### Instalación de Roles en Windows Server (Post-instalación)

> [!IMPORTANT] Post-instalación en Windows Server Tras instalar el SO: **Drivers, actualizaciones y acceso remoto**.

**Roles principales que se instalan:**

|Rol|Para qué sirve|
|---|---|
|**Servicios de dominio de AD**|Crear y gestionar el dominio|
|**DNS**|Resolución de nombres en el dominio|
|**DHCP**|Asignación automática de IPs|
|**Servicios de Archivos e Impresión**|Compartir archivos e impresoras|
|**IIS (Servicios Web)**|Servidor web|
|**WSUS**|Gestión centralizada de actualizaciones|

---

## Bloque 6 — Gestión de Usuarios y Permisos

### Gestión de Usuarios en Linux

**Comandos esenciales:**

```bash
# Crear un nuevo usuario
sudo useradd -m juan
# O la forma interactiva (más completa)
sudo adduser juan

# Establecer/cambiar contraseña
sudo passwd juan

# Añadir usuario al grupo sudo (administradores)
sudo usermod -aG sudo juan

# Eliminar usuario
sudo userdel -r juan

# Ver grupos de un usuario
groups juan
```

> [!TIP] Diferencia useradd vs adduser
> 
> - **useradd** = comando básico, requiere opciones adicionales para crear el directorio home
> - **adduser** = script interactivo más amigable que crea el home y pide contraseña

> [!IMPORTANT] sudo usermod -aG sudo juan Añade a Juan al grupo **sudo** (administradores). Después, Juan podrá **ejecutar comandos como administrador** usando `sudo` delante del comando.

---

### Permisos en Linux (rwx)

> [!IMPORTANT] El sistema de permisos rwx Cada archivo/carpeta tiene permisos para tres entidades:
> 
> ```
> -rwxr-xr--
>  ↑↑↑ ↑↑↑ ↑↑↑
>  │││ │││ └── Otros (o): r-- = solo lectura
>  │││ └────── Grupo (g): r-x = lectura y ejecución
>  └────────── Dueño (u): rwx = lectura, escritura, ejecución
> ```

|Permiso|Letra|Número|Significa|
|---|---|---|---|
|**Read**|r|4|Leer el archivo / listar directorio|
|**Write**|w|2|Escribir/modificar|
|**Execute**|x|1|**Ejecutar** (si es archivo) o entrar (si es directorio)|

> [!IMPORTANT] El bit 'x' en Linux Indica que el **archivo es ejecutable** (se puede ejecutar como programa/script).

**A quién se aplican los permisos:**

> **Dueño (u), Grupo (g) y Otros (o)**

**Permiso 777:**

> Todos los permisos para todos (dueño + grupo + otros). Es **poco seguro** — todo el mundo puede leer, escribir y ejecutar.

**Comandos de permisos:**

```bash
# Cambiar permisos
chmod 755 archivo.sh    # rwxr-xr-x
chmod u+x script.sh     # Añadir ejecución al dueño

# Cambiar propietario
chown juan archivo.txt

# Cambiar grupo propietario
chown :grupo_docs /srv/docs
# O equivalente:
chgrp grupo_docs /srv/docs
```

---

### Permisos en Windows (NTFS)

> [!IMPORTANT] NTFS — Sistema de permisos de Windows El modelo de permisos avanzado de Windows. Permite control granular sobre archivos y carpetas.

**Niveles de permiso NTFS (de menor a mayor):**

|Permiso|Capacidades|
|---|---|
|**Lectura**|Ver el contenido|
|**Lectura y Ejecución**|Leer y ejecutar programas|
|**Escritura**|Crear y modificar archivos|
|**Modificar**|Lectura + escritura + borrar|
|**Control Total**|Todo lo anterior + **cambiar permisos de otros**|

> [!TIP] El permiso que permite cambiar permisos de otros = **Control Total**

**Ventaja de asignar permisos a grupos:**

> Facilita la **administración a gran escala**. Si cambias el permiso del grupo, se aplica a todos sus miembros automáticamente.

---

### Cuotas de Disco

> [!IMPORTANT] ¿Qué son las cuotas? Limitan el **espacio de disco que puede usar cada usuario**. Evitan que un usuario monopolice el almacenamiento.

**¿Qué pasa si un usuario agota su cuota?**

> **No podrá guardar más archivos nuevos** hasta que libere espacio o se aumente su cuota.

---

### Archivo sudoers en Linux

> [!IMPORTANT] ¿Cómo editar el archivo sudoers? **Siempre con `visudo`**, no con nano ni gedit. `visudo` verifica la sintaxis antes de guardar para evitar bloquear el acceso sudo.

```bash
# Editar sudoers de forma segura
sudo visudo
```

**Ventaja de sudo:**

> Permite **registrar todas las acciones** realizadas por el usuario con privilegios elevados. Es una herramienta de auditoría.

---

## Bloque 7 — Compartición de Archivos (Samba, NFS, SMB)

### Protocolos de Compartición de Archivos

|Protocolo|Sistema|Uso|
|---|---|---|
|**SMB/CIFS**|Windows (nativo)|Compartir archivos en redes Windows|
|**Samba**|Linux (implementa SMB)|**Linux habla SMB con Windows**|
|**NFS**|Linux/Unix nativo|Redes solo Linux/Unix — más eficiente y estable|
|**CUPS**|Linux|**Impresión** en red|

> [!IMPORTANT] CIFS Una versión pública del protocolo SMB. No es un virus ni un cable — es el protocolo de compartición de archivos de Windows.

> [!TIP] Pregunta trampa: ¿Qué protocolo usa Windows para compartir archivos? **SMB/CIFS**. Samba en Linux implementa este mismo protocolo para ser compatible con Windows.

---

### Samba — Compartir Archivos desde Linux

> [!IMPORTANT] ¿Qué es Samba? Una implementación libre del protocolo **SMB/CIFS** para Linux. Permite a Linux **compartir archivos e impresoras** con clientes Windows.

**Instalación y configuración básica:**

```bash
# Instalar Samba
sudo apt install samba -y

# Crear la carpeta a compartir
sudo mkdir -p /srv/docs

# Crear grupo para gestionar el acceso
sudo groupadd grupo_docs

# Asignar el grupo como propietario de la carpeta
sudo chown :grupo_docs /srv/docs

# Crear usuario del sistema
sudo useradd -m usuario1

# Añadir usuario al grupo
sudo usermod -aG grupo_docs usuario1

# Registrar usuario en Samba (contraseña específica de Samba)
sudo smbpasswd -a usuario1
```

**Configuración del recurso compartido en `/etc/samba/smb.conf`:**

```ini
[docs]
  path = /srv/docs              # Ruta en el sistema de archivos
  browseable = yes
  valid users = @grupo_docs     # Solo el grupo grupo_docs puede acceder
  read only = no
  create mask = 0660
```

> [!IMPORTANT] valid users = @grupo_docs El símbolo `@` indica un **grupo**. Solo pueden acceder los usuarios que pertenezcan al grupo `grupo_docs`.

```bash
# Aplicar cambios reiniciando Samba
sudo systemctl restart smbd

# Ver conexiones activas de Samba
smbstatus
```

**Acceso desde Windows:**

```
\\<IP_DEL_SERVIDOR>\docs
```

> Escribir en el Explorador de Archivos de Windows. Pedirá el usuario y contraseña configurados con `smbpasswd`.

---

### Diferencia Samba vs disco en router

| |Samba (servidor Linux)|Disco en router|
|---|---|---|
|**Control de acceso**|**Control granular** por usuario/grupo|Básico o inexistente|
|**Gestión de permisos**|NTFS/Posix completo|Muy limitado|
|**Escalabilidad**|Alta|Baja|

---

### NFS — Compartición en Redes Linux/Unix

> [!IMPORTANT] NFS (Network File System) Protocolo **nativo para redes Linux/Unix**. Más **eficiente y estable** que SMB en entornos Linux.

> [!NOTE] macOS puede usar tanto **NFS como SMB**. Windows usa SMB de forma nativa.

**Montaje automático con fstab:**

```bash
# /etc/fstab monta recursos de red automáticamente al arrancar
192.168.1.10:/srv/compartido  /mnt/compartido  nfs  defaults  0  0
```

> [!IMPORTANT] /etc/fstab Archivo de Linux que **monta recursos automáticamente** al arrancar el sistema. Evita tener que montar manualmente cada vez.

---

### Impresoras Compartidas vs Servidor de Impresión

> [!WARNING] Compartir impresora desde un PC normal Si el PC se apaga → **nadie puede imprimir**. La disponibilidad depende de que el PC esté encendido. Por eso se usan servidores de impresión.

---

## Bloque 8 — Copias de Seguridad y RAID

### Tipos de Backup

|Tipo|Qué copia|Velocidad backup|Restauración|
|---|---|---|---|
|**Completo**|**Todo cada vez**|Lento|La más fácil (un solo archivo)|
|**Incremental**|**Solo lo cambiado desde ayer** (desde el último backup, sea cual sea)|Muy rápido|Necesita completo + todos los incrementales|
|**Diferencial**|**Lo cambiado desde el último completo**|Rápido|Necesita completo + último diferencial|

> [!TIP] Ventaja del incremental = ocupa poco y es rápido. Desventaja = restauración compleja. Ventaja del diferencial = restauración más simple que el incremental.

---

### Regla 3-2-1 de Backup

> [!IMPORTANT] Regla 3-2-1
> 
> - **3** copias de los datos
> - En **2** soportes/formatos distintos
> - **1** copia fuera de sede (offsite / nube)

> [!WARNING] ¿Dónde NO guardar el backup? **En el mismo servidor que se protege**. Si el servidor falla, se pierde todo (datos + backup).

---

### RAID — Alta Disponibilidad de Discos

> [!IMPORTANT] RAID Sistema que agrupa discos para proteger contra **fallos de hardware** (no es un backup).

|RAID|Discos mínimos|Característica|
|---|---|---|
|**RAID 0**|2|Mayor velocidad, sin redundancia|
|**RAID 1**|2|Espejo exacto — alta disponibilidad|
|**RAID 5**|3|Rendimiento + redundancia (paridad distribuida)|

> [!WARNING] RAID ≠ Backup
> 
> - **RAID** protege contra **fallos físicos de disco**
> - **RAID NO protege** contra borrado accidental, ransomware ni errores lógicos
> - Si el ransomware cifra el disco → **los datos se cifran en TODOS los discos del RAID**

> [!IMPORTANT] ¿Qué ofrece RAID? **Alta disponibilidad** (el sistema sigue funcionando si falla un disco), no backup.

---

### Herramientas de Backup

|Sistema|Herramienta|
|---|---|
|**Windows Server**|Copias de seguridad de Windows Server|
|**Linux**|`tar`, `rsync`, cron para automatizar|
|**Empresarial**|Veeam, Acronis|

**Automatización de backup con cron en Linux:**

```bash
# Comprimir /home cada noche a las 2:00 AM
0 2 * * * tar -czf /backup/home_$(date +%Y%m%d).tar.gz /home
```

---

### Política de Retención de Backups

> [!IMPORTANT] Buena práctica de retención Definir una **política de borrado periódica** para no acumular copias infinitas que consumen espacio. Ejemplo: guardar 7 diarias, 4 semanales, 12 mensuales.

---

## Bloque 9 — Automatización: Cron, PowerShell y Scripts

### Cron en Linux

> [!IMPORTANT] ¿Qué es cron? El **programador de tareas de Linux**. Permite ejecutar scripts o comandos de forma automática en momentos programados.

**Sintaxis de una línea cron:**

```
# Formato: minuto hora día-mes mes día-semana comando
# Valores posibles: número, * (cualquier), */n (cada n)

  *    *    *    *    *   /ruta/al/script.sh
  │    │    │    │    │
  │    │    │    │    └── Día de la semana (0-7, 0 y 7 = domingo)
  │    │    │    └─────── Mes (1-12)
  │    │    └──────────── Día del mes (1-31)
  │    └───────────────── Hora (0-23)
  └────────────────────── Minuto (0-59)
```

> [!IMPORTANT] El primer campo de cron indica el **MINUTO**. Son **5 campos en total**.

**Ejemplos prácticos:**

```bash
# Ejecutar cada noche a las 2:30 AM
30 2 * * * /scripts/backup.sh

# Ejecutar todos los lunes a las 8:00 AM
0 8 * * 1 /scripts/informe.sh

# Ejecutar cada 5 minutos
*/5 * * * * /scripts/comprobacion.sh
```

**Editar crontab:**

```bash
# Editar las tareas del usuario actual
crontab -e

# Ver las tareas programadas
crontab -l
```

> [!TIP] Reglas de oro del cron
> 
> 1. Usar **rutas absolutas**: cron no conoce tu entorno de usuario
> 2. **Probar el script manualmente** antes de programarlo
> 3. Las tareas de cron **se reactivan solas** desde sus archivos si se reinicia el servidor

---

### PowerShell en Windows

> [!IMPORTANT] ¿Qué es PowerShell? Herramienta de Windows para **automatizar y administrar el sistema** mediante comandos y scripts. A diferencia de Bash (que maneja **texto**), PowerShell maneja **objetos .NET**.

| |PowerShell|Bash|
|---|---|---|
|**Sistema**|Windows|Linux/Unix|
|**Maneja**|**Objetos** (.NET)|**Texto**|
|**Extensión scripts**|`.ps1`|`.sh`|

**Comandos PowerShell clave:**

```powershell
# Enviar salida a un archivo
Get-Process | Out-File -FilePath C:\logs\procesos.txt

# Crear usuarios desde un fichero (automatización AD)
Import-Csv usuarios.csv | ForEach-Object {
    New-ADUser -Name $_.nombre -SamAccountName $_.usuario
}
```

> [!IMPORTANT] cmdlet en PowerShell Un **comando especializado de una sola función** en PowerShell. Tienen el formato `Verbo-Sustantivo` (ej: `Get-Process`, `New-ADUser`, `Out-File`).

---

### Programador de Tareas en Windows

> [!IMPORTANT] Programador de Tareas Herramienta de Windows equivalente a cron en Linux. Permite **ejecutar scripts automáticamente** a una hora concreta o ante un evento.

---

### Scripts Bash — Elementos Clave

```bash
#!/bin/bash
# Shebang: indica que es un script Bash

# Variables
FECHA=$(date +%Y%m%d)
BACKUP_DIR="/backup"

# Redirigir salida (>> añade sin borrar)
echo "Backup iniciado: $FECHA" >> /var/log/backup.log

# Crear backup comprimido
tar -czf "$BACKUP_DIR/home_$FECHA.tar.gz" /home
```

> [!IMPORTANT] '>>' en scripts Linux **Añade la salida a un archivo (log) sin borrarlo**. El `>` simple sobrescribiría el archivo.

> [!WARNING] Ejecutar script sin permisos Si ejecutas un script de creación de usuarios sin suficientes privilegios → **falla la creación por falta de privilegios**. Siempre usar `sudo` para comandos de administración.

---

## Bloque 10 — Contenedores Docker

### ¿Qué es Docker?

> [!IMPORTANT] Docker Plataforma para **empaquetar aplicaciones con todas sus dependencias** en contenedores ligeros y portables. **Docker Desktop** es la aplicación para ejecutar y gestionar contenedores en tu máquina.

---

### Diferencia Contenedor vs Máquina Virtual

| |Máquina Virtual|Contenedor Docker|
|---|---|---|
|**Incluye**|SO completo + app|Solo lo esencial para la app|
|**Peso**|Pesado (GB)|Ligero (MB)|
|**Inicio**|Minutos|Segundos|
|**Aislamiento**|Total (hardware virtualizado)|Comparte el **kernel del host**|
|**Uso ideal**|Múltiples SO diferentes|Microservicios, despliegues masivos|

> [!IMPORTANT] Docker comparte el kernel del host A diferencia de una VM que emula todo el hardware, Docker **comparte el kernel del sistema operativo host**. Por eso es más ligero y rápido.

---

### Comandos Docker Esenciales

```bash
# Crear y ejecutar un contenedor
docker run -d -p 8080:80 --name mi-apache httpd

# Ver contenedores en ejecución
docker ps

# Ver todos los contenedores (incluidos parados)
docker ps -a

# Detener un contenedor
docker stop mi-apache

# Eliminar un contenedor
docker rm mi-apache

# Ver imágenes descargadas
docker images
```

---

### Mapeo de Puertos: -p host:contenedor

> [!IMPORTANT] Sintaxis del mapeo de puertos
> 
> ```
> -p 8080:80
>      │    │
>      │    └── Puerto del CONTENEDOR (donde escucha el servicio)
>      └──────── Puerto del HOST (tu máquina)
> ```

**Ejemplo práctico:**

```bash
docker run -d -p 8080:80 httpd
# Acceder al servidor Apache del contenedor:
# http://localhost:8080
```

> [!TIP] localhost = tu propia máquina (host) `localhost` apunta a tu propia máquina. No es un dominio público ni el servidor remoto.

**¿Qué pasa si el puerto del host ya está ocupado?**

> El contenedor **no podrá publicar el puerto** y el comando fallará. Hay que usar un puerto libre.

---

### Ventajas de Docker

- **Portabilidad**: funciona igual en cualquier máquina que tenga Docker
- **Eficiencia**: muy ligero para despliegues masivos
- **Aislamiento**: cada contenedor es independiente
- Permite a los desarrolladores **empaquetar apps con sus dependencias**

> [!NOTE] ¿Por qué las pymes usan la nube? Porque **evita grandes inversiones iniciales** en hardware. No necesitan comprar servidores físicos.

---

## Bloque 11 — Impresión en Red (CUPS)

### CUPS — Common Unix Printing System

> [!IMPORTANT] CUPS El sistema de impresión estándar en Linux. Permite **administrar impresoras remotamente** a través de su interfaz web.

**Interfaz web de CUPS:**

```
http://localhost:631
```

**Comandos CUPS:**

```bash
# Ver trabajos de impresión activos
lpstat

# Ver estado de todas las impresoras
lpstat -p

# Cancelar un trabajo
cancel [job-id]
```

> [!TIP] El comando para consultar trabajos de impresión en CUPS es **lpstat**

---

## Bloque 12 — Seguridad en Sistemas en Red

### Firewall en Linux (UFW)

> [!IMPORTANT] UFW (Uncomplicated Firewall) Herramienta sencilla para gestionar el cortafuegos en Linux. Simplifica el uso de iptables.

```bash
# Bloquear todas las conexiones entrantes por defecto
sudo ufw default deny incoming

# Permitir conexiones salientes
sudo ufw default allow outgoing

# Permitir SSH
sudo ufw allow 22

# Permitir HTTP y HTTPS
sudo ufw allow 80
sudo ufw allow 443

# Activar UFW
sudo ufw enable

# Ver estado
sudo ufw status
```

**Bloquear ping (ICMP):**

```bash
# En /etc/ufw/before.rules, cambiar:
# -A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT
# Por:
# -A ufw-before-input -p icmp --icmp-type echo-request -j DROP
```

> [!TIP] Para bloquear ping → cambiar **ACCEPT por DROP** en la regla ICMP echo-request

---

### Actualizaciones del Sistema

|Sistema|Comando actualizar lista|Comando instalar actualizaciones|
|---|---|---|
|**Ubuntu/Debian**|`sudo apt update`|`sudo apt upgrade`|
|**CentOS/RHEL**|—|`sudo yum update`|

> [!WARNING] Diferencia apt update vs apt upgrade
> 
> - `apt update` = **actualiza la LISTA** de paquetes disponibles (no instala nada)
> - `apt upgrade` = **instala** las actualizaciones disponibles

**WSUS en Windows Server:**

> Herramienta para **gestionar actualizaciones de Windows de forma centralizada** en toda la red empresarial.

---

### Hashes para Verificar Integridad

> [!IMPORTANT] ¿Para qué sirven los hashes? Permiten **detectar cambios o manipulaciones** en archivos. Si el hash de un archivo cambia, el archivo fue modificado.

---

### Política de Contraseñas

> [!IMPORTANT] Política de contraseñas Configuración (habitualmente mediante GPO en Windows) que **obliga a usar claves complejas**: longitud mínima, caracteres especiales, caducidad, etc.

---

### Seguridad General — Resumen de Buenas Prácticas

|Medida|Descripción|
|---|---|
|**Mínimo privilegio**|Solo los permisos necesarios|
|**Cambiar puertos por defecto**|SSH (22) y RDP (3389) → puertos alternativos|
|**Firewall local**|Limitar el acceso remoto a IPs autorizadas|
|**Autenticación por clave SSH**|Más segura que contraseñas|
|**Actualizaciones periódicas**|Parchear vulnerabilidades conocidas|
|**Copias de seguridad**|Regla 3-2-1, fuera del servidor principal|
|**Defensa en profundidad**|Múltiples capas de seguridad|
|**PermitRootLogin no**|Prohibir acceso root por SSH|

---

## 🎯 Resumen de Conceptos Trampa para el Examen

> [!WARNING] Los errores más frecuentes — estudia esta tabla antes del examen

| Pregunta trampa                                    | Opción incorrecta frecuente                | Respuesta correcta                                       |
| -------------------------------------------------- | ------------------------------------------ | -------------------------------------------------------- |
| ¿Qué es VirtualBox?                                | "Un sistema operativo" / "Un editor"       | **Hipervisor para crear máquinas virtuales**             |
| ¿Por qué IP estática en servidores?                | "Para conectarse más rápido"               | **Siempre la misma dirección, fácil de localizar**       |
| ¿Servicio de acceso remoto terminal en Ubuntu?     | "FTP" / "RDP"                              | **SSH**                                                  |
| ¿Cliente SSH en Windows?                           | "Paint" / "Calculadora"                    | **PuTTY**                                                |
| ¿Cómo conectar SSH desde Linux?                    | "ping usuario@ip"                          | **ssh usuario@ip**                                       |
| ¿Rol para crear dominio AD?                        | "Servicios de Escritorio Remoto"           | **Servicios de dominio de Active Directory**             |
| ¿Paso tras instalar el rol AD?                     | "Formatear el disco"                       | **Promover el servidor a Controlador de Dominio**        |
| ¿Qué es un DC?                                     | "Solo almacena backups"                    | **Gestiona usuarios, grupos y autenticación**            |
| ¿Para qué sirven grupos en AD?                     | "Cambiar fondos de pantalla"               | **Administrar permisos y accesos de forma centralizada** |
| ¿Comando crear usuario Linux?                      | "sudo newuser juan"                        | **sudo useradd -m juan**                                 |
| ¿Comando cambiar contraseña Linux?                 | "sudo usermod juan"                        | **sudo passwd juan**                                     |
| ¿Qué hace usermod -aG sudo juan?                   | "Borra grupos de juan"                     | **Añade a juan al grupo administradores (sudo)**         |
| ¿Dónde configurar IP estática Windows?             | "Administrador de tareas"                  | **Centro de redes y recursos compartidos**               |
| ¿Archivo IP estática Ubuntu Server?                | "/etc/hosts"                               | **/etc/netplan/*.yaml**                                  |
| ¿Comando comprobar conectividad?                   | "test" / "dir"                             | **ping**                                                 |
| ¿Qué obtiene el cliente DHCP además de la IP?      | "Solo la IP"                               | **Puerta de enlace y DNS**                               |
| ¿Rol DNS en Windows Server?                        | "DHCP"                                     | **DNS**                                                  |
| ¿Registro DNS nombre→IPv4?                         | "AAAA" / "CNAME"                           | **Registro A**                                           |
| ¿Servidor DNS en Linux?                            | "Apache" / "MariaDB"                       | **BIND9**                                                |
| ¿Archivo zonas BIND9?                              | "/etc/bind/resolv.conf"                    | **/etc/bind/named.conf.local**                           |
| ¿Herramienta comprobar DNS?                        | "dns-check"                                | **nslookup**                                             |
| ¿IP 169.254.x.x qué indica?                        | "Todo bien"                                | **No ha encontrado servidor DHCP**                       |
| ¿Qué es una OU en AD?                              | "Un disco duro virtual"                    | **Contenedor lógico para organizar usuarios**            |
| ¿Qué es una GPO?                                   | "Un antivirus corporativo"                 | **Conjunto de directivas aplicadas a usuarios/equipos**  |
| ¿Qué hace la GPO de longitud mínima de contraseña? | "Las hace iguales"                         | **Aumenta la seguridad de las cuentas**                  |
| ¿Herramienta firewall Linux sencilla?              | "iptables directamente"                    | **ufw**                                                  |
| ¿Qué hace ufw default deny incoming?               | "Permite todo"                             | **Bloquea por defecto todas las conexiones entrantes**   |
| ¿Cómo bloquear ping?                               | "Cambiar TCP por UDP"                      | **ACCEPT → DROP en regla ICMP echo-request**             |
| ¿Herramienta backup integrada Windows Server?      | "Visor de eventos"                         | **Copias de seguridad de Windows Server**                |
| ¿Qué es un snapshot?                               | "Un archivo de configuración"              | **Punto de guardado del estado de la VM**                |
| ¿Riesgo de acumular snapshots?                     | "Ninguno"                                  | **Degrada el rendimiento de la VM**                      |
| ¿Son los snapshots un backup?                      | "Sí, el más seguro"                        | **No, dependen del disco original**                      |
| ¿Para qué sirve crontab?                           | "Gestionar usuarios"                       | **Programar tareas automáticas**                         |
| ¿Herramienta programar tareas Windows?             | "Visor de eventos"                         | **Programador de Tareas**                                |
| ¿Qué hace ufw default deny incoming?               | "Abre SSH automáticamente"                 | **Bloquea todas las conexiones entrantes**               |
| ¿Primer campo de cron?                             | "La hora"                                  | **El minuto**                                            |
| ¿Cuántos campos tiene la sintaxis cron?            | "3" / "7"                                  | **5 campos**                                             |
| ¿Por qué rutas absolutas en cron?                  | "Es indiferente"                           | **Cron no conoce el entorno del usuario**                |
| ¿Qué hace '>>' en Bash?                            | "Borra el archivo"                         | **Añade la salida sin borrar el archivo**                |
| ¿Diferencia PowerShell vs Bash?                    | "PowerShell solo funciona en modo gráfico" | **PowerShell maneja objetos; Bash maneja texto**         |
| ¿Qué es un cmdlet?                                 | "Un tipo de cable"                         | **Comando especializado de una función en PowerShell**   |
| ¿Qué es Samba?                                     | "Un antivirus"                             | **Implementación libre de SMB/CIFS para Linux**          |
| ¿Para qué sudo smbpasswd -a usuario1?              | "Crear la carpeta"                         | **Dar de alta en Samba y asignar contraseña**            |
| ¿Qué significa valid users = @grupo_docs?          | "Solo root puede entrar"                   | **Solo los del grupo grupo_docs**                        |
| ¿Cómo acceder desde Windows a Samba?               | "http://ip/docs"                           | **\\ip\docs en el explorador**                           |
| ¿Por qué reiniciar smbd tras smb.conf?             | "Para actualizar el SO"                    | **Para que Samba lea la nueva configuración**            |
| ¿Qué es CIFS?                                      | "Un virus"                                 | **Versión pública del protocolo SMB**                    |
| ¿Qué protocolo nativo usa Windows para archivos?   | "NFS" / "HTTP"                             | **SMB/CIFS**                                             |
| ¿Qué protocolo ideal para redes solo Linux?        | "Samba" / "SMB"                            | **NFS**                                                  |
| ¿Para qué sirve /etc/fstab?                        | "Guarda contraseñas"                       | **Monta recursos automáticamente al arrancar**           |
| ¿Regla 3-2-1 de backup?                            | "3 nubes, 2 discos, 1 clave"               | **3 copias, 2 soportes, 1 fuera de sede**                |
| ¿Dónde no guardar el backup?                       | "En la nube"                               | **En el mismo servidor que se protege**                  |
| ¿RAID es un backup?                                | "Sí, el más seguro"                        | **No, protege contra fallos físicos, no borrados**       |
| ¿Ransomware en disco con RAID?                     | "El RAID lo descifra"                      | **Los datos se cifran en todos los discos**              |
| ¿Qué ofrece RAID?                                  | "Backup automático"                        | **Alta disponibilidad**                                  |
| ¿Backup que copia todo cada vez?                   | "Incremental"                              | **Completo**                                             |
| ¿Ventaja del backup incremental?                   | "Restauración más fácil"                   | **Solo copia lo cambiado desde ayer**                    |
| ¿Ventaja del backup diferencial?                   | "El más rápido"                            | **Copia lo cambiado desde el último completo**           |
| ¿En Docker, 8080 en -p 8080:80?                    | "Puerto del contenedor"                    | **Puerto del host**                                      |
| ¿En Docker, 80 en -p 8080:80?                      | "Puerto del host"                          | **Puerto del contenedor**                                |
| ¿Docker comparte qué con el host?                  | "El disco duro entero"                     | **El kernel del host**                                   |
| ¿Qué hace docker ps?                               | "Elimina contenedores"                     | **Ver contenedores en ejecución**                        |
| ¿Si puerto 8080 ocupado en host?                   | "Docker lo cambia solo"                    | **El contenedor no puede publicar el puerto**            |
| ¿Qué es Proxmox para VMs completas?                | "LXC"                                      | **KVM**                                                  |
| ¿Qué es Proxmox para contenedores ligeros?         | "KVM"                                      | **LXC**                                                  |
| ¿Qué usa Docker vs Proxmox KVM?                    | "Son iguales"                              | **Docker comparte kernel; KVM da aislamiento total**     |
| ¿Comando ver trabajos impresión CUPS?              | "ps aux"                                   | **lpstat**                                               |
| ¿Permiso rwx qué significa?                        | "Reset Write XML"                          | **Read Write Execute**                                   |
| ¿Permiso que cambia permisos de otros?             | "Modificar"                                | **Control total**                                        |
| ¿A quién se aplican permisos en Linux?             | "Solo al root"                             | **Dueño, Grupo y Otros**                                 |
| ¿Qué indica permiso 777?                           | "Seguridad máxima"                         | **Acceso total para todos (poco seguro)**                |
| ¿Herramienta editar sudoers?                       | "nano" / "gedit"                           | **visudo**                                               |
| ¿Qué hace apt update?                              | "Instala actualizaciones"                  | **Actualiza la LISTA de paquetes**                       |
| ¿Qué hace apt upgrade?                             | "Actualiza la lista"                       | **Instala las actualizaciones**                          |
| ¿Qué riesgo tiene puerto 3389 por defecto?         | "Ninguno si la clave es larga"             | **Ataques automatizados constantes**                     |
| ¿Cuotas de disco qué hacen?                        | "Aceleran el disco"                        | **Limitan el espacio que usa cada usuario**              |
| ¿Qué pasa si agota la cuota?                       | "Se borran archivos viejos"                | **No podrá guardar más archivos**                        |
| ¿Qué identifica un equipo de forma única?          | "La máscara"                               | **La dirección IP**                                      |
| ¿Cuántos bits tiene IPv4?                          | "16 bits"                                  | **32 bits**                                              |
| ¿Qué hace la máscara de subred?                    | "Oculta la IP"                             | **Diferencia parte de red y parte de host**              |

---

## 🔑 Glosario de Siglas y Términos Clave

|Término|Significado|
|---|---|
|**AD**|Active Directory|
|**DC**|Domain Controller (Controlador de Dominio)|
|**OU**|Organizational Unit (Unidad Organizativa)|
|**GPO**|Group Policy Object (Directiva de Grupo)|
|**NTFS**|New Technology File System (sistema de permisos Windows)|
|**SMB**|Server Message Block (protocolo de compartición Windows)|
|**CIFS**|Common Internet File System (versión pública de SMB)|
|**NFS**|Network File System (compartición en Linux/Unix)|
|**CUPS**|Common Unix Printing System|
|**SSH**|Secure Shell (acceso remoto cifrado)|
|**RDP**|Remote Desktop Protocol (escritorio remoto Windows)|
|**DHCP**|Dynamic Host Configuration Protocol|
|**DNS**|Domain Name System|
|**BIND9**|Berkeley Internet Name Domain 9 (servidor DNS en Linux)|
|**ufw**|Uncomplicated Firewall (cortafuegos Linux)|
|**SON**|Sistema Operativo en Red|
|**WSUS**|Windows Server Update Services|
|**KVM**|Kernel-based Virtual Machine|
|**LXC**|Linux Containers|
|**APIPA**|Automatic Private IP Addressing (169.254.x.x)|
|**RAID**|Redundant Array of Independent Disks|
|**rwx**|Read, Write, Execute (permisos Linux)|
|**mstsc**|Microsoft Terminal Services Client (Escritorio Remoto)|
|**PuTTY**|Cliente SSH para Windows|
|**smbpasswd**|Herramienta para gestionar usuarios de Samba|
|**smbstatus**|Ver conexiones activas de Samba|
|**lpstat**|Ver trabajos de impresión en CUPS|
|**visudo**|Editor seguro del archivo sudoers|
|**crontab**|Tabla de tareas programadas en Linux|
|**fstab**|File Systems Table (montaje automático de recursos)|
|**RFC 1918**|Estándar que define los rangos de IPs privadas|

---

_Apuntes generados para 2º SMR — Módulo: Sistemas Operativos en Red_ _Basados en el test de repaso del módulo — Optimizados para Obsidian_

get-service
samba