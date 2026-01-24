# 27-10-2027

![[{29C66CE2-1AAE-4440-9EFA-B9887D58DDB2}.png]]



# 17-11-2025
solo 3 clusterpoque 1 es arbitro

![[Pasted image 20251117182650.png]]

![[Pasted image 20251117183229.png]]s3 es el mas comun usado para almacenamiento y ec2 para computo

![[Pasted image 20251117183712.png]]

![[Pasted image 20251117190525.png]]



![[Pasted image 20251117190729.png]]

![[Pasted image 20251117190959.png]]

![[Pasted image 20251117191205.png]]





base de datos grafica


segurdiad

responsabilidad
el cliente dentro de la nube
aws de la nube
![[Pasted image 20251117193851.png]]
![[Pasted image 20251117194044.png]]

![[Pasted image 20251117194141.png]]
![[Pasted image 20251117194324.png]]

![[Pasted image 20251117195532.png]]






# 24-11-2025

![[Pasted image 20251124180919.png]]


usuario grupo politica rol
![[Pasted image 20251124181559.png]]
![[Pasted image 20251124182215.png]]![[Pasted image 20251124182613.png]]
![[Pasted image 20251124182828.png]]
se puede delegar acceso
![[Pasted image 20251124183137.png]]![[Pasted image 20251124183958.png]]

![[Pasted image 20251124184035.png]]

![[Pasted image 20251124184139.png]]
![[Pasted image 20251124191432.png]]
![[Pasted image 20251124191550.png]]

![[Pasted image 20251124191832.png]]

![[Pasted image 20251124191931.png]]
![[Pasted image 20251124192028.png]]

![[Pasted image 20251124192135.png]]


![[Pasted image 20251124192300.png]]

![[Pasted image 20251124192406.png]]


acceso programado y consola

el root quitarle las claves no la cuenta 

# 01-12-2025
subnetting
clase C solo se puede cambiar un oceteto B 2 y clase A 3 octetos para la direccion del host

la ip tiene dos partes id de host e id de red

### 📌 **Rangos por clase (basado en el primer octeto)**

|Clase|Rango del primer octeto (decimal)|Máscara por defecto|Uso principal|
|---|---|---|---|
|**A**|**1 – 126**|255.0.0.0|Redes muy grandes|
|**B**|**128 – 191**|255.255.0.0|Redes medianas|
|**C**|**192 – 223**|255.255.255.0|Redes pequeñas|

---
![[Pasted image 20251205125828.png]]

calculo de subredes

primero hace  2  ^1  2^2  2^3  ...hasta que iguale o supere el numero de subredes que queremos
el numero por el que hallamos elevado sumarselo a la mascara por ejemplo si hiciste 2 elevado a 4 y tenias /16 suma 16+4 = 20

despues a 32 le restas el numero que sacamos antes osea 20 y se lo elevas a 2 
osea 2 elevado a 12 da 4096 le restamos 2 y da el n de hsots utiles por subred

y a la mascara se le resta 256 - el valor del octeto de alli para ver los saltos que da
Sí, **hay una forma muy fácil** sin usar binario.  
Solo recuerdas **una tabla muy pequeña**.

---

## 📌 Paso 1

Saber en qué bloque cae el prefijo.

Cada bloque tiene 8 bits:

|Bloque|Rango de prefija|Ejemplo|
|---|---|---|
|1º octeto|/1 – /8|/8 = 255.0.0.0|
|2º octeto|/9 – /16|/16 = 255.255.0.0|
|3º octeto|/17 – /24|/20 = ???|
|4º octeto|/25 – /32|/27 = ???|

/20 está entre /17–/24 → afecta el **3er octeto**.

---

## 📌 Paso 2

Calcular cuántos bits hay **dentro del bloque**

`20 − 16 = 4 bits en el 3er octeto`

---

## 📌 Paso 3

Usar **esta tabla** (la memorizas una vez y listo)

|Bits en un octeto|Valor decimal|
|---|---|
|1 bit →|128|
|2 bits →|192|
|3 bits →|224|
|4 bits →|240|
|5 bits →|248|
|6 bits →|252|
|7 bits →|254|
|8 bits →|255|

---

## 📌 Resultado

Como son **4 bits en el 3er octeto**:

→ **240**

Por tanto /20 es:

`255.255.240.0`

---

## 🧠 RESUMEN FINAL SIN BINARIO

1. Restas: 20 − 16 = **4 bits**
    
2. Mira la tabla: **4 bits → 240**
    
3. Rellenas: **255.255.240.0**
    

Eso es TODO.

ipv6 
![[Pasted image 20251205134804.png]]

redirreccionar ipv6


# 12-01-2026

aws cloudwatch recopila metricas importantes sobre untancias ec2 y rds
aws cloudtrail lleva registro de todo accesi a los recursos AWS en la cuenta

route 53
es el dns por el puerto 53
puedes elegir en funcion del enrutamiento
withdrawn robin 

se puede activar dns por geolocalizacion .com alias
en funcion de la localizacion de los usuarios 


conmutacion por error de dns amazon route 53


aws cloudfront
redes y entrega de contenido

cdn red de entrega de contenido estatico
bootstarp5
en cache
mejora rendimiento y escalado
lo hace cloudfront y cobra por cantidad de solicitudes


al sufrir un ataque ddos
si tienes shield puesto no te cobran
si no tienes shield si te cobran
![[Pasted image 20260115141744.png]]
![[Pasted image 20260115141901.png]]

tamaño minimo subred en vpc /28
maximo /16
usa  puerta de enlace NAT para que los recursos de una subred privada accedan a internet
las ubicaciones perimetrales usan cloudfront para garantizar una entrega de baja latencia

**las ACL de red** (Network Access Control Lists) son un control de seguridad opcional que se aplica a nivel de subred. Actúan como un firewall sin estado para controlar el tráfico entrante y saliente de la subred. A diferencia de **los grupos de seguridad (que operan a nivel de instancia**), las ACL de red se asocian directamente con las subredes y son configurables de manera opcional.

**cuando se crea una VPC** la tabla de enrutamiento se crea de forma predeterminada, debes crear subredes y una puerta de enlace de internet de forma manual

**Nota rápida sobre cálculo de direcciones en un bloque CIDR**
- Cuando tienes un bloque como **10.0.1.0/24**, significa que los **24 bits** se usan para la **red** y los restantes **32-24 = 8 bits** son para los **hosts**.
- Para calcular cuántas direcciones hay:
- Se hace **2^(32 - máscara)** → en este caso: 2^(32-24) = 2^8 = **256 direcciones**.   
- No todas se pueden usar: normalmente se reservan **5 direcciones** (red, broadcast y algunas para routers/servicios).
- Entonces, direcciones **disponibles ≈ total - 5** → 256 - 5 = **251 direcciones útiles**.


**servicios de computo**
![[Pasted image 20260115143620.png]]

![[Pasted image 20260115143852.png]]

ec2 porporciona maquinas virtuales windows o linux
puedes usar imagenes ami de amazon , tuyas o de la comunidad
con una ami puedes lanzar varias instancias al mismo tiempo

tipo de instancia 
las t3 son las mas usadas

se puede añadir datos de usario 
para que instale actualice o solo admita credenciales etc...

efs es como google drive


clave publica la guarda aws y la privada la guardas tu

ciclo de vida de una isntancia ec2
![[Pasted image 20260115151452.png]]los metadatos son datos de la instancia, ip publica, pivada, nombre de host publico, id de instancia ...