




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

# 🧠 RESUMEN FINAL SIN BINARIO

1. Restas: 20 − 16 = **4 bits**
    
2. Mira la tabla: **4 bits → 240**
    
3. Rellenas: **255.255.240.0**
    

Eso es TODO.

ipv6 
![[Pasted image 20251205134804.png]]

redirreccionar ipv6
