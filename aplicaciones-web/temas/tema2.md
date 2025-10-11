
## Navegadores, protocolos y arquitectura web  

### Funcionamiento cliente-servidor, protocolos HTTP/HTTPS, cookies y sesiones. Uso de DevTools y Postman 

La web funciona gracias a la arquitectura cliente-servidor. Cada que escribes una dirección en tu navegador y pulsas  Enter, se activa una cadena de procesos:  

1. **Petición del cliente**  
Tu cliente (el navegador) envía una petición a un servidor a través de HTTP o HTTPS.  

2. **Procesamiento del servidor**  
El servidor interpreta esa petición, busca los datos solicitados y responde con un recurso: puede ser una página HTML, un archivo CSS, una imagen o  datos en JSON.  
  
3. **Renderizado en el navegador**  
El navegador procesa la respuesta y la muestra al usuario.  

Para mantener experiencia personalizada entre distintas páginas hay dos mecanismos:  
**Cookies**  
Pequeños archivos de texto que el servidor guarda en tu navegador. Se usan  
para recordar tu idioma, mantener tu sesión iniciada etc...  
**Sesiones**  
Información almacenada en el servidor asociada a un identificador único que viaja en la cookie. Permiten que el  servidor sepa quién eres y qué estabas haciendo.  

La **diferencia entre HTTP y HTTPS** es fundamental:  
- **HTTP** envía info en texto plano, quien intercepte la comunicación puede leerla.  
- **HTTPS** añade una capa de cifrado gracias a los certificados SSL/TLS, protegiendo la privacidad y seguridad de los usuarios.  


**Esquema Visual**  
![[Pasted image 20251011125258.png]]


**Cliente/Navegador (A)**  
Es el punto de inicio. Envía la petición y recibe la respuesta.  
**Petición HTTP/HTTPS (B)**  
Canal de comunicación entre cliente y servidor.  
**Servidor Web (C)**  
Procesa la petición y busca los recursos solicitados.  
**Respuesta con datos (D)**  
La información que vuelve al navegador para ser renderizada.  
**Cookies (E)**  
Memoria en el cliente, útil para recordar preferencias o identificadores.  
**Sesiones (F)**  
Memoria en el servidor, necesaria para  mantener la lógica de interacción y seguridad.  


#### Herramientas y Consejos  
**DevTools en navegadores**  
en la pestaña Network de Chrome, al cargar una página se realizan decenas de peticiones: HTML, CSS, JavaScript, imágenes, fuentes. Haz clic en una petición para  ver su método (GET, POST),  cabeceras y respuesta.  
*Herramienta*: Chrome  
DevTools  accesible con F12 o  Ctrl+Shift+I.  

**Prueba de APIs con Postman**  
utiliza Postman para enviar peticiones HTTP a un servidor y analizar su respuesta. ideal para probar APIs antes de integrarlas en una aplicación.  
Herramienta: Postman App permite gestionar colecciones  de peticiones, automatizar pruebas y simular entornos.  

**Seguridad y buenas  prácticas**  
siempre utiliza HTTPS, existen certificados gratuitos con Let's Encrypt .  
Herramienta: SSL Labs Test servicio online gratuito para analizar la seguridad de tu conexión HTTPS.  



**Resumen Final**  
La web funciona con modelo cliente-servidor.  
Comunicación mediante HTTP/HTTPS.  
Cookies = memoria en el cliente, sesiones = memoria en el servidor.  
Herramientas clave: DevTools y Postman.  
HTTPS = seguridad mediante cifrado.  
Mitos desmentidos: cookies no son siempre malas, HTTPS b HTTP.4