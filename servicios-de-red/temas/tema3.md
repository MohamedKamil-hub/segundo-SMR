## Servicios de correo electrónico 
Arquitectura del correo: MTA, MDA, MUA. Protocolos SMTP, POP, IMAP. Instalación básica de servidores de correo

El flujo del correo electrónico se sostiene sobre tres componentes principales:

**MUA** (Mail User Agent) Es el cliente de correo, la interfaz con la que interactúas. permite redactar, enviar y leer mensajes, pero no entrega los correos; los envía a través de un servidor. 

**MTA** (Mail Transfer Agent) envia los mensajes al servidor de destino y los reenvia entre servidores. Cada MTA mantiene una cola de mensajes pendiente de envío, gestiona reintentos si el servidor remoto no responde y aplica políticas de seguridad .

**MDA** (Mail Delivery Agent) entrega finalmente el mensaje al buzón del usuario. coloca cada correo en el buzón correspondiente y gestiona la lectura mediante protocolos de acceso. 

el MUA envía  el MTA transporta  el MDA entrega. 

#### Los protocolos que hacen posible el correo

**SMTP** (Simple Mail Transfer Protocol) Se usa para enviar correos. Opera en el puerto 25, aunque para conexiones seguras y autenticadas se utilizan 465 (SSL) y 587 (STARTTLS). Cada vez que un correo sale de un cliente o de un servidor intermedio, viaja mediante SMTP. 

**POP3** (Post Office Protocol versión 3) Permite descargar los mensajes desde el servidor al cliente. Usa el puerto 110 en texto plano o 995 con TLS. los mensajes se descargan y, se eliminan del servidor Es ideal cuando se accede al correo desde un solo dispositivo.

**IMAP** (Internet Message Access Protocol) Opera en el puerto 143 (sin cifrar) o 993 (IMAPS).
Diseñado para sincronizar correos en múltiples dispositivos. estándar en entornos profesionales ya que facilita el acceso simultaneo.

En resumen: SMTP = Envío, POP3 = Descarga, IMAP = Sincronización. 

Esquema funcional del flujo de correo El usuario redacta un mensaje en su MUA (Thunderbird, Roundcube&).1. El cliente se conecta al MTA mediante SMTP para enviarlo.2. El MTA examina el dominio del destinatario y lo reenvía al MTA del servidor remoto.3. El servidor receptor utiliza el MDA para entregar el mensaje en el buzón del usuario.4. El receptor abre su MUA y recupera el mensaje mediante POP3 o IMAP.5. Así, cada correo que viaja de un remitente a un destinatario atraviesa esta "cadena logística digital", pasando de una máquina a otra hasta llegar a destino. 2 

**Esquema Visual:**  A (MUA) representa al cliente del usuario que redacta y envía mensajes. B y C (MTA) simbolizan los servidores que transportan el mensaje entre dominios, aplicando las reglas SMTP. D (MDA) es el agente que entrega el correo 
![[{FEA70947-7F46-4B61-8C64-BFADB31CC894}.png]]


#### Herramientas y Consejos para tu Futuro Profesional 
**Herramientas recomendadas**
- Postfix MTA Configurable mediante /etc/postfix/main.cf, donde se definen dominios, puertos y seguridad TLS. 
- Dovecot  MDA y servidor IMAP/POP3. Su configuración esta en /etc/dovecot/conf.d/. 
- Roundcube Cliente web (MUA) basado en PHP, ideal para entornos educativos o PYMEs. 
- MXToolbox.com  Analiza registros DNS y comprueba la salud del servidor de correo. 
- mailutils / telnet / swaks Herramientas de prueba para verificar la entrega de mensajes. 
- Certbot (Let's Encrypt) Genera y renueva certificados TLS de forma automática. 

**Consejos prácticos** 
- Configura los registros MX en el DNS del dominio para que otros servidores sepan dónde entregar el correo. 
- Habilita TLS (STARTTLS o SSL) en SMTP y POP3/IMAP para proteger las credenciales de los usuarios. 
- Revisa los logs de correo regularmente: /var/log/mail.log o /var/log/maillog muestran el recorrido de cada mensaje. 
- Controla la cola de correo con: mailq # Lista los mensajes pendientes postqueue -f # Fuerza su envío 
- Evita usar el puerto 25 para envío directo desde clientes; usa el 587 (SMTP autenticado),  
- Monitorea el rendimiento con herramientas como Munin o Grafana si gestionas un entorno con alto volumen de correos.

Mitos y Realidades 
Mito 1: "SMTP sirve para recibir correos." FALSO. SMTP se utiliza para el envío y reenvío de correos entre servidores o desde el cliente al servidor. Para la recepción se usan POP3 o IMAP, 

Mito 2: "POP3 y IMAP hacen lo mismo." FALSO. POP3 descarga los mensajes al dispositivo, lo que impide sincronizar varios equipos. IMAP, en cambio, mantiene los correos en el servidor y sincroniza en tiempo real las carpetas entre distintos dispositivos. 

##### Resumen Final para el Examen 
- **Componentes principales:** MUA Cliente del usuario (Outlook). MTA Servidor que envía mensajes (Postfix, Sendmail). MDA Entrega los correos en el buzón (Dovecot, Procmail). 
- **Protocolos esenciales:** SMTP: Envío (puertos 25, 465, 587). POP3: Descarga (puertos 110, 995). IMAP: Sincronización (puertos 143, 993).
- **Herramientas clave:** Postfix + Dovecot combinación en servidores Linux. Roundcube / Thunderbird clientes comunes. MXToolbox / mailq / postqueue verificación y diagnóstico.
- **Buenas prácticas:** Habilitar TLS para cifrar las comunicaciones. Configurar registros MX correctos. Revisar logs y colas de correo periódicamente. 
- **Idea central:** SMTP envía, POP descarga, IMAP sincroniza. Postfix envía, Dovecot entrega. 

## Gestión de usuarios, alias y buzones. Configuración de recepción y reenvío de correo. Logs y monitorización

**Administración práctica del correo en servidores** 
Una vez que un servidor de correo está instalado y operativo el siguiente paso es gestionar  los usuarios, los alias y los buzones, asegurando que cada mensaje se entregue al destinatario  y quede almacenado de forma segura. 

### Usuarios de correo 
Los usuarios representan las identidades que pueden enviar y recibir mensajes. En un servidor Linux, dos tipos:

**Usuarios locales del sistema:** cuentas creadas en el sistema operativo (por ejemplo, useradd juan). Cada usuario tiene un directorio y un buzón donde se almacenan sus correos. 

**Usuarios virtuales:** No tienen cuenta de sistema, sino que sus datos se almacenan en una base de datos o archivo de configuración , permite escalar el servicio para gestionar varios dominios

#### Alias de correo 
dirección alternativa que redirige mensajes hacia otra cuenta o varias a la vez. Los alias se configuran en el archivo /etc/aliases y se actualizan con el comando newaliases. 

**Buzones de correo: dónde se guardan los mensajes**
Cada usuario necesita un buzón (mailbox), el espacio donde el MDA entrega los mensajes recibidos. formatos principales: 
**mbox** los mensajes del usuario se almacenan en un único archivo Ventaja: simple y compatible en sistemas antiguos. Desventaja: difícil de manejar cuando el volumen de mensajes crece, propenso a corrupciones. 
**Maildir** Cada mensaje se guarda como un archivo independiente dentro de una carpeta. Ventaja: más seguro, rápido y compatible con IMAP. Desventaja: ocupa más espacio, pero ofrece un rendimiento superior.

En servidores modernos,Maildir es el recomendado por su estabilidad y facilidad de backup.

**Recepción y reenvío** 
Cuando un mensaje llega al servidor con SMTP (Postfix), el sistema decide qué hacer con él: 

Si el dominio y el usuario existen, el MDA (Dovecot o Procmail) lo entrega al buzón. 
Si el correo está dirigido a un alias, se reenvía automáticamente a los destinatarios definidos. 
puede reenviarse manualmente creando un archivo .forward en el directorio del usuario, indicando allí la dirección destino. 

###### Logs y monitorización 
El correo electrónico es un servicio silencioso: la mayoría de los errores no se muestran al usuario final. supervisar los registros (logs) es crítica. Los principales archivos a revisar son: 

- /var/log/mail.log o /var/log/maillog registro general de actividad de Postfix y Dovecot. 
- mailq o postqueue -p muestra los correos pendientes en la cola. 
- postsuper -d ALL  elimina mensajes atascados si hay errores recurrentes. 

Los logs permiten detectar errores como: Problemas de autenticación. Buzones inexistentes. Fallos de DNS o alias mal configurados. 

#### Herramientas y Consejos Profesionales 
###### Herramientas clave 
- PostfixAdmin Interfaz web para gestionar usuarios y alias virtuales sin usar línea de comandos. Permite crear dominios, usuarios y contraseñas seguras fácilmente
- Dovecot Logs Analyzer Analiza los logs de Dovecot, genera reportes de acceso, errores y tráfico IMAP/POP. 
- Swaks (Swiss Army Knife for SMTP) Permite simular envíos SMTP para verificar la entrega. 
- Roundcube / Rainloop  Webmail modernos y ligeros. Facilitan acceso multiplataforma y permiten probar configuraciones IMAP/SMTP. 
- Grafana + Promtail + Loki  Solución visual para centralizar logs de correo y obtener métricas de rendimiento en tiempo real.

###### Consejos prácticos de administración 
- Prefiere Maildir sobre mbox: mayor fiabilidad, rendimiento y compatibilidad con IMAP. 
- Utiliza alias para correos compartidos (como info@, ventas@, soporte@). 
- Automatiza backups de /home/usuario/Maildir y /etc/postfix/ periódicamente. 
- Revisa los logs cada día con: tail -f /var/log/mail.log 
- Controla la cola de mensajes: mailq postqueue -p 
- Limpieza periódica: Si una cola se bloquea por errores, utiliza: postsuper -d ALL 
- Verifica la salud del servidor con MXToolbox o con pruebas telnet mail.dominio 25. 
- Limita el tamaño máximo de los mensajes en main.cf para evitar saturación. 
#### Mitos y Realidades 
Mito 1: "Cada dirección de correo necesita un usuario independiente." FALSO. con los alias, varias direcciones pueden compartir buzón o redirigir mensajes a varios destinatarios. 

Mito 2: "Si el correo no llega, el problema siempre es del remitente." FALSO. Los fallos suelen deberse a errores locales: alias mal configurados, buzones llenos o permisos incorrectos.  revisar los logs es fundamental antes de culpar a factores externos. 

**Usuarios:** locales (sistema) o virtuales (base de datos). 
**Alias:** direcciones alternativas configuradas en /etc/aliases, actualizadas con newaliases. **Buzones:** formatos principales  mbox (1 archivo) / Maildir (1 mensaje = 1 archivo).
**Reenvío:** mediante archivo .forward o alias de dominio. 
**Recepción:** Postfix (SMTP) recibe ³ Dovecot (IMAP/POP) entrega. 
**Logs:** /var/log/mail.log para diagnóstico; comandos mailq, postqueue, postsuper. **Herramientas:** PostfixAdmin, Swaks, Roundcube, Dovecot Analyzer. 
**Buenas prácticas:** revisar logs, usar TLS, automatizar backups, limpiar colas de correo.
**Idea central:** La gestión del correo es organización, prevención y control continuo. 

##### Seguridad en correo: TLS, firma digital, cifrado, antispam y webmail
###### Seguridad integral en el sistema de correo electrónico 
 La seguridad en el correo electrónico se apoya en cinco pilares fundamentales: 

**Seguridad en Correo Electrónico: Pilares Fundamentales**

**1. Cifrado en Tránsito (TLS)** Protege la comunicación entre cliente-servidor y entre servidores, cifrando los datos durante su transmisión.
*   **Protocolo:** TLS (reemplazó a SSL).
*   **Puertos Seguros:**
    *   SMTP: 465 o 587
    *   IMAPS: 993
    *   POP3S: 995
*   **Configuración:** En servidores Postfix/Dovecot, se especifica la ruta del certificado y clave privada.

**2. Firma Digital**  Verifica la identidad del remitente y garantiza la integridad del mensaje .
*   **Estándares:**
    *   **S/MIME:** Utiliza certificados emitidos por una Autoridad Certificadora (CA).
    *   **OpenPGP (GPG):** Usa un sistema de claves pública/privada autogestionado.

**3. Cifrado del Contenido** Protege el contenido del mensaje (texto y adjuntos) en sí mismo, haciéndolo ilegible incluso si es interceptado o el servidor es comprometido.
*   **Herramientas:** GPG o integraciones en clientes de correo (Thunderbird, Outlook) con S/MIME.

**4. Antispam y Antimalware** Mitigar el  (spam) y el software malicioso (malware).
*   **Filtros Comunes:**
    *   **SpamAssassin:** Analiza patrones y cabeceras para identificar spam.
    *   **ClamAV:** Antivirus de código abierto para detectar adjuntos maliciosos.
    *   **Amavis/Rspamd:** Actúan como intermediarios para el filtrado.

**5. Webmail Seguro**  Garantizar que el acceso al correo desde un navegador sea seguro.
*   **Medidas Esenciales:**
    *   Usar **HTTPS** con un certificado válido.
    *   Conectarse al servidor de correo (IMAP/SMTP) **solo mediante TLS**.
    *   Implementar límites de intentos de login y políticas de contraseñas seguras.



### Herramientas y Consejos Profesionales 
#### Herramientas recomendadas 
- Let's Encrypt + Certbot: Permite obtener y auto renovar certificados TLS gratuitos.
- SpamAssassin: Sistema de filtrado antispam basado en reglas y aprendizaje automático. 
- ClamAV: Antivirus de código abierto para detectar y eliminar adjuntos maliciosos. 
- Amavis: intermediario entre Postfix y los motores de análisis, permitiendo ejecutar múltiples filtros de seguridad en cadena. 
- Roundcube o Rainloop: Webmail profesionales compatibles con IMAP y SMTP seguros. Deben ejecutarse siempre sobre HTTPS. 
- Thunderbird con GPG: Cliente de correo que permite firmar y cifrar mensajes con OpenPGP.

#### Consejos prácticos para la administración segura
- Forzar TLS en todas las conexiones (entrada y salida) modificando los parámetros de seguridad en Postfix y Dovecot. 
- No reutilizar certificados: Let's Encrypt para renovarlos automáticamente cada 90 días. 
- Aplicar límites de tamaño de adjuntos para evitar ataques por saturación. 
- Implementar DKIM, SPF y DMARC para evitar la suplantación de dominio (phishing). 
- Revisar los logs de seguridad con: tail -f /var/log/mail.log 
- Usar fail2ban para bloquear intentos de acceso repetidos o ataques de fuerza bruta. 
- Realizar copias de seguridad cifradas de /etc/postfix/, /etc/dovecot/ y /var/mail/. 


**Mitos y Realidades** 
Mito 1: "Si un servidor usa TLS, todos los mensajes están totalmente cifrados." FALSO. TLS cifra solo la transmisión entre el cliente y el servidor o entre servidores, no protege el contenido almacenado en el buzón ni adjuntos. Para lograr cifrado completo, utiliza S/MIME o GPG. 

Mito 2: "El antispam bloquea todos los correos no deseados." FALSO. Los sistemas antispam  no son infalibles. Algunos mensajes legítimos pueden clasificarse erróneamente como spam (falsos positivos). es esencial revisar las carpetas de spam y ajustar las reglas de puntuación. 

#### Resumen Final para el Examen 
- TLS: cifra la comunicación entre cliente y servidor, evitando la interceptación de mensajes. 
- Firma digital (S/MIME o GPG): garantiza autenticidad y no alteración del contenido. 
- Cifrado del contenido: protege el mensaje si el servidor o la red son comprometidos. 
- Antispam y antivirus: herramientas principales: SpamAssassin, ClamAV, Amavis. 
- Webmail: debe funcionar únicamente con HTTPS y TLS para acceso seguro. 
- Certificados: Let9s Encrypt permite obtenerlos y renovarlos de forma automática.
- Logs: /var/log/mail.log es el archivo principal para verificar la entrega y la seguridad. 
- Buenas prácticas: habilitar autenticación SMTP, revisar logs y aplicar DKIM/SPF/DMARC. 

**Idea central:** Un sistema de correo seguro combina múltiples capas: cifrado, autenticación, filtrado y control. Ninguna medida por sí sola garantiza la protección total; la seguridad se construye a partir de la suma de todas ellas. 