# 📱 Guía Definitiva: Digitalización Aplicada a los Sectores Productivos — 2º SMR

> [!NOTE] ¿Cómo usar estos apuntes? Optimizados para **Obsidian**. Los callouts `[!IMPORTANT]` son definiciones clave, `[!TIP]` son trucos de examen, `[!WARNING]` son errores frecuentes y `[!NOTE]` son aclaraciones útiles. Estudia las **tablas comparativas** con especial atención: son la base de las preguntas más difíciles.

---

## Índice de Contenidos

1. [[#Bloque 1 — Digitalización y Transformación Digital]]
2. [[#Bloque 2 — Industria 4.0 e Industria 5.0]]
3. [[#Bloque 3 — Tecnologías Habilitadoras Digitales (THD)]]
4. [[#Bloque 4 — Cloud Computing]]
5. [[#Bloque 5 — Inteligencia Artificial]]
6. [[#Bloque 6 — Big Data y el Ciclo del Dato]]
7. [[#Bloque 7 — Ciberseguridad]]
8. [[#Bloque 8 — Proyecto de Transformación Digital]]
9. [[#Resumen de Conceptos Trampa]]
10. [[#Glosario de Siglas y Acrónimos]]

---

## Bloque 1 — Digitalización y Transformación Digital

### Las 3 fases: informatización → digitalización → transformación

Mucha gente confunde estos tres conceptos. Son distintos y el examen los diferencia:

|Fase|En qué consiste|Ejemplo|
|---|---|---|
|**Informatización**|Introducir tecnología para hacer lo mismo de antes, pero con ordenadores|Pasar facturas en papel a Excel|
|**Digitalización**|Automatizar y mejorar tareas usando tecnología|Usar un ERP que automatiza la contabilidad|
|**Transformación Digital**|**Rediseñar el modelo de negocio** usando tecnología como palanca estratégica|Netflix: pasar de alquilar DVDs a streaming bajo demanda|

> [!IMPORTANT] Definición clave — Transformación Digital No consiste en digitalizar tareas aisladas ni en adoptar tecnologías de moda. Implica **cambiar procesos, cultura organizacional y modelo de negocio**. Es responsabilidad de **toda la organización**, no solo del departamento IT.

> [!TIP] Truco de examen — "Pensar en bits" La expresión "pensar en bits en lugar de en átomos" resume la transformación digital: transformar **productos físicos en servicios y experiencias digitales**. Ejemplo: un libro (átomo) → un ebook o suscripción (bit).

> [!WARNING] Error frecuente "Sustituir papel por PDFs" o "tener presencia en redes sociales" **NO es transformación digital**. Son pasos mínimos de informatización. La clave siempre está en la **reorganización del modelo de negocio**.

---

### IT vs OT — Dos mundos que convergen

> [!IMPORTANT] IT vs OT
> 
> ||IT (Information Technology)|OT (Operational Technology)|
> |---|---|---|
> |**Significado**|Tecnología de la Información|Tecnología Operacional|
> |**Se ocupa de**|Gestión de datos, software, servidores|Activos físicos: sensores, PLCs, máquinas|
> |**Entorno**|Oficinas, servidores, redes corporativas|Plantas industriales, fábricas|
> |**Ejemplo**|ERP, CRM, servidores cloud|PLC (Controlador Lógico Programable), sensores|

> [!IMPORTANT] Convergencia IT/OT La unión de IT y OT permite **conectar los datos de la planta industrial (OT) con los sistemas de gestión empresarial (IT)**. En la práctica: los datos de producción llegan en tiempo real a los sistemas de análisis y toma de decisiones.
> 
> Beneficio principal: **conectar análisis digital con acciones físicas**.

> [!TIP] PLC = entorno OT Si el examen pregunta qué tecnología pertenece al entorno OT, la respuesta es **PLC** (Programmable Logic Controller). ERP, CRM y servidores cloud pertenecen al entorno IT.

---

## Bloque 2 — Industria 4.0 e Industria 5.0

### Las 4 Revoluciones Industriales

|Revolución|Motor|Característica|
|---|---|---|
|**1ª** (finales s. XVIII)|Máquina de vapor|Mecanización|
|**2ª** (finales s. XIX)|Electricidad|Producción en masa|
|**3ª** (s. XX)|Informática básica|Automatización simple|
|**4ª — Industria 4.0** (actualidad)|Datos + conectividad|**Interconexión inteligente de sistemas físicos y digitales**|

> [!IMPORTANT] Industria 4.0 — Definición Se caracteriza por **interconexión, automatización e inteligencia distribuida**. Los sistemas físicos y digitales se comunican entre sí en tiempo real. No es simplemente "más robots" ni "más automatización": es la **inteligencia** de los sistemas lo que la define.

---

### Industria 5.0 — El ser humano vuelve al centro

> [!IMPORTANT] Industria 5.0 Va más allá de la 4.0 añadiendo tres pilares:
> 
> 1. **Humanocéntrico**: el ser humano vuelve al centro de la producción, aportando creatividad y juicio. No es sustituido, **colabora** con la tecnología.
> 2. **Sostenible**: minimizar el impacto ambiental, procesos eficientes, economía circular.
> 3. **Resiliente**: cadenas de suministro robustas que se **adaptan a crisis** (pandemias, disrupciones...).

| |Industria 4.0|Industria 5.0|
|---|---|---|
|Foco|Eficiencia y automatización|Personas, planeta y resiliencia|
|Rol humano|Supervisor de máquinas|**Centro del sistema productivo**|
|Sostenibilidad|Secundaria|**Pilar fundamental**|

> [!WARNING] Error frecuente "Industria 5.0 añade más robots" → FALSO. Añade **enfoque humano, sostenible y resiliente**. No es una evolución cuantitativa (más máquinas), sino cualitativa (nuevos valores).

---

## Bloque 3 — Tecnologías Habilitadoras Digitales (THD)

> [!IMPORTANT] ¿Qué son las THD? Tecnologías que actúan como **capacidades estratégicas que permiten rediseñar procesos y modelos de negocio**. No son gadgets ni herramientas puntuales: son la base tecnológica de la transformación digital.

### Mapa de las THD principales

```
┌──────────────────────────────────────────────────────────────┐
│                   TECNOLOGÍAS HABILITADORAS                  │
├────────────┬──────────────┬──────────────┬───────────────────┤
│    IoT     │   IA / ML    │  Blockchain  │   Cloud / Edge    │
│  Cobots    │  Big Data    │   5G / WiFi6 │   Gemelo Digital  │
│  RA / RV   │    NLP       │ Impresión 3D │  Ciberseguridad   │
└────────────┴──────────────┴──────────────┴───────────────────┘
                         ↑
          CIBERSEGURIDAD: PILAR TRANSVERSAL
          (envuelve y protege todas las demás)
```

---

### IoT — Internet de las Cosas

> [!IMPORTANT] IoT — Lo que importa de verdad El valor del IoT **no está en el dispositivo/sensor**, sino en el **dato contextualizado y analizado**. Un sensor de temperatura que mide sin analizar no aporta valor. El valor está en **capturar datos del mundo físico y transmitirlos** para tomar decisiones.

**Aplicaciones clave:**

- **Mantenimiento predictivo**: analizar vibraciones, temperatura, ruido → **anticipar fallos antes de que ocurran** (no reparar cuando se rompen, eso es mantenimiento correctivo).
- **Smart factories**: sensores en líneas de producción.
- **Logística**: tracking de mercancías en tiempo real.

> [!TIP] Mantenimiento predictivo vs correctivo
> 
> - **Correctivo** = reparar cuando se rompe (costoso, para producción)
> - **Preventivo** = revisiones periódicas programadas
> - **Predictivo** = IoT + IA analizan datos en tiempo real → detectan el fallo **antes** de que ocurra

---

### Cobots — Robots Colaborativos

> [!IMPORTANT] ¿Qué diferencia a un cobot de un robot industrial tradicional?
> 
> ||Robot Industrial Tradicional|Cobot (Collaborative Robot)|
> |---|---|---|
> |Entorno|Jaulas de seguridad, aislado|**Trabaja junto a humanos** sin barreras|
> |Flexibilidad|Rígido, tarea fija|**Flexible y reprogramable**|
> |Tamaño|Grande, pesado|Compacto, ligero|
> |Uso|Gran producción en serie|Tareas cambiantes, PyMEs|

---

### Realidad Aumentada (RA) y Realidad Virtual (RV)

| |Realidad Aumentada (RA)|Realidad Virtual (RV)|
|---|---|---|
|¿Qué hace?|**Superpone información digital sobre el mundo real**|Sumerge al usuario en un mundo **100% virtual**|
|El usuario ve|El mundo real + capas digitales encima|Solo el entorno virtual (mundo físico bloqueado)|
|Uso industrial|Guiar tareas, ver instrucciones sobre máquinas reales|**Formación** en entornos peligrosos sin riesgo|
|Ejemplo|Técnico ve instrucciones sobre una avería real|Operario practica soldadura en entorno virtual|

> [!TIP] Truco de examen — RA vs RV
> 
> - **RA** = el mundo **real más** información digital. Se usa para **guiar tareas en el mundo real**.
> - **RV** = mundo completamente **virtual**. Se usa para **formación segura** en situaciones de riesgo.
> - Si la pregunta dice "instrucciones superpuestas sobre una máquina real" → **RA**.
> - Si dice "practicar procesos peligrosos en entorno seguro" → **RV**.

---

### Blockchain

> [!IMPORTANT] Blockchain — Función principal Genera **confianza mediante un registro distribuido e inmutable**. Una vez que un dato se escribe en la cadena, **no se puede modificar ni eliminar**.

**Aplicaciones más allá de las criptomonedas:**

- **Cadena de suministro**: trazabilidad total de un producto (de dónde viene, por dónde ha pasado).
- **Contratos inteligentes (Smart Contracts)**: código que **se ejecuta automáticamente cuando se cumplen las condiciones pactadas**. No requiere intermediarios.
- **Gestión de identidades digitales**.

> [!NOTE] Smart Contract — Ejemplo sencillo Imagina que acuerdas con un proveedor: "si el envío llega antes del día 10, se paga automáticamente". El Smart Contract ejecuta el pago **solo** cuando se cumple esa condición. Nadie puede manipularlo.

---

### Gemelo Digital (Digital Twin)

> [!IMPORTANT] Definición Una **réplica virtual conectada a datos reales** de un objeto físico. No es una copia de seguridad ni un modelo 3D estático: está **sincronizado en tiempo real** con el objeto real.

**Para qué sirve:**

- **Fase de diseño**: simular fallos y optimizar el rendimiento **antes de fabricar** el producto real.
- **Operaciones**: detectar anomalías en tiempo real comparando el comportamiento virtual vs. real.
- **Logística**: optimizar rutas y flujos de almacén mediante simulaciones.

---

### 5G — Por qué importa en la industria

> [!IMPORTANT] 5G como habilitador digital No es solo "internet más rápido en el móvil". Sus características técnicas clave son:
> 
> - **Alta velocidad** de transmisión de datos.
> - **Latencia ultrabaja** (tiempo de respuesta casi instantáneo) → comunicación en tiempo real.
> - **Capacidad masiva**: conectar **millones de dispositivos por km²** → ideal para IoT industrial.

> [!WARNING] 5G ≠ solo velocidad La pregunta del examen no busca "más velocidad". Lo clave es la **latencia ultrabaja** (para respuesta en tiempo real) y la **capacidad de conectar millones de dispositivos** simultáneamente.

---

### Impresión 3D (Fabricación Aditiva)

> [!IMPORTANT] Fabricación Aditiva Construye objetos **capa a capa desde un diseño digital** (al contrario que el fresado, que recorta material de un bloque).

**Ventajas clave:**

- Crear **piezas personalizadas y geometrías complejas** imposibles con moldes.
- Materiales avanzados: titanio, acero inoxidable, biopolímeros.
- Ideal para prototipos y series cortas (no para millones de piezas idénticas).

> [!NOTE] Fabricación aditiva vs. sustractiva
> 
> - **Aditiva** (impresión 3D) = añadir material capa a capa.
> - **Sustractiva** (fresado/torneado) = eliminar material de un bloque sólido.

---

### Ciberseguridad — El Pilar Transversal

> [!IMPORTANT] ¿Por qué es transversal? Porque **cada nueva conexión digital genera un riesgo potencial**. No protege solo servidores: **envuelve y protege todas las demás THD**. Sin ciberseguridad, el IoT, el cloud, el 5G y el Blockchain son vulnerables.

**Conceptos clave de ciberseguridad:**

|Concepto|Definición|
|---|---|
|**Defensa en Profundidad**|Aplicar **múltiples capas** de seguridad (red, dispositivo, humano). Si una falla, las demás protegen.|
|**Segmentación de red**|**Aislar zonas críticas** de la red de posibles intrusiones. Si un atacante entra en una zona, no puede saltar a las demás.|
|**Alta Disponibilidad**|El servicio está operativo **el mayor tiempo posible** (ej: 99,99% del tiempo).|
|**Ransomware**|Malware que **cifra tus datos y pide un rescate** económico para devolverlos.|

> [!WARNING] Ransomware ≠ phishing
> 
> - **Ransomware** = cifra tus archivos y pide dinero.
> - **Phishing** = correo fraudulento que intenta robarte contraseñas haciéndose pasar por otra entidad.

---

### Sinergia de las THD

> [!IMPORTANT] ¿Qué pasa cuando se integran las THD? Se generan **ecosistemas digitales inteligentes y autónomos**. Las tecnologías solas tienen valor, pero combinadas se multiplica su impacto.

**Ejemplo de sinergia:**

```
Sensor IoT → captura dato de vibración de una máquina
     ↓
5G → lo transmite en tiempo real con latencia mínima
     ↓
Cloud / Edge → procesa el dato
     ↓
IA / ML → detecta patrón anómalo (posible fallo)
     ↓
Gemelo Digital → simula el impacto del fallo
     ↓
Acción automática → alerta al técnico con instrucciones en RA
```

---

## Bloque 4 — Cloud Computing

### ¿Qué es y por qué importa?

> [!IMPORTANT] Cloud Computing Modelo que permite acceder a recursos informáticos (servidores, almacenamiento, software) **bajo demanda a través de Internet**, pagando solo por lo que se usa.
> 
> **Beneficio principal: escalabilidad y pago por uso.**

---

### Los 3 Modelos de Servicio (IaaS / PaaS / SaaS)

> [!IMPORTANT] La pirámide de servicios cloud Cuanto más alto en la pirámide, **menos gestiona el cliente** y más gestiona el proveedor.

```
         ┌─────────────┐
         │    SaaS     │  ← El cliente solo usa la app
         │  (Gmail,    │
         │   Canva)    │
         ├─────────────┤
         │    PaaS     │  ← El cliente desarrolla apps
         │  (Heroku,   │
         │  App Engine)│
         ├─────────────┤
         │    IaaS     │  ← El cliente gestiona SO y apps
         │  (Azure VM, │
         │   AWS EC2)  │
         └─────────────┘
         [Proveedor gestiona hardware, red, virtualización]
```

|Modelo|El proveedor da...|El cliente gestiona...|Ejemplo|
|---|---|---|---|
|**IaaS** (Infrastructure as a Service)|Servidores, redes, almacenamiento|**Sistema operativo, middleware y aplicaciones**|Azure Virtual Machines, AWS EC2|
|**PaaS** (Platform as a Service)|Infraestructura + SO + plataforma de desarrollo|**Solo las aplicaciones y datos**|Google App Engine, Heroku|
|**SaaS** (Software as a Service)|Todo: infra + SO + app lista para usar|**Nada técnico**: solo usa el software|Gmail, Canva, Office 365|

> [!TIP] Truco de examen — Recordar IaaS / PaaS / SaaS
> 
> - **IaaS** = alquilas el **edificio vacío** (tú lo amueblas y decoras)
> - **PaaS** = alquilas la **cocina equipada** (tú cocinas y sirves)
> - **SaaS** = vas a un **restaurante** (solo comes, no cocinas ni friegas)

> [!WARNING] Error frecuente "En el modelo IaaS el cliente gestiona el hardware" → FALSO. El hardware lo gestiona siempre el proveedor. El cliente gestiona el **sistema operativo y las aplicaciones** que instala encima.

---

### Tipos de Nube

|Tipo|Descripción|Cuándo usarla|
|---|---|---|
|**Pública**|Recursos compartidos entre múltiples clientes, gestionados por el proveedor|Webs, apps de uso general|
|**Privada**|Infraestructura dedicada solo a una organización|Datos muy sensibles, regulación estricta|
|**Híbrida**|**Combina pública y privada**|Datos sensibles en privada + picos de demanda en pública|
|**Comunitaria**|Compartida por organizaciones con intereses comunes|Administraciones públicas, sector sanitario|

> [!IMPORTANT] Nube Híbrida — caso de uso típico en examen Una empresa que quiere **mantener datos sensibles internamente** pero usar cloud para **picos de demanda** → **Nube Híbrida**.

---

### Responsabilidad Compartida

> [!IMPORTANT] Modelo de responsabilidad compartida En cloud, la seguridad se reparte:
> 
> - **Proveedor**: seguridad física del CPD, hardware, red, virtualización.
> - **Cliente**: seguridad de sus **propios datos y gestión de accesos de usuarios**.
> 
> La mayoría de brechas de seguridad en cloud se deben a **errores de configuración del usuario**, no a fallos del proveedor.

---

### Conceptos Adicionales de Cloud

|Concepto|Definición|
|---|---|
|**Escalabilidad**|Aumentar o disminuir recursos **según la demanda** en cada momento, sin rediseñar el sistema|
|**Alta Disponibilidad**|El servicio está operativo el **mayor tiempo posible** (ej: 99,99%)|
|**Edge Computing**|**Procesar datos cerca de donde se generan** (en el "borde" de la red), para reducir latencia. Alternativa al cloud central.|

> [!NOTE] Edge Computing vs Cloud
> 
> ||Cloud|Edge Computing|
> |---|---|---|
> |Dónde procesa|En el centro de datos remoto|**Cerca del sensor/dispositivo**|
> |Latencia|Mayor|**Menor**|
> |Uso ideal|Big Data, análisis histórico|Respuesta en tiempo real, IoT industrial|
> 
> Edge Computing **ayuda a optimizar el ancho de banda** en sistemas industriales al no enviar todo al cloud.

---

## Bloque 5 — Inteligencia Artificial

### Tipos de IA

> [!IMPORTANT] ANI vs AGI
> 
> ||ANI (Artificial Narrow Intelligence)|AGI (Artificial General Intelligence)|
> |---|---|---|
> |También llamada|IA Estrecha|IA General|
> |Capacidad|**Especializada en una tarea concreta**|Capacidad cognitiva humana generalizada|
> |Estado actual|**La IA que usamos hoy** (ChatGPT, sistemas de reconocimiento)|Todavía no existe / teórica|
> 
> **Toda la IA que usamos actualmente es ANI**: es muy buena en su tarea específica, pero no puede hacer otra cosa.

---

### El Mapa de la IA

```
                    INTELIGENCIA ARTIFICIAL
                           │
              ┌────────────┴────────────┐
              │                         │
       Machine Learning           Otras ramas
              │                  (Robótica, etc.)
     ┌────────┴────────┐
     │                 │
Deep Learning         NLP
(Redes neuronales    (Lenguaje
  profundas)          humano)
                         │
                  Visión Artificial
                  (Imágenes, vídeo)
```

|Subcampo|¿Qué hace?|Ejemplo|
|---|---|---|
|**Machine Learning (ML)**|**Aprender patrones a partir de datos** sin programar reglas explícitas|Detectar spam, recomendar películas|
|**Deep Learning**|ML usando **redes neuronales profundas**|Reconocimiento facial, coches autónomos|
|**NLP** (Natural Language Processing)|**Comprender y generar lenguaje humano** (texto y voz)|ChatGPT, asistentes de voz, traducción automática|
|**Visión Artificial**|Interpretar imágenes y vídeo|Diagnóstico médico por imagen, control de calidad industrial|

> [!TIP] Truco de examen — Subcampos de la IA
> 
> - "Aprender patrones a partir de datos" → **Machine Learning**
> - "Redes neuronales profundas" → **Deep Learning**
> - "Comprender texto o voz" → **NLP**
> - "Interpretar imágenes médicas" → **Visión Artificial**

---

### XAI — Inteligencia Artificial Explicable

> [!IMPORTANT] XAI (eXplainable AI) IA **Explicable**: sistemas de IA capaces de **explicar por qué tomaron una decisión**. Es crucial en sectores donde las decisiones tienen impacto legal o ético (medicina, justicia, créditos bancarios).

---

### Sesgos Algorítmicos

> [!IMPORTANT] ¿Qué es un sesgo algorítmico? Se produce cuando **los datos de entrenamiento contienen prejuicios**, y el algoritmo los aprende y los perpetúa. El algoritmo en sí no "falla": aprende lo que le enseñan los datos.
> 
> Ejemplo: si un sistema de selección de personal se entrena con datos históricos que discriminaban a ciertos colectivos, el algoritmo reproducirá esa discriminación.

---

### Reskilling y el Impacto en el Empleo

> [!IMPORTANT] Reskilling Adquirir **nuevas competencias** para adaptarse a los cambios que introduce la digitalización. No es despedir a nadie ni sustituir personas: es **reconvertir el talento**.

> [!IMPORTANT] La competencia más valorada hoy **Combinar conocimiento de un sector (dominio) con habilidades digitales**. No basta con saber programar, ni con saber solo del sector. La combinación es lo que tiene valor en el mercado.

---

## Bloque 6 — Big Data y el Ciclo del Dato

### Las 3V del Big Data

> [!IMPORTANT] Big Data — Las 3V (y más)
> 
> |V|Significado|Ejemplo|
> |---|---|---|
> |**Volumen**|Cantidad masiva de datos|Millones de transacciones por segundo|
> |**Velocidad**|Datos generados y procesados a alta velocidad|Tweets en tiempo real, sensores IoT|
> |**Variedad**|Diferentes tipos de datos (texto, imagen, vídeo, sensor...)|Datos estructurados + no estructurados|
> |_(Veracidad)_|Calidad y fiabilidad de los datos|Datos limpios vs. datos con ruido|
> |_(Valor)_|Lo que importa al final: extraer valor accionable|Decisiones basadas en patrones|

---

### Dato → Información → Conocimiento

> [!IMPORTANT] La cadena del valor del dato
> 
> - **Dato**: registro bruto, sin contexto. Ejemplo: `37.5`
> - **Información**: dato **al que se le añade contexto y estructura**. Ejemplo: `Temperatura corporal: 37.5 °C`
> - **Conocimiento**: información **interpretada y aplicada**. Ejemplo: `El paciente tiene fiebre leve; no requiere medicación urgente.`

> [!WARNING] El Big Data sin IA no genera valor Sin IA (Machine Learning), el Big Data es solo un **conjunto de datos acumulados sin valor accionable**. La IA es lo que convierte los datos en decisiones. Su relación es **simbiótica**: la IA necesita datos para aprender; el Big Data necesita IA para ser útil.

---

### El Ciclo de Vida del Dato

```
1. CAPTURA       → Recogida de datos (sensores, formularios, logs...)
       ↓
2. ALMACENAMIENTO → Data Lake, Data Warehouse, BD
       ↓
3. PROCESAMIENTO  → Limpieza, transformación, estructuración
       ↓
4. ANÁLISIS       → ML, estadística, minería de datos
       ↓
5. USO / VISUALIZACIÓN → Dashboards, decisiones, automatizaciones
       ↓
6. ARCHIVO O DESTRUCCIÓN ← ÚLTIMA FASE del ciclo
```

> [!IMPORTANT] La última fase del ciclo del dato Es el **archivo o destrucción**. Los datos que ya no son útiles deben archivarse (si hay obligación legal) o destruirse de forma segura (cumpliendo el RGPD).

---

### Data Warehouse vs Data Lake

| |Data Warehouse|Data Lake|
|---|---|---|
|**Estructura**|**Schema-on-write**: estructura definida al escribir|**Schema-on-read**: estructura se aplica al leer|
|**Tipo de datos**|Estructurados, limpios, organizados|Cualquier tipo: estructurado, semiestructurado, no estructurado|
|**Uso principal**|**Business Intelligence y reporting**|**Exploración libre y Machine Learning**|
|**Rendimiento**|Consultas rápidas y predecibles|Más flexible pero más complejo de gestionar|
|**Analogía**|Biblioteca ordenada: cada libro en su sitio|Almacén: lo metes todo, ya lo ordenarás después|

> [!TIP] Truco de examen
> 
> - "BI y reporting" → **Data Warehouse**
> - "Machine Learning y exploración" → **Data Lake**
> - "Schema-on-write" → **Data Warehouse**
> - "Schema-on-read" → **Data Lake**

---

## Bloque 7 — Ciberseguridad

### Defensa en Profundidad

> [!IMPORTANT] Defensa en Profundidad Estrategia que aplica **múltiples capas de seguridad** (red, dispositivo, aplicación, humano). Si una capa falla, las demás siguen protegiendo. Es el opuesto a depender de una única barrera.

```
Capa exterior: Firewall / Perímetro de red
      ↓
Capa de red: Segmentación, VPN
      ↓
Capa de dispositivo: Antivirus, parches, actualizaciones
      ↓
Capa de aplicación: Autenticación, cifrado
      ↓
Capa humana: Formación, políticas de seguridad
```

---

### Segmentación de Red

> [!IMPORTANT] ¿Para qué sirve la segmentación? **Aislar zonas críticas de la red** de posibles intrusiones. Si un atacante compromete una zona (ej: la red de invitados WiFi), **no puede saltar** a la zona crítica de producción o datos sensibles.

---

### Amenazas Clave

|Amenaza|Descripción|
|---|---|
|**Ransomware**|Malware que **cifra tus datos y pide un rescate** para devolverte el acceso|
|**Phishing**|Correo/web falsa que intenta robarte **credenciales** haciéndose pasar por una entidad legítima|
|**Ingeniería social**|Manipular a personas para que revelen información o realicen acciones|

---

## Bloque 8 — Proyecto de Transformación Digital

### Las Fases de un Proyecto de TD

> [!IMPORTANT] Orden correcto de las fases — MUY importante para el examen
> 
> ```
> 1. Definir ESTRATEGIA digital        ← PRIMER paso siempre
>        ↓
> 2. DIAGNÓSTICO digital
>    (procesos + personas + tecnología + clientes)
>        ↓
> 3. Análisis DAFO
>    (Fortalezas, Debilidades, Oportunidades, Amenazas)
>        ↓
> 4. Seleccionar THD
>    (alineamiento estratégico + ROI)
>        ↓
> 5. Priorizar iniciativas
>    (Matriz Impacto/Esfuerzo)
>        ↓
> 6. Implementar y escalar
> ```

> [!WARNING] Error frecuente — El orden importa El examen puede presentar como primer paso "comprar tecnología", "contratar programadores" o "implantar IA". **Ninguno de estos es el primer paso**. Siempre se empieza por **definir la estrategia digital**.

---

### Herramientas de Análisis

|Herramienta|Para qué sirve|
|---|---|
|**Diagnóstico digital**|Analizar el estado actual: procesos, personas, tecnología y clientes. **No solo tecnología.**|
|**Análisis DAFO**|Evaluar **Fortalezas, Debilidades** (internas) + **Oportunidades, Amenazas** (externas) aplicado a la digitalización|
|**Matriz Impacto/Esfuerzo**|**Priorizar iniciativas** según su impacto esperado y el esfuerzo necesario para implementarlas|

> [!TIP] Truco de examen — Matriz Impacto/Esfuerzo
> 
> ```
>                IMPACTO
>         Alto │ Quick Wins │ Grandes proyectos
>              │            │
>         Bajo │ Descartar  │ Solo si sobran recursos
>              └────────────┴──────────────────────
>                  Bajo        Alto
>                         ESFUERZO
> ```
> 
> Los "Quick Wins" (alto impacto, bajo esfuerzo) son las **primeras iniciativas a implementar**.

---

### ¿Quién es responsable de la TD?

> [!IMPORTANT] Responsabilidad de la Transformación Digital **La dirección y toda la organización**. No es solo responsabilidad del departamento IT. La transformación digital requiere un cambio cultural que debe liderarse desde arriba y adoptarse en todos los niveles.

---

### Escalabilidad en el Diseño de Sistemas

> [!IMPORTANT] ¿Por qué es importante la escalabilidad? Permite **crecer sin rediseñar todo el sistema**. Si tu aplicación crece de 100 a 100.000 usuarios, un sistema escalable lo absorbe; uno no escalable colapsa o requiere una reconstrucción completa (muy cara).

---

## 🎯 Resumen de Conceptos Trampa para el Examen

> [!WARNING] Los más frecuentes — estúdialos con atención

|Pregunta típica|Opción trampa|Respuesta correcta|
|---|---|---|
|¿Qué es la transformación digital?|"Digitalizar documentos" / "Usar ordenadores"|**Reorganizar modelo de negocio con tecnología**|
|¿Cuál es el elemento clave de la TD?|"El hardware" / "La conectividad"|**Los datos**|
|¿Qué añade la Industria 5.0?|"Más robots" / "Más automatización"|**Enfoque humano, sostenible y resiliente**|
|¿Qué valor aporta el IoT?|"El dispositivo" / "El hardware"|**El dato contextualizado y analizado**|
|¿Qué tecnología pertenece al entorno OT?|"ERP" / "CRM"|**PLC**|
|¿Qué gestiona el cliente en IaaS?|"El hardware" / "Nada"|**Sistema operativo y aplicaciones**|
|¿Qué es Gmail como servicio cloud?|"IaaS" / "PaaS"|**SaaS**|
|¿Qué son las brechas de seguridad en cloud?|"Fallos del proveedor"|**Errores de configuración del usuario**|
|¿Qué es la IA que usamos hoy?|"AGI" / "IA consciente"|**ANI (IA Estrecha)**|
|¿Qué es el Big Data sin IA?|"Genera conocimiento"|**Solo acumula datos sin valor accionable**|
|¿Cuál es la última fase del ciclo del dato?|"Análisis" / "Visualización"|**Archivo o destrucción**|
|¿Qué usa un Data Lake?|"Schema-on-write"|**Schema-on-read**|
|¿Cuál es el primer paso en un proyecto de TD?|"Comprar tecnología" / "Implantar IA"|**Definir la estrategia digital**|
|¿Qué analiza el diagnóstico digital?|"Solo la tecnología"|**Procesos, personas, tecnología y clientes**|
|RA vs RV — instrucciones sobre máquina real|"Realidad Virtual"|**Realidad Aumentada**|
|RA vs RV — formación en entornos peligrosos|"Realidad Aumentada"|**Realidad Virtual**|

---

## 🔑 Glosario de Siglas y Acrónimos

|Sigla|Significado|
|---|---|
|**IT**|Information Technology (Tecnología de la Información)|
|**OT**|Operational Technology (Tecnología Operacional)|
|**IoT**|Internet of Things (Internet de las Cosas)|
|**THD**|Tecnologías Habilitadoras Digitales|
|**IA / AI**|Inteligencia Artificial|
|**ML**|Machine Learning (Aprendizaje Automático)|
|**NLP**|Natural Language Processing (Procesamiento del Lenguaje Natural)|
|**XAI**|eXplainable Artificial Intelligence (IA Explicable)|
|**ANI**|Artificial Narrow Intelligence (IA Estrecha)|
|**AGI**|Artificial General Intelligence (IA General)|
|**PLC**|Programmable Logic Controller (Controlador Lógico Programable)|
|**ERP**|Enterprise Resource Planning (Sistema de Planificación de Recursos)|
|**CRM**|Customer Relationship Management|
|**IaaS**|Infrastructure as a Service|
|**PaaS**|Platform as a Service|
|**SaaS**|Software as a Service|
|**CPD**|Centro de Procesamiento de Datos|
|**RA**|Realidad Aumentada|
|**RV**|Realidad Virtual|
|**TD**|Transformación Digital|
|**DAFO**|Debilidades, Amenazas, Fortalezas, Oportunidades|
|**ROI**|Return on Investment (Retorno de la Inversión)|
|**CI/CD**|Continuous Integration / Continuous Deployment|

---

## 📊 Tabla Maestra — Las THD de un Vistazo

|THD|Qué hace|Caso de uso clave|Lo que NO es|
|---|---|---|---|
|**IoT**|Captura y transmite datos del mundo físico|Mantenimiento predictivo|El valor no está en el dispositivo, sino en el dato|
|**Cobots**|Robots que colaboran con humanos sin barreras|Líneas de montaje flexibles|No es lo mismo que robot industrial en jaula|
|**RA**|Superpone info digital sobre la realidad|Guiar reparaciones en campo|No es RV (no sustituye la realidad)|
|**RV**|Entorno 100% virtual|Formación en situaciones peligrosas|No está conectada con el mundo real|
|**Blockchain**|Registro distribuido e inmutable|Trazabilidad de cadena de suministro|No es solo criptomonedas|
|**5G**|Alta velocidad + latencia ultrabaja|IoT masivo industrial|No es solo "internet más rápido en el móvil"|
|**Gemelo Digital**|Réplica virtual sincronizada con el objeto real|Simular fallos antes de fabricar|No es una copia de seguridad|
|**Impresión 3D**|Construye capa a capa desde diseño digital|Piezas personalizadas y complejas|No es ideal para producción masiva|
|**Cloud**|Recursos IT bajo demanda por Internet|Escalabilidad, teletrabajo|No elimina la necesidad de seguridad|
|**Edge Computing**|Procesa datos cerca de su origen|Reducir latencia en IoT industrial|No sustituye el cloud, lo complementa|
|**IA/ML**|Aprende patrones de datos para tomar decisiones|Predicción, automatización, visión|La IA actual es ANI, no AGI|
|**Ciberseguridad**|Protege todos los sistemas y datos digitales|Defensa en profundidad|No es opcional: es el pilar transversal|

---

_Apuntes generados para 2º SMR — Módulo: Digitalización Aplicada a los Sectores Productivos_ _Basados en el test de repaso — Optimizados para Obsidian_

diferencia entre it , ot , iot


![[Pasted image 20260506203401.png]]
![[Pasted image 20260506203536.png]]
![[Pasted image 20260506203648.png]]
![[Pasted image 20260506203726.png]]
![[Pasted image 20260506203832.png]]
![[Pasted image 20260506204238.png]]
![[Pasted image 20260506204305.png]]
![[Pasted image 20260506204422.png]]
![[Pasted image 20260506204440.png]]
![[Pasted image 20260506204523.png]]
![[Pasted image 20260506204543.png]]

![[Pasted image 20260506204641.png]]



