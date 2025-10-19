## Seguridad física y lógica
#### Sesión 5  Seguridad física: CPDs, control ambiental, SAIs, planes de continuidad
La seguridad física es el primer nivel de defensa en cualquier infraestructura tecnológica: protege los equipos, las instalaciones y el personal frente a riesgos ambientales, fallos eléctricos o accesos no autorizados. 
Un **CPD** (Centro de Procesamiento de Datos) ,**data center**, es el corazón físico de la infraestructura digital. Allí se concentran los servidores, sistemas de almacenamiento y redes que soportan las operaciones de una empresa. Protegerlo requiere una combinación 

**Control ambiental:** mantener las condiciones ideales Los equipos electrónicos son sensibles a la temperatura, la humedad y el polvo. Si el aire acondicionado falla las CPU pueden sobrecalentarse, provocando daños.  se instalan sensores de humo y sistemas automáticos de extinción.

**Control de accesos:** **limitar quién entra y cuándo** El acceso al CPD debe ser restringido a personal autorizado. Los métodos de control varían desde tarjetas RFID hasta biometría . Cada acceso queda registrado en un sistema de control que permite auditar quién estuvo dentro y a qué hora. Además, la vigilancia mediante cámaras (CCTV) y sensores de movimiento complementa la seguridad , junto con alarmas externas. 

**SAIs y energía redundante: garantizar la continuidad eléctrica** Los SAIs (Sistemas de Alimentación Ininterrumpida) son la columna vertebral de la continuidad eléctrica. Ante un corte de luz , actúan como un "colchón" energético que mantiene los servidores encendidos. permite apagar los equipos de forma controlada o activar generadores de emergencia. Un SAI no solo evita apagones: también filtra picos de tensión. 

**Planes de continuidad y recuperación ante desastres** 
- **BCP (Business Continuity Plan):** cómo mantener las operaciones críticas durante una interrupción (ej.: mover servicios a otro CPD, usar servidores en la nube).
- **DRP (Disaster Recovery Plan):** cómo restaurar sistemas después de un desastre (ej.: usar copias de seguridad, reparar equipos).
    
- **Revisión:**  deben probarse con simulacros y actualizarse tras incidentes.
- **Importancia:** la seguridad física (infraestructura) es esencial.

###### Herramientas y Consejos 
**1 Implanta un sistema integral de control de acceso** Usa tarjetas o sistemas biométricos para identificar a quien entra en el CPD. Registra los accesos y revisa los logs periódicamente. 

**2 Protege la energía con SAIs dimensionados correctamente** Antes de comprar un SAI, calcula el consumo total de los equipos críticos (servidores, switches, routers) y añade un margen del 20 %. 

**3 Planifica la redundancia eléctrica y de red** No dependas de un único punto de fallo. Instala dos líneas eléctricas o generadores y enlaces de red duplicados (multi-homing). Esto permite mantener la operatividad aunque una línea falle. 

**4 Controla el entorno con sistemas de monitoreo ambiental** Herramientas como PDU inteligentes o APC NetBotz miden temperatura, humedad y presencia de humo en tiempo 

**5 Ensaya tu plan de continuidad**  Realiza simulacros anuales:Documenta los tiempos de recuperación (RTO) y pérdida de datos asumible (RPO). 

**6 Aplica la regla 3-2-1 de copias de seguridad Mantén** 3 copias de tus datos en 2 soportes distintos, con 1 copia fuera del sitio físico (por ejemplo, en la nube).  


##### Mitos y Realidades 

**Mito**: "Los ataques físicos son improbables; no merece la pena invertir." 
**Realidad:** La seguridad física y la lógica deben trabajar juntas Una contraseña robusta no servirá de nada si cualquiera puede entrar en la sala de servidores y desconectar el equipo. Del mismo modo, un CPD blindado no es útil si los sistemas internos están desprotegidos digitalmente. La verdadera seguridad es integral y coordinada. 

**Mito**: "Un SAI pequeño sirve para todo un CPD." 
**Realidad:** Los planes de continuidad son un requisito normativo Normas como ISO 22301 (Gestión de Continuidad del Negocio) y ISO 27001 (Seguridad de la Información) exigen documentar, probar y mantener actualizados estos planes. Las auditorías suelen verificar no solo su existencia, sino también su eficacia. 


**Resumen Final para el Examen**
La seguridad física protege frente a riesgos no digitales (fuego, temperatura, accesos). Elementos clave: CPD seguro, SAIs, control ambiental y plan de continuidad. Un fallo físico puede detener el negocio tanto como un ataque informático. El caso OVH evidencia la importancia de la redundancia geográfica y la recuperación ante desastres. La seguridad debe ser integral: física + lógica + organizativa. 


##### Sesión 6 Seguridad lógica: contraseñas robustas, autenticación multifactor, cifrado y segmentación de red 
 la seguridad física protege  "dónde" y el "cómo" se almacenan los equipos, 
 la seguridad lógica protege "quién", "qué"  "desde dónde" se accede a la información. 


##### Contraseñas robustas: la primera línea de defensa 
Una contraseña robusta debe cumplir tres criterios: 
Complejidad: incluir letras mayúsculas y minúsculas, números y caracteres especiales. Longitud: al menos 12 caracteres 
Unicidad: no repetir la misma clave en diferentes servicios. promover el uso de gestores de contraseñas como Bitwarden. 

##### Autenticación multifactor (MFA): una segunda capa crítica 
La MFA combina algo que sabes (contraseña) con algo que tienes (móvil, token o llave física) y, en ocasiones, algo que eres (biometría). 

**Cifrado: blindar los datos en tránsito y en reposo**
El cifrado convierte la información en un formato ilegible para cualquier persona que no posea la clave de descifrado. Es esencial para garantizar la confidencialidad de los datos. **dos tipos principales:**
Cifrado en tránsito: protege los datos mientras viajan por redes. 
Cifrado en reposo: protege los datos almacenados en discos, servidores o nubes. 

#### Segmentación de red: contener los ataques
dividir la red corporativa en zonas o subredes separadas por niveles de seguridad. 
si un atacante logra acceder a un equipo, no podrá desplazarse libremente por toda la organización. facilita la monitorización y la respuesta a incidentes. 

#### La lógica de la defensa en capas 
La seguridad lógica depende de un conjunto de capas . Las contraseñas previenen accesos indebidos, la MFA los refuerza, el cifrado mitiga el impacto si los datos se filtran y la segmentación limita el daño si la red se ve comprometida. Es la aplicación del principio del mínimo privilegio: cada usuario o sistema debe tener solo el acceso que necesita, ni más ni menos. 


**ESQUEMA**
El nodo principal <Seguridad Lógica= se ramifica en cuatro pilares. Cada pilar contiene los
controles técnicos más relevantes:
	Contraseñas robustas: primera barrera de acceso.
	MFA: refuerza la autenticación.
	Cifrado: protege la confidencialidad de los datos.
	Segmentación: delimita el movimiento lateral de atacantes.


#### Herramientas y Consejos 
- **1 Utiliza gestores de contraseñas** como KeePassXC generan claves únicas para cada servicio y las guardan cifradas. Permiten compartir contraseñas dentro de equipos sin exponerlas en texto plano. 
- **2 Implementa MFA en todos los accesos críticos** Activa MFA en el correo corporativo, las VPN, la nube y los paneles administrativos, combina con llaves físicas YubiKey compatibles con FIDO2.
- **3 Cifra siempre tus datos sensibles** En tránsito, usa conexiones seguras (HTTPS, SFTP, VPN). En reposo, protege discos duros y portátiles con BitLocker, FileVault o VeraCrypt. Las copias de seguridad también deben cifrarse antes de enviarse a la nube. 
- **4 Segmenta la red y aplica el principio de mínimo privilegio** Divide la red en VLANs separadas: una para administración, otra para usuarios y otra para invitados. Usa firewalls internos como pfSense o FortiGate para controlar el tráfico entre zonas.          nadie debería tener acceso a más recursos de los necesarios. 
- **5 Monitorea accesos y genera alertas automáticas** Usa sistemas SIEM (Security Information and Event Management) como Splunk, Wazuh o Elastic Security para centralizar registros y detectar accesos inusuales o intentos de login fallidos masivos. 
- **6 Forma y sensibiliza a los empleados** Implementa programas de formación continua en ciberseguridad: campañas de phishing simulado, talleres sobre MFA y gestión de contraseñas. Plataformas como KnowBe4 o Cyberbit ofrecen módulos interactivos.

#### Mitos y Realidades 

**Mito**: "Con una contraseña larga ya es suficiente." 
Realidad: "La segmentación limita la propagación de ataques." Cuando un ransomware o malware entra en un ordenador, la segmentación impide que se propague fácilmente a toda la red. Es como tener compartimentos estancos en un barco: si una zona se inunda, el resto sigue a flote. 


**Mito**: "El cifrado ralentiza demasiado los sistemas." 
Realidad: "La MFA es una medida de bajo coste y alto impacto." Activar MFA en cuentas corporativas puede reducir hasta en un 99,2 % las probabilidades de compromiso, según datos de Microsoft. Es una de las prácticas más rentables en seguridad digital. 




**Resumen Final para el Examen**
Seguridad lógica: conjunto de medidas para proteger accesos digitales. Pilares clave: contraseñas robustas, MFA, cifrado, segmentación de red. Caso Uber (2022): mostró los riesgos de depender solo de contraseñas. El cifrado protege los datos incluso si son robados. La segmentación evita la expansión lateral de ataques. La MFA es la medida más efectiva contra el robo de credenciales.