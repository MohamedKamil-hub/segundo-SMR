
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