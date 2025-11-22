¡Por supuesto! Con base en las 32 preguntas que me has enviado, he creado un resumen estructurado para que puedas repasar los conceptos clave. Está organizado por temas para facilitar el estudio.

### **Resumen de Estudio: Administración de Sistemas y Redes**

---

### **1. Configuración de Red**

*   **IP Estática:**
    *   **Propósito:** Asignar una dirección IP fija a un servidor para que siempre sea localizable en la red.
    *   **Windows:** Se configura en el **"Centro de redes y recursos compartidos"**.
    *   **Ubuntu (Netplan):** Se configura editando un archivo YAML en **`/etc/netplan/*.yaml`**.

*   **DHCP (Protocolo de configuración dinámica de host):**
    *   Los clientes configurados en DHCP obtienen su IP automáticamente de un **servidor DHCP**.
    *   Junto con la IP, reciben información adicional como la **puerta de enlace** y los **servidores DNS**.
    *   Si un cliente Windows obtiene una IP **169.254.x.x (APIPA)**, significa que **no pudo contactar con un servidor DHCP**.

*   **Comprobación de Red:**
    *   **`ping`:** Comprueba la conectividad básica entre dos máquinas.
    *   **`nslookup`:** Verifica que el DNS está resolviendo correctamente los nombres de dominio a direcciones IP.

---

### **2. Servicio DNS (Sistema de Nombres de Dominio)**

*   **Función:** Resolver **nombres de dominio** (ej: `server1.smr.local`) en **direcciones IP**.
*   **Windows Server:** Se instala el rol **DNS**.
*   **Linux (Ubuntu Server):** El servidor más común es **BIND9** (`apt install bind9`).
*   **Archivos de Configuración en BIND9:**
    *   **`/etc/bind/named.conf.local`:** Donde se declaran las zonas DNS.
*   **Tipos de Registros DNS:**
    *   **Registro A:** Asigna un nombre de dominio a una dirección IPv4.
    *   (Otros registros mencionados: MX para correo, CNAME para alias).

---

### **3. Active Directory (Windows Server)**

*   **Rol a instalar:** **Servicios de dominio de Active Directory**.
*   **Proceso clave:** Después de instalar el rol, se debe **promover el servidor a Controlador de Dominio**.
*   **Controlador de Dominio (DC):** Es el servidor que **gestiona de forma centralizada usuarios, grupos y la autenticación** en el dominio.
*   **Usuarios y Grupos:** Se crean para **administrar permisos y accesos** de manera centralizada.

---

### **4. Gestión de Usuarios en Linux**

*   **`sudo useradd [nombre]`:** Crea un nuevo usuario.
*   **`sudo passwd [nombre]`:** Establece o cambia la contraseña de un usuario.
*   **`sudo usermod -aG [grupo] [usuario]`:** Añade un usuario a un grupo.
    *   Ej: **`sudo usermod -aG sudo juan`** le da permisos de administrador.
*   **Diferencia clave con Active Directory:** Los usuarios creados con estos comandos son **locales al servidor**, no son usuarios de dominio.

---

### **5. Virtualización y Conexiones Remotas**

*   **VirtualBox:** Es un **hipervisor** para crear y ejecutar máquinas virtuales.

*   **Conexión a Linux (SSH - Secure Shell):**
    *   **En el servidor:** Habilitar el servicio **SSH**.
    *   **Desde Windows:** Usar el cliente **PuTTY**.
    *   **Desde Linux:** Usar el comando **`ssh usuario@ip_del_servidor`**.

*   **Conexión a Windows (RDP - Remote Desktop Protocol):**
    *   **En el servidor:** Habilitar **Escritorio Remoto** en las propiedades del sistema.
    *   **Desde el cliente:** Usar la herramienta **"Conexión a Escritorio Remoto" (mstsc)**.
    *   **Requisito fundamental:** El cliente y el servidor deben tener **conectividad IP** (estar en la misma red o que las redes estén enrutadas).
