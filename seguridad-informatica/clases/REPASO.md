
la seguridad informática es un conjunto de principios, procesos y controles que se aplican de forma continua para proteger la información y los servicios. 
![[Pasted image 20251107163411.png]]
## Aspectos de la seguridad 
**Confidencialidad (confidenciality)** Privacidad de los datos Sólo puede acceder a la info los usuarios autorizados por propietario. Y cada usuario sólo debe acceder a su parte de información . 
**Riesgos**: robo de información, acceso no autorizado, pérdida o difusión (involuntarias), intercepción de las comunicaciones... 
**Controles**: control de acceso, criptografía, seguridad física... 

**Integridad (integrity)** La información no debe ser modificada o destruida de forma no autorizada Consistencia interna y externa de los datos 
● Consistencia interna: la información del sistema debe cumplir unas reglas de “sanidad”
● Consistencia externa: los datos deben reflejar la realidad 
**Riesgos**: corrupción por fallo hardware, modificación intencionada de datos, errores en la entrada de datos, errores software, modificación de las transmisiones... 
**Controles**: control de acceso, mantenimiento hardware, redundancia, criptografía... 

**Disponibilidad (Availability)** Capacidad de respuesta a una peticiones con las mínimas pausas por causas involuntarias.  Se mide la disponibilidad de un SI en «nueves». 
SI ofrece una disponibilidad de «2 nueves», si está disponible el 99% del tiempo. etc...

### Aspectos adicionales

**Legalidad o cumplimiento (compliance):** Ajuste a las normas con empresas colaboradoras . Políticas y normas internas 

**Autenticidad**: Los datos provienen de quien se supone que provienen (autenticidad de datos) Los usuarios son quienes dicen ser (autenticidad de usuarios) 

**Trazabilidad**: saber quién realizó cada acción en el sistema, y de dónde provienen los datos y sus modificaciones  

**No repudio (non-repudiation)** Proporciona pruebas legalmente vinculantes de la realización de una acción Necesario en comercio electrónico y administración electrónica 

**La seguridad** no es un producto, es un proceso: estos pilares no se aseguran mediante soluciones técnicas/organizativas únicamente. Hay que gestionar la seguridad.
![[Pasted image 20251108124004.png]]
![[Pasted image 20251108124151.png]]
## **¿Qué es el firewall?** 
es un programa que examina los paquetes de red entrantes y salientes y decide autorizar o no el paso en función de las reglas que dictamine el admin. 
niega la entrada o salida de tráfico basándose en parámetros ej. IP de origen y/o destino , El puerto de origen y/o destino , El protocolo etc…

Tipos de cortafuegos. 
un dispositivo controla todo el tráfico de entrada y salida de una red. Por desgracia tiene el inconveniente de que si un intruso logra «saltarse» el cortafuegos tendrá acceso total a toda la red. • El mecanismo más utilizado hoy en día es la creación de una «zona desmilitarizada» o DMZ y requiere varios dispositivos. También se conoce por el nombre de «screened host».




### IP Tables y NFTables 
Las distros modernas usan nftables. pero `iptables` sigue siendo funcional y  usado. 

### NFTables
#### Instalación de cortafuegos. Ubicación. 
• NFTables es una arquitectura de filtrado de paquetes que se integra con el núcleo de Linux y reemplaza a IPTables .
Para instalarlo podemos hacer lo siguiente: 
sudo apt-get update y sudo apt-get upgrade 
sudo apt-get remove iptables; para no tener varios sistemas de filtrado ejecutándose a la vez. 
sudo apt-get install nftables para instalar NFTables .

el comando nft que permite el acceso al sistema de filtrado. 
configuracion: el cortafuegos entre mi red e Internet, el equipo permite filtrar el tráfico entre ambas redes. 
**Advertencia** El comando nft debe ejecutarse SIEMPRE como administrador. 


#### Reglas de filtrado de cortafuegos. 
NFTables es la “nueva” arquitectura de filtrado y manipulación de paquetes de red en el núcleo de Linux. NFTables distingue entre varias «familias de protocolos de red»
«ip»:  IPv4 
«ip6»: IPv6
«inet»: tanto IPv4 como IPv6. 
«arp»: para tramas Ethernet. 
«bridge»: para tramas Ethernet que crucen este equipo cuando esté siendo usado como switch. 
«netdev»: examinar todo el tráfico que entre en la tarjeta. 

El comando básico de acceso a todas las operaciones es **nft**. examina los paquetes y analiza las reglas que se le dan para decidir que hacer con un paquete de red. mediante **«hooks», «tablas», «cadenas» y «reglas»**:

Una **tabla** indica el protocolo que queremos analizar, puede ser «ip», «ip6», «arp», «bridge» ...
comandos como nft list tables o nft listtables ip , permiten ver qué hemos hecho con protocolos. 
**crear** una tabla con sudo nft add table ipTablaFiltradoSQL 
**borrar** con sudo nft delete table ip TablaFiltradoSQL. 
 
Un «**hook**» es una etapa en la que está un paquete. 
	a) «Prerouting»: el paquete aún no ha entrado en la tabla de enrutamiento. 
	b) «Input»: el paquete era para nosotros pero aún no ha entrado en ningún programa. 
	c) «Output»: paquete sale de nuestro programa pero aún no se ha decidido qué hacer con él. 
	d) «Postrouting»: paquete que sale de nuestro programa  ya cruzo la tabla de enrutamiento.
	e) «Forwarding»: para paquetes que cruzan nuestra máquina pero no son para nosotros
el tráfico que entre verá los **hooks** «prerouting» e «input». El que sale verá «ouput» y «postrouting». El que atraviesa el equipo mientras funciona como router verá «forwarding». 


Una «**cadena**» es un conjunto de reglas que nft irá examinando por orden para decidir qué hacer con un paquete. Una cadena puede ser «base» o «no base».
«base» puede ver TODO el tráfico TCP y una «no base» al principio no ve nada. 
En una cadena hay que indicar el tipo de manipulación aplicar en un protocolo: «filter», «route» y «nat». 
también  indicar la etapa o hook.  Se debe indicar la prioridad un numero menor se examina antes. e indicar la política; accept (la predeterminada) o drop. 

Una «**regla**»  va metida dentro de una cadena. Toda regla tiene:  Un identificador o «handle»,  Una posición dentro de la cadena
Una regla PUEDE llevar un «match» para crear «condiciones» y saber si una regla se aplica o no. si hay un «match»  DEBE haber una sentencia, que indique lo que se tiene que hacer en ese caso. 


Una vez configurado todo podemos hacer lo siguiente: 
sudo nft list ruleset muestra la configuración del cortafuegos 
sudo nft list ruleset > ficheronftables.conf 
Si el fichero anterior lo ponemos «encima» de /etc/nftables.conf el sistema operativo recargará esta configuración.El comando sería algo como: 
sudo cp ficheronftables.conf /etc/nftables.conf 
Sudo systemctl reload nftables recagar la configuración 
Sudo systemctl enable nftables cada vez que inicia el sistema inicia el servicio

#### Gestión de tablas 
Crear una tabla que trabaje con el protocolo IPv4: nft add table ip filtradoBD 
Crear una tabla que trabaje con IP ( versión 4 o 6): nft add table inet filtradoWeb 
Ver las tablas del cortafuegos: nft list tables 
Borrar una tabla: • sudo nft delete table ip filtradoBD o sudo nft delete table inet filtradoWeb 
Se pueden borrar absolutamente todas las tablas con nft flush ruleset 

#### Gestión de cadenas 
cadena se llamara «traficoEntrada»: 
sudo nft add chain ip filtradoUsuarios traficoEntrada {type filter hook input priority 0\; } 

#### **Gestión de reglas** 

 Ejemplos 
1. **Rechazar conexiones SSH externas:**  
   `sudo nft add rule ip filtradoUsuarios traficoEntrada tcp dport 22 drop`  
   *Descarta tráfico al puerto 22 (SSH).*

2. **Borrar una cadena:**  
   `nft flush chain ip filtradoUsuarios traficoEntrada`  
   *Elimina todas las reglas de la cadena.*

3. **Listar reglas para ver handles:**  
   `nft list table ip filtradoUsuarios`  
   *Muestra las reglas con sus identificadores (handles) para borrar reglas específicas.*



#### **Matches Comunes:**
- **IP de origen:**  `ip saddr 192.168.47.5 drop`   *Descarta paquetes desde una IP específica.*

- **IP de destino:**  `ip daddr 10.45.10.10 drop`  *Descarta paquetes hacia una IP específica.*

- **Rango de IPs:**   `ip daddr 10.45.10.0/24 drop`  *Descarta tráfico hacia una subred.*

- **Puerto de destino:**   `tcp dport 80 drop`  *Descarta tráfico al puerto 80 (HTTP).*

- **Combinar campos:**  `ip saddr 192.168.47.5 tcp dport 443 drop`  Descarta tráfico desde una IP hacia el puerto 443 (HTTPS).*


#### **Reglas Avanzadas:**
1. **Rangos de puertos y IPs:**  
   `ip saddr 192.168.1.0/24 tcp dport 1-1024 drop`  
	*Descarta tráfico desde una subred a puertos 1-1024.*

3. **Limitar tráfico:**  
   - `ip saddr 192.168.1.45 limit rate 100 kbytes/second accept`  
     *Acepta tráfico hasta 100 kB/s.*  
   - `ip saddr 192.168.1.45 limit rate over 100 kbytes/second drop`  
     *Descarta si excede el límite.*

3. **NAT (redirección):**  
   `sudo nft add rule ip tablaNAT natEntrada tcp dport 80 dnat to 192.168.100.10:80`  
   *Redirige tráfico del puerto 80 a un servidor interno.*

- Usa `nft list table [tabla]` para ver reglas y handles.
- Las reglas de límite de tráfico suelen aplicarse en cadenas `prerouting`.
- Ordena las reglas correctamente (ej: límites después de aceptar tráfico base).



**Acciones sobre paquetes** 
drop (descartar),  
counter permite hacer un recuento de bytes/paquetes que cumplen una regla . 
accept

**Pruebas de funcionamiento de firewall. Sondeo.** 
- Usar una herramienta genérica de gestión de redes, como netcat 
- Usar una herramienta específica de comprobación de puertos como nmapzenmap o wireshark 
- Usar los ficheros de log para registrar la actividad de la red. 

**Registros de sucesos de un cortafuegos**. 
Se puede registrar el tráfico que entra en un cortafuegos como nft . 
Para ello, se debe usar la acción log por ejemplo: 
`sudo nft add rule ip tablaFiltrado cadenaEntrada log` . registra todo el tráfico que circule por esa cadena.    puede ser excesivo. 
`sudo nft add rule ip tablaFiltrado cadenaEntrada tcp dport 80 log` . registra solo el tráfico de entrada HTTP. 
Los registros del cortafuegos van al fichero /etc/syslog


#### Conceptos Básicos de Redes para Cortafuegos

**Elementos Clave de un Paquete:**
- **Dirección IP:**  **Origen:** Quién envía el paquete  **Destino:** A dónde va el paquete  
- **Puerto:**  
  - **Puerto destino:** Identifica el servicio **Puerto origen:** normalmente random, menos importante  

**Decisiones sobre Paquetes:**
1. **PERMITIR** - Dejar pasar el paquete
2. **DENEGAR** - Bloquear el paquete  
3. **REDIRIGIR** - Enviar a otra dirección

**Criterios para Tomar Decisiones:**
- **Por IP de origen** → `ip saddr`
- **Por IP de destino** → `ip daddr`  
- **Por puerto de destino** → `tcp dport` o `udp dport`
- **Por protocolo** → Ej: bloquear todo ICMP
- **Por flags TCP** → (Menos común) examinar SYN, ACK, RST



## Copias de seguridad
##### Tipos de copias de seguridad 
**Copia de seguridad normal o completa.** Copia todos los archivos seleccionados y los marca como copiados (es decir, se desactiva el atributo de modificado).  se suelen realizar al crear por primera vez un conjunto de copia de seguridad. 

**Copia de seguridad diferencial.** Copia los archivos desde la última copia de seguridad normal . Los archivos no se marcan como copiados .  
Necesitas: Última copia normal **+** última copia diferencial


**Copia de seguridad incremental.** copia los archivos desde la última copia de seguridad de cualquier tipo. Marca los archivos como copiados .
Última copia normal **+** **TODAS** las copias incrementales posteriores

![[Pasted image 20251108124441.png]]


## Controles detectivos y correctivos 

los controles de seguridad se clasifican en tres tipos:
![[Pasted image 20251108124553.png]]
#### Control Detectivo 
permite identificar incidentes de seguridad una vez que han ocurrido o mientras ocurren. Ejemplos: • Monitorización de tráfico de red. • Análisis de logs del sistema. • Detección de intrusiones con IDS. • Uso de honeypots para registrar ataques. 

Snort (IDS - Intrusion Detection System) Snort es un sistema de detección de intrusos basado en red (NIDS). • Permite analizar el tráfico y detectar ataques mediante reglas. Comandos básicos: sudo apt install snort sudo snort -T -i eth0 -c /etc/snort/snort.lua sudo snort -A console -i eth0 -c /etc/snort/snort.lua Ejemplo de uso: Monitorear tráfico en tiempo real: sudo snort -A fast -i eth0 Ver alertas en /var/log/snort/alert

OSSEC / Wazuh (HIDS - Host-based IDS) • OSSEC: Monitorea logs y archivos del sistema local (HIDS). • Detecta modificaciones sospechosas, escaladas de privilegios, etc. Instalación (modo agente en Kali): • sudo apt install wazuh-agent • Configura el agente para conectarse al servidor Wazuh y revisa los logs: • sudo tail -f /var/ossec/logs/ossec.log Detecta: • Cambios en ficheros críticos. • Intentos fallidos de login. • Actividad sospechosa en procesos.



#### Controles correctivos 
Medidas que actúan después de un incidente para mitigar daños, recuperar operaciones y prevenir su repetición.

| Tipo           | Ejemplo                                  | Descripción                                        |
|----------------|------------------------------------------|----------------------------------------------------|
| **Técnico**    | Restauración de copias de seguridad      | Recupera datos perdidos tras un ataque.            |
| **Físico**     | Reparación de cerraduras o alarmas dañadas | Restablece la seguridad física.                   |
| **Administrativo** | Actualización de políticas              | Corrige fallos detectados tras una auditoría.      |
| **Humano**     | Reentrenamiento del personal             | Evita que se repita un error humano.               |

#### Automatizar mitigación: Fail2BAN
Instala fail2ban y crea una jail básica para SSH: 
sudo tee /etc/fail2ban/jail.d/ssh-local.conf > /dev/null <<'EOF’ 

[sshd] 
enabled = true 
port = ssh  
filter = sshd 
logpath = /var/log/auth.log • maxretry = 5 
findtime = 600 • bantime = 3600 
EOF

sudo systemctl restart fail2ban 
sudo fail2ban-client status sshd 
Esto banea IPs con más de 5 intentos fallidos en 10 minutos al intentar entrar por ssh durante 1 hora. 
https://www.youtube.com/watch?v=_3VlnrOkM14 

![[Pasted image 20251107164253.png]]


**¿Qué debería llevar un informe?** 
Encabezado a. Autor/a: [Tu nombre] 
Departamento: [Ciberseguridad ] 
Práctica: [“Detección de intentos de intrusión SSH con Snort y análisis de logs”] 
Fecha: 24/10/2025 
1. Objetivo 
2. Entorno 
Herramientas + URL oficiales 
Actividad realizada (pasos) 
Evidencias 
Análisis 
Recomendaciones. 
Conclusión (Lecciones aprendidas) + ataque real (meter presión) referencia -noticia 

#### Planes de recuperación ante desastres (DRP) 
es un conjunto de estrategias, procedimientos y acciones para que una organización pueda recuperar sus sistemas, datos y operaciones críticas después de un evento adverso
para minimizar el tiempo de inactividad y la pérdida de información, y la empresa pueda continuar operando lo más rápido posible.

![[Pasted image 20251108124721.png]]
###### **Componentes clave de un PRD** 

**Análisis de Impacto en el Negocio (BIA)** 
Identificar procesos críticos y el impacto de su interrupción. 
Determinar el Tiempo Objetivo de Recuperación (RTO) y el Punto Objetivo de Recuperación (RPO).

**Evaluación de Riesgos** 
Identificar amenazas y vulnerabilidades. 
Clasificar los riesgos según su probabilidad y severidad. 
![[Pasted image 20251107163022.png]]


**Estrategias de Recuperación** 
Copias de seguridad y redundancia de datos. 
Sistemas alternativos (servidores espejo, nube, contingencia). 
Procedimientos de comunicación y coordinación. 

**Procedimientos de Respuesta** 
Pasos detallados para reaccionar ante distintos tipos de desastre. 
Roles y responsabilidades del personal clave. 

**Pruebas y Mantenimiento** 
Simulaciones periódicas de desastres. 
Actualización constante del plan según cambios tecnológicos o de negocio.











tema 3: Seguridad Física y Lógica 

Clasificación de la Seguridad Informática 

  
 #### **Dependiendo del MOMENTO DE ACTUACION** 
	 **Seguridad Activa**  Conjunto de medidas preventivas con objetivo de evitar i
	 ncidentes antes de que ocurran. 
	 
	**Seguridad Pasiva**  Su objetivo es minimizar el impacto de un incidente una  
	vez que ya ha ocurrido. Es complementaria a la seguridad activa. 

 #### **Según el ACTIVO a proteger**
## **Seguridad Física** 
Se centra en proteger elementos tangibles (hardware, instalaciones, servidores, cableado, etc.) frente a daños, robos o desastres naturales.

El primer paso para establecer la seguridad de un equipo es decidir dónde instalarlo. 
Los planes de seguridad física aplican barreras físicas y procedimientos de control, como medidas de prevención y contramedidas para proteger los recursos y la información, tanto para mantener la seguridad dentro y alrededor del Centro de Cálculo como los medios de acceso remoto a él o desde él. 

Cada sistema informático es único. no podemos pensar que existe un plan de seguridad general aplicable a cualquier tipo de instalación. 

**Factores para elegir la ubicación**
tratamiento acustico, menos cirtico
suministro electico cpd  
seguridad fisica del edificio
otros factores



**Control de acceso** • Es necesario un férreo control de acceso al mismo. 
Servicio de Vigilancia, donde el acceso es controlado por personal de seguridad. 
Detectores de Metales y escáneres de control de pertenencias. 
Utilización de Sistemas Biométricos 
Protección Electrónica, sensores conectados a alarmas que reaccionan ante distintas señales. 


**Seguridad eléctrica** • un sis informático puede tener problemas con la alimentación eléctrica, como: 
• PICO 
• RUIDO ELÉCTRICO 
• CORTE DE LUZ 
• CAÍDAS DE TENSIÓN

Para tratar de minimizar estos problemas,, la mejor alternativa es un Sistema de Alimentación Ininterrumpida (Uninterrupted Power Supply) 

SAI (UPS - Uninterrupted Power Supply) permite dar energía eléctrica constante a un pc incluso si el suministro principal de energía se ve interrumpido. utiliza una batería cargada. también suelen funcionar como reguladores de voltaje eléctrico. 

**Sais Off-Line** • suministra la corriente eléctrica sin ningún filtro a los dispositivos conectados, carece de Regulador de voltaje. solamente empezará a funcionar cuando detecte un fallo de corriente eléctrica, es en este momento cuando se comenzará a suministrar la energía que ha ido almacenando en sus baterías a los dispositivos. 
Estos Sais necesitan un tiempo de conmutación 2-10 ms, para pasar a modo baterías,
solo recomendables en una red estable ya que al no realizar ningún filtrado de la corriente, solo protegen ante un corte de suministro eléctrico. • Dispositivos poco sensibles como ordenadores personales de gama baja, televisores, monitores, router, etc.. 
es recomendable utilizar este tipo de SAIS en zonas con pocas anomalías eléctricas y buena calidad de red. 


**SAI Interactivo In-Line**
sistema de protección eléctrica **intermedio** entre el Off-Line y el On-Line.
**regula y filtra** siempre la tensión de la red eléctrica ±15% con filtros activos y un microprocesador.
**Mejora la corriente** que reciben los aparatos **sin usar las baterías**, protegiéndolos no solo de apagones, sino también de subidas y bajadas de voltaje.

**Salida:** Proporciona una onda **pseudo-sinusoidal** o **sinusoidal pura** 
**Tiempo de conmutación:**  interrupción (2-10 ms) al cambiar a batería, como los SAI Off-Line.
**Ruido:** Los modelos con onda sinusoidal pura son **muy silenciosos**.

**Ideales para:** Ordenadores, consolas , routers, cámaras de seguridad y pequeños servidores.
No recomendables para dispositivos muy sensibles a microcortes .
**Para equipos sensibles:** es **obligatorio** usar un SAI con **salida sinusoidal pura**.


**Sais OnLine** realiza una doble conversión de la energía eléctrica que recibe, transformándola en continua y después a alterna de nuevo, 
siempre proporciona energía eléctrica directamente desde sus baterías mientras estas se van cargando de la red, garantiza la protección total contra cualquier problema de la red eléctrica.
destinada a proteger cualquier instalacion informática crítica o imprescindible 



¿Qué SAI elegir? 
![[Pasted image 20251115153452.png]]

La capacidad de un SAI se mide en **Voltiamperios (VA)** o **KiloVoltioamperios (kVA)**.
Los dispositivos que conectamos muestran su consumo en **Vatios (W)**. 
**Para calcular el SAI necesario:**
    1.  Suma los vatios (W) de todos los aparatos a conectar.
    2.  **Añade un 20%** extra a ese total para cubrir picos de consumo.
    3.  El resultado son los vatios que tu SAI debe poder suministrar.


#### Almacenamiento de la Información
Se basa en tres aspectos:
*   **Rendimiento:** Velocidad para guardar/recuperar datos.
*   **Disponibilidad:** Garantía de poder recuperar la información cuando se necesite.
*   **Accesibilidad:** Facilidad de acceso para usuarios autorizados.

• HDD • SSD a. SATA b. mSATA c. M.2 • SCSI

![[Pasted image 20251115154205.png]]

**Sistemas de Almacenamiento Externo:**
*   **NAS (Almacenamiento Conectado en Red):** Dispositivos de almacenamiento que se acceden por la red local (ej: usando Samba o NFS). Suelen usar discos en RAID.
*   **SAN (Red de Área de Almacenamiento):** Una red dedicada y de alta velocidad solo para almacenamiento.
*   **Almacenamiento en la Nube:** Guardar archivos en servicios de Internet.

#### Almacenamiento Redundante (RAID)
RAID usa varios discos para distribuir o copiar datos, aumentando la velocidad o la seguridad.
*   **RAID 0 (Dividido):** Mejora la velocidad, pero **si un disco falla, se pierden todos los datos**. No hay copia de seguridad.
![[Pasted image 20251115154906.png]]
*   **RAID 1 (Espejo):** Duplica los datos en otro disco. Si uno falla, el sistema sigue funcionando. El espacio útil se reduce a la mitad.
![[Pasted image 20251115154646.png]]
*   **RAID 5 (Dividido con Paridad):** Usa al menos 3 discos. Los datos y la información de recuperación (paridad) se reparten entre todos. Soporta el fallo de un solo disco. Se pierde la capacidad de un disco.
 ![[Pasted image 20251115154939.png]]

**LVM (Gestor de Volúmenes Lógicos):** Es una herramienta que permite agrupar discos físicos (PV) en grupos de volúmenes (VG) para crear unidades lógicas (LV) de forma flexible, sin depender del hardware físico.

#### 4. Centros de Procesamiento de Datos (CPD)
Un CPD es el lugar donde una organización concentra sus recursos para procesar información.

**Requisitos clave:**
*   **Disponibilidad 24/7** y alta fiabilidad (ej. 99.999%).
*   **Redundancia:** Múltiples fuentes de electricidad, SAIs, etc.
*   **Seguridad física:** Paredes resistentes al fuego (ej. RF-60), puertas con cierre, materiales incombustibles y sellado contra agua.
*   **Control ambiental:** Temperatura controlada de forma muy precisa (alrededor de **22.3°C**).
*   **Extintores** de dióxido de carbono (CO₂).



## **Seguridad Lógica** 
criptografia
Los algoritmos de cifrado se clasifican en dos grandes tipos: 
a. De cifrado en bloque: dividen el texto origen en bloques de bits de un tamaño fijo y los cifran de manera independiente. 
b. De cifrado de flujo: el cifrado se realiza bit a bit, byte a byte o carácter a carácter. 
• Las dos técnicas más sencillas de cifrado son: 
a. La sustitución: supone el cambio de significado de los elementos básicos del mensaje, las letras, los dígitos o los símbolos. 
b. La transposición: supone una reordenación de los mismos, pero los elementos básicos no se modifican en sí mismos. 

El descifrado es el proceso inverso que recupera el texto plano a partir del criptograma y la clave. 

Un buen sistema de cifrado pone toda la seguridad en la clave y ninguna en el algoritmo. 
### Tipos de algoritmos de cifrado 
#### **Criptografía Simétrica** 
es un método criptográfico en el cual se usa una misma clave para cifrar y descifrar mensajes.  
Las dos partes han de ponerse de acuerdo sobre la clave a usar.
el remitente cifra un mensaje usándola, lo envía al destinatario y éste lo descifra con la misma. 

**Algunos ejemplos de algoritmos de cifrado simétrico son:** 
• El algoritmo de cifrado DES usa una clave de 56 bits, 2^56 claves posibles
• Algoritmos de cifrado como 3DES, Blowfish e IDEA usan claves de 128 bits, 2^128 claves posibles.
• Otros algoritmos de cifrado muy usados son RC5 y AES, Advanced Encryption Standard,

**Los principales problemas de cifrado simétrico :** 
a. El intercambio de claves: una vez que el remitente y el destinatario hayan intercambiado las claves pueden usarlas para comunicarse con seguridad, pero, ¿qué canal de comunicación seguro han usado para transmitirse las claves? Sería mucho más fácil para un atacante intentar interceptar una clave que probar las posibles combinaciones del espacio de claves
b. El número de claves que se necesitan: si tenemos un número n de personas que necesitan comunicarse entre sí, se necesitan n/2 claves diferentes para cada pareja de personas que tengan que comunicarse de modo privado. Esto puede funcionar con un grupo reducido de personas, pero sería imposible llevarlo a cabo con grupos más grandes. Para solucionar estos problemas se mejora la seguridad de los sistemas, mediante la criptografía asimétrica y la criptografía híbrida. 

#### **Criptografía Asimétrica** 
cada usuario del sistema criptográfico ha de poseer una pareja de claves: 
**a. Clave privada:** será custodiada por su propietario y no se dará a conocer a ningún otro. 
**b. Clave pública:** será conocida por todos los usuarios. 
Esta pareja es complementaria: lo que cifra una solo lo puede descifrar la otra y viceversa. 
es imposible conocer una clave a partir de la otra. 

Una función de un solo sentido es aquella cuya computación es fácil, y su inversión es difícil.
Un hash de un sentido es algo parecido, pero tiene una simplificación o atajo, si se conoce alguna parte de la información, sería fácil computar el inverso. .

La seguridad de un sistema no se puede comparar solo por el tamaño de la clave, ya que las claves simétricas (ej. 128 bits) y asimétricas (ej. 1024 bits) requieren longitudes diferentes para un mismo nivel de protección, siendo la asimétrica más lenta y con mayor sobrecarga

Herramientas software como PGP o en comunicaciones TCP/IP, protocolos como SSH o la capa de seguridad TLS/SSL, utilizan un cifrado híbrido formado por la criptografía asimétrica para intercambiar claves de criptografía simétrica y la criptografía simétrica para la transmisión de la información. 
• Algunos algoritmos de técnicas de clave asimétrica son: a. Diffie-Hellman, RSA, DSA, ElGamal, criptografía de curva elíptica. • Algunos protocolos y software que usan los algoritmos antes citados son: a. DSS (Digital Signature Standard) con el algoritmo DSA (Digital Signature Algorithm). PGP y GPG, una implementación de OpenPGP, SSH, SSL y TLS. 

#### **Criptografía Híbrida** 
1. **Se genera una clave simétrica NUEVA y única** para esta comunicación.
2. **Se cifra el mensaje** con esa clave simétrica.
3. **Se cifra la clave simétrica** con la clave pública del destinatario (criptografía asimétrica).
4. **Se envían AMBAS cosas cifradas:**
    - El mensaje cifrado con la clave simétrica.
        
    - La clave simétrica cifrada con la clave pública.


#### **Firma Digital** 
permite al receptor verificar la autenticidad del origen de la información y verificar que dicha info no ha sido modificada desde su generación.  la firma digital ofrece el soporte para la autenticación e integridad de los datos así como para el no repudio en origen, ya que la persona que origina un mensaje firmado digitalmente no puede argumentar que no lo hizo. 

Mecánica de la generación y comprobación de una firma digital. lo que comprueba:
a. Autenticación: la firma digital es equivalente a la firma física de un documento. 
b. Integridad: el mensaje no podrá ser modificado. 
c. No repudio en origen: el emisor no puede negar haber enviado el mensaje. 

**Certificados Digitales** 
Para garantizar la unicidad de las claves privadas se suele recurrir a soportes físicos tales como tarjetas inteligentes que garantizan la imposibilidad de la duplicación de las claves. las tarjetas criptográficas suelen estar protegidas por un PIN.

**un certificado digital** es un archivo que puede emplear un software para firmar digitalmente archivos y mensajes
y que contienen información sobre una persona o entidad, nombre, dirección, mail, el ámbito de utilización de la clave pública, las fechas de inicio y fin de la validez del certificado, etc., así como una clave pública y una firma digital de una autoridad certificadora u organismo de confianza, 


**Terceras partes de confianza** 
La validez de un certificado es la confianza en que la clave pública contenida en el certificado pertenece al usuario indicado en el certificado. La manera en que se puede confiar en el certificado de un usuario con el que nunca hemos tenido ninguna relación previa es mediante la confianza en terceras partes. 
ambos usuarios tienen relación con una tercera parte y ésta puede dar fe de la fiabilidad de los dos. 


**DNI electrónico o DNIE** 
similar al tradicional y su principal novedad es que incorpora un pequeño circuito integrado (chip), capaz de guardar de forma segura, mediante medidas específicas de seguridad para impedir su falsificación, contiene: 
a. Un certificado electrónico para autenticar la personalidad del ciudadano. 
b. Un certificado electrónico para firmar electrónicamente, con la misma validez jurídica que la firma manuscrita. 
c. Certificado de la Autoridad de Certificación emisora. 
d. Claves para su utilización. e. La plantilla biométrica de la impresión dactilar.

Para la utilización del DNI electrónico es necesario contar con : 
i. Hardware específico: lector de tarjetas inteligentes que cumpla el estándar ISO-7816. 
ii. Software específico: controladores o módulos criptográficos que permitan el acceso al chip de la tarjeta y, por tanto la utilización de los certificados contenidos en él. En Windows es el servicio CryptographicService Provider (CSP), y en los entornos GNU/Linux o MAC el módulo criptográfico se denomina PKCS#11. 


# Resumen para Examen: DNIe 4.0, MFA y SSH

## DNI Electrónico 4.0 (DNIe 4.0) - 2022

**Características Principales:**
- Se puede llevar en el teléfono móvil
- Permite realizar operaciones bancarias (sacar dinero, ir al banco) solo con el móvil

**Tecnología:**
- Microchip con tecnología **contactless (NFC)**
- Almacena: foto, firma, huellas dactilares, certificados de autenticación y firma electrónica

**Seguridad:**
- Diseñado por Policía Nacional y Fábrica Nacional de Moneda y Timbre
- Características que 'blindan' el documento y lo hacen difícil de falsificar

**Usos del 'DNI Europeo':**
- Acceder a servicios públicos
- Solicitar certificados (nacimiento, médico)
- Comunicar cambio de domicilio
- Abrir cuentas bancarias
- Presentar declaración de impuestos
- Solicitar plaza en universidades
- Almacenar recetas médicas válidas en Europa
- Alquilar coches con permiso de conducir digital
- Registrarse en hoteles

---

## Autenticación Multifactor (MFA)

**Definición:**
- Mecanismo de seguridad que requiere **más de un factor** para verificar la identidad
- Protege incluso si alguien obtiene tu contraseña

**Factores de Autenticación:**
1. **Algo que sabes**: Contraseña, PIN, patrón
2. **Algo que tienes**: Token físico, smartphone con app
3. **Algo que eres**: Biométricos (huella, reconocimiento facial, iris, voz)
4. **Factores adicionales**: Ubicación, comportamiento, hora de acceso

**Ejemplos de MFA:**
- **Código OTP (One-Time Password)**
  - Apps: Google Authenticator, Authy, Microsoft Authenticator
  - Cambia cada 30 segundos
  - Ejemplo: Gmail pide código de 6 dígitos después de la contraseña

- **SMS o Email con código**
  - Código temporal por SMS o correo
  - Ejemplo: bancos envían SMS con código único

- **Llave de seguridad física (hardware token)**
  - Dispositivo como YubiKey (USB o NFC)
  - Ejemplo: GitHub, Google

- **Notificación push**
  - App pregunta: "¿Estás intentando iniciar sesión?"
  - Ejemplo: Duo Mobile, Microsoft Authenticator

- **Biometría**
  - Face ID en iPhone, huella digital en Android para apps bancarias

---

## Configuración con Claves SSH para Git/GitHub

**Verificar si existen claves SSH:**
```bash
ls -al ~/.ssh
```
Si existen, se verán archivos como: `id_rsa` (privada) y `id_rsa.pub` (pública)

**Generar nuevas claves (si no existen):**
```bash
mkdir $HOME/.ssh
ssh-keygen -t rsa -b 4096 -C your@email.com
```

**Importante:**
- **Clave pública** (`id_rsa.pub`): Para autenticación (compartir)
- **Clave privada** (`id_rsa`): NUNCA revelar

**Configurar ssh-agent:**
- Verificar ejecución:
  ```bash
  eval "$(ssh-agent -s)"  # Mac/Linux
  ssh-agent -s           # Windows
  ```
- Añadir clave privada:
  ```bash
  ssh-add ~/.ssh/id_rsa
  ```

**Copiar clave pública:**
- Linux/Mac: `cat ~/.ssh/id_rsa.pub`
- Windows: `clip < ~/.ssh/id_rsa.pub`

**Añadir clave a GitHub:**
1. Ir a Settings → SSH and GPG keys
2. Click "New SSH key"
3. Pegar clave pública

**Verificar autenticación:**
```bash
ssh -T git@github.com
```
Mensaje esperado: `Hi your_user_name! You've successfully authenticated...`






