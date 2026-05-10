
## Índice de Contenidos

1. [[#Bloque 1 — Fundamentos de Seguridad Informática]]
2. [[#Bloque 2 — Amenazas, Vulnerabilidades y Ataques]]
3. [[#Bloque 3 — Controles de Seguridad]]
4. [[#Bloque 4 — Criptografía]]
5. [[#Bloque 5 — Seguridad en Redes y Firewalls]]
6. [[#Bloque 6 — Acceso Remoto Seguro]]
7. [[#Bloque 7 — Sistemas de Detección y Monitorización]]
8. [[#Bloque 8 — Almacenamiento, RAID y Copias de Seguridad]]
9. [[#Bloque 9 — Seguridad Física y CPD]]
10. [[#Bloque 10 — Gestión de Identidades y Redes Empresariales]]
11. [[#Bloque 11 — Control de Versiones con Git]]
12. [[#Bloque 12 — Normativa Legal: RGPD, LOPD y LSSI]]
13. [[#Bloque 13 — Amenazas Avanzadas y Análisis Forense]]
14. [[#Resumen de Conceptos Trampa]]
15. [[#Glosario de Siglas y Acrónimos]]

---

## Bloque 1 — Fundamentos de Seguridad Informática

### La Triada CIA — El Marco Fundamental

> [!IMPORTANT] La Triada CIA El pilar conceptual de toda la seguridad informática. Son los **tres objetivos** que cualquier sistema de seguridad debe garantizar:
> 
> |Pilar|Nombre|¿Qué garantiza?|Ataque que lo compromete|
> |---|---|---|---|
> |**C**|**Confidencialidad**|Que solo acceda **quien debe** a la información|Acceso no autorizado, phishing, robo de credenciales es cuando alguien mira lo que no debe|
> |**I**|**Integridad**|Que los datos **no sean alterados** sin autorización|Malware que modifica registros, ataques MITM cuando alguien tocalo que no debe |
> |**A**|**Disponibilidad**|Que el sistema **esté accesible** cuando se necesita|DoS/DDoS, caída de servidor, ransomware hace que tu no puedas entrar|

> [!TIP] Cómo identificar qué pilar se ve comprometido
> 
> - "Un atacante **roba datos** confidenciales" → **Confidencialidad**
> - "Un atacante **altera un registro** en una BD" → **Integridad**
> - "Un servidor **cae** y nadie puede acceder" → **Disponibilidad**
> - "Decisiones basadas en **datos falsos**" → **Integridad**
> - "Caída de un servidor de ventas online" → **Disponibilidad**

> [!NOTE] ¿Qué no forma parte de la CIA? "Control", "Autenticación", "Autenticidad" y "Trazabilidad" son conceptos relacionados pero **no son los tres pilares**. La respuesta correcta siempre es **Confidencialidad, Integridad y Disponibilidad**.

---

### Principio de Kerckhoffs

> [!IMPORTANT] Principio de Kerckhoffs La seguridad de un sistema criptográfico **debe recaer en la clave, no en el algoritmo**. El algoritmo puede ser público; lo que debe mantenerse secreto es la clave.

---

### Conceptos Básicos

|Concepto|Definición|Ejemplo|
|---|---|---|
|**Amenaza**|Posible causa de un incidente (no ha ocurrido aún)|Un hacker que podría atacar|
|**Vulnerabilidad**|Debilidad del sistema que puede ser explotada|Contraseña débil, software sin actualizar|
|**Riesgo**|Probabilidad de que una amenaza explote una vulnerabilidad|Alto riesgo si contraseña = "1234"|
|**Incidente**|Daño ya producido|El servidor fue hackeado|
|**Control**|Medida para reducir el riesgo|Firewall, antivirus, backup|

> [!TIP] Diferencia amenaza vs vulnerabilidad
> 
> - **Amenaza** = el peligro externo (el ladrón)
> - **Vulnerabilidad** = la debilidad propia (la puerta sin cerrojo)
> - Una contraseña débil es una **vulnerabilidad**, no una amenaza.

---

### La Seguridad como Proceso

> [!IMPORTANT] La seguridad informática debe entenderse como... **Un proceso continuo**, no como un producto ni un software puntual. No se "instala" la seguridad: se gestiona y mejora constantemente.

**Mejor estrategia de seguridad:**

> Combinar **medidas técnicas y organizativas** (firewalls + formación + políticas + procedimientos).

**Mentalidad de seguridad:**

> Asumir que el sistema **puede fallar**. No se trata de ser paranoico, sino de diseñar sistemas que sigan funcionando (o fallen de forma segura) cuando algo sale mal.

---

### Seguridad Activa vs Pasiva / Física vs Lógica

| Dimensión  | Tipo                                               | Ejemplos                                      |
| ---------- | -------------------------------------------------- | --------------------------------------------- |
| **Activa** | Previene o detecta activamente PREVIENE ANTES      | Firewall, antivirus, autenticación            |
| **Pasiva** | Minimiza daños cuando ocurre el incidente, DESPUES | **Copia de seguridad**, RAID, SAI             |
| **Física** | Protege el hardware y el entorno                   | Cerraduras, cámaras, control de acceso físico |
| **Lógica** | Protege accesos y datos digitales                  | Contraseñas, cifrado, firewalls, permisos     |
|            |                                                    |                                               |

> [!TIP] La "primera línea de defensa" en una infraestructura Es la **seguridad física**: si alguien puede acceder físicamente al servidor, el cifrado y los firewalls son irrelevantes.

preguntate : evita que ocurra?? si si , es activo, si no , es pasivo

## Bloque 2 — Amenazas, Vulnerabilidades y Ataques

### Tipos de Malware

| Tipo           | Descripción                                                 | Clave diferenciadora            |
| -------------- | ----------------------------------------------------------- | ------------------------------- |
| **Ransomware** | Cifra los datos y pide rescate                              | Combina impacto en C + I + A    |
| **Troyano**    | **Finge ser software legítimo** para engañar al usuario     | No se replica solo              |
| **Gusano**     | **Se replica automáticamente** sin intervención del usuario | No necesita archivo huésped     |
| **Rootkit**    | **Oculta su presencia** en el sistema comprometido          | Muy difícil de detectar         |
| **Spyware**    | Espía y roba información del usuario                        | Actúa en silencio               |
| **Keylogger**  | Registra las teclas pulsadas                                | Roba contraseñas al escribirlas |


> [!TIP] Diferencia Rootkit vs Troyano
> 
> - **Rootkit** = se **oculta** a sí mismo en el sistema (modifica el SO para no ser visible)
> - **Troyano** = finge ser **software legítimo** pero hace cosas maliciosas Si un binario de 'ssh' modificado guarda contraseñas → **Puerta trasera basada en SSH** (backdoor)

> [!WARNING] El gusano se replica SOLO A diferencia del virus (que necesita un archivo huésped) y el troyano (que necesita que el usuario lo ejecute), el **gusano** se propaga de forma autónoma por la red.

---

### Tipos de Ataques

|Ataque|¿Qué hace?|Pilar CIA afectado|
|---|---|---|
|**Phishing**|**Engaño** para que el usuario revele datos|Confidencialidad|
|**DoS/DDoS**|Satura un servicio para que caiga|Disponibilidad|
|**Fuerza bruta**|Probar todas las combinaciones de contraseña|Confidencialidad|
|**MITM** (Man in the Middle)|Intercepta comunicaciones entre dos partes|C + I|
|**SQL Injection**|Inyecta código SQL en formularios web|C + I|
|**Escalado de privilegios**|Obtener permisos de admin sin credenciales|Confidencialidad|
|**Pass-the-hash**|Usar el hash de contraseña sin conocerla en texto plano|Confidencialidad|
|**Cipher downgrade**|Forzar el uso de cifrado débil para vulnerarlo|Confidencialidad|
|**Backdoor**|Puerta trasera para volver a acceder después|Persistencia|
|**Exfiltración**|Robar datos hacia el exterior|Confidencialidad|

> [!IMPORTANT] Persistencia mediante Backdoors Un atacante entra en una red, **no roba datos**, pero instala puertas traseras para volver más tarde. Esto se llama **persistencia mediante backdoors**. Es un ataque silencioso y peligroso porque puede pasar desapercibido durante meses.

> [!IMPORTANT] Escalado de Privilegios Un atacante tiene acceso **limitado** y logra ejecutar código **como administrador** sin tener credenciales de admin. Esto se llama **escalado de privilegios** (privilege escalation).

---

### Ingeniería Social

> [!IMPORTANT] Ingeniería Social **Manipular a las personas** para que revelen información o realicen acciones peligrosas. No explota vulnerabilidades técnicas: explota la psicología humana. Es la causa más habitual de incidentes de seguridad.

> [!TIP] La causa más habitual de incidentes **Los errores humanos**, no los ataques de día cero ni los fallos de hardware. La ingeniería social explota esto directamente.

---

### Indicadores de Compromiso (IoC)

|Situación|Indicador|
|---|---|
|**Persistencia**|Creación de tareas programadas ocultas; binarios del sistema modificados|
|**Exfiltración**|Conexiones salientes **cifradas y persistentes** hacia IPs desconocidas|
|**Compromiso**|Logs con actividades inusuales a horas extrañas|

---

## Bloque 3 — Controles de Seguridad

### Los 3 Tipos de Control

> [!IMPORTANT] Clasificación de controles de seguridad
> 
> |Tipo|Cuándo actúa|Ejemplos|
> |---|---|---|
> |**Preventivo**|**Antes** del incidente (evitar que ocurra)|Firewall, autenticación MFA, formación|
> |**Detectivo**|**Durante/después** (detectar que ha ocurrido)|IDS/IPS, antivirus, análisis de logs|
> |**Correctivo**|**Después** (recuperar de los daños)|Restaurar backup, reinstalar sistema|

> [!TIP] Truco de examen — Tipo de control
> 
> - "Configurar un firewall" → **Preventivo**
> - "Analizar logs del sistema" → **Detectivo**
> - "Restaurar una copia de seguridad" → **Correctivo**
> - "Investigar un incidente" → **Detectivo**

---

### Medidas Preventivas Clave

**Contra ataques de fuerza bruta:**

- **Bloquear la cuenta tras varios intentos fallidos**
- Usar contraseñas largas y complejas
- Implementar MFA (Autenticación Multifactor)
- Fail2ban (bloquea la IP del atacante)

**Hardening (Endurecimiento de sistemas):**

> [!IMPORTANT] Hardening **Deshabilitar servicios innecesarios** y reducir la superficie de ataque. Cuantos menos servicios activos, menos puertas de entrada para un atacante.

**Principio de Mínimo Privilegio:**

> [!IMPORTANT] Mínimo Privilegio **Dar acceso solo a lo estrictamente necesario**. Un usuario de contabilidad no necesita acceso al servidor de producción. Limitar el acceso reduce el impacto de cualquier compromiso.

**MFA (Autenticación Multifactor):**

> Añade una **segunda capa de seguridad** además de la contraseña. Si la contraseña se compromete, el atacante aún necesita el segundo factor.

**Actualizaciones y parches:**

> La medida más efectiva para **corregir vulnerabilidades conocidas**. Es vital priorizar los **CVEs explotados activamente** (Common Vulnerabilities and Exposures).

---

## Bloque 4 — Criptografía

### Conceptos Fundamentales

|Término|Definición|
|---|---|
|**Texto plano**|El mensaje original **sin cifrar**|
|**Criptograma**|El mensaje cifrado (ilegible)|
|**Clave**|El secreto que permite cifrar/descifrar|
|**Hash**|**Resumen** de longitud fija generado por una función matemática irreversible|
|**Cifrado**|Proceso de transformar texto plano en criptograma|

> [!IMPORTANT] Función Hash Genera un **resumen (digest) de longitud fija** a partir de cualquier dato. Las propiedades clave son:
> 
> - **Irreversible**: no se puede obtener el original desde el hash
> - **Determinista**: el mismo input siempre produce el mismo output
> - **Sensible**: un pequeño cambio produce un hash completamente diferente
> 
> **Usos**: verificar integridad de archivos (suma de verificación), almacenar contraseñas.

---

### Criptografía Simétrica

> [!IMPORTANT] Cifrado Simétrico Usa **una única clave** para cifrar y descifrar. Ambas partes deben conocer la misma clave.
> 
> - **Ventaja**: rápido y eficiente para grandes volúmenes de datos
> - **Problema principal**: el **intercambio de claves** (¿cómo envías la clave de forma segura?)
> 
> **Algoritmo estándar**: **AES** (Advanced Encryption Standard). AES-256 se considera el estándar moderno y seguro.

---

### Criptografía Asimétrica

> [!IMPORTANT] Cifrado Asimétrico Usa **dos claves distintas**: una **clave pública** (se puede compartir con todos) y una **clave privada** (secreta, solo la tiene el propietario).
> 
> - Lo que cifra la clave pública → solo lo puede descifrar la clave privada
> - Lo que cifra la clave privada → solo lo puede verificar la clave pública
> 
> **Ventaja**: resuelve el problema del intercambio de claves **Uso principal**: SSH, firma digital, HTTPS/TLS

---

### SSH — Cómo combina ambos tipos

> [!IMPORTANT] Cifrado en SSH SSH usa **cifrado asimétrico para el inicio de sesión** (autenticación) y **simétrico para la sesión** (datos en tránsito). Esto combina la seguridad de la autenticación asimétrica con la velocidad del cifrado simétrico.

---

### Firma Electrónica

> [!IMPORTANT] Firma Electrónica — Niveles
> 
> |Nivel|Característica|Seguridad|
> |---|---|---|
> |**Simple**|Solo datos de identificación básica|Baja|
> |**Avanzada**|**Permite detectar cambios posteriores** al firmado|Media|
> |**Cualificada**|Máximo nivel de seguridad legal|**Máxima**|
> 
> La tecnología base es la **criptografía asimétrica** (clave pública/privada).

---

### Propiedades de Seguridad Adicionales

|Propiedad|¿Qué garantiza?|
|---|---|
|**No repudio**|Que un mensaje **no pueda ser negado** por quien lo envió. La firma digital lo garantiza.|
|**Trazabilidad**|Saber **quién hizo qué** y cuándo (auditoría)|
|**Autenticidad**|Verificar que el origen es quien dice ser|

---

## Bloque 5 — Seguridad en Redes y Firewalls

### Puertos TCP/IP

> [!IMPORTANT] Un puerto identifica un servicio específico dentro de una IP La IP identifica el equipo; el **puerto** identifica el servicio dentro de ese equipo.

|Puerto|Servicio|
|---|---|
|**21**|FTP|
|**22**|**SSH**|
|**23**|Telnet|
|**25**|SMTP|
|**80**|HTTP|
|**443**|HTTPS|
|**3389**|**RDP**|

> [!WARNING] Puerto RDP (3389) abierto a Internet Es extremadamente peligroso porque recibe **ataques automatizados de bots** constantemente. Nunca debe exponerse directamente a Internet sin protección adicional (VPN, NLA, restricción de IPs).

---

### Firewall

> [!IMPORTANT] Función del Firewall **Filtrar el tráfico de red** según reglas definidas. Decide qué paquetes pueden pasar y cuáles se bloquean.

**NFTables — Firewall en Linux:**

```bash
# Ver toda la configuración del firewall
nft list ruleset

# Acciones sobre paquetes:
# accept  → permite el paquete
# drop    → DESCARTA el paquete (sin respuesta)
# log     → registra el paquete
# counter → cuenta paquetes o bytes
```

|Elemento NFTables|Función|
|---|---|
|**Tabla**|Define el **protocolo de red a analizar** (ip, ip6, inet...)|
|**Cadena**|Agrupa reglas y define el hook|
|**Regla**|La instrucción concreta (si X → hacer Y)|

**Hooks de NFTables:**

|Hook|Cuándo se ejecuta|
|---|---|
|`input`|Paquetes **dirigidos al sistema local**|
|`output`|Paquetes **generados por el sistema local**|
|`forward`|Paquetes que **atraviesan el sistema** (como router)|
|`prerouting`|Antes de enrutar (para NAT)|
|`postrouting`|Después de enrutar (para NAT)|

> [!TIP] Truco de examen — NFTables
> 
> - "Paquetes que atraviesan como router" → hook **forward** (forwarding)
> - "Descartar paquete" → acción **drop**
> - "Contar paquetes" → acción **counter**
> - "Ver configuración completa" → `nft list ruleset`

**Logs del firewall en Linux:**

```
/var/syslog   (logs del firewall según el examen)
/var/log/auth.log  (logs de autenticación)
```

---

### Nmap — Escaneo de Puertos

> [!IMPORTANT] Nmap Herramienta para **escanear puertos** y descubrir servicios activos en una red. Usada tanto por administradores (para auditar) como por atacantes (para reconocimiento).

---

### VPN (Virtual Private Network)

> [!IMPORTANT] VPN Crea un **túnel cifrado** que oculta la IP real y protege las comunicaciones sobre redes públicas.

|Tipo de VPN|Uso|
|---|---|
|**Acceso remoto**|Un usuario se conecta a la red corporativa desde fuera|
|**Sitio a sitio**|**Conecta dos sedes distintas** de una empresa entre sí|
|**Personal**|Uso individual para privacidad en internet|

> [!IMPORTANT] OpenVPN Protocolo VPN que usa **certificados digitales** para autenticar tanto al cliente como al servidor. Es el más seguro de los mencionados.

> [!NOTE] PPTP y L2TP sin IPSec son inseguros
> 
> - **PPTP** = obsoleto y vulnerable
> - **L2TP sin IPSec** = no cifra por sí solo
> - **OpenVPN** = usa certificados digitales, el más seguro

---

## Bloque 6 — Acceso Remoto Seguro

### SSH (Secure Shell)

> [!IMPORTANT] SSH Protocolo que permite **conexiones remotas cifradas** mediante clave pública y privada. **Reemplazó a Telnet** (que transmitía todo en texto plano, sin cifrado).

**Comparativa SSH vs Telnet:**

| |SSH|Telnet|
|---|---|---|
|Cifrado|✅ Sí|❌ No (texto plano)|
|Puerto|22|23|
|Seguridad|Alta|Ninguna|
|Estado|Estándar actual|**Reemplazado por SSH**|

**Autenticación en SSH:**

|Método|Cómo funciona|Seguridad|
|---|---|---|
|**Contraseña**|El usuario escribe su clave|Media (vulnerable a fuerza bruta)|
|**Clave pública/privada**|El servidor verifica la clave privada del cliente|**Alta** (recomendado)|

> [!IMPORTANT] Clave privada en SSH La clave privada **se almacena en el cliente** y demuestra la identidad del usuario. Nunca se envía al servidor. Es el método más seguro.

> [!IMPORTANT] Verificación del servidor SSH (primera conexión) Cuando el cliente se conecta por primera vez, SSH verifica el servidor mediante la **huella digital (fingerprint) de la clave pública del servidor**. El cliente debe confirmar que confía en esa huella.

**Comandos SSH útiles:**

```bash
# Conectar a un servidor SSH
ssh usuario@servidor

# Especificar una clave privada concreta
ssh -i /ruta/clave_privada usuario@servidor

# Especificar un puerto distinto al 22
ssh -p 2222 usuario@servidor
```

> [!IMPORTANT] Ataque típico contra SSH mal configurado **Fuerza bruta**: probar combinaciones de usuario/contraseña automaticamente. Mitigación: usar claves en lugar de contraseñas + Fail2ban.

**Cliente SSH en Windows:**

> **PuTTY** = programa para realizar conexiones SSH en sistemas Windows.

---

### Herramientas Basadas en SSH

|Herramienta|Función|
|---|---|
|**SCP** (Secure Copy)|**Transferir archivos** de forma segura sobre SSH. Solo copia.|
|**SFTP**|Transferir archivos sobre SSH. **Permite navegación y gestión avanzada** (listar, borrar, crear directorios...)|

> [!TIP] SCP vs SFTP
> 
> - **SCP** = solo copia archivos (como cp pero seguro y remoto)
> - **SFTP** = explorador de archivos remoto completo sobre SSH
> - SCP **no cifra** por sí solo — FALSO. Ambos usan SSH para el cifrado.

---

### RDP (Remote Desktop Protocol)

> [!IMPORTANT] RDP Protocolo **propietario de Microsoft** para acceso remoto con **interfaz gráfica** completa. Usa el **puerto 3389**.

**Requisitos para usar RDP:**

- Tener el **Escritorio Remoto habilitado** en el sistema Windows de destino

**Seguridad RDP con NLA (Network Level Authentication):**

> NLA **evita que un atacante pueda iniciar conexión sin credenciales válidas** previamente. La autenticación ocurre antes de que se establezca la sesión gráfica, reduciendo la superficie de ataque.

---

### VNC (Virtual Network Computing)

> [!IMPORTANT] VNC Protocolo para control remoto de escritorio que usa el protocolo **RFB** (Remote Framebuffer) para transmitir la imagen del escritorio.
> 
> **Principal debilidad**: por defecto, **no suele cifrar la comunicación**. Se recomienda usarlo siempre a través de un túnel SSH.

---

### Fail2ban

> [!IMPORTANT] Fail2ban Herramienta que **bloquea la IP del atacante** tras detectar varios intentos de acceso fallidos (fuerza bruta). Es un control preventivo/reactivo.

**Configuración en Fail2ban:**

```bash
# Archivo que NO se debe modificar directamente:
jail.conf   # ← El archivo .conf NO se modifica

# Archivo correcto para personalizaciones:
jail.local  # ← Siempre usar .local para cambios propios
```

> [!WARNING] Regla de oro de Fail2ban Nunca modificar el archivo `.conf` directamente. Siempre hacer cambios en el archivo `.local` correspondiente. Si se actualiza fail2ban, los `.conf` se sobreescriben; los `.local` se conservan.

---

## Bloque 7 — Sistemas de Detección y Monitorización

### IDS/IPS — Detección de Intrusos

|Sistema|Nombre|Función|
|---|---|---|
|**NIDS**|Network Intrusion Detection System|Analiza tráfico **de red** para detectar intrusos|
|**HIDS**|Host Intrusion Detection System|Monitoriza un **host específico** (logs, archivos, procesos)|
|**IPS**|Intrusion Prevention System|Detecta Y **bloquea** automáticamente|

> [!IMPORTANT] Snort = NIDS | OSSEC/Wazuh = HIDS
> 
> - **Snort** → detección de intrusos **en red** (NIDS)
> - **OSSEC / Wazuh** → detección de intrusos **en host** (HIDS)

---

### Herramientas de Análisis

|Herramienta|Función principal|
|---|---|
|**Snort**|IDS/IPS de red: detecta intrusos en el tráfico|
|**Zeek**|**Analiza tráfico y genera logs detallados**|
|**Wireshark**|Captura tráfico de red para **análisis de protocolos en profundidad**|
|**Nmap**|Escanea puertos y descubre servicios|
|**Fail2ban**|Bloquea IPs con intentos fallidos (fuerza bruta)|
|**RKHunter**|Detecta **rootkits** y actividad sospechosa en procesos|
|**John the Ripper**|**Audita la seguridad de contraseñas** (crackeo ético)|
|**KeePassX**|**Gestor de contraseñas** seguro|
|**OpenVAS / Nessus**|**Escanea vulnerabilidades** en sistemas y redes|
|**Zabbix**|**Monitorización activa** y envío de alertas en tiempo real|
|**WSUS**|Gestiona **parches de Windows de forma centralizada**|
|**Hydra**|Herramienta de ataques de fuerza bruta (usada en auditorías)|

> [!TIP] Truco de examen — Herramienta correcta por función
> 
> - "Bloquear fuerza bruta" → **Fail2ban**
> - "Detectar rootkits" → **RKHunter**
> - "Analizar tráfico con logs detallados" → **Zeek**
> - "Capturar y analizar paquetes de red" → **Wireshark**
> - "Auditar contraseñas" → **John the Ripper**
> - "Gestionar contraseñas" → **KeePassX**
> - "Escanear vulnerabilidades" → **OpenVAS / Nessus**
> - "Monitorizar servicios web (que el puerto 443 esté activo)" → **Zabbix**
> - "Backup automático en Windows" → **Cobian Backup**
> - "Backup profesional empresarial" → **Veeam**

---

### Análisis de Logs con Bash

```bash
# Ver últimas líneas del log del sistema
tail -n 50 /var/log/syslog

# Buscar eventos de autenticación fallida
grep "Failed" /var/log/auth.log

# Copiar y mover logs
cp /var/log/auth.log /backup/auth_$(date +%Y%m%d).log
mv /var/log/old.log /archive/
```

> [!NOTE] Bash para logs Bash permite **copiar, mover y revisar logs** de forma eficiente, automatizando tareas repetitivas que reducen el error humano.

---

### Sandboxing

> [!IMPORTANT] Sandboxing en Antivirus Los antivirus modernos pueden **ejecutar archivos dudosos en un entorno aislado** (sandbox) para observar su comportamiento sin riesgo para el sistema real.

**Análisis heurístico:**

> Los antivirus modernos detectan amenazas **sin firma conocida** mediante **análisis heurístico**: analizan el comportamiento del código para detectar patrones sospechosos.

---

## Bloque 8 — Almacenamiento, RAID y Copias de Seguridad

### Tipos de RAID

> [!IMPORTANT] RAID — Redundant Array of Independent Disks Sistema que agrupa múltiples discos para mejorar el rendimiento y/o la seguridad. **No sustituye a las copias de seguridad**.

|RAID|Mínimo de discos|Característica principal| ¿Hay redundancia?                        |
|---|---|---|---|
|**RAID 0**|2|**Mayor velocidad** (striping)| ❌ No (si falla un disco, se pierde todo) |
|**RAID 1**|2|**Copia espejo exacta** (mirroring)| ✅ Sí                                     |
|**RAID 5**|**3**|Striping con paridad distribuida| ✅ Sí (tolera fallo de 1 disco) n-1       |
|**RAID 10**|4|RAID 0 + RAID 1 (velocidad + espejo)| ✅ Sí                                     |

> [!TIP] Truco de examen — RAID
> 
> - "Mayor velocidad" → **RAID 0** (pero sin seguridad)
> - "Copia exacta/espejo" → **RAID 1**
> - "Mínimo 3 discos" → **RAID 5**
> - "Alta seguridad" → RAID 1, 5 o 10 (nunca RAID 0)

---

### LVM (Logical Volume Manager)

> [!IMPORTANT] LVM **Sistema que agrupa discos de forma lógica**, permitiendo crear volúmenes virtuales que pueden crecer, reducirse o moverse sin interrumpir el servicio.

---

### NAS y SAN

|Sistema|Acceso|Uso|
|---|---|---|
|**NAS** (Network Attached Storage)|Mediante **protocolos de red** (SMB, NFS)|Almacenamiento compartido en oficinas|
|**SAN** (Storage Area Network)|Red dedicada de alta velocidad (FC, iSCSI)|Entornos empresariales críticos|

---

### Copias de Seguridad (Backups)

| Tipo            | Qué copia                                                             | Restauración                                | Espacio |
| --------------- | --------------------------------------------------------------------- | ------------------------------------------- | ------- |
| **Completa**    | **Todos los archivos**                                                | La más fácil                                | Mucho   |
| **Incremental** | Solo lo modificado **desde la última copia** (completa o incremental) | Necesita completa + todas las incrementales | Poco    |
| **Diferencial** | Solo lo modificado **desde la última copia completa**                 | Necesita completa + última diferencial      | Medio   |

> [!TIP] ¿Cuál facilita más la restauración? La **copia completa** es la más simple para restaurar (un solo archivo). Las incrementales requieren encadenar varias.

> [!IMPORTANT] Regla 3-2-1 de Backups
> 
> - **3** copias de los datos
> - En **2** soportes/formatos distintos
> - **1** copia fuera del sitio (offsite)
> 
> Ejemplo: 2 discos locales + 1 copia en la nube.

> [!IMPORTANT] Qué hacer SIEMPRE después de un backup **Verificar la restauración**. Un backup que no se puede restaurar no sirve para nada. La prueba de restauración es tan importante como el propio backup.

**Herramientas de backup:**

- **Cobian Backup** → backup automático en **Windows**
- **Veeam** → backup profesional empresarial

---

### DRP y Continuidad de Negocio

|Término|Definición|
|---|---|
|**DRP** (Disaster Recovery Plan)|Plan de **recuperación ante desastres**|
|**BCP** (Business Continuity Plan)|Plan de **continuidad del negocio**|
|**RTO**|**Tiempo máximo de recuperación** aceptable (Recovery Time Objective)|
|**RPO**|**Cantidad máxima de datos perdidos** aceptable (Recovery Point Objective)|

> [!TIP] RTO vs RPO
> 
> - **RTO** = ¿cuánto tiempo puede estar caído el sistema? (tiempo)
> - **RPO** = ¿cuántos datos podemos permitirnos perder? (datos)

---

## Bloque 9 — Seguridad Física y CPD

### El Centro de Procesamiento de Datos (CPD)

> [!IMPORTANT] CPD (Centro de Procesamiento de Datos) El **corazón físico de la infraestructura**: la sala donde se alojan los servidores, sistemas de almacenamiento, comunicaciones y todo el equipamiento crítico.

---

### Condiciones Ambientales del CPD

|Parámetro|Valor ideal|
|---|---|
|**Temperatura**|**22 ºC**|
|**Humedad relativa**|**Entre 40% y 60%**|
|**Climatización**|Sistemas **HVAC** (Heating, Ventilation and Air Conditioning)|

> [!WARNING] Extintores en el CPD Solo se deben usar extintores de **CO₂**. El agua destruye el equipamiento electrónico. El polvo seco también daña los equipos. CO₂ sofoca el fuego sin dejar residuos.

---

### SAI (Sistema de Alimentación Ininterrumpida) / UPS

> [!IMPORTANT] SAI/UPS Dispositivo que **garantiza el suministro eléctrico** ante microcortes o apagones. Protege el pilar de **Disponibilidad** de la triada CIA.

|Tipo|Protección|
|---|---|
|**Off-line**|Solo actúa cuando se va la corriente (básico)|
|**Interactivo**|Filtra variaciones de tensión|
|**On-line**|**Mayor protección**: el equipo siempre funciona desde el SAI|

> [!TIP] El SAI On-line ofrece MAYOR protección

---

### Plan de Continuidad

> [!IMPORTANT] Plan de Continuidad Documento que define **cómo actuar tras un desastre físico en el CPD**: qué sistemas restaurar primero, en qué orden, con qué recursos. Es el BCP/DRP llevado al plano de las instalaciones físicas.

---

## Bloque 10 — Gestión de Identidades y Redes Empresariales

### LDAP — Directorio Centralizado

> [!IMPORTANT] LDAP (Lightweight Directory Access Protocol) Protocolo para **centralizar usuarios y grupos** en una red empresarial. Actúa como base de datos central de identidades. Es la **base de la integración** de redes heterogéneas.

---

### Kerberos — Autenticación con Tickets

> [!IMPORTANT] Kerberos Sistema de autenticación que usa **tickets temporales** para evitar enviar contraseñas por la red. El ticket es legítimo gracias al **cifrado y al tiempo de expiración** (no se puede reutilizar indefinidamente).

**Ventaja**: las credenciales reales nunca viajan por la red → más seguro que enviar usuario/contraseña.

---

### Active Directory y Samba

|Sistema|Plataforma|Función|
|---|---|---|
|**Active Directory** (AD)|Microsoft Windows|Gestión centralizada de usuarios, grupos y políticas en redes Windows|
|**Samba**|Linux|Permite a Linux **actuar como servidor de archivos e impresoras Windows** usando el protocolo **SMB/CIFS**|

> [!IMPORTANT] Samba Implementación libre del protocolo **SMB** (Server Message Block) para Linux. Permite:
> 
> - Compartir archivos e impresoras con clientes Windows
> - Integrarse con **Active Directory** para gestionar permisos

**Protocolo de Samba:**

> **SMB/CIFS** (Server Message Block / Common Internet File System)

---

### NFS — Compartir Archivos en Linux/Unix

> [!IMPORTANT] NFS (Network File System) Protocolo **estándar para compartir archivos en entornos Unix/Linux**. Permite "montar" una carpeta remota: **aparece como una unidad local** en el sistema del usuario.

> [!IMPORTANT] NFSv4 La versión más moderna, con **mejoras de seguridad y rendimiento** respecto a versiones anteriores.

---

### SSO — Single Sign-On

> [!IMPORTANT] SSO (Single Sign-On) Permite **loguearse una sola vez** y acceder a varios servicios sin volver a autenticarse.
> 
> **Riesgo principal**: si la cuenta SSO se compromete, **todas las cuentas vinculadas quedan comprometidas**.
> 
> **Mitigación**: **MFA + detección de anomalías** son obligatorios junto al SSO.

---

### Integración de Red Empresarial Segura

> [!IMPORTANT] Combinación óptima **LDAP + Kerberos + SSO** forman la base de una red eficiente, escalable y segura:
> 
> - LDAP = directorio de usuarios (base de datos central)
> - Kerberos = autenticación segura sin enviar contraseñas
> - SSO = acceso transparente a múltiples servicios

---

### CUPS — Impresión en Linux

> [!IMPORTANT] CUPS (Common Unix Printing System) El **sistema de impresión estándar en entornos Linux y Unix**. Usa el protocolo **IPP** (Internet Printing Protocol) para comunicarse.

**Windows usa**: protocolo **SMB/IPP** para compartir impresoras en red.

**Impresión segura con PIN:**

> El código PIN en impresoras corporativas sirve para **garantizar la confidencialidad**: el documento no se imprime hasta que el usuario se identifica físicamente en la impresora.

---

### Gestión Centralizada de Parches en Windows

> [!IMPORTANT] WSUS (Windows Server Update Services) Herramienta de Microsoft para **gestionar parches de Windows de forma centralizada** en toda la organización.

---

### PowerShell vs BAT

> [!IMPORTANT] Diferencia PowerShell vs archivos BAT PowerShell está **basado en objetos y .NET**, mucho más potente que los antiguos archivos BAT (basados en texto). Permite gestionar usuarios, servicios, red y más desde la línea de comandos.

**Ventaja del scripting en seguridad:**

> Ejecuta tareas **siempre de la misma forma**, eliminando el error humano (la causa más habitual de incidentes).

---

## Bloque 11 — Control de Versiones con Git

### Comandos Git Esenciales

> [!IMPORTANT] Flujo básico de Git
> 
> ```
> Modificar archivos → git add (staging) → git commit (historial) → git push (remoto)
> ```

```bash
# Inicializar un repositorio nuevo
git init

# Añadir archivos al área de preparación (staging)
git add archivo.txt
git add .          # Añadir todos los archivos modificados

# Guardar los cambios en el historial
git commit -m "Descripción del cambio"

# Subir cambios al repositorio remoto (GitHub)
git push

# Traer cambios del repositorio remoto al local
git pull

# Copiar un repositorio remoto a tu ordenador
git clone https://github.com/usuario/repo.git

# Ver diferencias entre estado actual y último commit
git diff

# Deshacer el último commit manteniendo cambios en staging
git reset --soft HEAD~1
```

|Comando|Función|
|---|---|
|`git init`|**Crear un repositorio** en una carpeta|
|`git add`|Añadir archivos al **área de staging**|
|`git commit`|**Guardar** los cambios en el historial|
|`git push`|**Subir** cambios al repositorio remoto|
|`git pull`|**Traer** cambios del remoto al local|
|`git clone`|**Copiar** un repositorio remoto al local|
|`git diff`|Ver **diferencias** respecto al último commit|
|`git reset --soft HEAD~1`|**Deshacer** el último commit (sin perder cambios)|

> [!IMPORTANT] GitHub **Plataforma web para alojar repositorios Git**. No es un editor de texto, ni un SO, ni un lenguaje: es un servicio de alojamiento de código con herramientas de colaboración.

**Ventaja de Git para la seguridad:**

> Permite **revertir a versiones seguras** de scripts y configuraciones si se detecta un error o compromiso.

---

## Bloque 12 — Normativa Legal: RGPD, LOPD y LSSI

### Marco Normativo Europeo y Español

```
RGPD (Reglamento Europeo) dicta como `rpteger datos personales`
    ↓ Se adapta al marco español mediante
LOPDGDD (Ley Orgánica 3/2018) o LOPD es la adaptacion 
    ↓ Complementada por
LSSI-CE (Ley de Servicios de la Sociedad de la Información)
```

---

### RGPD — Reglamento General de Protección de Datos

> [!IMPORTANT] RGPD (o GDPR en inglés) La **norma europea principal** sobre protección de datos personales. Se aplica a **cualquier organización que maneje datos** de ciudadanos europeos, sin importar dónde esté ubicada.

**Principios fundamentales del RGPD:**

|Principio|¿Qué implica?|
|---|---|
|**Licitud**|El tratamiento debe tener una **base legal** (consentimiento, contrato, obligación legal...)|
|**Transparencia**|**Informar claramente al usuario** sobre qué datos se recogen y para qué|
|**Minimización de datos**|Recoger **solo los datos estrictamente necesarios**|
|**Exactitud**|Los datos deben estar actualizados|
|**Limitación del plazo**|No conservar datos más tiempo del necesario|
|**Integridad y confidencialidad**|Proteger los datos con medidas de seguridad adecuadas|

**Derechos del ciudadano según el RGPD:**

|Derecho|¿Qué permite?|
|---|---|
|**Acceso**|Saber qué datos tiene la empresa sobre ti|
|**Rectificación**|Corregir datos incorrectos|
|**Supresión (Derecho al olvido)**|Pedir que se borren tus datos|
|**Portabilidad**|**Transferir datos entre responsables** en formato estructurado|
|**Limitación del tratamiento**|Exigir que **dejen de tratar temporalmente** tus datos|
|**Oposición**|Oponerte al tratamiento en ciertos casos|

> [!TIP] Truco de examen — Derechos RGPD
> 
> - "Transferir datos entre responsables" → **Portabilidad**
> - "Dejar de tratar temporalmente" → **Limitación del tratamiento**
> - "Borrar datos" → **Supresión / Derecho al olvido**

---

### Roles en el RGPD

|Rol|Función|
|---|---|
|**Responsable del tratamiento**|Decide la finalidad y los medios del tratamiento|
|**Encargado del tratamiento**|**Procesa datos siguiendo instrucciones del responsable** (un tercero: proveedor de hosting, empresa de nóminas...)|
|**DPD** (Delegado de Protección de Datos)|**Supervisa el cumplimiento del RGPD** dentro de la organización|

---

### Notificación de Brechas de Seguridad

> [!IMPORTANT] Tiempo para notificar una brecha a la AEPD Una empresa que sufre una brecha de datos debe notificarlo a la **AEPD en un máximo de 72 horas**.

---

### Niveles de Seguridad y Datos Sensibles

|Nivel|Datos|Medidas|
|---|---|---|
|**Básico**|Nombre, dirección, teléfono, email|Contraseña, registro de accesos|
|**Medio**|Infracciones, finanzas, solvencia patrimonial|+ Responsable de seguridad, auditorías|
|**Alto**|**Religión, salud, ideología, orientación sexual, datos biométricos**|+ **Cifrado robusto** de datos|

> [!TIP] Datos que requieren nivel ALTO de seguridad Los datos especialmente protegidos: **religión, ideología política, salud, orientación sexual, datos biométricos**. En el examen siempre aparece uno de estos como la respuesta correcta cuando se pregunta por "nivel alto".

---

### Infracciones según la Normativa

|Gravedad|Ejemplo|
|---|---|
|**Leve**|No actualizar el documento de seguridad|
|**Grave**|**Tratar datos sin consentimiento**|
|**Muy grave**|**Impedir el ejercicio de derechos** de los usuarios|

---

### Evaluación de Impacto (EIPD)

> [!IMPORTANT] ¿Cuándo es obligatoria la EIPD? Cuando el tratamiento es de **alto riesgo**, por ejemplo: **monitorizar de forma sistemática y a gran escala una zona pública**. No es necesaria para el simple guardado de nombres o el uso de cookies técnicas.

---

### ISO 27001 — SGSI

> [!IMPORTANT] ISO 27001 Norma internacional que establece los **requisitos para un SGSI** (Sistema de Gestión de Seguridad de la Información). Sigue el modelo **PDCA** (Plan → Do → Check → Act).
 la iso 27001 se enfoca en porteger la informacion valiosa de la empresa
---

### LOPDGDD

> [!IMPORTANT] LOPDGDD (Ley Orgánica 3/2018) Ley española que **adapta el RGPD europeo al marco jurídico español**. Incluye derechos adicionales como el **derecho a la desconexión digital** en el ámbito laboral.

---

### LSSI-CE — Servicios de la Sociedad de la Información

> [!IMPORTANT] LSSI-CE Regula los **servicios de la sociedad de la información**: comercio electrónico, servicios online, comunicaciones comerciales por email...
> 
> **Prohíbe**: el envío masivo de correos comerciales **sin permiso** del destinatario (spam).
> 
> **Obliga a**: incluir en el aviso legal la **información clara de contacto e identidad** del prestador del servicio.
> 
> **Regula**: el uso de **cookies y comunicaciones comerciales electrónicas**.

> [!TIP] LSSI vs RGPD — ¿cuál regula qué?
> 
> - **Cookies y spam en internet** → **LSSI-CE**
> - **Protección de datos personales** → **RGPD / LOPDGDD**

---

### AEPD

> [!IMPORTANT] AEPD (Agencia Española de Protección de Datos) El organismo que **supervisa el cumplimiento** de la normativa de protección de datos en España.

---

### Diferencia Ley vs Reglamento

> [!IMPORTANT] Jerarquía normativa
> 
> - **Ley**: establece los **principios generales** (aprobada por el Parlamento)
> - **Reglamento**: **desarrolla y detalla** la ley (aprobado por el ejecutivo) La ley tiene rango **superior** al reglamento.

---

## Bloque 13 — Amenazas Avanzadas y Análisis Forense

### Técnicas de Ataque Avanzadas

|Técnica|Descripción|
|---|---|
|**Pass-the-hash**|Usa el **hash de una contraseña** (sin conocerla en texto) para autenticarse en otro sistema de la misma red|
|**Cipher downgrade**|Fuerza al sistema a usar un protocolo **de cifrado más débil** para luego vulnerarlo|
|**Pivoting**|Desde un sistema comprometido, **saltar a otros sistemas** de la red interna|
|**Fragmentación de botnet**|Dividir la botnet en grupos pequeños para **evitar detección**|
|**Watering hole**|Comprometer un sitio web visitado por las víctimas objetivo|

---

### Análisis Forense

|Tipo|Descripción|
|---|---|
|**Análisis en vivo**|Revisa **eventos, logs y configuraciones sin alterar** el sistema en ejecución|
|**Análisis estático**|Analiza el código o los archivos sin ejecutarlos|
|**Análisis dinámico**|Ejecuta el código en un entorno controlado para observar su comportamiento|

---

### Protocolos de Red Clave

|Protocolo|Función|
|---|---|
|**SSH**|Acceso remoto cifrado (puerto 22)|
|**RDP**|Escritorio remoto Windows (puerto 3389)|
|**VNC/RFB**|Control remoto gráfico (protocolo RFB)|
|**SMB/CIFS**|Compartir archivos en red Windows/Samba|
|**NFS**|Compartir archivos en red Unix/Linux|
|**LDAP**|Directorio centralizado de usuarios|
|**Kerberos**|Autenticación con tickets temporales|
|**IPP**|Internet Printing Protocol (CUPS)|
|**L2TP**|Encapsula tráfico no-IP en VPN|
|**HTTPS/TLS**|Web segura + confidencialidad en tránsito|

---

## 🎯 Resumen de Conceptos Trampa para el Examen

> [!WARNING] Los errores más frecuentes en los exámenes de este módulo

| Pregunta trampa                                  | Opción incorrecta frecuente           | Respuesta correcta                                          |
| ------------------------------------------------ | ------------------------------------- | ----------------------------------------------------------- |
| ¿Qué es la Triada CIA?                           | "Control, Identificación y Acceso"    | **Confidencialidad, Integridad, Disponibilidad**            |
| ¿Qué compromete un DoS?                          | "Confidencialidad"                    | **Disponibilidad**                                          |
| ¿Qué compromete un acceso no autorizado a datos? | "Integridad"                          | **Confidencialidad**                                        |
| ¿Qué compromete alterar un registro en BD?       | "Confidencialidad"                    | **Integridad**                                              |
| ¿El SAI protege qué pilar CIA?                   | "Confidencialidad"                    | **Disponibilidad**                                          |
| ¿Qué es una contraseña débil?                    | "Amenaza" / "Control"                 | **Vulnerabilidad**                                          |
| ¿Qué es una amenaza?                             | "Un daño ya producido"                | **Una posible causa de un incidente**                       |
| ¿Qué tipo de control es restaurar un backup?     | "Preventivo" / "Detectivo"            | **Correctivo**                                              |
| ¿Qué tipo de control es un firewall?             | "Detectivo" / "Correctivo"            | **Preventivo**                                              |
| ¿Qué cifrado usa AES?                            | "Asimétrico" / "Hash"                 | **Simétrico**                                               |
| ¿Cuál es el problema del cifrado simétrico?      | "Es lento" / "No es seguro"           | **El intercambio de claves**                                |
| ¿Qué hace un hash?                               | "Cifra datos" / "Comprime"            | **Genera un resumen**                                       |
| ¿Qué garantiza el no repudio?                    | "Integridad" / "Trazabilidad"         | **No repudio** (la firma no puede negarse)                  |
| ¿Qué protocolo reemplazó Telnet?                 | "FTP" / "HTTP"                        | **SSH**                                                     |
| ¿Qué protocolo usa VNC?                          | "RDP" / "TLS"                         | **RFB**                                                     |
| ¿Qué VPN conecta dos sedes?                      | "VPN personal" / "Acceso remoto"      | **VPN de sitio a sitio**                                    |
| ¿Qué RAID ofrece mayor velocidad?                | "RAID 1" / "RAID 5"                   | **RAID 0**                                                  |
| ¿Qué RAID es copia espejo?                       | "RAID 0" / "RAID 5"                   | **RAID 1**                                                  |
| ¿Cuántos discos mínimo RAID 5?                   | "2" / "4"                             | **3**                                                       |
| ¿Qué facilita más la restauración?               | "Incremental" / "Diferencial"         | **Copia Completa**                                          |
| ¿Cuál es la regla 3-2-1?                         | "3 soportes, 2 sitios, 1 nube"        | **3 copias, 2 soportes, 1 fuera**                           |
| ¿Qué hacer tras un backup?                       | "Cifrar la red" / "Reiniciar DNS"     | **Verificar la restauración**                               |
| ¿Qué SAI ofrece mayor protección?                | "Off-line" / "Interactivo"            | **On-line**                                                 |
| ¿Temperatura correcta en CPD?                    | "18 ºC" / "30 ºC"                     | **22 ºC**                                                   |
| ¿Humedad correcta en CPD?                        | "10-30%" / "70-90%"                   | **40-60%**                                                  |
| ¿Extintor en CPD?                                | "Agua" / "Polvo seco"                 | **CO₂**                                                     |
| ¿Qué detecta Snort?                              | "Intrusos en host (HIDS)"             | **Intrusos en red (NIDS)**                                  |
| ¿Qué es OSSEC/Wazuh?                             | "NIDS" / "Firewall"                   | **HIDS**                                                    |
| ¿Qué analiza tráfico con logs detallados?        | "Snort" / "Fail2ban"                  | **Zeek**                                                    |
| ¿Qué audita contraseñas?                         | "KeePassX" / "Nmap"                   | **John the Ripper**                                         |
| ¿Qué gestiona contraseñas de forma segura?       | "Nmap" / "Zeek"                       | **KeePassX**                                                |
| ¿Qué protocolo usa CUPS?                         | "SMTP" / "DHCP"                       | **IPP**                                                     |
| ¿Qué protocolo usa Samba?                        | "SSH" / "DNS"                         | **SMB/CIFS**                                                |
| ¿Qué comparte NFS?                               | "Solo en Windows"                     | **Archivos en entornos Unix/Linux**                         |
| ¿Qué hace SSO?                                   | "Usar una sola IP"                    | **Loguearse una vez para varios servicios**                 |
| ¿Qué riesgo tiene SSO?                           | "Aumenta velocidad de red"            | **Compromiso de todas las cuentas vinculadas**              |
| ¿Qué es el DPD?                                  | "Instala antivirus"                   | **Supervisa el cumplimiento del RGPD**                      |
| ¿En qué tiempo notificar brecha a la AEPD?       | "24 horas" / "48 horas"               | **72 horas**                                                |
| ¿Qué dato requiere nivel alto?                   | "Nombre" / "Dirección"                | **Religión (o salud, ideología...)**                        |
| ¿Qué regula cookies y spam?                      | "RGPD" / "LOPDGDD"                    | **LSSI-CE**                                                 |
| ¿Qué adapta el RGPD en España?                   | "La Constitución" / "El Código Penal" | **LOPDGDD**                                                 |
| ¿Qué hook procesa tráfico de router?             | "input" / "output"                    | **forward**                                                 |
| ¿Qué acción descarta paquetes en NFTables?       | "accept" / "counter"                  | **drop**                                                    |
| ¿Qué archivo .conf de fail2ban no modificar?     | ".local"                              | **El .conf** (usar siempre .local)                          |
| ¿Qué comando crea un repo Git?                   | "git create" / "git start"            | **git init**                                                |
| ¿Qué comando ve diferencias en Git?              | "git compare" / "git check"           | **git diff**                                                |
| ¿Qué diferencia SFTP de SCP?                     | "SCP cifra, SFTP no"                  | **SFTP permite navegación avanzada; SCP solo copia**        |
| ¿Qué rootkit diferencia de troyano?              | "Son lo mismo"                        | **Rootkit oculta su presencia; troyano finge ser legítimo** |

---

## 🔑 Glosario de Siglas y Acrónimos

| Sigla           | Significado                                                              |
| --------------- | ------------------------------------------------------------------------ |
| **CIA**         | Confidentiality, Integrity, Availability (Triada de seguridad)           |
| **SGSI**        | Sistema de Gestión de la Seguridad de la Información                     |
| **SSH**         | Secure Shell                                                             |
| **SCP**         | Secure Copy Protocol                                                     |
| **SFTP**        | Secure File Transfer Protocol                                            |
| **RDP**         | Remote Desktop Protocol                                                  |
| **VNC**         | Virtual Network Computing                                                |
| **RFB**         | Remote Framebuffer (protocolo de VNC)                                    |
| **VPN**         | Virtual Private Network                                                  |
| **IDS**         | Intrusion Detection System                                               |
| **IPS**         | Intrusion Prevention System                                              |
| **NIDS**        | Network IDS                                                              |
| **HIDS**        | Host IDS                                                                 |
| **DRP**         | Disaster Recovery Plan                                                   |
| **BCP**         | Business Continuity Plan                                                 |
| **RTO**         | Recovery Time Objective                                                  |
| **RPO**         | Recovery Point Objective                                                 |
| **RAID**        | Redundant Array of Independent Disks                                     |
| **LVM**         | Logical Volume Manager                                                   |
| **NAS**         | Network Attached Storage                                                 |
| **SAN**         | Storage Area Network                                                     |
| **SAI / UPS**   | Sistema de Alimentación Ininterrumpida / Uninterruptible Power Supply    |
| **CPD**         | Centro de Procesamiento de Datos                                         |
| **HVAC**        | Heating, Ventilation and Air Conditioning                                |
| **AES**         | Advanced Encryption Standard                                             |
| **LDAP**        | Lightweight Directory Access Protocol                                    |
| **SMB**         | Server Message Block                                                     |
| **CIFS**        | Common Internet File System                                              |
| **NFS**         | Network File System                                                      |
| **IPP**         | Internet Printing Protocol                                               |
| **CUPS**        | Common Unix Printing System                                              |
| **SSO**         | Single Sign-On                                                           |
| **MFA**         | Multi-Factor Authentication                                              |
| **NLA**         | Network Level Authentication                                             |
| **WSUS**        | Windows Server Update Services                                           |
| **CVE**         | Common Vulnerabilities and Exposures                                     |
| **RGPD / GDPR** | Reglamento General de Protección de Datos                                |
| **LOPDGDD**     | Ley Orgánica de Protección de Datos y Garantía de los Derechos Digitales |
| **LSSI-CE**     | Ley de Servicios de la Sociedad de la Información y Comercio Electrónico |
| **AEPD**        | Agencia Española de Protección de Datos                                  |
| **DPD**         | Delegado de Protección de Datos                                          |
| **EIPD**        | Evaluación de Impacto en la Protección de Datos                          |
| **PDCA**        | Plan-Do-Check-Act (ciclo de mejora continua ISO 27001)                   |
| **IoC**         | Indicators of Compromise (Indicadores de Compromiso)                     |

---

_Apuntes generados para 2º SMR — Módulo: Seguridad Informática_ _Basados en el test de repaso del módulo — Optimizados para Obsidian_


![[Pasted image 20260507191328.png]]
![[Pasted image 20260507191558.png]]![[Pasted image 20260507191707.png]]
![[Pasted image 20260507191921.png]]
![[Pasted image 20260507191948.png]]![[Pasted image 20260507192036.png]]
![[Pasted image 20260507192112.png]]

![[Pasted image 20260507192258.png]]
![[Pasted image 20260507192516.png]]

![[Pasted image 20260507192829.png]]

![[Pasted image 20260507193010.png]]
![[Pasted image 20260507193048.png]]

![[Pasted image 20260507193107.png]]
![[Pasted image 20260507193547.png]]
![[Pasted image 20260507193708.png]]


![[Pasted image 20260507193735.png]]
![[Pasted image 20260507193755.png]]
![[Pasted image 20260507194000.png]]

![[Pasted image 20260507194630.png]]

