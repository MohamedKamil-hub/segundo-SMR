# Práctica – John The Ripper (JTR Jumbo)
**mohamed kamil el kouarti mecchidan**
Seguridad Informática 2º SMR  |  Práctica JTR
23/12/2025
[Repositorio en GitHub]
## Objetivo
El objetivo de esta práctica es aprender a usar John the Ripper Jumbo para crackear diferentes tipos de hashes con varios modos. Aunque muchos hashes son ficticios a propósito (como dijo la profesora), el foco está en demostrar que se usan los comandos correctos y se entiende el proceso en auditorías de seguridad.
## Preparación del entorno
Instalé las herramientas necesarias y descargué los archivos con estos comandos:
```bash
sudo apt update && sudo apt install john
sudo apt install unrar
wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
wget "https://github.com/olga3emes/Seguridad-25-26/raw/master/Unidad%203/JTR/practica_jtr_archivos.zip" -O practica_oficial.zip
```
![](../fotos/Pasted%20image%2020251221222851.png)

Después de descomprimir el zip, listé el contenido con `ls -l`.
![](../fotos/Pasted%20image%2020251223150956.png)

## Ejercicio 1 – Cracking de contraseñas de sistema (SHA‑512)
Archivo: hashes_sistema.txt
### Ejecuta John the Ripper con el modo automático. ¿Qué comando usas?
Comando john en modo por defecto:
`john hashes_sistema.txt`
No cargó ningún hash.
Al ver el contenido, empieza con `$6$` que es típico de SHA-512
`pedro:$6$abc123$hashficticio123`

asi que robé forzando el formato:
`john --format=sha512crypt hashes_sistema.txt`
Resultado: `No password hashes loaded (see FAQ)`

**Por qué:** El modo auto es el primero que se usa en auditorías para probar métodos rápidos. 
Aquí no funcionó porque el hash es ficticio.
También probé modo single y comprobé que mi version de John si tiene soporte para SHA-512.
![](../fotos/Pasted%20image%2020251223154303.png)

![](../fotos/Pasted%20image%2020251223154720.png)

### Muestra las contraseñas crackeadas. ¿Qué comando usas?
Comando usado:
`john --show hashes_sistema.txt`
Resultado: 0 password hashes cracked, 0 left
Por qué: Este comando lee el archivo john.pot donde se guardan las contraseñas ya crackeadas. Es útil para ver resultados sin repetir el ataque.
### ¿Qué contraseñas aparecen como crackeadas?
Ninguna, porque el formato ficticio impidió cargar el hash.


## Ejercicio 2 – Ataque de Diccionario (Wordlist)
Archivo: hashes_wordlist.txt
### Lanza John usando la wordlist rockyou.txt. ¿Qué comando usas?
Primero probé sin forzar ningun formato:
`john --wordlist=rockyou.txt hashes_wordlist.txt`

**John lo detectó como LM** y no crackeó nada, solo dio muchos avisos.
John the Ripper ha detectado automáticamente los hashes del archivo **hashes_wordlist.txt** como tipo **LM** (una vieja funcion de hasheado para windows). 

Por eso solo cargo 4 hashes tipo LM e ignoro otros formatos como SHA1, NT....
Además al usar el rockyou que contiene contraseñas en minúsculas y mixtas, no ha encontrado coincidencias porque LM convierte todo a mayúsculas y divide la contraseña en dos partes de 7 caracteres .

- Resultado: 0 contraseñas crackeadas.
![](../fotos/Pasted%20image%2020251223161223.png)

Liste el contenido para ver el formato de los hashes:

`md5:5f4dcc3b5aa765d61d8327deb882cf99`
`sha1:a94a8fe5ccb19ba61c4c0873d391e987982fbbd3`
`sha256:01ba4719c80b6fe911b091a7c05124b64eeece964e09`
`ntlm:8846f7eaee8fb117ad06bdd830b7586c`

Por eso forcé el formato para cada tipo en un comando diferente con la opcion `--format=` :
```bash
john --format=Raw-MD5 --wordlist=rockyou.txt hashes_wordlist.txt
john --format=Raw-SHA1 --wordlist=rockyou.txt hashes_wordlist.txt
john --format=Raw-SHA256 --wordlist=rockyou.txt hashes_wordlist.txt
john --format=NT --wordlist=rockyou.txt hashes_wordlist.txt
```
![](../fotos/Pasted%20image%2020251223161450.png)

**Por qué:** Los hashes son puros de diferentes algoritmos. Cuando John no detecta bien el formato o estan mezclados, hay que usar `--format=` para que el ataque funcione bien. Esta es una práctica común en auditorías para asegurar que el ataque se aplique al algoritmo correcto.
### Muestra las contraseñas crackeadas.
Comandos usados:
```bash
john --show --format=Raw-MD5 hashes_wordlist.txt
john --show --format=Raw-SHA1 hashes_wordlist.txt
john --show --format=Raw-SHA256 hashes_wordlist.txt
john --show --format=NT hashes_wordlist.txt
```
![](../fotos/Pasted%20image%2020251223161809.png)

### Escribe las contraseñas descubiertas.
- MD5 (`5f4dcc3b5aa765d61d8327deb882cf99`): password
- SHA1 (`a94a8fe5ccb19ba61c4c0873d391e987982fbbd3`): test
- NTLM (`8846f7eaee8fb117ad06bdd830b7586c`): password
- SHA256: N/A
**Razonamiento:** Los hashes sin sal son vulnerables a diccionario. "password" y "test" están al principio de rockyou.txt, por eso se crackearon rápido. El SHA256 no salió porque su contraseña no está en rockyou o es más lento de calcular.

- Los hashes sin sal y contraseñas débiles son vulnerables a ataques de diccionario.
- Usar algoritmos más lentos como SHA256 ofrece más protección contra este tipo de ataque.


## Ejercicio 3 – Fuerza Bruta (Incremental)
Archivo: hashes_incremental.txt
### Lanza un ataque incremental.
Comando usado:
`john --incremental hashes_incremental.txt`
(y también probé `--incremental=Alnum` que incluye letras mayusculas minusculas y numeros que es lo mas comun que contenga una contraseña)

Resultado: `No password hashes loaded (see FAQ)`

**Por qué:** El modo de fuerza bruta se usa cuando fallan los ataques más rápidos (diccionario, reglas, máscara). John  prueba todas las combinaciones posibles empezando por las más cortas. 
este modo se usa como último recurso porque puede tardar hasta meses dependiendo de la contraseña y el hardware.  como los hashes están preparados, la contraseña será corta para que se crackee rapido.

Contenido del archivo:
`hash_inc:ABC123FICTICIO`
![](../fotos/Pasted%20image%2020251223162254.png)

Aquí no cargó porque el prefijo hash_inc: no existe en John
### Muestra la contraseña encontrada.
`john --show hashes_incremental.txt`
Resultado: `0 password hashes cracked, 0 left`
no cargó ningún hash `No password hashes loaded`

El hash no tiene formato estándar `hash_inc:ABC123FICTICIO`.  john al no saber el tipo de hash, no puede cargarlo ni aplicar ningún ataque.
eso es normal muchos sistemas usan formatos personalizados que necesitan herramientas específicas o conversión .
No ha encontrado una contraseña porque John no pudo cargar el hash por el formato desconocido.
### Explica por qué este ataque suele ser más lento que el de diccionario.
El incremental prueba todas las combinaciones posibles en un conjunto de caracteres, lo que crece exponencialmente con la longitud. 
una contraseña de 8 caracteres tiene 62⁸ ≈ 218 billones de posibilidades.
john empieza por longitud 1 luego 2...

El diccionario solo prueba contraseñas reales y comunes que estan en una lista, por eso es mucho más rápido si la contraseña es débil. El incremental se deja como último recurso.

El orden recomendado es siempre: reglas + diccionario → máscaras → incremental 


## Ejercicio 4 – Ataque por Máscara (Mask Mode)
Archivo: hash_mask.txt
Patrón: 3 letras minúsculas + 1 número
### Lanza un ataque con la máscara ?l?l?l?d.
Comando usado:
`john --mask=?l?l?l?d hash_mask.txt`
Resultado: `No password hashes loaded`

Contenido del archivo:
mask_hash:XYZ987FICTICIO
**mask_hash:** no existe en John the Ripper
La contraseña está escrita en claro después de los dos puntos (**XYZ987FICTICIO**), 
dice **No password hashes loaded**.
![](../fotos/Pasted%20image%2020251223162619.png)

**Por qué:** La máscara ?l?l?l?d genera todas las combinaciones de 3 minúsculas + 1 dígito. Es util cuando se sabe el patrón. 
como el patrón conocido es **3 letras minúsculas + 1 número**.
En la sintaxis de John seria:
- ?l → una minúscula (a-z)
- ?d → digito (0-9)
la máscara para generar todas las combinaciones posibles de ese patrón es **?l?l?l?d**.

Este ataque habría sido eficiente ( 26³ × 10 candidatos) si el hash estuviera en un formato reconocido.
John responde `No password hashes loaded`.
El hash tiene un formato no estándar `mask_hash:XYZ987FICTICIO`. John solo procesa hashes en formatos conocidos (MD5, sha512crypt, NT, etc.). Al no reconocer el tipo, no carga el hash y no puede aplicar ningún ataque, ni siquiera el modo máscara.
### Muestra la contraseña encontrada.
`john --show hash_mask.txt`
Resultado: `0 password hashes cracked, 0 left`

No se ha crackeado ninguna contraseña porque el hash no fue cargado debido a su formato desconocido.
El ataque por máscara es muy potente porque aprovecha información parcial del patrón para reducir el número de candidatos frente a la fuerza bruta.

además de elegir la máscara adecuada, es fundamental que el hash esté en un formato que la herramienta pueda interpretar.


## Ejercicio 5 – WPA‑PSK
Archivo: wifi_wpa.hash
### Lanza John sobre el hash WPA‑PSK.
Comando usado:
`john --wordlist=rockyou.txt wifi_wpa.hash`
`No password hashes loaded`
John no reconoce este formato. Por eso devuelve **No password hashes loaded**.
`wpa_psk:FAKEWPAHASH1234567890`

![](../fotos/Pasted%20image%2020251223162742.png)


**Por qué:** En WPA-PSK real, diccionario con rockyou.txt es el ataque más efectivo porque muchas claves Wi-Fi son débiles. 
El cracking de redes Wi-Fi WPA/WPA2 se hace en modo offline una vez capturado el handshake. JTR soporta nativamente este tipo de hashes.

El ataque más efectivo es con rockyou.txt, ya que muchas claves Wi-Fi son contraseñas débiles.
En un escenario real, el archivo estaría en formato .cap convertido previamente, y John lo detectaría automáticamente.

John no cargó ningún hash (`No password hashes loaded`).
utiliza un formato ficticio (`wpa_psk:FAKEWPAHASH1234567890`) no reconocido por John. Los hashes WPA-PSK reales tienen una estructura más compleja incluyen SSID, MAC etc.). 
### Muestra la clave crackeada.
`john --show wifi_wpa.hash`
Resultado: `0 password hashes cracked, 0 left`

Razonamiento: WPA2-PSK es vulnerable offline si la clave es débil. Recomendación: usar WPA3 o passphrases largas y aleatorias.

WPA2-PSK es vulnerable a ataques de diccionario offline si la passphrase es débil. El algoritmo PBKDF2 con 4096 repeticiones hace que los ataques sean más lentos, pero una contraseña en rockyou.txt se descubriría rapido.

Recomendacion : usar WPA3-SAE y/o passphrases de mas de 20 caracteres aleatorios 


## Ejercicio 6 – Hash NTLM (Windows)
Archivo: ntlm_only.hash
### Crackea el hash usando el formato NTLM.
Comando usado:
`john --format=NT --wordlist=rockyou.txt ntlm_only.hash`
Resultado: Cargó el hash y lo crackeó rápido.
Los hashes NTLM son hashes MD4 del Unicode de la contraseña, sin sal y sin iteraciones. Son rápidos de calcular 
el hash esta en  un formato que John reconoce .
Forzar `--format=NT` es util para evitar cualquier ambigüedad y asegurar  que el ataque se aplique.

John cargó el hash correctamente y, aunque en la salida dice `No password hashes left to crack`, eso indica que ya lo crackeó en la misma ejecución 

Contenido:
ntlm:8846f7eaee8fb117ad06bdd830b7586c
```
ntlm:password
1 password hash cracked, 0 left
```
**Contraseña encontrada**: **password**
Los hashes NTLM son uno de los puntos débiles de Windows. Al no tener sal, cualquier contraseña idéntica produce siempre el mismo hash, lo que permite ataques rainbow tables 
La contraseña "password" es común en brechas reales y aparece en las primeras líneas de rockyou.txt, por lo que se crackeó casi instantáneamente.

Esto muestra el riesgo de permitir contraseñas débiles en entornos Windows y la importancia de:
- Políticas de complejidad y longitud mínima, de como 14 caracteres o mas
- Uso de Windows Hello o credenciales más modernas como Kerberos
- Desactivar almacenamiento de hashes LM/NTLM si es posible.
![](../fotos/Pasted%20image%2020251223163058.png)

Los NTLM son MD4 sin sal, muy rápidos de crackear. Forzar `--format=NT` asegura que no haya confusión.
### Muestra la contraseña encontrada.
`john --show --format=NT ntlm_only.hash`
Resultado: **password**
password es la contraseña más común y sale al principio de rockyou.txt. Los NTLM sin sal son muy débiles.


## Ejercicio 7 – Cracking de un archivo RAR
### Convierte el RAR a un archivo hash usando rar2john.
En un caso real:
`rar2john documento.rar > documento.rar.hash`
documento.rar.hash con contenido: rar_hash:FICTICIO123456

Porqué rar2john extrae el hash del RAR para que John lo pueda atacar.
Los archivos RAR protegidos con contraseña no pueden ser atacados directamente por John. 
hay que extraer el hash criptográfico del archivo con  **rar2john**, incluido en John the Ripper Jumbo. 

El hash resultante tiene un formato específico que John sí entiende.
El archivo original `documento.rar` no está presente. esta directamente `documento.rar.hash`.

Al inspeccionarlo (`cat documento.rar.hash`), contiene:
```
rar_hash:FICTICIO123456
```

### Crackea la contraseña del archivo RAR.
Comando usado:
`john --wordlist=rockyou.txt documento.rar.hash`
	 `No password hashes loaded` 

el ataque más efectivo es el de diccionario con rockyou.txt, ya que las contraseñas usadas para archivos comprimidos suelen ser débiles .

John no cargó ningún hash (`No password hashes loaded`), porque el formato `rar_hash:FICTICIO123456` no es reconocido

flujo completo de trabajo en un ataque real a archivos RAR protegidos: extracción del hash con rar2john → cracking con John.

esto es efectivo contra contraseñas débiles. El cifrado RAR5 es robusto pero depende de la contraseña elegida por el usuario. lo importante es la clave no el cifrado.
### Muestra la contraseña encontrada.
`john --show documento.rar.hash`
Resultado: 0 password hashes cracked, 0 left
![](../fotos/Pasted%20image%2020251223163348.png)

En RAR reales con contraseña débil, diccionario funciona bien. El cifrado es fuerte, pero depende de la contraseña elegida.


## Ejercicio 8 – Hash SHA‑256 (Aplicación Web)
Archivo: aplicacion_web.sha256
### Crackea el hash usando wordlist.
Comando usado:
`john --format=Raw-SHA256 --wordlist=rockyou.txt aplicacion_web.sha256`
`No password hashes loaded`

Contenido:
sha256:FICTICIOABCDE12345
![](../fotos/Pasted%20image%2020251223170304.png)


algunas webs guardan contraseñas con SHA-256 en claro y sin sal ni funciones como scrypt . Estos hashes son rápidos de calcular y, vulnerables a ataques de diccionario.
se fuerza `--format=Raw-SHA256` para indicar a John que es un hash SHA-256 puro sin sal
El ataque de diccionario con rockyou.txt es el más eficiente en este escenario, ya que las contraseñas de usuarios suelen ser débiles y comunes.
### Muestra la contraseña crackeada.
`john --show --format=Raw-SHA256 aplicacion_web.sha256`
Resultado: `0 password hashes cracked, 0 left`

En aplicaciones reales se crackea rápido con contraseña común. eso es mala práctica; mejor usar bcrypt  con sal.
Aunque el comando y el enfoque son completamente correctos para un hash SHA-256 real de una aplicación web, el formato ficticio impide el cracking.

Esto resalta una mala práctica común y la importancia de usar funciones de hashing modernas con sal y alto coste de recursos hardware (bcrypt, PBKDF2, Argon2id).
## Conclusión
Esta práctica, con hashes mayoritariamente, me ayudó a enfocarme en los comandos correctos y el proceso de cracking. 
Aprendí lo clave que es forzar formatos con --format=, priorizar ataques como diccionario antes que incremental, y lo frágiles que son contraseñas comunes.

mi conclusion en seguridad propia es optar por contraseñas largas, aleatorias y únicas, junto con hashes salados como bcrypt o Argon2 para mayor seguridad.
## fuentes
https://github.com/openwall/john
https://www.openwall.com/john/doc/EXAMPLES.shtml
https://www.freecodecamp.org/news/crack-passwords-using-john-the-ripper-pentesting-tutorial/
https://www.geeksforgeeks.org/linux-unix/how-to-use-john-the-ripper-in-kali-linux/
https://blog.qualys.com/vulnerabilities-threat-research/2012/06/08/lessons-learned-from-cracking-2-million-linkedin-passwords?utm_source=chatgpt.com