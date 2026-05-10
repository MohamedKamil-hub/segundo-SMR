# 🌐 Guía Definitiva: Servicios en Red — 2º SMR

> [!NOTE] ¿Cómo usar estos apuntes? Optimizados para **Obsidian**. Los callouts `[!IMPORTANT]` son definiciones clave, `[!TIP]` son trucos de examen, `[!WARNING]` son errores frecuentes y `[!NOTE]` son aclaraciones técnicas. La tabla de **puertos y protocolos** y la sección de **conceptos trampa** al final son las más útiles el día del examen.

---

## Índice de Contenidos

1. [[#Bloque 0 — Modelos de Red y Conceptos Generales]]
2. [[#Bloque 1 — Tabla Maestra de Puertos y Protocolos]]
3. [[#Bloque 2 — DNS (Domain Name System)]]
4. [[#Bloque 3 — DHCP]]
5. [[#Bloque 4 — HTTP y Servidor Web Apache]]
6. [[#Bloque 5 — FTP y Transferencia de Archivos]]
7. [[#Bloque 6 — SSH y Acceso Remoto]]
8. [[#Bloque 7 — Correo Electrónico]]
9. [[#Bloque 8 — Redes: NAT, VoIP y Conceptos Básicos]]
10. [[#Bloque 9 — Streaming, Videoconferencia y Herramientas]]
11. [[#Resumen de Conceptos Trampa]]
12. [[#Confusiones típicas que hay que resolver]]
13. [[#Glosario de Siglas y Términos Clave]]

---

## Bloque 0 — Modelos de Red y Conceptos Generales

### Modelos de comunicación en red

> [!IMPORTANT] Modelo Cliente-Servidor vs Peer to Peer (P2P)

|Modelo|Descripción|
|---|---|
|**Cliente-Servidor**|Un servidor centraliza el servicio; los clientes lo solicitan. Ejemplo: web, correo, DNS.|
|**Peer to Peer (P2P)**|Todos los nodos actúan como cliente y servidor a la vez. No hay un servidor central. Ejemplo: BitTorrent.|

### ¿Qué es un servicio de red?

> [!NOTE] Servicio de red Funcionalidad ofrecida por un equipo (servidor) al resto de equipos de la red. Cada servicio escucha en un puerto y usa un protocolo concreto (DNS, DHCP, HTTP, SMTP, etc.).

---

## Bloque 1 — Tabla Maestra de Puertos y Protocolos

> [!IMPORTANT] Memoriza esta tabla — es la base de al menos 20 preguntas del examen

| Puerto   | Protocolo            | Descripción                                   |
| -------- | -------------------- | --------------------------------------------- |
| **20**   | FTP (datos)          | Canal de datos FTP (modo activo)              |
| **21**   | FTP (control)        | Canal de control FTP                          |
| **22**   | **SSH / SFTP / SCP** | Acceso remoto cifrado y transferencia segura  |
| **23**   | Telnet               | Acceso remoto SIN cifrado (obsoleto)          |
| **25**   | SMTP                 | Envío de correo entre servidores              |
| **53**   | DNS                  | Resolución de nombres de dominio              |
| **80**   | HTTP                 | Web sin cifrar                                |
| **110**  | POP3                 | Recepción de correo (sin SSL)                 |
| **119**  | NNTP                 | Grupos de noticias (Usenet)                   |
| **143**  | IMAP                 | Correo sincronizado (sin SSL)                 |
| **443**  | HTTPS                | Web con cifrado TLS                           |
| **465**  | SMTPS                | SMTP con SSL directo                          |
| **554**  | RTSP                 | Control de sesiones de streaming (cámaras IP) |
| **587**  | SMTP Submission      | Envío de correo desde clientes (STARTTLS)     |
| **993**  | IMAP seguro (SSL)    | IMAP con cifrado SSL                          |
| **995**  | POP3 seguro (SSL)    | POP3 con cifrado SSL                          |
| **1935** | RTMP                 | Ingesta/transmisión de vídeo en directo       |
| **3389** | RDP                  | Escritorio remoto Windows                     |
| **5060** | SIP                  | VoIP — señalización de llamadas               |
| **5900** | VNC                  | Control remoto gráfico                        |
| **6667** | IRC                  | Chat clásico por canales                      |

> [!TIP] Truco para recordar los puertos de correo seguro
> 
> - POP3: 110 → seguro: **995** (+885)
> - IMAP: 143 → seguro: **993** (+850)
> - SMTP: 25 → con SSL: **465** / con STARTTLS: **587**

> [!TIP] Reglas rápidas para recordar puertos
> 
> |Si pienso en...|Debo recordar...|
> |---|---|
> |Web normal|**HTTP 80**|
> |Web segura|**HTTPS 443**|
> |Administración remota segura|**SSH 22**|
> |Enviar correo moderno|**Puerto 587**|
> |Streaming en directo|**RTMP 1935**|
> |Cámaras IP|**RTSP 554**|

---

## Bloque 2 — DNS (Domain Name System)

### ¿Qué es el DNS?

> [!IMPORTANT] Función del DNS **Traduce nombres de dominio en direcciones IP** (y viceversa). Sin DNS, habría que memorizar IPs numéricas para cada web. Es la "agenda telefónica" de Internet.

---

### Jerarquía del DNS

```
                    . (Punto raíz — Servidores Raíz)
                    │
          .com   .org   .net   .es  ...  (TLD — Top Level Domain)
                    │
           ejemplo.com   (Dominio de segundo nivel)
                    │
          www.ejemplo.com  (Subdominio)
```

|Nivel|Nombre|Ejemplo|
|---|---|---|
|**Raíz**|**Servidores Raíz** (nivel más alto)|Los 13 servidores raíz mundiales|
|**TLD**|Top Level Domain|.com, .org, .es, .net|
|**2º nivel**|Dominio registrado|ejemplo.com|
|**Subdominio**|Creado por el administrador|www.ejemplo.com|

> [!TIP] "Nivel más alto" = Servidores Raíz, no los TLD Los servidores raíz están por encima de los TLD (.com, .es...). Son el componente en el nivel **más alto** de la jerarquía DNS.

---

### Tipos de Consultas DNS

|Tipo|Descripción|
|---|---|
|**Recursiva**|El servidor DNS hace todas las consultas necesarias hasta tener la **IP final** y devuelve **una respuesta definitiva** (el dato final o un error). El cliente solo pregunta una vez.|
|**Iterativa**|El servidor devuelve la **IP más conveniente que conoce** (referencia a otro servidor) pero **no la final**. El cliente va preguntando a cada servidor hasta obtener la respuesta.|
|**Inversa**|De IP → nombre de dominio. Usa registros PTR.|

> [!TIP] Diferencia Recursiva vs Iterativa
> 
> - **Recursiva** = el DNS trabaja por ti, te da la respuesta definitiva. El cliente "descansa".
> - **Iterativa** = el DNS te dice "pregunta a este otro". El cliente hace el trabajo de ir de servidor en servidor.

---

### Registros DNS

> [!IMPORTANT] Tipos de registros DNS — MUY preguntados

| Registro  | Función                                                                                           |
| --------- | ------------------------------------------------------------------------------------------------- |
| **A**     | **Nombre de dominio → dirección IPv4** (el más básico)                                            |
| **AAAA**  | Nombre de dominio → dirección IPv6                                                                |
| **CNAME** | **Alias** o nombre alternativo para un host existente                                             |
| **MX**    | Indica **qué servidor de correo** gestiona el dominio, que servidor recibe correo para el dominio |
| **NS**    | **Identifica los servidores DNS** autoritativos de la zona                                        |
| **PTR**   | IP → nombre (resolución **inversa**)                                                              |
| **TXT**   | Texto libre. Usado para SPF, DKIM, verificaciones                                                 |
| **SOA**   | Start of Authority: **datos de autoridad** de la zona (primer registro de cualquier zona)         |
| **SRV**   | Localización de servicios específicos                                                             |

> [!TIP] Truco de examen — Registros DNS
> 
> - "IPv4 → nombre" → registro **A**
> - "Alias / nombre alternativo" → **CNAME**
> - "Servidor de correo" → **MX**
> - "Servidores DNS de la zona" → **NS**
> - "Resolución inversa (IP a nombre)" → **PTR**
> - "Datos de autoridad de la zona" → **SOA**

---

### Funcionalidades DNS Avanzadas

| Funcionalidad                    | Descripción                                                                                                    |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| **DNS Dinámico**                 | Actualiza registros DNS **automáticamente cuando cambia la IP** del servidor                                   |
| **DNSSEC**                       | Añade **firmas criptográficas** a los registros DNS para garantizar que las respuestas no han sido manipuladas |
| **Transferencia de zona (AXFR)** | Copia la base de datos de zona completa del servidor primario al secundario                                    |
| **Reenviadores (Forwarders)**    | El servidor DNS **envía consultas externas** a otro servidor DNS (ej: al de Google 8.8.8.8)                    |
| **Reenvío condicional**          | Reenvía consultas de dominios específicos a servidores concretos                                               |

> [!NOTE] TTL (Time To Live) en DNS Tiempo durante el cual una respuesta DNS puede estar en caché. No confundir con el tiempo de concesión DHCP.

---

### Seguridad en el Correo — Registros DNS Especializados

| Registro        | Función                                                                              |
| --------------- | ------------------------------------------------------------------------------------ |
| **SPF** (TXT)   | Indica qué **IPs están autorizadas** para enviar correo en nombre del dominio        |
| **DKIM** (TXT)  | Añade una **firma criptográfica al cuerpo del mensaje**                              |
| **DMARC** (TXT) | **Combina SPF y DKIM** para indicar qué hacer con correos que fallan la verificación |

> [!TIP] Truco SPF vs DKIM vs DMARC
> 
> - **SPF** = "¿viene de una IP autorizada?" (verifica el origen)
> - **DKIM** = "¿el mensaje no fue alterado?" (firma el contenido)
> - **DMARC** = "¿qué hago si SPF o DKIM fallan?" (política de gestión)

> [!TIP] Seguir la resolución completa de un dominio El comando **`dig +trace dominio`** muestra el camino de la consulta desde los servidores raíz hasta la respuesta final, ayudando a depurar problemas de delegación DNS.

---

## Bloque 3 — DHCP

### ¿Qué es DHCP?

> [!IMPORTANT] DHCP (Dynamic Host Configuration Protocol) Protocolo que **asigna automáticamente configuración de red** a los clientes: IP, máscara de subred, puerta de enlace y servidor DNS.

---

### El Proceso DORA

> [!IMPORTANT] El proceso DORA — Las 4 fases de la asignación de IP

```
CLIENTE                              SERVIDOR
   │                                     │
   │ 1. DHCP DISCOVER (broadcast)        │
   │────────────────────────────────────>│
   │                                     │
   │ 2. DHCP OFFER (propuesta de IP)     │
   │<────────────────────────────────────│
   │                                     │
   │ 3. DHCP REQUEST (acepta la oferta)  │
   │────────────────────────────────────>│
   │                                     │
   │ 4. DHCP ACK (confirmación)          │
   │<────────────────────────────────────│
```

|Mensaje|Quién lo envía|¿Qué hace?|
|---|---|---|
|**DISCOVER**|**Cliente**|"¿Hay algún servidor DHCP?" (broadcast)|
|**OFFER**|**Servidor**|"Te propongo esta configuración"|
|**REQUEST**|**Cliente**|"Acepto esa oferta"|
|**ACK**|**Servidor**|**Confirmación definitiva** de la asignación|

> [!TIP] Truco para recordar DORA **D**iscover → **O**ffer → **R**equest → **A**ck El **primer mensaje** lo envía siempre el **cliente** (DISCOVER). La **confirmación definitiva** es el **ACK** del servidor.

> [!NOTE] ¿Qué pasa si expira la concesión? Si el cliente no puede **renovar** su concesión DHCP antes de que expire, **pide una nueva IP** iniciando el proceso desde DISCOVER.

---

### Conceptos DHCP Clave

| Concepto              | Definición                                                                                                                                                                                                                                                   |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Concesión (Lease)** | **Tiempo durante el cual el cliente puede usar la IP** asignada                                                                                                                                                                                              |
| **Reserva**           | **Asociación permanente** de una IP específica a una dirección **MAC** (siempre la misma IP). La MAC es el parámetro que usa DHCP para identificar al equipo en una reserva. DORA seguira ocurriendo pero siempre recibiras la misma IP vbasandose en tu MAC |
| **Rango (Scope)**     | Rango de IPs disponibles para asignar                                                                                                                                                                                                                        |
| **Exclusión**         | IPs dentro del rango que NO se asignan (ej: IPs de servidores estáticos)                                                                                                                                                                                     |

> [!TIP] Reserva DHCP vs IP estática
> 
> - **IP estática**: configurada manualmente en el dispositivo
> - **Reserva DHCP**: el servidor DHCP siempre asigna la misma IP basándose en la **MAC** del dispositivo

---

### Parámetros de Red que Asigna DHCP

|Parámetro|Función|
|---|---|
|**Dirección IP**|Identifica el dispositivo en la red|
|**Máscara de subred**|**Determina qué parte es red y qué parte es host**|
|**Puerta de enlace (Gateway)**|**Salida de la red local hacia el exterior**|
|**Servidor DNS**|Para resolver nombres de dominio|

---

### DHCP y arranque PXE

> [!NOTE] Arranque PXE Protocolo que permite a los clientes **obtener una IP antes de cargar el sistema operativo**, arrancando desde la red. Usado para instalar SO de forma remota.

---

## Bloque 4 — HTTP y Servidor Web Apache

### El Protocolo HTTP

> [!IMPORTANT] HTTP — HyperText Transfer Protocol **La base del funcionamiento de la web**. Define cómo los navegadores (clientes) se comunican con los servidores web. HTTP va por el puerto **80** (texto claro); HTTPS por el **443** (cifrado TLS).

---

### Métodos HTTP

|Método|Función|
|---|---|
|**GET**|Solicitar/descargar un recurso|
|**POST**|**Enviar datos** al servidor (formularios, login)|
|**PUT**|**Actualizar/modificar** un recurso existente|
|**DELETE**|**Eliminar** un recurso|
|**HEAD**|Solicitar **solo las cabeceras** de un recurso (sin el cuerpo)|
|**OPTIONS**|Preguntar qué métodos acepta el servidor|

> [!TIP] Truco GET vs POST
> 
> - **GET** = pides algo al servidor (lo recibes)
> - **POST** = envías datos al servidor (formulario, inicio de sesión)
> - **HEAD** = como GET pero **sin el contenido**, solo las cabeceras

---

### Códigos de Estado HTTP

|Rango|Significado|Ejemplos clave|
|---|---|---|
|**2xx**|**Éxito**|**200** = OK (respuesta correcta, petición completada con éxito)|
|**3xx**|**Redirección**|**301** = Redirección permanente|
|**4xx**|**Error del cliente**|**404** = Recurso no encontrado; 403 = Prohibido|
|**5xx**|**Error del servidor**|**500** = Error interno del servidor|

> [!TIP] Truco para recordar los códigos
> 
> - **200** = todo bien ✅
> - **301** = "se ha movido permanentemente"
> - **404** = "no encontrado" (el más famoso). Un 404 NO significa "no hay Internet": significa que ese recurso concreto no se ha encontrado.
> - **5xx** = culpa del **servidor** (no del cliente)

---

### Tipos MIME

> [!IMPORTANT] MIME (Multipurpose Internet Mail Extensions) Estándar que define el **formato de los correos y adjuntos**, y también el tipo de contenido en HTTP.

|Tipo MIME|Contenido|
|---|---|
|`text/html`|Página web HTML|
|`application/json`|**Datos JSON** (APIs)|
|`image/png`|Imagen PNG|
|`video/mp4`|Vídeo MP4|
|`application/pdf`|Documento PDF|

---

### Cabeceras HTTP Clave

|Cabecera|Dirección|Función|
|---|---|---|
|**Host**|Request → servidor|**Obligatoria para Virtual Hosts**: identifica el dominio destino|
|**Set-Cookie**|Respuesta → cliente|Le indica al navegador que **guarde una cookie**|
|**Cookie**|Request → servidor|Envía las cookies guardadas al servidor|
|**Content-Type**|Ambas|Tipo MIME del contenido|
|**User-Agent**|Request → servidor|Identifica el navegador/cliente|

---

### Cookies — Atributos de Seguridad

|Atributo|Función|
|---|---|
|**HttpOnly**|**Impide que JavaScript acceda** a la cookie (protege contra XSS)|
|**Secure**|Solo se envía por **HTTPS** (nunca por HTTP)|
|**SameSite**|Controla si la cookie se envía en peticiones cross-site|
|**Domain**|Define el dominio que puede recibir la cookie|

> [!TIP] Pregunta típica de cookies ¿Qué atributo asegura que una cookie solo se envía por HTTPS? → **Secure**

---

### Apache — Servidor Web

> [!IMPORTANT] Apache HTTP Server El servidor web más extendido en Linux. Gestiona las peticiones HTTP/HTTPS.

**Archivos y directorios clave de Apache:**

```
/etc/apache2/apache2.conf     ← Configuración principal (Debian/Ubuntu)
/etc/apache2/sites-available/ ← Definición de Virtual Hosts, archivos de configuracion disponibles
/etc/apache2/sites-enabled/   ← Virtual Hosts activos (enlaces simbólicos)
/var/www/html/                ← Directorio raíz de documentos (DocumentRoot por defecto)
/var/log/apache2/             ← Logs de acceso y errores
.htaccess                     ← Reglas locales por directorio
```

> [!WARNING] El .htaccess El archivo `.htaccess` permite definir **reglas locales** (redirecciones, contraseñas, restricciones) **por directorio**, sin necesidad de modificar la configuración principal del servidor.

**Comandos esenciales de Apache:**

```bash
# Comprobar sintaxis de la configuración
apachectl configtest

# Reiniciar Apache
systemctl restart apache2

# Ver estado de Apache
systemctl status apache2

# Activar un sitio
a2ensite mi-sitio.conf

# Activar un módulo
a2enmod ssl
a2enmod rewrite
```

**Directivas y módulos clave de Apache:**


| Elemento         | Función                                                                                                                                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `DocumentRoot`   | **Directiva que define la carpeta raíz** donde se sirven los archivos del sitio POR EJEMPLO PODRIA SER VAR/WWW/TIENDA si tu pagina se llama tienda.com  es para el contenido que ve el usuario |
| `ServerName`     | Nombre del dominio del Virtual Host, el dominio que escribe el  ckiente                                                                                                                        |
| `VirtualHost`    | Bloque que define un sitio virtual contiene el server name y  su document root                                                                                                                 |
| `DirectoryIndex` | Archivo por defecto al acceder a un directorio                                                                                                                                                 |
| **mod_status**   | Módulo para **monitorizar estado y rendimiento** de Apache                                                                                                                                     |
| **mod_ssl**      | **Activa HTTPS** en Apache                                                                                                                                                                     |
| **mod_rewrite**  | Reescritura de URLs                                                                                                                                                                            |
| **mod_cache**    | Caché de contenidos                                                                                                                                                                            |


`<VirtualHost *:80>`
    `ServerName tienda.com`
    `DocumentRoot /var/www/tienda`
`</VirtualHost>`

`<VirtualHost *:80>`
    `ServerName blog.com`
    `DocumentRoot /var/www/blog`
`</VirtualHost>`

**Logs de Apache detallados:**

- `access.log` → Registra **cada petición HTTP recibida** (IP, fecha, método, código de respuesta, User‑Agent…). Fundamental para auditoría y solución de errores 404/500.
- `error.log` → Contiene errores de arranque, módulos y fallos internos.

> [!TIP] Preguntas típicas de Apache
> 
> |Pregunta|Respuesta|
> |---|---|
> |Archivo principal de Apache en Debian/Ubuntu|`/etc/apache2/apache2.conf`|
> |Directiva de carpeta raíz web|`DocumentRoot`|
> |Módulo para monitorizar Apache|`mod_status`|
> |Log de peticiones recibidas|`access.log`|

---

### Virtual Hosts y HTTPS en Apache

> [!IMPORTANT] Virtual Hosts Permiten servir **múltiples sitios web desde un mismo servidor** con una sola IP. La cabecera HTTP `Host` identifica qué sitio debe responder.

**Certbot — Certificados HTTPS gratuitos:**

> [!IMPORTANT] Certbot Herramienta para obtener **certificados TLS gratuitos de Let's Encrypt** e instalarlos automáticamente en Apache o Nginx.

```bash
# Instalar certificado con Certbot para Apache
certbot --apache -d mi-dominio.com

# Verificar certificado TLS desde terminal
openssl s_client -connect mi-dominio.com:443
```

---

### Nginx — Servidor web y streaming

> [!IMPORTANT] Nginx Servidor web alternativo a Apache, también usado como proxy inverso, balanceador de carga o servidor de streaming.

|Elemento|Función|
|---|---|
|`/etc/nginx/nginx.conf`|Archivo principal de configuración de Nginx.|
|**Módulo RTMP**|Permite **convertir Nginx en una plataforma de streaming**.|
|**Gzip**|Compresión de contenido para reducir el ancho de banda.|
|**SSL/TLS**|Configuración de conexiones seguras (HTTPS).|

> [!TIP] Pregunta típica ¿Qué módulo de Nginx permite convertirlo en servidor de streaming? → **Módulo RTMP**.

---

## Bloque 5 — FTP y Transferencia de Archivos

### Comparativa de Protocolos de Transferencia

> [!IMPORTANT] FTP vs FTPS vs SFTP vs SCP

|Protocolo|Puerto|Cifrado|Base|Característica|
|---|---|---|---|---|
|**FTP**|21 (ctrl), 20 (datos)|❌ **NO**|FTP puro|El más antiguo, inseguro|
|**FTPS**|21 (implícito)|✅ **TLS/SSL**|FTP + TLS|FTP con capa SSL/TLS|
|**SFTP**|**22**|✅ **SSH**|**SSH**|Integrado con SSH, seguro|
|**SCP**|**22**|✅ **SSH**|**SSH**|Copia rápida, **sin navegación**|

> [!TIP] SFTP vs SCP — ¿cuál es cuál?
> 
> - **SFTP** = explorador de archivos remoto completo sobre SSH (puede listar, borrar, crear carpetas...)
> - **SCP** = solo copia archivos de A a B sobre SSH. No permite navegar por el sistema remoto.
> 
> Ambos usan el **puerto 22**. Si el examen dice "transferencia de archivos sobre SSH sin navegación" → **SCP**.

> [!WARNING] FTP no cifra NADA FTP transmite usuario, contraseña y archivos en **texto plano**. Es el único protocolo de transferencia que "no cifra por defecto".

---

### Modos FTP: Activo vs Pasivo

> [!IMPORTANT] Modo Activo vs Pasivo en FTP
> 
> ||**FTP Activo**|**FTP Pasivo**|
> |---|---|---|
> |¿Quién abre el canal de datos?|**El servidor** se conecta al cliente|**El cliente** abre ambos canales|
> |Problema|El cliente debe aceptar conexiones entrantes (problemático con firewalls)|El cliente inicia siempre → **compatible con firewalls**|
> |**Recomendado**|❌ Menos recomendable|✅ **Recomendable**|
> |Puertos extra|Firewall debe abrir puertos en el **cliente**|Firewall debe abrir **rango de puertos pasivos** en el servidor|

> [!TIP] Pregunta trampa: FTP pasivo y firewalls En redes con firewall, se recomienda **modo pasivo** porque el cliente siempre inicia las conexiones (no hay conexiones entrantes hacia el cliente que el firewall pueda bloquear).

---

### vsftpd — Servidor FTP en Linux

> [!IMPORTANT] vsftpd (Very Secure FTP Daemon) Software de Linux considerado un servidor FTP **muy seguro y ligero**.

**Archivo de configuración:** `/etc/vsftpd.conf` **Logs:** `/var/log/vsftpd.log`

**Directivas clave de vsftpd:**

```ini
# Desactivar acceso anónimo (recomendado en entornos corporativos)
anonymous_enable=NO

# Permitir usuarios locales del sistema
local_enable=YES

# Permitir escritura
write_enable=YES

# Encerrar a los usuarios en su directorio (CHROOT JAIL)
chroot_local_user=YES

# Activar cifrado SSL/TLS (FTPS)
ssl_enable=YES
```

|Parámetro / concepto|Función|
|---|---|
|`anonymous_enable`|Permite o bloquea accesos anónimos.|
|`local_enable`|Permite usuarios locales.|
|`write_enable`|Permite operaciones de escritura.|
|`ssl_enable`|Activa soporte SSL/TLS.|
|**Chroot jail**|Aísla al usuario dentro de un directorio.|

**Tipos de usuarios FTP en vsftpd:**

|Tipo|Descripción|
|---|---|
|**Anónimo**|Acceso sin credenciales (desactivar en producción)|
|**Local**|Usuarios reales del sistema Linux|
|**Virtual**|**NO existen como cuenta del sistema** — solo en la BD de vsftpd|

> [!TIP] Usuario Virtual en vsftpd Los usuarios **virtuales** son cuentas FTP que **no existen como cuenta del sistema operativo**. Son más seguros porque si se compromete la cuenta FTP, no hay acceso al sistema.

**Chroot jail en FTP:**

> La técnica **chroot jail** (también llamada jaula) **aísla al usuario dentro de su directorio personal**, impidiendo que navegue por el resto del sistema de archivos.

**Cuotas FTP:**

> Permiten **limitar el uso de disco** por usuario para evitar que un solo usuario llene el servidor.

> [!TIP] Preguntas típicas de vsftpd
> 
> |Pregunta|Respuesta|
> |---|---|
> |¿Qué parámetro debe desactivarse por seguridad corporativa?|`anonymous_enable`|
> |¿Cómo se llama el entorno aislado donde vsftpd limita a usuarios?|**Chroot jail**|

---

## Bloque 6 — SSH y Acceso Remoto

### SSH — Acceso Remoto Seguro

> [!IMPORTANT] SSH (Secure Shell) Protocolo que permite **conexiones remotas cifradas** al puerto **22**. Reemplazó a Telnet (que transmitía todo en texto plano).

---

### Archivos SSH Importantes

|Archivo|Ubicación|Función|
|---|---|---|
|`sshd_config`|`/etc/ssh/sshd_config`|**Configuración del servidor SSH**|
|`ssh_config`|`/etc/ssh/ssh_config`|Configuración del cliente SSH|
|`authorized_keys`|`~/.ssh/authorized_keys`|**Claves públicas autorizadas** para conectarse al servidor|
|`known_hosts`|`~/.ssh/known_hosts`|**Identifica servidores conocidos** (evita ataques MITM)|
|`id_rsa` / `id_ed25519`|`~/.ssh/`|Clave privada del cliente|
|`id_rsa.pub`|`~/.ssh/`|Clave pública del cliente|

---

### Comandos SSH Esenciales

```bash
# Generar par de claves
ssh-keygen -t ed25519 -C "comentario"

# Copiar clave pública al servidor (para acceso sin contraseña)
ssh-copy-id usuario@servidor

# Conectar con clave específica
ssh -i ~/.ssh/mi_clave usuario@servidor

# Conectar a puerto distinto
ssh -p 2222 usuario@servidor
```

---

### Directivas de Seguridad en sshd_config

```ini
# Prohibir acceso root por red (muy importante)
PermitRootLogin no

# Desactivar autenticación por contraseña (solo claves)
PasswordAuthentication no

# Cambiar el puerto por defecto
Port 2222

# Limitar qué usuarios pueden conectarse
AllowUsers usuario1 usuario2
```

> [!IMPORTANT] PermitRootLogin no La directiva más importante de seguridad SSH. **Impide el acceso directo del administrador (root) por red**, obligando a conectarse con un usuario normal y luego elevar privilegios.

---

### Túneles SSH

> [!IMPORTANT] Los 3 tipos de túneles SSH

|Tipo|Flag|Función|
|---|---|---|
|**Local** (-L)|`ssh -L`|**Expone un puerto remoto como si fuera local**. "Traigo" un servicio remoto a mi máquina.|
|**Inverso / Remoto** (-R)|`ssh -R`|**Expone un puerto local hacia el servidor remoto**. "Publico" mi servicio local en el servidor.|
|**Dinámico** (-D)|`ssh -D`|Crea un **proxy SOCKS** que enruta todo el tráfico a través del servidor SSH.|

> [!TIP] Truco para recordar los túneles
> 
> - **Local (-L)** = el puerto "llega" a mi máquina LOCAL desde el remoto
> - **Inverso (-R)** = expongo algo desde mi máquina REMOTA (inverso al flujo normal)
> - **Dinámico (-D)** = proxy completo (como una mini-VPN)

---

### Otros Protocolos de Acceso Remoto

|Protocolo|Puerto|Cifrado|Sistema|Notas|
|---|---|---|---|---|
|**RDP**|**3389**|✅ TLS + NLA|Windows|Protocolo **propietario de Microsoft**, interfaz gráfica completa|
|**VNC**|5900|❌ (nativo no)|Multiplataforma|Usa protocolo **RFB**; **no cifra de forma nativa**|
|**SSH**|22|✅|Linux/Mac|Terminal; sin interfaz gráfica|
|**Telnet**|23|❌|Obsoleto|Texto plano, reemplazado por SSH|

> [!IMPORTANT] NLA en RDP La **autenticación NLA** (Network Level Authentication) **mejora la seguridad de RDP** autenticando al usuario antes de establecer la sesión gráfica. Evita que atacantes lleguen a la pantalla de login sin credenciales.

> [!WARNING] RDP expuesto a Internet El puerto 3389 expuesto directamente a Internet es un **vector de ataque crítico**. Recibe ataques automatizados de bots constantemente. Nunca exponer sin VPN o restricción de IPs.

> [!WARNING] VNC sin cifrado VNC **no cifra la comunicación de forma nativa**. Su principal desventaja frente a SSH o RDP. Se debe usar siempre a través de un túnel SSH.

---

## Bloque 7 — Correo Electrónico

### Los Agentes del Correo

> [!IMPORTANT] Los 3 tipos de agentes en el sistema de correo
> 
> |Agente|Nombre|Función|Software|
> |---|---|---|---|
> |**MUA**|Mail User Agent|**Cliente de correo usado por el usuario** (interfaz: leer y escribir correo)|Thunderbird, Outlook, **Roundcube** (webmail)|
> |**MTA**|Mail Transfer Agent|**Transfiere mensajes entre servidores**|**Postfix**, Sendmail, Exim|
> |**MDA**|Mail Delivery Agent|**Deposita el mensaje en el buzón final** del destinatario|**Dovecot**, Procmail|

> [!TIP] Truco para recordar MUA/MTA/MDA
> 
> - **MUA** = lo que usa el **U**suario (cliente de correo)
> - **MTA** = lo que **T**ransfiere (entre servidores, el "cartero")
> - **MDA** = lo que hace la entrega final en el bu**zón** (mailbo**x**)

> [!NOTE] El buzón El **buzón** se accede mediante **IMAP/POP3**. Dovecot es el software más típico que ofrece este acceso.

> [!TIP] Preguntas típicas — Arquitectura de correo
> 
> |Pregunta|Respuesta|
> |---|---|
> |¿Qué protocolo se usa exclusivamente para envío o reenvío de correos?|**SMTP**|
> |¿Qué componente deposita el mensaje en el buzón final?|**MDA**|
> |¿Qué nombre recibe el cliente de correo usado por el usuario?|**MUA**|
> |¿Qué servidor permite acceso a buzones POP3/IMAP?|**Dovecot**|
> |¿Qué registro DNS identifica servidores de correo?|**MX**|
> 
> _"MX localiza servidores de correo; SMTP envía; MDA entrega; IMAP/POP3 permiten acceder."_

---

### Protocolos de Correo

> [!IMPORTANT] SMTP vs POP3 vs IMAP

|Protocolo|Puerto|Función|
|---|---|---|
|**SMTP**|25 (servidor-servidor), 587 (Submission con STARTTLS), 465 (SSL directo)|**Envío** de correo (cliente → servidor; servidor → servidor)|
|**POP3**|110 (sin SSL), 995 (con SSL)|**Descarga** los mensajes del servidor (pensado para descargar, suele eliminarlos)|
|**IMAP**|143 (sin SSL), 993 (con SSL)|**Mantiene sincronizadas carpetas, leídos, enviados y estados** entre varios dispositivos|

> [!TIP] Diferencia POP3 vs IMAP
> 
> ||POP3|IMAP|
> |---|---|---|
> |**Qué hace**|Descarga el correo y lo elimina del servidor|Sincroniza carpetas en el servidor|
> |**Ventaja**|Menor uso del servidor|**Sincronización centralizada** (acceso desde múltiples dispositivos)|
> |**Desventaja**|Si se pierde el dispositivo, se pierde el correo|Requiere más espacio en servidor|

> [!WARNING] SMTP — STARTTLS vs SMTPS
> 
> - Puerto **25** = comunicación entre servidores (puede ser sin cifrar)
> - Puerto **587** = **SMTP Submission** con **STARTTLS** (cifrado negociado, recomendado para envío autenticado desde clientes modernos)
> - Puerto **465** = **SMTPS**, envío con **SSL directo** (cifrado desde el inicio)

> [!TIP] Preguntas típicas IMAP/SMTP
> 
> |Pregunta|Respuesta|
> |---|---|
> |¿Cuál es la principal ventaja de IMAP frente a POP3?|Sincronización de carpetas en múltiples dispositivos|
> |¿Qué puerto se recomienda para envío autenticado y cifrado mediante STARTTLS?|**587**|

---

### Formato de Buzones

|Formato|Descripción|
|---|---|
|**mbox**|Todos los correos en un único archivo de texto|
|**Maildir**|**Cada correo es un archivo independiente** dentro de una carpeta|

> [!NOTE] Maildir es más moderno y robusto Al ser cada correo un archivo independiente, Maildir permite acceso concurrente y no se corrompe si falla a mitad de escritura.

---

### Software de Correo en Linux

|Software|Tipo|Función|
|---|---|---|
|**Postfix**|MTA|Servidor de envío/transferencia de correo|
|**Exim / Sendmail**|MTA|Alternativas a Postfix|
|**Dovecot**|MDA|Entrega de correo en buzones; también servidor IMAP/POP3|
|**SpamAssassin**|Filtro|**Filtra correo no deseado** por puntuación|
|**ClamAV**|Antivirus|Analiza correos en busca de malware|
|**Roundcube**|MUA/Webmail|**Cliente de correo web** (interfaz gráfica en el navegador)|
|**Thunderbird / Outlook**|MUA|Clientes de correo de escritorio|

**Logs de correo:**

```bash
# Ver problemas de envío de correo
tail -f /var/log/mail.log

# Ver estado de Postfix
systemctl status postfix
```

---

### MIME en Correo

> [!IMPORTANT] MIME (Multipurpose Internet Mail Extensions) Estándar que **define el formato de los correos electrónicos y adjuntos**. Sin MIME, el correo solo podría enviar texto ASCII puro. MIME permite adjuntos, imágenes, HTML, etc.

---

### Cifrado de Correo

|Tecnología|Nivel de cifrado|Descripción|
|---|---|---|
|**TLS / STARTTLS**|Canal de comunicación|Cifra el **canal** entre cliente y servidor (como HTTPS para el correo)|
|**S/MIME o GPG**|Contenido del mensaje|**Cifra el cuerpo del mensaje extremo a extremo** (el canal puede ser inseguro; el mensaje no)|

> [!TIP] TLS vs S/MIME — diferencia clave
> 
> - **TLS** = cifra el "tubo" por donde viaja el correo (el canal)
> - **S/MIME o GPG** = cifra el "contenido" del sobre (el mensaje en sí) Para **cifrado extremo a extremo** → S/MIME o GPG

---

## Bloque 8 — Redes: NAT, VoIP y Conceptos Básicos

### Parámetros Básicos de Red

|Parámetro|Función|
|---|---|
|**Dirección IP**|Identifica un dispositivo en la red|
|**Máscara de subred**|**Determina qué parte de la IP es red y cuál es host**|
|**Pasarela / Gateway**|**Salida de la red local hacia el exterior** (router)|
|**Servidor DNS**|Resuelve nombres de dominio|
|**Dirección MAC**|Identificador físico único de la tarjeta de red|

> [!NOTE] RFC 1918 — Rangos de IPs Privadas El RFC 1918 define los rangos de **direcciones IP privadas** (no enrutables por Internet):
> 
> - `10.0.0.0/8`
> - `172.16.0.0/12`
> - **`192.168.0.0/16`** (la más común en redes domésticas)

---

### NAT, Gateway y Proxy: no son lo mismo

> [!IMPORTANT] NAT, Gateway y Proxy
> 
> |Concepto|Explicación|
> |---|---|
> |**NAT**|Traduce direcciones privadas a una dirección pública.|
> |**IP privada**|Dirección usada dentro de la red local.|
> |**IP pública**|Dirección visible en Internet.|
> |**Gateway**|Punto de salida de una red local hacia redes externas.|
> |**Proxy**|Intermediario que puede filtrar, registrar o cachear navegación.|
> |**Squid**|Software proxy común para control y caché web.|
> 
> _"El gateway es la puerta de salida, NAT traduce direcciones y el proxy intermedia la navegación."_

**Esquema de funcionamiento:**

`LAN (IPs privadas)` → `Gateway / NAT (salida y traducción)` → `Internet (IP pública)`

#### Tipos de NAT

|Tipo de NAT|Función|
|---|---|
|**SNAT** (Source NAT)|Equipos internos **salen a Internet** (la fuente/origen cambia). Tú **sales**.|
|**DNAT** (Destination NAT) / Port Forwarding|**Exponer un servidor interno** a Internet mapeando un puerto externo a una IP interna. Tú **no sales**, el mundo viene hacia ti.|
|**PAT** (Port Address Translation)|Variante de SNAT donde se usa también el puerto (permite múltiples IPs internas con una sola IP pública).|

> [!TIP] SNAT vs DNAT
> 
> - **SNAT** = tráfico de dentro → fuera (el origen cambia). Usado para navegar por Internet desde una red privada.
> - **DNAT / Port Forwarding** = tráfico de fuera → dentro (el destino cambia). Usado para publicar un servidor web interno.

> [!TIP] Preguntas típicas — Salida a Internet
> 
> |Pregunta|Respuesta|
> |---|---|
> |¿Qué tecnología permite que varios equipos compartan una única IP pública?|**NAT**|
> |¿Cuál es la función principal de una pasarela?|Actuar como punto de salida hacia redes externas|
> |¿Qué software se usa como servidor proxy común?|**Squid**|

> [!IMPORTANT] Activar reenvío IPv4 en Linux Para que un Linux actúe como router (reenvíe paquetes entre interfaces):
> 
> ```bash
> sysctl -w net.ipv4.ip_forward=1
> ```

---

### Squid — Proxy y Caché Web

> [!IMPORTANT] Squid Servidor **proxy intermedio** que actúa como **caché de contenidos web**. Los clientes hacen sus peticiones a Squid, y este las sirve desde su caché o las reenvía al destino.
> 
> - **Ahorro de ancho de banda**: las páginas ya visitadas se sirven localmente.
> - **Control de acceso**: filtra por dominio, IP, horario, etc.
> - **Logs detallados**: registra todas las peticiones, útil para auditoría (similar a `access.log` pero centralizado).

---

### VoIP (Voice over IP)

> [!IMPORTANT] VoIP Tecnología que permite **enviar voz y vídeo a través de redes IP** (Internet). Sustituye a la telefonía tradicional.

#### Protocolos VoIP

|Protocolo|Puerto|Función|
|---|---|---|
|**SIP** (Session Initiation Protocol)|**5060**|**Señalización**: establece, modifica y finaliza llamadas|
|**RTP** (Real-Time Protocol)|Dinámico|**Transporta el audio y vídeo en tiempo real**|
|**SRTP**|Dinámico|RTP con **cifrado** (Secure RTP)|

> [!TIP] SIP vs RTP
> 
> - **SIP** controla la llamada (señalización — la establece)
> - **RTP** transporta la voz y el vídeo (una vez establecida la llamada)

---

#### Codecs VoIP

|Codec|Calidad / uso|
|---|---|
|**G.711**|**Buena calidad** similar a telefonía fija, sin compresión. Consume más ancho de banda.|
|**G.729**|Adecuado para conexiones con **poco ancho de banda** por su alta compresión.|
|**Opus**|Alta calidad **adaptativa**. Muy adecuado para **WebRTC y videollamadas modernas**.|
|MP3|Códec de audio general, **no específico para VoIP profesional**.|

> [!TIP] Truco de examen — Codecs VoIP
> 
> - "Alta calidad, sin compresión, similar a telefonía fija" → **G.711**
> - "Poco ancho de banda" → **G.729**
> - "Adaptativo / WebRTC" → **Opus**

---

#### Componentes de una Infraestructura VoIP

|Componente|Función|
|---|---|
|**PBX IP**|Centralita digital que **gestiona las extensiones internas**|
|**Asterisk**|Software **open source** más popular para implementar una PBX IP en Linux|
|**FreePBX**|Solución con **interfaz web** basada en Asterisk|
|**Softphone**|Teléfono por software (app en PC o móvil)|
|**Servidor SIP Proxy**|**Encamina las peticiones SIP** entre los clientes|
|**SIP Trunk**|**Enlace entre la centralita y el operador** de telecomunicaciones|
|**Codec**|**Comprime y descomprime la voz** para enviarla por la red|
|**Gateway VoIP**|Conecta la red IP con la telefonía tradicional (PSTN)|

> [!NOTE] H.323 — El abuelo de SIP Protocolo de señalización VoIP **anterior a SIP** y todavía presente en algunos sistemas heredados. Define el control de llamadas, el formato de audio/vídeo y la gestión de ancho de banda en redes IP. Fue el estándar dominante hasta que SIP lo reemplazó por su mayor simplicidad.

---

#### Problemas de Calidad en VoIP — QoS

|Problema|Descripción|
|---|---|
|**Latencia**|Retardo excesivo en la transmisión (la voz llega tarde)|
|**Jitter**|**Variación en el retardo** de los paquetes (voz irregular)|
|**Pérdida de paquetes**|Paquetes que no llegan → huecos en la voz|
|**Eco**|Retroalimentación del audio|

> [!IMPORTANT] QoS y DSCP
> 
> - **QoS** (Quality of Service): tecnología que **prioriza el tráfico de voz sobre el de datos**. La voz es sensible al retardo → debe tener prioridad sobre la navegación web o descargas.
> - **DSCP 46**: valor recomendado para voz (**Expedited Forwarding**).

---

#### Seguridad en VoIP

|Medida|Función|
|---|---|
|**SRTP + TLS**|**SRTP** cifra la voz; **TLS** cifra la señalización SIP|
|**Firewall para VoIP**|**Evita el fraude telefónico** (toll fraud) — ataques que usan tu centralita para hacer llamadas internacionales|
|**Autenticación SIP**|Contraseñas en las extensiones SIP|

---

## Bloque 9 — Streaming, Videoconferencia y Herramientas

### Protocolos de Streaming de Vídeo

> [!IMPORTANT] ¿Qué son? Permiten transmitir vídeo y audio en tiempo real por la red. Se distinguen por cómo envían los datos y el control sobre la reproducción.

|Protocolo|Puerto por defecto|Características|
|---|---|---|
|**HLS** (HTTP Live Streaming)|80/443 (HTTP)|**Divide el vídeo en pequeños fragmentos `.ts`** servidos por HTTP, con un manifiesto `m3u8` que indica el orden. Ampliamente usado en web y móviles.|
|**RTMP** (Real‑Time Messaging Protocol)|**1935**|**Ingesta o transmisión de vídeo, audio y datos en tiempo real**. Ideal para **directos** (envío al servidor). Requiere Flash o servidores especializados.|
|**RTSP** (Real‑Time Streaming Protocol)|**554**|Permite **control de sesiones** (pausa, avance, retroceso). Usado en **cámaras IP y videovigilancia**.|

> [!TIP] RTMP vs HLS vs RTSP — tres ideas diferentes
> 
> - **RTMP 1935** = **ingesta/directo** (envío al servidor, flujo que no se pausa).
> - **HLS** = **distribución en fragmentos** (el reproductor monta los `.ts`).
> - **RTSP 554** = **cámaras IP / control de sesiones** (se puede pausar).

> [!TIP] Preguntas típicas — Streaming
> 
> |Pregunta|Respuesta|
> |---|---|
> |¿En qué puerto escucha RTMP?|**1935**|
> |¿Qué característica define HLS?|Fragmentos `.ts` servidos por HTTP|
> |¿Para qué dispositivos es común RTSP?|Cámaras IP y videovigilancia|

---

### WebRTC y Open Connect

> [!IMPORTANT] WebRTC y Netflix Open Connect
> 
> - **WebRTC**: permite **audio, vídeo y comunicación en tiempo real directamente desde el navegador**, sin instalar aplicaciones. Base de muchas plataformas de videoconferencia.
> - **Netflix Open Connect**: sistema/CDN propio de Netflix para **distribuir contenido globalmente** y acercarlo a los usuarios.

> [!TIP] Preguntas típicas — WebRTC y Open Connect
> 
> |Pregunta|Respuesta|
> |---|---|
> |¿Qué tecnología permite videoconferencias desde navegador sin instalar aplicaciones?|**WebRTC**|
> |¿Cómo se llama el sistema de Netflix para distribuir contenido globalmente?|**Open Connect**|

---

### Protocolos de Comunicación Clásicos

- **NNTP** (Network News Transfer Protocol): grupos de noticias (Usenet), precursor de los foros modernos. Puerto **119**.
- **IRC** (Internet Relay Chat): **sistema clásico de chat por canales** en tiempo real, popular en los años 90/2000. Puerto **6667**. El símbolo `#` se usa habitualmente para designar canales. Carece de cifrado nativo; sustituido por plataformas como Discord o Slack.

---

### Herramientas de análisis y red

|Herramienta|Función|
|---|---|
|**Wireshark**|**Captura y analiza paquetes de red** en tiempo real.|
|**Postman**|**Prueba peticiones HTTP y APIs**.|
|**Apache**|Servidor web.|
|**Nginx**|Servidor web, proxy o streaming según configuración.|

---

### Herramientas de Red desde Terminal

|Comando|Sistema|Función|
|---|---|---|
|`ipconfig /all`|Windows|**Muestra IP, DHCP, DNS, MAC, puerta de enlace**, etc.|
|`ifconfig` / `ip a`|Linux|Muestra configuración de interfaces de red.|
|`nslookup dominio`|Windows / Linux|Consulta registros DNS.|
|`dig dominio`|Linux|**Diagnóstico DNS avanzado** (la herramienta más completa).|
|`ping`|Windows / Linux|Comprueba conectividad básica.|
|`tracert`|Windows|Muestra la ruta hasta un destino.|
|`traceroute`|Linux|Muestra la ruta hasta un destino.|
|`sysctl -w net.ipv4.ip_forward=1`|Linux|**Activa el reenvío de paquetes IPv4** (Linux como router).|
|`curl -I URL`|Linux / Windows|**Ver cabeceras HTTP** de una URL desde terminal.|
|`openssl s_client -connect host:443`|Linux|**Analizar certificados TLS**.|
|`ssh-keygen`|Linux / Windows|**Generar par de claves SSH**.|
|`ssh-copy-id`|Linux|Copiar clave pública al servidor.|
|`scp archivo usuario@host:/ruta`|Linux|Copiar archivos de forma segura por SSH.|
|`apachectl configtest`|Linux|**Comprobar sintaxis** de Apache.|
|`systemctl status postfix`|Linux|Ver estado del servidor de correo.|

> [!TIP] Preguntas típicas — Comandos de red
> 
> |Pregunta|Respuesta|
> |---|---|
> |Comando Windows para configuración IP completa|`ipconfig /all`|
> |Herramienta Linux más completa para DNS|`dig`|
> |Comando para activar reenvío IPv4|`sysctl -w net.ipv4.ip_forward=1`|
> |Comando para consultar registros DNS|`nslookup`|

---

## 🎯 Resumen de Conceptos Trampa para el Examen

> [!WARNING] Los errores más frecuentes — estudia esta tabla antes del examen

|Pregunta trampa|Opción incorrecta frecuente|Respuesta correcta|
|---|---|---|
|¿Protocolo envío correo cliente→servidor?|"IMAP" / "POP3"|**SMTP**|
|¿Puerto HTTPS?|"80" / "22"|**443**|
|¿FTP cifra datos?|"Sí, como SFTP"|**NO** — FTP no cifra nada|
|¿SFTP usa qué protocolo base?|"FTP + TLS"|**SSH** (puerto 22)|
|¿FTPS usa qué?|"SSH"|**TLS/SSL sobre FTP**|
|¿Diferencia SFTP vs SCP?|"SCP permite navegación"|**SCP solo copia; SFTP permite navegación completa**|
|¿Modo FTP recomendado con firewall?|"Activo"|**Pasivo**|
|¿En modo FTP pasivo quién abre canales?|"El servidor"|**El cliente abre ambos canales**|
|¿En modo FTP activo quién conecta datos?|"El cliente"|**El servidor** conecta al cliente para datos|
|¿Qué no existe como cuenta del sistema en vsftpd?|"Local" / "Root"|**Usuario Virtual**|
|¿Directiva para encerrar usuario en su dir?|"local_enable" / "write_enable"|**chroot_local_user**|
|¿Config de vsftpd?|"/etc/ftp.conf"|**/etc/vsftpd.conf**|
|¿Log de vsftpd?|"/var/log/apache2/"|**/var/log/vsftpd.log**|
|¿Código HTTP "no encontrado"?|"403" / "500"|**404**|
|¿Código HTTP "redirección permanente"?|"200" / "404"|**301**|
|¿Código HTTP errores del servidor?|"4xx"|**5xx**|
|¿Código HTTP éxito?|"301"|**200**|
|¿Método HTTP para formularios?|"GET"|**POST**|
|¿Método HTTP solo cabeceras?|"OPTIONS" / "GET"|**HEAD**|
|¿Método HTTP actualizar recurso?|"POST"|**PUT**|
|¿Tipo MIME de JSON?|"text/html" / "image/png"|**application/json**|
|¿MIME qué define?|"Solo tipos web"|**Formato de correos y adjuntos** (y tipos de contenido HTTP)|
|¿Cabecera obligatoria para Virtual Hosts?|"User-Agent" / "Cookie"|**Host**|
|¿Atributo cookie impide acceso JavaScript?|"Secure" / "SameSite"|**HttpOnly**|
|¿Atributo cookie solo HTTPS?|"HttpOnly" / "SameSite"|**Secure**|
|¿Config principal Apache?|"/etc/httpd.conf"|**/etc/apache2/apache2.conf**|
|¿DocumentRoot en Apache?|"ServerName" / "VirtualHost"|**DocumentRoot**|
|¿Directorio raíz web por defecto?|"/etc/www"|**/var/www/html**|
|¿Módulo Apache para HTTPS?|"mod_rewrite"|**mod_ssl**|
|¿Módulo Apache para monitorizar?|"mod_ssl"|**mod_status**|
|¿Módulo Nginx para streaming?|"Gzip"|**Módulo RTMP**|
|¿Config principal Nginx?|"/etc/nginx.cfg"|**/etc/nginx/nginx.conf**|
|¿Certbot para qué?|"OpenSSL manual"|**Certificados gratuitos Let's Encrypt**|
|¿Comprobar sintaxis Apache?|"systemctl apache"|**apachectl configtest**|
|¿Primer mensaje DHCP?|"OFFER" / "REQUEST"|**DISCOVER** (lo envía el cliente)|
|¿Mensaje confirmación definitiva DHCP?|"OFFER" / "REQUEST"|**ACK**|
|¿OFFER lo envía quién?|"El cliente"|**El servidor**|
|¿Qué asigna DHCP?|"Solo la IP"|IP + máscara + **gateway** + DNS|
|¿IP siempre igual para una MAC?|"Concesión dinámica"|**Reserva DHCP** (parámetro: MAC)|
|¿Qué hace la máscara de subred?|"Identifica el equipo"|**Determina qué parte es red y cuál es host**|
|¿Qué es el Gateway?|"Servidor DNS"|**Salida de la red local al exterior**|
|¿Registro DNS IPv4?|"AAAA" / "CNAME"|**A**|
|¿Registro DNS alias?|"A" / "MX"|**CNAME**|
|¿Registro DNS servidor correo?|"NS" / "SPF"|**MX**|
|¿Registro DNS resolución inversa?|"A" / "CNAME"|**PTR**|
|¿Registro DNS servidores DNS zona?|"MX" / "SOA"|**NS**|
|¿Registro DNS datos de autoridad?|"NS" / "MX"|**SOA**|
|¿Nivel más alto jerarquía DNS?|"TLD (.com)"|**Servidores Raíz**|
|¿DNS que evita manipulación?|"DNS Dinámico"|**DNSSEC**|
|¿Consulta DNS con respuesta definitiva?|"Iterativa"|**Recursiva**|
|¿SPF vs DKIM vs DMARC?|Confundirlos|SPF=IPs autorizadas; DKIM=firma mensaje; DMARC=política combinada|
|¿Quién entrega el correo en el buzón?|"MTA" / "MUA"|**MDA**|
|¿Quién transfiere entre servidores?|"MDA" / "MUA"|**MTA**|
|¿Interfaz con el usuario final del correo?|"MTA" / "MDA"|**MUA**|
|¿Roundcube qué es?|"Servidor MTA"|**Cliente Webmail (MUA)**|
|¿Postfix qué es?|"MDA" / "MUA"|**MTA**|
|¿Dovecot qué es?|"MTA" / "MUA"|**MDA** (y servidor IMAP/POP3)|
|¿IMAP vs POP3 — ventaja IMAP?|"Menor consumo"|**Sincronización centralizada** (múltiples dispositivos)|
|¿POP3 qué hace por defecto?|"Sincroniza"|**Descarga y elimina** del servidor|
|¿Puerto IMAP seguro?|"143" / "465"|**993**|
|¿Puerto POP3 seguro?|"110" / "143"|**995**|
|¿Puerto SMTP con STARTTLS?|"25" / "465"|**587**|
|¿Puerto SMTP con SSL directo?|"25" / "587"|**465**|
|¿Cifrado extremo a extremo correo?|"TLS" / "STARTTLS"|**S/MIME o GPG**|
|¿TLS cifra qué en correo?|"El mensaje"|**El canal** (no el contenido)|
|¿SpamAssassin para qué?|"Antivirus"|**Filtrar spam por puntuación**|
|¿VNC cifra nativo?|"Sí, como SSH"|**NO cifra de forma nativa**|
|¿Protocolo de VNC?|"RDP" / "SSH"|**RFB**|
|¿Puerto RDP?|"22" / "5900"|**3389**|
|¿Puerto VNC?|"3389" / "22"|**5900**|
|¿NLA en RDP para qué?|"Compresión"|**Autenticar antes de la sesión gráfica**|
|¿Puerto SIP?|"80" / "443"|**5060**|
|¿SIP protocolo de qué?|"Transporte de voz"|**Señalización** (establece la llamada)|
|¿RTP protocolo de qué?|"Señalización"|**Transporte de voz en tiempo real**|
|¿Codec alta calidad sin compresión?|"G.729" / "Opus"|**G.711**|
|¿Codec poco ancho de banda?|"G.711" / "Opus"|**G.729**|
|¿Codec adaptativo / WebRTC?|"G.711" / "G.729"|**Opus**|
|¿Valor DSCP recomendado para voz?|"DSCP 0"|**DSCP 46** (Expedited Forwarding)|
|¿Jitter qué es?|"Latencia"|**Variación en el retardo** de los paquetes|
|¿QoS para qué?|"Cifrar voz"|**Priorizar tráfico de voz** sobre datos|
|¿PBX IP para qué?|"Proxy SIP"|**Gestiona extensiones internas** (centralita)|
|¿Asterisk qué es?|"Servidor web"|**PBX IP libre** más popular|
|¿FreePBX qué es?|"PBX hardware"|**Interfaz web basada en Asterisk**|
|¿SNAT vs DNAT?|Confundirlos|SNAT=salida a Internet; DNAT=publicar servidor interno|
|¿NAT/PAT para qué?|"DNS"|**Traducir IPs privadas en una pública**|
|¿RFC 1918?|"RFC 2616 (HTTP)"|**Define rangos IPs privadas** (192.168.x.x, 10.x.x.x)|
|¿Comando Linux para activar router?|"systemctl router"|**sysctl -w net.ipv4.ip_forward=1**|
|¿Software proxy/caché web común?|"Apache" / "Nginx"|**Squid**|
|¿Puerto RTMP?|"554" / "443"|**1935**|
|¿Puerto RTSP?|"1935" / "80"|**554**|
|¿HLS qué hace?|"Flujo continuo"|**Fragmentos `.ts` por HTTP**|
|¿Videoconferencia desde navegador sin app?|"RTMP" / "RTSP"|**WebRTC**|
|¿CDN de Netflix?|"CloudFlare"|**Open Connect**|
|¿Wireshark vs Postman?|Confundirlos|Wireshark=captura paquetes; Postman=prueba HTTP/APIs|
|¿Modelo donde no hay servidor central?|"Cliente-Servidor"|**Peer to Peer (P2P)**|

---

## Confusiones típicas que hay que resolver

> [!WARNING] Estas son las confusiones más habituales — repasarlas antes del examen

|Confusión|Aclaración|
|---|---|
|**DNS vs DHCP**|DNS traduce nombres; DHCP asigna configuración IP.|
|**SMTP vs IMAP vs POP3**|SMTP envía; IMAP sincroniza; POP3 descarga.|
|**SIP vs RTP**|SIP controla la llamada; RTP transporta audio/vídeo.|
|**RTMP vs HLS vs RTSP**|RTMP ingesta; HLS distribuye en fragmentos; RTSP cámaras/control.|
|**FTP pasivo vs SFTP**|Pasivo ayuda con firewall; SFTP aporta seguridad sobre SSH.|
|**Gateway vs NAT vs Proxy**|Gateway sale; NAT traduce; Proxy intermedia.|
|**Wireshark vs Postman**|Wireshark captura paquetes; Postman prueba HTTP/APIs.|
|**Recursiva vs Iterativa**|Recursiva da IP final; iterativa da la IP más conveniente que conoce.|
|**Cliente-Servidor vs P2P**|Cliente-Servidor centraliza; P2P todos son cliente y servidor.|
|**TLS vs S/MIME**|TLS cifra el canal; S/MIME cifra el contenido del mensaje.|
|**SNAT vs DNAT**|SNAT = salir; DNAT = publicar/entrar.|
|**Reserva DHCP vs IP estática**|Reserva DHCP la asigna el servidor por MAC; IP estática se configura manualmente.|

---

## 🔑 Glosario de Siglas y Términos Clave

| Sigla/Término | Significado                                                    |
| ------------- | -------------------------------------------------------------- |
| **DNS**       | Domain Name System                                             |
| **DHCP**      | Dynamic Host Configuration Protocol                            |
| **HTTP**      | HyperText Transfer Protocol                                    |
| **HTTPS**     | HTTP Secure (con TLS)                                          |
| **FTP**       | File Transfer Protocol                                         |
| **FTPS**      | FTP Secure (FTP + TLS)                                         |
| **SFTP**      | SSH File Transfer Protocol                                     |
| **SCP**       | Secure Copy Protocol                                           |
| **SSH**       | Secure Shell                                                   |
| **SMTP**      | Simple Mail Transfer Protocol                                  |
| **POP3**      | Post Office Protocol v3                                        |
| **IMAP**      | Internet Message Access Protocol                               |
| **MIME**      | Multipurpose Internet Mail Extensions                          |
| **MUA**       | Mail User Agent                                                |
| **MTA**       | Mail Transfer Agent                                            |
| **MDA**       | Mail Delivery Agent                                            |
| **SPF**       | Sender Policy Framework                                        |
| **DKIM**      | DomainKeys Identified Mail                                     |
| **DMARC**     | Domain-based Message Authentication, Reporting and Conformance |
| **TLS**       | Transport Layer Security                                       |
| **SSL**       | Secure Sockets Layer (predecesor de TLS)                       |
| **NAT**       | Network Address Translation                                    |
| **SNAT**      | Source NAT                                                     |
| **DNAT**      | Destination NAT                                                |
| **PAT**       | Port Address Translation                                       |
| **VoIP**      | Voice over IP                                                  |
| **SIP**       | Session Initiation Protocol                                    |
| **RTP**       | Real-Time Protocol                                             |
| **SRTP**      | Secure RTP                                                     |
| **PBX**       | Private Branch Exchange (centralita)                           |
| **QoS**       | Quality of Service                                             |
| **DSCP**      | Differentiated Services Code Point (marcado de prioridad)      |
| **RDP**       | Remote Desktop Protocol                                        |
| **VNC**       | Virtual Network Computing                                      |
| **RFB**       | Remote Framebuffer (protocolo de VNC)                          |
| **NLA**       | Network Level Authentication                                   |
| **DORA**      | Discover, Offer, Request, Acknowledge (proceso DHCP)           |
| **DNSSEC**    | DNS Security Extensions                                        |
| **TTL**       | Time To Live                                                   |
| **AXFR**      | Asynchronous Full Transfer (transferencia de zona DNS)         |
| **SOA**       | Start of Authority                                             |
| **RFC**       | Request for Comments (estándares de Internet)                  |
| **PXE**       | Preboot Execution Environment                                  |
| **chroot**    | Change Root (aísla usuario en su directorio — chroot jail)     |
| **vsftpd**    | Very Secure FTP Daemon                                         |
| **Jitter**    | Variación en el retardo de paquetes de red                     |
| **P2P**       | Peer to Peer                                                   |
| **HLS**       | HTTP Live Streaming                                            |
| **RTMP**      | Real-Time Messaging Protocol                                   |
| **RTSP**      | Real-Time Streaming Protocol                                   |
| **WebRTC**    | Web Real-Time Communication                                    |
| **CDN**       | Content Delivery Network                                       |
| **NNTP**      | Network News Transfer Protocol                                 |
| **IRC**       | Internet Relay Chat                                            |
| **MAC**       | Media Access Control (dirección física)                        |

---

_Apuntes generados para 2º SMR — Módulo: Servicios en Red_ _Basados en el test de repaso del módulo — Optimizados para Obsidian_