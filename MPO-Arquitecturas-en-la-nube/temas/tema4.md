### Sesión 8: VPC: Subredes públicas y privadas, conexión a Internet 

#### Arquitectura de Red en la Nube con AWS VPC
Virtual Private Cloud (VPC) Representa una red virtual privada, configurable y aislada, donde defines las reglas de comunicación, los rangos de direcciones IP, las subredes y las rutas del tráfico.

**Subredes públicas** Contienen recursos que necesitan comunicarse con Internet, como servidores web, balanceadores de carga o gateways de API.tienen rutas hacia un Internet Gateway (IGW). 

**Subredes privadas** Albergan recursos internos, como bases de datos, servidores de aplicaciones o instancias de backend, no  accesibles desde el exterior. sino a través de un NAT Gateway.

A esto se añaden las Route Tables, que determinan hacia dónde se dirige el tráfico de cada subred, y las políticas de seguridad: 
- Security Groups actúan a nivel de instancia, permitiendo o bloqueando puertos y direcciones IP específicas.
- Network Access Control Lists (NACLs). operan a nivel de subred, dando control adicional del tráfico entrante y saliente. 

estos elementos permiten construir redes modulares, seguras y escalables, donde cada capa cumple una función específica. Por ejemplo, una arquitectura típica de tres niveles se organiza así: 

01 Capa web En subred pública, detrás de un balanceador de carga. 
02 Capa de aplicación En subred privada, comunicándose solo con la capa web. 
03 Capa de datos En subred privada aislada, sin salida directa a Internet. 

una VPC en AWS te permite tener el mismo control de red que en una infraestructura física, pero con la agilidad, elasticidad y automatización propias de la nube. 


**Esquema** 
1. VPC (10.0.0.0/16): el contenedor principal de toda la red.1
2. Subredes Públicas: alojan recursos que deben tener visibilidad externa
3. Subredes Privadas: contienen servicios internos  sin acceso directo a Internet.
4. Internet Gateway (IGW): conecta la red pública con Internet.
5. NAT Gateway: permite que las subredes privadas accedan a Internet sin exposición pública. 
6. Route Tables: definen las rutas. pública dirige tráfico a el IGW; privada hacia el NAT Gateway. 
7. Security Groups / NACLs: añade capa de filtrado, define qué tráfico está permitido entre zonas. 


**Resumen final** VPC: red privada virtual dentro de AWS, totalmente configurable. Subredes públicas: acceso directo a Internet mediante Internet Gateway. Subredes privadas: sin acceso público, pero con salida controlada a través de NAT Gateway. Route Tables: definen el flujo del tráfico entre subredes. Security Groups / NACLs: capas de protección que filtran tráfico entrante y saliente. Aislamiento y segmentación: principios clave para la seguridad y el rendimiento. 


## DNS en AWS (Route 53) y balanceo de tráfico
#### El Rol del DNS y el Balanceo de Carga en la Nube

En el corazón de cualquier infraestructura moderna en la nube está el DNS, el sistema que traduce los nombres de dominio en direcciones IP que los servidores pueden entender. en AWS, el servicio que gestiona esta función es Amazon Route 53. no solo ofrece la resolución DNS tradicional, sino también registro de dominios, monitoreo de salud (Health Checks) y balanceo de tráfico global entre regiones o instancias. 


Cuando un usuario escribe una dirección en su navegador, el proceso sigue una serie de pasos 

01 Consulta DNS El navegador consulta el resolver DNS configurado en el dispositivo. 
02 Servidores raíz El resolver contacta con los servidores raíz DNS, que indican qué servidor maneja el dominio de nivel superior. 
03 Servidor autoritativo El resolver continúa hasta llegar al servidor autoritativo, que en AWS puede ser gestionado por Route 53. 
04 Respuesta IP Route 53 responde con la dirección IP del recurso correspondiente. 
05 Conexión El navegador usa esa IP para establecer la conexión y cargar el sitio. 

#### El Balanceo de Carga: Distribución Inteligente del Tráfico 
El Elastic Load Balancer (ELB)  complementa al DNS.  distribuye de forma automática las solicitudes entrantes entre varias instancias (EC2, contenedores o funciones Lambda), 

Application Load Balancer (ALB) para tráfico HTTP/HTTPS, con ruteo por rutas o contenido. 
Network Load Balancer (NLB)  para conexiones de baja latencia y alto rendimiento (TCP, UDP). 
Gateway Load Balancer (GWLB) para enrutar tráfico hacia servicios de seguridad o appliances virtuales (firewalls, IDS, etc.). 

Cuando se integran Route 53 y ELB, se obtiene un sistema capaz de balancear entre regiones aplicando políticas como: 

1 Geolocation Routing Dirige al usuario a la región más cercana a su ubicación. 
2 Latency-Based Routing Redirige al servidor con menor latencia en tiempo real. 
3 Failover Routing: Conmuta automáticamente hacia otra región en caso de fallo.

 Route 53 traduce y decide adónde enviar al usuario, y ELB distribuye la carga internamente. 

![[{541FBA5D-CD71-48C0-B3AE-0854BEBCB59A}.png]]




Resumen final 
DNS: traduce nombres de dominio en direcciones IP. Route 53: servicio DNS gestionado de AWS, con ruteo inteligente, registro de dominios y monitoreo. Elastic Load Balancer: distribuye tráfico entre instancias o contenedores, asegurando rendimiento y disponibilidad. Health Checks: supervisan la salud de los endpoints.
Failover y Latency Routing: garantizan resiliencia y baja latencia global. Combinación Route 53 + ELB: base de las arquitecturas distribuidas, seguras y escalables en AWS. 