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

Corporativa en BBVA
Contexto
BBVA, uno de los principales
bancos españoles, cuenta con
miles de empleados en su
sede central en Madrid. La red
debía dar servicio a
ordenadores, impresoras de
red, teléfonos IP y dispositivos
móviles de visitantes.
Configurar manualmente
cada dispositivo habría
supuesto un enorme coste de
tiempo y un alto riesgo de
conflictos.
Estrategia
El equipo de IT implementó
servidores DHCP sobre
Windows Server en alta
disponibilidad. Se definieron
ámbitos para cada planta del
edificio (ej. 10.10.1.0/24 para la
planta 1, 10.10.2.0/24 para la
planta 2, etc.). Además:
Se configuraron reservas
DHCP para impresoras y
servidores críticos,
garantizando que siempre
recibieran la misma IP.
Se establecieron políticas
de concesión de 8 horas
para dispositivos móviles,
optimizando la reutilización
de direcciones.
Se integró la configuración
DHCP con DNS dinámico
para registrar
automáticamente los
nombres de los equipos en
la red corporativa.
Resultado
20
Reducción drástica de
incidencias por IP duplicadas
(de 20 al mes a prácticamente
cero).
80%
Reducción tiempo
Tiempo de despliegue de
nuevos equipos reducido en
un 80%.
Capacidad para absorber
picos de visitantes en eventos
sin necesidad de ajustes
manuales.
Este caso demuestra cómo el
DHCP es mucho más que un
facilitador: es un componente
crítico para la operativa diaria
de grandes corporaciones.


## Herramientas y Consejos para DHCP 

**Wireshark**
Herramienta de análisis de red que permite capturar y visualizar el ciclo DORA.
 
**Administrador de DHCP en Windows Server**
Interfaz gráfica que permite crear ámbitos,reservas y ver concesiones activas. 
**ISC DHCP en Linux**
Paquete clásico para
servidores DHCP. Su
configuración en
/etc/dhcp/dhcpd.conf
permite un control
detallado de rangos,
opLinuxciones y reservas.

**Comandos de diagnóstico**
`ipconfig /all` (Windows): muestra concesiones activas y parámetros asignados.
`dhclient -v` (): fuerza renovación de concesión y muestra el intercambio de mensajes.

**Buenas prácticas**
Usar reservas DHCP en lugar de configurar IP
fija manual en dispositivos críticos.
Documentar los ámbitos definidos y
mantenerlos sincronizados con el equipo de
DNS.
Configurar alertas en logs para detectar
intentos de servidores DHCP "rogue" (no
autorizados).


## Mitos y Realidades

Mito
"DHCP solo sirve para dar direcciones IP." ³
 El servidor DHCP puede proporcionar: puerta de enlace, DNS, servidores de tiempo, servidores PXE para arranque remoto, entre otros. 
 
Mito
"El DHCP funciona de forma caótica, los clientes se autoconfiguran sin control." ³ FALSO. El
proceso está totalmente controlado por el servidor. Es este quien decide qué IP entregar,
por cuánto tiempo y bajo qué condiciones. El
cliente simplemente solicita y acepta lo que el
servidor autoriza.
Resumen final
Recursos clave: CPU, memoria, disco y red.
Sistemas de archivos: ext4, XFS (Linux); NTFS, FAT32 (Windows).
Herramientas: top, systemctl en Linux;
services.msc, Task Manager en Windows.
Buenas prácticas: monitorización constante + gestión eficiente de servicios.4
Sesión 2 3 Instalación y configuración de clientes/servidores
DHCP. Reservas, exclusiones y monitorización
Un servidor DHCP no solo reparte direcciones IP de forma automática: también actúa como el
núcleo de la administración de red en cualquier organización moderna. Para entender cómo
desplegarlo correctamente, hay que conocer los elementos clave de su configuración:
Ámbitos (Scopes)
Definen el rango de direcciones que el
servidor puede asignar. Por ejemplo, en
una red 192.168.1.0/24, podrías crear un
ámbito de 192.168.1.100 a 192.168.1.200 para
equipos de oficina.
Reservas
Permiten asociar una dirección IP fija a un
dispositivo específico, basándose en su
dirección MAC. Así, un proyector o
impresora siempre recibirá la misma IP
aunque la configuración sea automática.
Exclusiones
Dentro de un rango, puedes marcar
direcciones que no deben entregarse
nunca, ya sea porque están asignadas
manualmente a servidores o a routers.
Duración de concesión
Determina cuánto tiempo un cliente
conserva la IP antes de renovarla. Un
plazo corto (ej. 4 horas) es útil en redes
con muchos dispositivos temporales,
mientras que uno largo (ej. 8 días)
funciona mejor en oficinas estables.
En la práctica, existen dos grandes entornos de despliegue:
1. Linux
El servidor más común es ISC DHCP Server,
con un archivo de configuración central
(/etc/dhcp/dhcpd.conf). Su flexibilidad
permite definir múltiples subredes, opciones
avanzadas e integración con DNS dinámico.
2. Windows Server
Incluye un rol DHCP que se gestiona desde
la consola "Administrador del servidor". Su
interfaz gráfica facilita la creación de
ámbitos, reservas y exclusiones, y permite la
replicación entre servidores para alta
disponibilidad.
Además de configurar, es imprescindible monitorizar el funcionamiento. Los logs de
concesiones permiten detectar anomalías, como intentos de clientes de obtener IP fuera del
rango o la aparición de servidores DHCP no autorizados (rogue DHCP).
En resumen, instalar y configurar un servidor DHCP implica mucho más que habilitar el
servicio: supone definir reglas claras, mantener control sobre qué dispositivos reciben
direcciones y garantizar la seguridad de la red.5
Esquema Visual
El siguiente diagrama conceptual muestra los componentes de un servidor DHCP y su gestión.
Descripción del esquema:
El servidor DHCP es el núcleo de la gestión.
Desde él se definen ámbitos (para usuarios), reservas (para dispositivos críticos) y
exclusiones (para direcciones especiales).
La configuración de concesiones controla los tiempos de validez.
La monitorización asegura la detección de incidentes y protege la red frente a intrusiones.
Caso de Estudio: Universidad
Complutense de Madrid
Contexto
La Universidad Complutense, con más de 2000 alumnos conectados
simultáneamente en su campus principal, necesitaba una solución que
garantizara una gestión centralizada y eficiente de direcciones IP. El reto era doble:
soportar un gran volumen de usuarios móviles y asegurar conectividad estable
para equipos fijos como proyectores y servidores de laboratorio.
Estrategia
01
Implementación de servidores
Se implementaron servidores DHCP sobre Linux (ISC DHCP), distribuidos en dos
centros de datos con redundancia.
02
Segmentación por facultades
Se crearon ámbitos específicos por facultad para segmentar la red (ej. Ciencias,
Derecho, Medicina).
03
Reservas para equipos críticos
Se aplicaron reservas DHCP a proyectores y dispositivos de red, evitando que
cambiaran de dirección y se perdiera la conectividad.
04
Protección de infraestructura
Se configuraron exclusiones para proteger direcciones utilizadas por routers y
equipos de infraestructura.
05
Sistema de monitorización
Se estableció un sistema de monitorización con Wireshark y syslog, detectando
accesos sospechosos y verificando la asignación correcta de IPs.
Resultados
Eliminación total
De conflictos por IP duplicadas.
Reducción drástica
Del tiempo de despliegue de equipos en aulas: de 15 minutos por equipo a
apenas segundos.
Escalabilidad
Posibilidad de escalar la red sin esfuerzo cuando el número de alumnos
conectados superó las previsiones iniciales.
Este caso muestra cómo la combinación de reservas, exclusiones y monitorización
convierte al DHCP en una herramienta estratégica para gestionar redes de gran
escala.7
Herramientas y Consejos Clave
ISC DHCP Server (Linux)
La referencia en entornos libres. Su archivo dhcpd.conf
permite configurar múltiples subredes, reservas por
MAC y tiempos de concesión.
DHCP Manager (Windows Server)
Interfaz gráfica que simplifica la creación de ámbitos,
exclusiones y la visualización de concesiones.
Comandos de Diagnóstico
ipconfig /all (Windows): Muestra concesiones y
detalles completos de la configuración IP.
dhclient -v (Linux): Permite renovar y depurar la
asignación de direcciones.
Wireshark
Permite analizar en tiempo real los mensajes DHCP y
detectar servidores no autorizados.
Buenas Prácticas Profesionales
Documentación
Documenta cada ámbito y su rango de
direcciones para evitar solapamientos.
Reservas para Críticos
Configura reservas para todos los dispositivos
críticos (impresoras, routers, servidores).
Exclusiones Claras
Define exclusiones claras para direcciones
manuales y sistemas de red.
Revisión de Logs
Revisa periódicamente los logs para identificar
intentos de intrusión o errores de concesión.
Mitos y Realidades del DHCP
o
Mito: "Una reserva DHCP es lo mismo
que configurar una IP fija en el cliente."
Realidad: FALSO. Una IP fija manual depende de la
configuración del usuario y puede entrar en conflicto
con otros dispositivos. En cambio, la reserva DHCP
asegura que el servidor siempre entregue la misma
dirección a un dispositivo, manteniendo el control
centralizado.
o
Mito: "El DHCP no permite excepciones,
todo es completamente automático."
Realidad: FALSO. El administrador puede definir
exclusiones, reservas y diferentes políticas de
concesión. DHCP es flexible y se adapta a distintos
escenarios, desde una red de oficina hasta un
campus universitario.
Resumen Final
DHCP distribuye IPs de forma automática, pero requiere configuración precisa.
Elementos clave: ámbitos, reservas, exclusiones y concesiones.
Linux (ISC DHCP) y Windows Server ofrecen herramientas de gestión y monitorización.
Las reservas garantizan IP fija centralizada, las exclusiones previenen conflictos.
La monitorización detecta fallos y servidores no autorizados.8
Sesión 3 3 Fundamentos de DNS: espacios de nombres, consultas
iterativas/recursivas, resolvers
El DNS (Domain Name System) es uno de los pilares más importantes de Internet. Su misión es convertir los nombres de
dominio legibles por las personas (como www.google.com) en direcciones IP (142.250.190.78) que los equipos utilizan para
comunicarse. Sin DNS, Internet sería un lugar donde todo tendría que recordarse por números, lo que resultaría imposible de
gestionar.
El sistema se basa en tres grandes principios:
3. Espacio de nombres
jerárquico
En la cúspide está la raíz (.), que
contiene referencias a todos los
dominios de nivel superior.
Los TLDs (Top-Level Domains)
como .com, .org, .es agrupan
dominios.
Cada TLD contiene múltiples
dominios secundarios como
example.com.
Finalmente, existen los
subdominios, que permiten
estructurar servicios (ej.
blog.example.com).
4. Resolvers
Son programas que se ejecutan
en los clientes y actúan como
intermediarios entre las
aplicaciones y los servidores
DNS.
Un navegador web, por ejemplo,
no consulta directamente a los
servidores raíz, sino que delega
la tarea al resolver configurado
(generalmente del proveedor de
Internet o de servicios públicos
como Google DNS o Cloudflare).
5. Consultas DNS
Iterativa: el servidor responde
con lo que sabe o con la
dirección de otro servidor que
podría tener la respuesta. Es el
cliente quien sigue consultando.
Recursiva: el servidor se encarga
de recorrer toda la cadena de
servidores hasta obtener la
respuesta final y la devuelve al
cliente.
En el contexto profesional, entender el DNS es clave no solo para navegación web, sino también para servicios críticos como
correo electrónico (registros MX), seguridad (DNSSEC) y administración de redes internas. Las caídas de DNS suelen generar
impacto global, incluso aunque los servidores de las aplicaciones estén funcionando.
Cliente/Resolver
Inicia la consulta DNS
Servidor Local
Recibe y decide tipo de
consulta
Consultas Iterativas
Raíz ³ TLD ³ dominio ³
subdominio
Consulta Recursiva
Resolver delegado resuelve y
devuelve
Descripción del esquema:
El cliente consulta primero a su resolver local.
En una consulta iterativa, el resolver recibe referencias sucesivas (de raíz a TLD, de TLD a dominio, etc.) hasta alcanzar la
respuesta.
En una consulta recursiva, el resolver delegado (ej. Google 8.8.8.8) realiza todo el proceso en nombre del cliente y
devuelve la respuesta final.
La jerarquía garantiza que cada nivel tenga autoridad sobre su zona.9
Caso de Estudio: Caída global de
Cloudflare (2021)
Contexto
En julio de 2021, una
interrupción en la red de
Cloudflare, uno de los
principales proveedores
de DNS y servicios de
seguridad, provocó que
millones de usuarios en
todo el mundo no
pudieran acceder a webs
y aplicaciones críticas.
Estrategia
Cloudflare opera
resolvers públicos
(1.1.1.1) y servicios de
DNS autoritativo para
miles de dominios.
Un fallo en la
propagación de rutas
internas (BGP) afectó
al acceso a sus
resolvers, lo que dejó
sin servicio a millones
de usuarios aunque
los servidores web de
las empresas
estuvieran
funcionando
perfectamente.
Resultado
Plataformas como
Discord, Shopify y
servicios de
criptomonedas
quedaron
inaccesibles durante
varias horas.
El incidente evidenció
que si el DNS falla,
para los usuarios es
como si Internet
hubiera
desaparecido,
aunque la
infraestructura de
fondo siga activa.
Este caso resalta la importancia del DNS como servicio crítico y la necesidad de redundancia
en la infraestructura.10
Herramientas y Consejos
Comandos Esenciales
nslookup dominio.com
(Windows/Linux) ³
Consulta registros
básicos.
dig dominio.com
(Linux/Unix) ³
Herramienta avanzada
que permite ver detalles
de la resolución, tipo de
consulta y tiempos.
dig +trace dominio.com ³
Muestra paso a paso
cómo se resuelve un
dominio desde la raíz
hasta el servidor final.
Resolvers Públicos
Recomendados
Google DNS: 8.8.8.8 y
8.8.4.4 ³ Alta
disponibilidad y rapidez.
Cloudflare DNS: 1.1.1.1 ³
Privacidad reforzada y
baja latencia.
Quad9: 9.9.9.9 ³
Orientado a seguridad,
bloquea dominios
maliciosos conocidos.
Buenas Prácticas
Profesionales
Configura siempre al
menos dos servidores
DNS en clientes y
servidores para
redundancia.
Habilita la caché local en
resolvers internos para
mejorar el rendimiento y
reducir el tráfico externo.
Monitoriza la expiración
de registros en DNS
autoritativo
(especialmente los MX de
correo) para evitar
interrupciones en
servicios críticos.
Mitos y Realidades del DNS
Mito: "El DNS solo guarda direcciones
IP."
FALSO. El DNS almacena múltiples tipos de
registros: A (IPv4), AAAA (IPv6), MX (correo),
CNAME (alias), TXT (verificación y seguridad,
como SPF o DKIM). Su función es mucho más
amplia que la simple traducción de nombres a
IP.
Mito: "Todas las consultas DNS son
recursivas."
FALSO. Existen dos tipos: iterativas (el cliente
va avanzando paso a paso) y recursivas (el
servidor hace todo el trabajo). Entender esta
diferencia es crucial para diagnosticar
problemas de resolución y optimizar la
infraestructura.
Resumen Final
DNS traduce nombres de dominio a direcciones IP.
Estructura jerárquica: raíz ³ TLD ³ dominio ³ subdominio.
Dos tipos de consulta: iterativa y recursiva.
Los resolvers hacen de intermediarios entre clientes y servidores DNS.
Es un servicio crítico: si falla, la red se vuelve inutilizable para el usuario.11
Sesión 4 3 Instalación de servidores DNS. Archivos de zona,
registros, DNS dinámico y seguridad
Un servidor DNS es la pieza encargada de responder a las consultas de resolución de nombres
dentro de una red local o en Internet. Si los resolvers son los intermediarios de los clientes, los
servidores DNS autoritativos son la fuente de verdad para un dominio concreto.
Los elementos esenciales de su configuración son:
1
Archivos de zona
Son ficheros de texto que
contienen la información
de un dominio gestionado.
En ellos se definen los
registros DNS, como:
A: relaciona un nombre
con una dirección IPv4.
AAAA: lo mismo pero
con IPv6.
MX: indica el servidor
de correo electrónico.
CNAME: crea alias de
un nombre hacia otro.
TXT: almacena
información adicional
(ej. validaciones SPF,
DKIM).
2
DNS Dinámico (DDNS)
Permite que los clientes
actualicen sus propios
registros en el servidor DNS
automáticamente. Es
especialmente útil en
redes donde el servidor
DHCP asigna direcciones
que cambian con el
tiempo. Así, un equipo que
recibe una IP nueva puede
registrarse sin intervención
manual.
3
Seguridad en DNS
Restricción de
transferencias de zona:
solo servidores
autorizados deben
poder replicar
información entre sí.
DNSSEC (Domain Name
System Security
Extensions): añade
firmas digitales a las
respuestas DNS,
protegiendo frente a
ataques de
suplantación (cache
poisoning).
Filtrado de consultas
recursivas: un servidor
autoritativo no debería
responder
recursivamente a
cualquiera, ya que
podría ser usado en
ataques de
amplificación.
En el ámbito profesional, los servidores más comunes son:
BIND9 en Linux: el más extendido a nivel
mundial, muy flexible y potente.
Microsoft DNS Server en Windows: integrado
en Active Directory, facilita la gestión de redes
corporativas con autenticación centralizada.12
Esquema Visual
Descripción del esquema:
El servidor DNS se alimenta de archivos de zona, donde están los registros que definen un
dominio.
El DDNS permite actualizaciones automáticas desde clientes o servidores DHCP.
La seguridad se articula en tres niveles:
DNSSEC para validar la autenticidad de las respuestas.
Restricción de transferencias para que solo servidores secundarios autorizados
puedan sincronizarse.
Filtrado de consultas recursivas para limitar el abuso.13
Caso de Estudio: Red
Corporativa de
Telefónica
Contexto
Telefónica, con sedes distribuidas en múltiples países,
necesitaba un sistema robusto de resolución de nombres
tanto para sus servicios internos como para los clientes.
Los riesgos de ataques de cache poisoning y de saturación
en consultas eran altos debido a la magnitud de su red.
Estrategia
Implementaron servidores BIND9 en Linux para servicios
públicos y Microsoft DNS Server integrado en Active
Directory para entornos internos. Configuraron zonas
primarias y secundarias para redundancia y equilibrio de
carga. Habilitaron DNS Dinámico seguro, de forma que
solo equipos autenticados en Active Directory podían
registrar o actualizar sus direcciones. Implementaron
DNSSEC en dominios clave, garantizando autenticidad en
la resolución. Restringieron las transferencias de zona
únicamente a servidores autorizados y filtraron las
consultas recursivas para mitigar ataques de
amplificación.
Resultado
Reducción drástica de intentos de envenenamiento de
caché. Alta disponibilidad en la resolución de nombres
gracias a la redundancia de servidores. Mayor confianza
en servicios críticos como correo electrónico y
aplicaciones internas, que dependen del DNS para su
funcionamiento diario.
Este caso muestra cómo el DNS, bien configurado y protegido,
no solo facilita la navegación, sino que blinda la seguridad de
toda la organización.14
Herramientas y Consejos
Herramientas Principales
BIND9 (Linux) 3 El estándar más extendido en
servidores DNS. Sus archivos de zona suelen estar
en /etc/bind/.
Microsoft DNS Server 3 Integrado en Windows
Server y Active Directory, permite una gestión
sencilla y escalable.
Microsoft DNS Server
Integrado en Windows Server y Active Directory,
permite una gestión sencilla y escalable.
Comandos Útiles
named-checkconf (Linux): valida la sintaxis del
archivo de configuración de BIND.
named-checkzone dominio archivo (Linux):
comprueba la validez de un archivo de zona.
nslookup o dig: para probar consultas y verificar
que los registros responden correctamente.
Buenas Prácticas Profesionales
Define zonas secundarias para asegurar
redundancia.
Activa DNSSEC en los dominios bajo tu control.
Controla las transferencias de zona: no dejes
abierto el acceso a cualquiera.
Documenta todos los registros críticos (MX, SPF,
DKIM) y revisa periódicamente su caducidad.
Mitos y Realidades
o
Mito: "El DNS dinámico significa que las
direcciones cambian constantemente."
³ FALSO. El DNS dinámico no implica cambios
aleatorios, sino que permite a los clientes actualizar
automáticamente sus registros cuando su IP varía.
Esto evita inconsistencias entre el DHCP y el DNS.
o
Mito: "El DNS no necesita medidas de
seguridad."
³ FALSO. El DNS es uno de los principales vectores de
ataque. Sin DNSSEC ni restricciones de transferencia,
un atacante puede manipular respuestas, redirigir
tráfico o usar servidores abiertos para ataques DDoS.
Resumen Final
Un servidor DNS responde a consultas de resolución para dominios locales o globales.
Los archivos de zona contienen registros esenciales: A, AAAA, MX, CNAME, TXT.
El DNS dinámico permite actualizaciones automáticas, clave en redes con DHCP.
La seguridad exige DNSSEC, restricciones de transferencia y filtrado recursivo.
Casos como Telefónica demuestran que el DNS es crítico para la estabilidad y seguridad empresarial.15













