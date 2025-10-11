# Configuración dinámica y resolución de nombres (DHCP + DNS)

**Sesión**  **1**  IP, máscara, puerta de enlace. Protocolo DHCP: funcionamiento, mensajes, concesiones

Cada dispositivo conectado a una red necesita ciertos básicos para poder comunicarse:

**Dirección IP:** identifica de forma única al dispositivo dentro de la red.
**Máscara de subred:** determina qué parte de la dirección corresponde a la red y cuál al host.
**Puerta de enlace predeterminada:** es la salida hacia otras redes, normalmente un router.

El **DHCP** automatiza esos procesos. 
El cliente envía una petición al server DHCP y recibe automáticamente todos
los parámetros necesarios . 

**Proceso** **DORA**
El funcionamiento de DHCP se basa en un ciclo de cuatro mensajes conocido como DORA:

- Discover
	El cliente lanza un mensaje broadcast preguntando si existe un server DHCP disponible.

- Offer
	El server responde ofreciendo una IP y parámetros de configuración.

- Request
	El cliente solicita formalmente esa dirección.

- Acknowledge (Ack)
	El servidor confirma y registra la concesión.

Garantiza que cada dispositivo reciba una dirección válida y que no se duplique con otro equipo
en la red. 
DHCP puede entregar más parámetros: direcciones de servidores DNS, tiempo de concesión
de la IP, e incluso opciones avanzadas como servidores de arranque PXE para despliegue de sistemas operativos.

**Esquema Visual del Protocolo DHCP**
![[Pasted image 20251009163721.png]]

1. El cliente que se conecta a la red y envía el mensaje Discover.
2. El server responde con una Offer de parámetros (IP, máscara, gateway, DNS).
3. El cliente confirma con un Request, y el servidor cierra el ciclo con el Acknowledge.

## Herramientas y Consejos para DHCP 

**Wireshark**
Herramienta de análisis de red que permite capturar y visualizar el ciclo DORA.
 
**Administrador de DHCP en Windows Server**
Interfaz gráfica que permite crear ámbitos,reservas y ver concesiones activas. 
**ISC DHCP en Linux**
Paquete clásico para servidores DHCP. Su configuración en
`/etc/dhcp/dhcpd.conf`
permite un control detallado de rangos, opciones y reservas.

**Comandos de diagnóstico**
`ipconfig /all` (Windows): muestra concesiones activas y parámetros asignados.
`dhclient -v` (): fuerza renovación de concesión y muestra el intercambio de mensajes.

**Buenas prácticas**
Usar reservas DHCP en lugar de configurar IP fija manual en dispositivos críticos.
Documentar los ámbitos definidos y mantenerlos sincronizados con el equipo de DNS.
Configurar alertas en logs para detectarintentos de servidores DHCP "rogue" (no
autorizados).


## Mitos y Realidades

**Mito**
**DHCP solo sirve para dar direcciones IP.**
El DHCP puede proporcionar: puerta de enlace, DNS, servidores de tiempo, servidores PXE para arranque remoto, entre otros. 
 
**Mito**
**"El DHCP funciona de forma caótica, los clientes se autoconfiguran sin control."** 
el servidor decide qué IP entregar, por cuánto tiempo y bajo qué condiciones. El
cliente simplemente solicita y acepta lo que elservidor autoriza.

#### Resumen final
**Recursos clave:** CPU, memoria, disco y red.
**Sistemas de archivos:** ext4, XFS (Linux); NTFS, FAT32 (Windows).
**Herramientas:** top, systemctl en Linux;
services.msc, Task Manager en Windows.
Buenas prácticas: monitorización constante + gestión eficiente de servicios.

**Instalación y configuración de clientes/servidores DHCP.** 
**Reservas, exclusiones y monitorización**

Un DHCP no solo reparte direcciones IP: también actúa como el núcleo de la administración de red.  
**elementos clave** de su configuración:

**Ámbitos (Scopes)**
Definen el rango de direcciones que el servidor puede asignar.
en una red 192.168.1.0/24, podrías crear un ámbito de 192.168.1.100 a 192.168.1.200
**Reservas**
Permiten asociar una dirección IP fija a un dispositivo , basándose en su MAC
**Exclusiones**
Dentro de un rango, puedes marcar direcciones que no deben entregarse nunca
**Duración de concesión**
Determina cuánto tiempo un cliente conserva la IP antes de renovarla. 

dos grandes entornos de despliegue:

1. **Linux**
El servidor más común es ISC DHCP Server, con un archivo de configuración
(/etc/dhcp/dhcpd.conf). permite definir múltiples subredes, opciones avanzadas e integración con DNS dinámico.
2. **Windows Server**
Incluye un rol DHCP que se gestiona desde la consola "Administrador del servidor". 


**Esquema Visual**
![[Pasted image 20251010205616.png]]
El servidor **DHCP** es el **núcleo** de la gestión.
se definen ámbitos (para usuarios), reservas (para dispositivos críticos) y exclusiones (para direcciones especiales).
La configuración de concesiones controla los tiempos de validez.
La monitorización asegura la detección de incidentes y protege la red frente a intrusiones.

**Herramientas y Consejos Clave 

**ISC DHCP Server (Linux)**
La referencia en entornos libres. Su archivo dhcpd.conf permite configurar múltiples subredes, reservas por MAC y tiempos de concesión.
**DHCP Manager (Windows Server)**
simplifica la creación de ámbitos, exclusiones y la visualización de concesiones.
**Comandos de Diagnóstico**
`ipconfig /all` (Windows): Muestra concesiones y detalles de la configuración IP.
`dhclient -v` (Linux): Permite renovar y depurar la asignación de direcciones.

**Wireshark**
analizar en tiempo real los mensajes DHCP y detectar servidores no autorizados.

**Buenas Prácticas Profesionales**
Documentación
Reservas para Críticos
Configura reservas para todos los dispositivos críticos
Exclusiones Claras
Define exclusiones claras para direcciones manuales y sistemas de red.
Revisión de Logs
Revisa periódicamente los logs para 

**Mito**: **"Una reserva DHCP es lo mismo que configurar una IP fija en el cliente."**
Una IP fija depende de la configuración y puede entrar en conflicto, la reserva DHCP asegura que el servidor siempre entregue la misma dirección a un dispositivo

**Resumen Final**
DHCP distribuye IPs de forma automática, pero requiere configuración precisa.
Elementos clave: ámbitos, reservas, exclusiones y concesiones.
Linux (ISC DHCP) y Windows Server ofrecen herramientas de gestión y monitorización.
Las reservas garantizan IP fija centralizada, las exclusiones previenen conflictos.
La monitorización detecta fallos y servidores no autorizados.

**Fundamentos de DNS: espacios de nombres, consultas iterativas/recursivas, resolvers**

**El sistema se basa en tres grandes principios:**

**Espacio de nombres jerárquico**
En la cúspide está la raíz (.), que contiene referencias a los dominios de nivel superior.
Los TLDs (Top-Level Domains) como .com, .org, .es agrupan dominios.
Cada TLD contiene múltiples dominios secundarios como example.com.
existen los subdominios, que permiten estructurar servicios 

**Resolvers**
se ejecutan en los clientes y actúan como intermediarios entre las aplicaciones y los servidores DNS.

**Consultas DNS**
el servidor responde con lo que sabe o con la dirección de otro servidor que
podría tener la respuesta. Es el cliente quien sigue consultando.
Recursiva: el servidor se encarga de recorrer la cadena de servidores hasta obtener la
respuesta final y la devuelve al cliente.


- El cliente consulta primero a su resolver local.
- En una consulta iterativa, el resolver recibe referencias sucesivas hasta alcanzar la respuesta.
- En una consulta recursiva, el resolver delegado (ej. Google 8.8.8.8) realiza el proceso en nombre del cliente y devuelve la respuesta final.
- La jerarquía garantiza que cada nivel tenga autoridad sobre su zona.

**Comandos Esenciales**
`nslookup dominio.com` (Windows/Linux)  Consulta registros básicos.
`dig dominio.com` (Linux/Unix)  permite ver detalles de la resolución, tipo de
consulta y tiempos.
`dig +trace dominio.com` 
Muestra cómo se resuelve un dominio desde la raíz hasta el servidor final.

**Resolvers Públicos Recomendados**
- **Google DNS:** 8.8.8.8 y 8.8.4.4  Alta disponibilidad y rapidez.
- **Cloudflare DNS:** 1.1.1.1 Privacidad reforzada y baja latencia.
- **Quad9:** 9.9.9.9 Orientado a seguridad, bloquea dominios maliciosos conocidos.

**Buenas Prácticas**
- Configura siempre al menos dos servidores DNS en clientes y servidores.
- Habilita la caché local en resolvers internos para mejorar el rendimiento
- Monitoriza la expiración de registros en DNS autoritativo

**Mito: "El DNS solo guarda direcciones IP."**
El DNS almacena múltiples tipos de registros: A (IPv4), AAAA (IPv6), MX (correo),
CNAME (alias), TXT (verificación y seguridad, como SPF o DKIM). 

**Mito: "Todas las consultas DNS son recursivas."**
Existen dos tipos: iterativas (el cliente va avanzando paso a paso) 
recursivas (el servidor hace todo el trabajo). 

**Resumen Final**
DNS traduce nombres de dominio a direcciones IP.
Estructura jerárquica: raíz ³ TLD ³ dominio ³ subdominio.
Dos tipos de consulta: iterativa y recursiva.
Los resolvers hacen de intermediarios entre clientes y servidores DNS.
Es un servicio crítico: si falla, la red se vuelve inutilizable para el usuario.11

## Instalación de servidores DNS. Archivos de zona, registros, DNS dinámico y seguridad

**Archivos de zona**
Son ficheros de texto que contienen la información de un dominio gestionado.
En ellos se definen los registros DNS, como:
A: relaciona un nombre con una dirección IPv4.
AAAA: lo mismo pero con IPv6.
MX: indica el servidor de correo electrónico.
CNAME: crea alias de un nombre hacia otro.
TXT: almacena información adicional

**DNS Dinámico (DDNS)**
Permite que los clientes actualicen sus registros en el servidor DNS automáticamente.
Así, un equipo que recibe una IP nueva puede registrarse sin intervención manual.

**Seguridad en DNS**
Restricción de transferencias de zona:
solo servidores autorizados deben poder replicar información entre sí.

DNSSEC (Domain Name System Security Extensions): 
añade firmas digitales a las respuestas DNS, protegiendo frente a ataques de suplantación

Filtrado de consultas recursivas:
un servidor autoritativo no debería responder recursivamente a cualquiera, ya que
podría ser usado en ataques de amplificación.


En el ámbito profesional, **los servidores más comunes** son:
**BIND9** en Linux: el más extendido a nivel mundial, muy flexible y potente.
**Microsoft DNS Server** en Windows: integrado en Active Directory, facilita la gestión de redes corporativas con autenticación centralizada.

El **DNS** se alimenta de archivos de zona, donde están los registros que definen un
dominio.
El **DDNS** permite actualizaciones automáticas desde clientes o servidores DHCP.
La **seguridad** se articula en tres niveles:
- DNSSEC para validar la autenticidad de las respuestas.
- Restricción de transferencias para que solo servidores secundarios autorizados puedan sincronizarse.
- Filtrado de consultas recursivas para limitar el abuso.



#### Herramientas Principales
**BIND9 (Linux)** El estándar más extendido en servidores DNS. Sus archivos de zona suelen estar en /etc/bind/.
**Microsoft DNS Server** Integrado en Windows Server y Active Directory, permite una gestión sencilla y escalable.

#### Microsoft DNS Server
Integrado en Windows Server y Active Directory, permite una gestión sencilla y escalable.

#### Comandos Útiles
`named-checkconf` (Linux): valida la sintaxis del archivo de configuración de BIND.
`named-checkzone dominio archivo` (Linux): comprueba validez de un archivo de zona.
`nslookup o dig`: para probar consultas y verificar que los registros responden.

#### Buenas Prácticas Profesionales
- Define zonas secundarias para asegurar redundancia.
- Activa DNSSEC en los dominios bajo tu control. 
- Controla las transferencias de zona: no dejes abierto el acceso a cualquiera.
- Documenta todos los registros críticos (MX, SPF, DKIM) y revisa su caducidad.

**Mitos y Realidades**

**Mito: "El DNS dinámico significa que las direcciones cambian constantemente."**
El DNS dinámico permite a los clientes actualizar automáticamente sus registros cuando su IP varía.

**Mito: "El DNS no necesita medidas de seguridad."**
El DNS es uno de los principales vectores de ataque. 

**Resumen Final**
Un servidor DNS responde a consultas de resolución para dominios locales o globales.
Los archivos de zona contienen registros esenciales: A, AAAA, MX, CNAME, TXT.
El DNS dinámico permite actualizaciones automáticas, clave en redes con DHCP.
La seguridad exige DNSSEC, restricciones de transferencia y filtrado recursivo.
Casos como Telefónica demuestran que el DNS es crítico para la estabilidad y seguridad empresarial.













