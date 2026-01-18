



## 05/12/2025
seguridad
hay distintos riesgos seguro es libre de riesgos
la seguridad informatica es el mecaniismo que hace un servicio seguro, es un proceso continuo que protege servicios e informaciion
triada CIA
los riesgos pueden afectar a confidencialidad integridad y disponibilidad (se mide en 9)

tambien esta la legalidad autenticidad trazabilidad y no repudio

una estrategia de seguridad integral debe tener
informacion continua de los usuarios
gestion contraseñas
actualizar sistemas siempre
minimo privilegios
monitorizacion necesaria
amenazas malware ransomware

keepass para ordenar contraseñas


vulnerabilidades comunes
credenciales malas
software desactualizado
configuraciones inseguras

estrategias
inventario de activos
gestionar contraseñas
endurecer sistemas
escanear vulnerabilidades
gestion de parches
autentciacion multifactor

plan de mitigacion saber que apps tienes y que vulnerabilidades tienes

control  preventivo
anticipa ataques antes que oucrran
firewall
pared entre sistemas e internet
por defecto no deja entrar nada o deja entrar todo y ya de alli permite o deniegas cosas
ip 
tcp ip
filtrado de paquetes de datos
ahora se hace zona desmilitarizada primero y luego  de escanear si es seguro pasa a la red local 
se gestiona con nftables

instalar nftables se ejecuta en sudo  y con un vocabulario
ip es ipv4 ip6 ipv6 inet ammbas arp y bridgepara tramos ethernet
netdev para ver trafico a tarjeta de red

reglas de filtrado prerouting forwarding y postrouting
con entradas y salidas de paquetes
cadena conjunto de reglas en la tabla en una hay que indicar etapa del paquete y politica accept o drop
cada regla necesita identificador posicion en cadena  match permite poner condiciones

con flush se puede borrar de todo

ip addr destination o origin para comprobar 

reglas
 rangos de ip 
 se pueden meter reglas NAT 
 acciones sobre paquete descartar aceptar y counter

etc syslog registra



controles de seguridad
preventiva correctiva detectiva

detectivo
honeypots 
ver equipos conectados a tu red
monitorizar
analizar logs accesos no autorizados


snort detecta intrusiones, se aplica a la red y analiza todo el trafico mediante reglas que se le apliquen

wazuh monitorea cambios en archuivos criticos y detecta logs

zeek genera archivos de log en logs current


correctivos
tecnico fisico administrativo humano


fail2ban ayuda mitigacion de fallos 


informe debe tener 

plan de recuperacion ante desastres
definir que hacer en caso de cualquier desastre ransomware a inundacion, como enfrentar y minimizar 
![[Pasted image 20251212175749.png]]

segun el activo puede ser seguridad logica o fisica

seguridad activa  pasiva
logico es software no es tangible fisico si lo es

medidas preventivas

seguridad activa limite de almacenamiento , contraseñas segura ACL, cifrado de datos, firmas digitales , redundancias.

pasiva registros de evento SAI copias de seguridad, 



seguridad logica evita accesos no autorizados , robo y perdida ataque de red, RAIDS, copias de seguridad, actualizaciones, intrusiones

fisica incendios y humo  extintor de diaxido de carbono, evitar que entre quien  no debe al sitio fisico, terremotos, SAI varias compañias de suministro electrico inundaciones CPD a tres metros de altura sobre el suelo, evitar ruido  electrico y temperaturas extremas de los CPD 22 grados es lo ideal
varios cluster para dar disponibilidad
amenazas comunes desastre naturrales, robos, intrusion fisica, 
factores para elegir ubicacion suministro electrico almenos 2 compañias , posiciosn fisica del edificio, antenas wimax no cerca de bosquye o mar 
control de acceso no entre cualquiera, vigilante de seguridad, biometrico , camaras y sensores

SAIS offline
SAIS inline
SAIS online doble conversion de energia electrica


almacenamiento
rendimiento disponibilidad y accesibilidad
nube solido cintta 

NAS para almacenamiento y SAN  en sitios grandes

almacenamiento redundante

todo debe tolerar fallos, RAID 1 5...

criptografia

cifrado en bloque flujo...
cesar
lo importante es la clave no el algoritmo
criptografia simetrica y asimetrica AES RC5
intercambio de claves privadas y publicas en la asimetrica HASH
criptografia hibrida es el mas usado AES +RSA y firmas digitales

firma digital
MFA
contraseñas robustas politicas en linux para cambiar politicas


fases ciberatque
reconocer 
preparar 
distribuir 
explotar 
instalar 
tomar control
y actuar sobre el objetivo

pruebas de intrusion pentest
escaner de vulnerabilidaes
pruebas de intrusio externa y interna
PTES para sistemas y OWASP para aplicaciones y sus metodologias

# 16-01-2026
