**Continuidad de negocio**

**RTO** es el tiempo máximo de recuperación, ¿Cuánto tiempo de “parón” podemos soportar sin que el negocio se hunda?

---

**Seguridad**

**Seguridad física** protege al hardware  
**Seguridad lógica**  
**Seguridad activa**  
**Seguridad pasiva** ej. copia de seguridad

La seguridad informática es un proceso continuo y su mejor estrategia es combinar medidas técnicas y organizativas.

---

**SAI**

**SAI** protege frente a cortes eléctricos, cuando eso ocurre el SAI detecta el problema y usa su batería interna para seguir dando energía para que puedas guardar todo.

**Tipos de SAI**

- **Off-line** solo salta cuando ya se ha ido la luz por completo ya que la electricidad va directa de la pared al pc.
    
- **Interactivo** estabiliza el voltaje, si la electricidad baja o sube un poco, el SAI lo corrige sin usar la batería, solo la usa si el corte es total.
    
- **On-Line** mayor protección, siempre está alimentando al pc con su batería y la electricidad de la pared solo alimenta la batería, pero es el más caro.
    

---

**Almacenamiento**

**RAID** son distintas estrategias de guardado de datos.

- **RAID 0** coges 2 datos y los divides entre 2 discos duros, rápido pero poco seguro
    
- **RAID 1** coges 1 dato y haces otra copia exacta en otro disco duro, muy seguro pero usas el doble de discos.
    
- **RAID 5** (min. 3 discos) guardas datos y calculas paridad que repartes entre discos, si un disco se rompe usas los datos de otros discos y la paridad para recuperar los datos de ese disco. es seguro y no gasta mas espacio pero es lento.
    
- **RAID 6** (min. 4 discos) como RAID 5 pero con 2 paridades, aguantas que 2 discos caigan, aun mas lento y gasta mas espacio pero es super seguro.
    
- **RAID 10 (1+0)** (min. 4 discos) primero haces copia espejo y luego a cada par lo divides en dos disco. es rápido y seguro pero caro.
    

**LVM** agrupa discos de manera lógica, (Logic Volume Manager), permite agrandar, reducir, mezclar discos sin vaciarlos

**NAS** significa **Almacenamiento Conectado a la Red** (Network Attached Storage), se accede a él mediante protocolos de red.

La principal ventaja del almacenamiento en la nube es la alta disponibilidad.

---

**Criptografía**

**Criptografía** se usa para ocultar información, si un texto no está cifrado se denomina texto plano.

**Tipos de cifrado**

- **Simétrico** una sola clave maestra que cifra y descifra, es rápida y simple pero si le das esa clave a otra persona y se la roban pueden abrir todo, problema de intercambio de claves. ej. AES
    
- **Asimétrico** una clave pública para cifrar y comprobar (libre de uso) y una privada que descifra y firma (secreta), es más lento pero su distribución es segura
    
- **HASH** toma datos y de manera unidireccional produce un hash, un resumen único de esa combinación de caracteres, si cambias una sola letra el hash cambia.
    

**Propiedades**

- **Integridad** los datos no han sido alterados
    
- **Trazabilidad** rastrea y registra todas las acciones, quien hizo que
    
- **No repudio** una parte no puede negar la autenticidad de su firma
    
- **Confidencialidad** solo la gente autorizada puede acceder a la información.
    

El principio **Kerckhoffs** indica que la seguridad recae en la clave.

---

**Infraestructura**

**CPD** centro de procesamiento de datos. tiene que estar a 22º  
su extintor tiene que ser de CO₂

---

**Riesgos**

**Vulnerabilidad** debilidad o fallo de un sistema que puede ser explotado por una amenaza.  
**Amenaza** evento o acción potencial de causar daño  
**Medida preventiva** acción proactiva para evitar que ocurra un accidente  
**Control** mecanismo para gestionar, mitigar o eliminar riesgos.

**Tipos de control**

- **Preventivo** evita y hace lo posible ANTES de que ocurra el incidente, firewall, políticas
    
- **Detectivo** avisa DURANTE el incidente, antivirus o monitoreo, snort
    
- **Correctivo** lo haces DESPUES de la intrusión para enmendar, back ups, parches
    
- **Pasivo** NO ACTUA solo observa y registra, procedimientos strictos, contratos, auditorias