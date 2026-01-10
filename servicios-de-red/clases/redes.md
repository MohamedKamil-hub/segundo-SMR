LAN red de area locAL
comparten  recursos
red perimetral DMZ incluyen servidores web, proxy

conexion perimetral 3 patas
![[{758C015D-15D9-4602-80E7-FF8AC49CD912}.png]]
conexion backtoback firewall en cada lado


direcciones ip
las LAN son privadas
si empieza por 10 o 172.2.  172.16  127 es privada lo que significa que nos se puede enrutar por el internet, las privadas se pueden reutilizar

reservar rangos de direcciones

VLANs
en un solo switch se pueden crear varias redes logicas, creando dos redes logicas en una fisica, segmentando la red

LANs alambricas e inalambricas

LAN
WLAN mas flexible pero mas lento


WAN
varias LANS


VPN
RED PRIVADA VIRTUAL
protocolos que autentica y encripta datos en transiro
con
SA
AH
ESP


LINEAS ALQUILADAS
T1 , T3 X28 MAS  RAPIDA,
E1, E3 LO MISMO PERO EN EUROPA


DSL
linea de suscriptor digital:
	SDSL simultaneo carga y descarga igual de rapido
	ADSL mas comun y lento

ESTANDARES
802.11  5G o 2.4GHz que es mas lento pero mas fiable
![[{7A7C323E-C30D-45D2-8890-89B7B7402866}.png]]
seguridad de red

formas de cifrado
WEP debil
WPA mas fuerte que wep
WPA2 la mas fuerte
WPS
802.11x basado en puerto

p2p 
ad hoc

puente inalambrico 
xonecta 2 segmentos cableados de una red


interferencias de inalambricos
central y por encima del suelo

topologias de red
estrella pieza central (conmutador) facil de escalar y tolerante al fallo
mesh malla todos los dispositivos estan conectadoes entre ellos, redundante conexiones = n*(n-1)/2 n es la cantidad de dsipositivos

anillo ya no es comun, basado en token
bus ya no es comun, todos los dispositivos se conectan a un cable primario

topologias logicas y fisicas



switch usa una tabla de direcciones mac para redirigir el trafico en una red.
![[Pasted image 20251106131613.png]]
 la mayoria de switches tienen varias capacidades tienen muchos puertos a distintas velocidades
 aunque la velocidad de una red siempre sera la del eslavon mas lento.

puertos ascendentes se usan para conectar un switch con otro, son mas rapidos.

pueden ser administrados o  no administrados si son administrados son administrados tienen ip, ajustes y acepta vlans.

VLAN redes LAN virtuales

switch capa 2
usa la direccion MAC

switch capa 3
puede enrutar a otras redes y usar IPs


redundancia y soporte
varios dispositivos del mismo tipo configurados y listos, para redundancia y balance de carga


cuando un dispositivo se conecta a una red el switch guarda su mac 

Hubs version anterior de los switch que en vez de reenviar el trafico lo hacian sin saber quien era el remitente, , ahora se usan para aumentar la señal de una red.


Vswitch

protocolo de arbol de expansion (STP)
para evitar bucles, encuentra y destruye enlaces redundantes



los **routers** enrutan trafico entre redes
rutas conectadas directamente tienen 2 dispositivos
ruta estatica, es definida por un administrador, para que el trafico pase por un enrutador determinado.
con route add o route delete

enrutamiento dinamico
**rip** usa hops para determinar la mejor ruta
**ospf** se basa en los hops y la velocidad

rutas por defecto,

tablas de enrutamiento
usan la RAM como almacenamiento

redireccion de puertos
para conectarse de manera remota
elimina as que no usas


segmentacion de redes
dividir una red fisica o logica en redes mas pequeñas

calidad de servicio

convergencia
proceso que un router aprende la topologia de una red y la disribuye a los demas routers en esa red


#### tipos y características de cables
- par trenzado para redes ethernet 100 metros hasta 10Gbps usa RJ45 UTP es sin blindaje y estan trenzados para proteger contra EMI, STP esta blindado, hay 5 categorias, CAT3 antiguo, CAT5 aun se usa CAT5e en 100 y 1 CAT6 solo 55 m pero mas rapido. CAT6a la misma velocidad que CAT6 pero a 100 m
- fibra óptica para redes WAN 70 km hasta 10 Gbps, no es susceptible a EMI pero es caro y no es muy flexible puede ser mono-modo un solo rayo de luz a mucha distancia o multimodo varios rayos de luz a nomas de 600 m