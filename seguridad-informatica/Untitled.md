

**Confidencialidad**
limitar acceso no autorizado mediante gestion de permisos con autenticacion solida y encriptacion

**Integridad**
los datos no se han cambiado de manera no autorizada para ello se hace un  seguimiento de quien toca los datos y cuando.
Y asegurarse de que los datos son los mismos de origen a destino
a traves de firma digital, hash

**disponibilidad**
los datos siempre estan accesibles
con un sistena disponible 24/7
mediante redundancia y tolerancia a errores, con backups




#### amenaza y riesgo

amenaza  posibilidad de datos siendo comprometidos
vulnerabilidad debilidad en el CIA de datos
riesgo probabilidad de que una amenaza se haga real
impacto  necesita ser determinado y puede ser evitado, aceptado o mitigado.

**principio de minimo privilegio**
darle a los trabajadores fisicos y logicos solo los permisos justos para realizar su trabajo

**superficie de ataque**
totalidad de formas en las que puede ser atacado un sistema
a mas codigo, servicios mas superficie de ataque
**modelado de amenzas** 
identificar amenzas y sus medidas preventivas


#### seguridad fisica
areas donde aplicar control deacceso
perimetro externo como vallas
perimetro interno
	areas seguras como una sala de servidores


**unidades  extribles,** 
bloquear puertos usb y cifrarlos con bitlocker

**control de acceso**
solo accede a los sistemas que necesites
mirar la seguridad de dentro hacia afuera

mantrap es para atrapar a quien entra ilegalmente a un edificio


**controles de seguridad**
administrativo sobre politicas
tecnico, o tecnologico, sistemas de deteccion y prevencion de intrusiones

malware, software malicioso, no solo es un virus
virus es un tipo de malware que se une a un programa para deñar el pc, no se puede ejecutar por si mismo, un tipo de virus es el polimorifco que cambia constantemente para evitar ser detectado
gusano no necesita un programa ya que se ejecuta por si mismo
vincula cosas no las destruye
troyano, no es un virus sino un programa impostor
spyware malware que recopila info personal sin que el usuario lo sepa.
ransomware ataque que cifra o bloquea datos y los descifra a cambio de un rescate
adware como anuncios emergentes
rootkit software o hardware que se usa para tener software administrativo y no se detecta ya que afecta al codigo dentro del cpu
puerta trasera, apertura en el sistema que se usa para hacer actividad no permitida
	ataque de dia cero aprovecha una vulnerabilidad por el proveedor

bomba logica ataque con advertencia

ataques DOS denegacion de servicio , se interrumpe la red hasta que deje de funcionar, varias mauqinas causan el ataque mediante una botnet , zombies,

metodos de atque comun
keyloggers
puerta trasera
envenenamiento dns inyectar destiono falso en una resolucion dns llevando de un sitio legitimo a uno que no lo es.
con man in the middle


ataque fuerza bruta
un atacante intenta adivinar una contraseña
se puede mitigar con una buena politica de contrseñas que se renueven frecuentemente.

man-in-the-middle un atacante se interpone en una comunicacion 

man in the browser

ingenieria social
tratar de sacar info de personas pareciendo legitimas como el phishing, se puede mitigar conociendo las politicas reales de la empresa y no facilitando info personal

keyloggers
registra las pulsaciones de teclas en un dispositivo para obtener contraseñas y usuarios

bombas logias
actividades maliciosas que ocurren con un evento o fecha especificos


COPIAS DE SEGURIDAD
completas no se suelen hacer muy amenudo ya que toman mucho tiempo, y se se hacen se hacen por la noche o momentos no frecuentados.
diferencial, guarda solo el contenido que cambio desde la ultima copia completa , se puede hacer mucho mas frecuentemente.
incremental, guarda , todos los datos desde la ultima copia de cualquier tipocompleta o incremental