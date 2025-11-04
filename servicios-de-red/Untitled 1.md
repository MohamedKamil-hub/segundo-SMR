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