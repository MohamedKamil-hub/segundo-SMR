# ☁️ Guía Definitiva: Nube y AWS — 2º SMR

## Índice de Contenidos

1. [[#Bloque 1 — Fundamentos de la Nube]]
2. [[#Bloque 2 — Infraestructura Global de AWS]]
3. [[#Bloque 3 — Cómputo en la Nube (EC2 y Serverless)]]
4. [[#Bloque 4 — Contenedores en AWS]]
5. [[#Bloque 5 — Almacenamiento en AWS]]
6. [[#Bloque 6 — Redes en AWS (VPC)]]
7. [[#Bloque 7 — Bases de Datos en AWS]]
8. [[#Bloque 8 — Monitorización, Escalado y Alta Disponibilidad]]
9. [[#Bloque 9 — Seguridad en AWS]]
10. [[#Bloque 10 — Gestión de Costes en AWS]]
11. [[#Bloque 11 — Arquitecturas Modernas]]
12. [[#Bloque 12 — Well-Architected Framework y Buenas Prácticas]]
13. [[#Resumen de Conceptos Trampa]]
14. [[#Glosario de Servicios AWS]]

---

## Bloque 1 — Fundamentos de la Nube

### ¿Qué es la nube?

> [!IMPORTANT] Definición de Cloud Computing Acceso bajo demanda a recursos informáticos (cómputo, almacenamiento, redes, bases de datos) a través de Internet, **pagando solo por lo que se usa** y sin necesidad de hardware propio.

---

### Ventajas Fundamentales de la Nube

|Ventaja|Descripción|
|---|---|
|**Sin costes iniciales**|No hay que comprar hardware ni licencias largas|
|**Pago por uso (Pay as You Go)**|Pagas solo por los recursos consumidos y el tiempo usado|
|**Elasticidad**|Los recursos **crecen o decrecen según la demanda** automáticamente|
|**Escalabilidad**|Capacidad de ampliar o reducir recursos rápidamente|
|**Alcance global**|Desplegar recursos en cualquier región del mundo en minutos|
|**Economías de escala**|AWS concentra millones de clientes → reduce costes variables|

> [!TIP] Diferencia Elasticidad vs Escalabilidad
> 
> - **Escalabilidad** = capacidad de crecer (ampliación planificada)
> - **Elasticidad** = crecer Y reducirse **automáticamente** según la demanda real en cada momento En el examen, "ampliar o reducir recursos automáticamente" = **elasticidad**.

> [!IMPORTANT] El problema del entorno tradicional (on-premise) El hardware se dimensiona para el **peor escenario posible (pico máximo)**, lo que genera infrautilización constante. En la nube, pagas solo por lo que usas en cada momento.

---

### Modelos de Servicio Cloud

> [!IMPORTANT] Los 3 modelos de servicio
> 
> |Modelo|Nombre|Qué gestiona el cliente|Qué gestiona AWS|Ejemplo|
> |---|---|---|---|---|
> |**IaaS**|Infrastructure as a Service|SO, middleware, apps, datos|Hardware, red, virtualización|**EC2**|
> |**PaaS**|Platform as a Service|Solo las aplicaciones y datos|Todo lo anterior + SO y plataforma|**Elastic Beanstalk**| facilita el despliegue rapido de aplicaciones
> |**SaaS**|Software as a Service|**Nada técnico**: solo usa el software|Todo|**Gmail, Office 365**|

> [!TIP] Truco de examen — IaaS vs PaaS vs SaaS
> 
> - "Máxima flexibilidad sobre recursos de TI" → **IaaS**
> - "Evitar gestionar sistemas operativos" → **PaaS**
> - "Correo web / app lista para usar" → **SaaS**

### Formas de Interactuar con AWS

> [!IMPORTANT] Las 3 formas principales de acceder a AWS
>
> | Herramienta | Qué es | Cuándo usarla |
> |---|---|---|
> | **Consola de Administración** | Interfaz **web gráfica** (navegador) para gestionar todos los servicios y recursos de AWS | Exploración, configuración manual, usuarios no técnicos |
> | **AWS CLI** | Herramienta de **línea de comandos** que permite ejecutar operaciones AWS desde la terminal | Scripts, automatización, administradores de sistemas |
> | **SDK (Software Development Kit)** | Bibliotecas para lenguajes de programación (Python, Java, JS...) que integran AWS en aplicaciones | Desarrollo de software que usa servicios AWS |
>
> Las tres acceden a la misma infraestructura AWS; solo cambia la interfaz.

> [!NOTE] AWS CLI — detalles clave
> - Se instala en el equipo local (Windows, Linux, macOS)
> - Requiere configurar **credenciales de acceso** (Access Key ID + Secret Access Key) o un rol IAM
> - Permite ejecutar cualquier operación que se puede hacer por consola, pero desde la terminal
> - Ejemplo: `aws s3 ls` lista todos los buckets S3 de la cuenta
> - Ideal para **automatizar tareas repetitivas** mediante scripts bash o PowerShell

### Modelos de Despliegue

|Modelo|Descripción|
|---|---|
|**Nube pública**|Recursos compartidos en la infraestructura del proveedor (AWS)|
|**Nube privada**|Infraestructura dedicada a una sola organización|
|**Nube híbrida**|Combinación de nube pública + recursos on-premise|

---

### Elasticidad Económica

> [!IMPORTANT] Elasticidad Económica Pagar **únicamente por la capacidad utilizada en cada pico**, no por la capacidad máxima posible. Si el tráfico baja, el coste baja. Si sube, escala y sube proporcionalmente.

> [!IMPORTANT] CapEx vs OpEx — terminología financiera clave
>
> | Término | Nombre completo | Qué significa | Ejemplo |
> |---|---|---|---|
> | **CapEx** | Capital Expenditure (gasto de capital) | Inversión **puntual y grande** en activos físicos | Comprar servidores, instalar CPD propio |
> | **OpEx** | Operational Expenditure (gasto operativo) | Pago **recurrente y variable** por uso de un servicio | Factura mensual de AWS |
>
> **La nube convierte CapEx en OpEx**: en lugar de invertir capital inicial en hardware (CapEx), pagas mes a mes solo por lo que consumes (OpEx). Esto elimina el riesgo de sobredimensionar y libera capital para el negocio.

> [!TIP] Truco de examen — CapEx/OpEx
> "Convertir gastos de capital en gastos operativos" = pasar de comprar servidores propios a pagar por uso en la nube = **beneficio principal de la nube frente a on-premises**.


## Bloque 2 — Infraestructura Global de AWS

### Jerarquía de Infraestructura AWS

> [!IMPORTANT] Jerarquía de infraestructura (de MAYOR a MENOR)
> 
> ```
> REGIÓN
>    └── ZONAS DE DISPONIBILIDAD (AZ)
>              └── CENTROS DE DATOS
> 
> + EDGE LOCATIONS (fuera de la jerarquía principal)
> ```
> 
> La jerarquía correcta es: **Región → AZ → Edge Location**

---

### Regiones

> [!IMPORTANT] ¿Qué es una Región? Un **área geográfica que agrupa varios centros de datos** (a través de sus AZs). Cada región es completamente independiente de las demás.

**Criterios para elegir una región:**

1. **Cumplimiento legal y residencia de datos** (ej: RGPD exige datos en Europa)
2. **Latencia** (región cercana a los usuarios = menor demora)
3. Disponibilidad de servicios (no todos los servicios están en todas las regiones)
4. Coste (varía por región)

> [!WARNING] No todas las regiones están habilitadas por defecto Algunas regiones requieren activación explícita. Una región cercana a los usuarios **reduce la latencia** pero no garantiza menor precio.

---

### Zonas de Disponibilidad (AZ)

> [!IMPORTANT] ¿Qué es una AZ? Un **centro de datos independiente con energía, refrigeración y red propias**. Cada región tiene **múltiples AZs** (mínimo 2, generalmente 3).
> 
> Las AZs dentro de una región se conectan mediante **redes privadas de fibra óptica de baja latencia**.

**¿Por qué usar múltiples AZs?**

> Para **aumentar la resiliencia**: si un desastre afecta a una AZ, las demás siguen operativas. Una arquitectura multi-AZ **aumenta la disponibilidad del sistema**.

---

### Edge Locations

> [!IMPORTANT] ¿Qué son las Edge Locations? Puntos de presencia distribuidos globalmente (más numerosos que las regiones) cuyo objetivo es **reducir la latencia entregando contenido más cerca del usuario final**. Las usa principalmente Amazon CloudFront (CDN).

**Ejemplo práctico:**

> Si un usuario en Japón accede a un servicio alojado en Virginia, una **Edge Location en Japón** sirve el contenido cacheado localmente → mucho menor latencia.

> [!TIP] Diferencia Región vs AZ vs Edge Location
> 
> - **Región** = área geográfica (ej: eu-west-1, Irlanda)
> - **AZ** = centro de datos dentro de la región
> - **Edge Location** = punto de caché de contenido cerca del usuario (más numerosos)

---

### Responsabilidad Compartida

> [!IMPORTANT] Modelo de Responsabilidad Compartida La seguridad en la nube se divide:
> 
> |Responsable|¿De qué se encarga?|
> |---|---|
> |**AWS** ("seguridad DE la nube")|**Infraestructura física, hardware, red, hipervisor, software de servicios gestionados**|
> |**Cliente** ("seguridad EN la nube")|**Datos, gestión de identidades (IAM), configuración de red, cifrado de datos, grupos de seguridad**|

> [!TIP] Ejemplos de responsabilidad en el examen
> 
> - "¿Quién protege el hardware físico?" → **AWS**
> - "¿Quién parchea el SO de una instancia EC2?" → **El cliente** (EC2 es IaaS)
> - "¿Quién parchea el SO de RDS?" → **AWS** (RDS es gestionado)
> - "¿Quién configura los grupos de seguridad?" → **El cliente**

---

## Bloque 3 — Cómputo en la Nube (EC2 y Serverless)

### Amazon EC2 — Servidores Virtuales

> [!IMPORTANT] ¿Qué es EC2? Amazon **Elastic Compute Cloud**: **servidores virtuales bajo demanda con control total** sobre el sistema operativo, el hardware virtual y las aplicaciones. Es el servicio IaaS principal de AWS.

---

#### Componentes Clave de EC2

|Componente|Función|
|---|---|
|**AMI** (Amazon Machine Image)|Define el **sistema operativo y software inicial** de la instancia. Es la "foto" desde la que arranca la máquina.|
|**Tipo de instancia**|Define la CPU, RAM y capacidad de red|
|**Par de claves (Key Pair)**|Permite el **acceso seguro SSH** a instancias Linux mediante clave privada|
|**Grupo de seguridad**|**Firewall virtual** que controla el flujo de tráfico de red (entrada y salida)|
|**VPC / Subred**|Define el rango de red donde se despliega la instancia|
|**User Data**|Script que se ejecuta al arrancar la instancia (**script de arranque**)|
|**Elastic IP**|Dirección IP pública fija asignada a una instancia|

> [!IMPORTANT] Acceso seguro a instancia Linux Se usa la **clave privada del par de claves SSH**. No se usa contraseña generada automáticamente ni token IAM para la conexión directa.


> [!WARNING] ¡Cuidado! AMI ≠ IAM — confusión frecuente de examen
>
> | Concepto | Significado | Para qué sirve |
> |---|---|---|
> | **AMI** | Amazon **Machine** Image | Define el **SO y software inicial** de una instancia EC2 |
> | **IAM** | **Identity** and Access Management | Gestiona **usuarios, roles y permisos** en AWS |
>
> - **AMI** es una "foto" del sistema operativo → se usa al **lanzar instancias EC2**
> - **IAM** es el sistema de control de acceso → se usa para **autorizar qué puede hacer cada usuario o servicio**
>
> La trampa del examen: preguntan "¿qué define el SO inicial de EC2?" y ponen IAM como opción distractor. La respuesta siempre es **AMI**.


---

#### Tipos de Instancias EC2

|Familia|Optimizada para|Ejemplo|
|---|---|---|
|**T** (T3, T4)|Uso general / **desarrollo y pruebas ligeras**|T3|
|**M** (M5, M6)|Uso general balanceado|M5|
|**C** (C5, C6)|**Cómputo intensivo** (CPU)|C5, C6|
|**R** (R5, R6)|**Memoria intensiva** (RAM)|R5|
|**P** / **G**|GPU / Machine Learning|P3|
|**H** / **I**|Almacenamiento intensivo|H1|
|**X**|Memoria extrema|X1|

> [!TIP] Cómo recordar los tipos de instancia
> 
> - **T** = Testing/ligero (el más barato para dev)
> - **C** = **C**ompute (CPU intensiva)
> - **R** = **R**AM / memoria intensiva
> - **M** = balanced (Middle, memoria/cómputo)

---

#### Modelos de Precio de EC2

|Modelo|Precio|Interrupción|Cuándo usar|
|---|---|---|---|
|**Bajo demanda**|Normal|No|Cargas variables, pruebas|
|**Reservado**|Hasta 72% descuento|No|Cargas estables y predecibles|
|**Spot**|Hasta 90% descuento|**Sí** (puede interrumpirse)|Procesos tolerantes a fallos|
|**Dedicado**|El más caro|No|Requisitos legales de aislamiento|

> [!WARNING] Las instancias Spot pueden ser interrumpidas Son muy baratas pero AWS puede recuperarlas cuando las necesita. Solo usar para tareas que toleran la interrupción (procesamiento por lotes, renderizado...).

---

#### Almacenamiento de Instancias EC2

|Tipo|Persistencia|Características|
|---|---|---|
|**EBS** (Elastic Block Store)|**Persiste** aunque se detenga/reinicie la instancia|Almacenamiento en **bloque** adjunto a una instancia|
|**Instance Store**|**Se pierde** al detener la instancia|Efímero, muy rápido, ligado al hardware físico|

> [!WARNING] Instance Store = datos efímeros Si **detienes** la instancia, los datos del Instance Store se borran. Si solo la **reinicias**, los datos se mantienen (pero es arriesgado). Para datos importantes → siempre **EBS**.

---

### AWS Lambda — Serverless

> [!IMPORTANT] ¿Qué es AWS Lambda? Servicio que **ejecuta código en respuesta a eventos sin necesidad de gestionar servidores**. El concepto "serverless" significa que **los servidores existen pero el cliente no los administra** (abstracción operativa).

**Características clave:**

- Se ejecuta en respuesta a **eventos (triggers)**
- **Escala automáticamente** ante picos de tráfico
- Se factura **por milisegundos de ejecución y número de peticiones**
- Sin coste cuando no se ejecuta

**Triggers (disparadores) comunes de Lambda:**

|Trigger|Ejemplo|
|---|---|
|**Amazon S3**|Subida de un archivo a un bucket|
|API Gateway|Petición HTTP a un endpoint|
|DynamoDB Streams|Cambio en una tabla NoSQL|
|CloudWatch Events|Evento programado (cron)|
|SNS / SQS|Mensaje en una cola o topic|

> [!TIP] EC2 vs Lambda — ¿cuándo usar cada uno?
> 
> ||EC2|Lambda|
> |---|---|---|
> |**Cuándo es mejor**|Procesos constantes y de alta utilización|Procesos puntuales, eventos esporádicos|
> |**Gestión**|El cliente gestiona el SO y parches|AWS gestiona todo|
> |**Control**|Total sobre el entorno|Solo el código|
> |**Facturación**|Por hora de instancia encendida|Por milisegundo de ejecución|

---

### AWS SAM — Despliegue Serverless

> [!IMPORTANT] AWS SAM (Serverless Application Model) Herramienta CLI para el **despliegue de aplicaciones serverless**. Permite definir funciones Lambda, APIs y eventos en un archivo de configuración y desplegarlos fácilmente.

---

## Bloque 4 — Contenedores en AWS

### ¿Qué es un Contenedor?

> [!IMPORTANT] Contenedor (Docker) Una **imagen liviana y portable** que empaqueta una aplicación con todas sus dependencias. Ventajas principales:
> 
> - **Portabilidad**: funciona igual en cualquier entorno
> - **Ligero**: no incluye un SO completo (a diferencia de una VM)
> - **Rápido** de iniciar y desplegar
> - Permite **escalado** horizontal

---

### Servicios de Contenedores en AWS

| Servicio                                    | Función                                                                                                                                              |
| ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Amazon ECR** (Elastic Container Registry) | **Registro de imágenes de contenedores** (como Docker Hub pero privado en AWS) PROPORCIONA IMAGENES DE CONTENEDORES LISTAS PARA DESCARGAR Y EJECUTAR |
| **Amazon ECS** (Elastic Container Service)  | **Orquestación de contenedores nativa de AWS** (servicio propio)                                                                                     |
| **Amazon EKS** (Elastic Kubernetes Service) | **Kubernetes gestionado** — ideal para microservicios con Kubernetes                                                                                 |
| **AWS Fargate**                             | Ejecutar contenedores **sin gestionar servidores** (serverless para contenedores)                                                                    |

> [!IMPORTANT] Diferencia ECS vs EKS
> 
> - **ECS** = servicio **nativo de AWS** para orquestar contenedores (más simple)
> - **EKS** = **Kubernetes** gestionado (estándar de la industria, más complejo pero más portable)

> [!TIP] Fargate = serverless para contenedores Si la pregunta habla de "ejecutar contenedores **sin gestionar servidores**" → la respuesta es **AWS Fargate**.

---

## Bloque 5 — Almacenamiento en AWS

### Tipos de Almacenamiento

> [!IMPORTANT] Los 3 tipos de almacenamiento en AWS
> 
> |Tipo|Servicio|Acceso|Uso típico|
> |---|---|---|---|
> |**Bloque**|**EBS**|Una instancia EC2 (disco duro virtual)|SO, bases de datos, aplicaciones|
> |**Objetos**|**S3**|URL pública / API|Archivos, backups, web estática, big data|
> |**Archivos (compartido)**|**EFS**|**Varios servidores simultáneamente**|Servidores de archivos compartidos|

---

### Amazon EBS (Elastic Block Store)

> [!IMPORTANT] EBS Almacenamiento en **bloque** que actúa como **disco duro para servidores EC2**. Se adjunta a una instancia y persiste aunque esta se detenga.

**Tipos de volumen EBS:**

|Tipo|Optimizado para|Cuándo usar|
|---|---|---|
|**gp3** (General Purpose SSD)|Uso general, balanceado|La mayoría de workloads|
|**io1 / io2** (Provisioned IOPS SSD)|**IOPS intensivo** (bases de datos críticas)|Alta velocidad de E/S|
|**st1** (Throughput Optimized HDD)|**Rendimiento secuencial** (streaming de datos)|Big Data, logs|
|**sc1** (Cold HDD)|Acceso poco frecuente, bajo coste|Archivos fríos|

> [!TIP] Truco de examen — Tipos de EBS
> 
> - "Rendimiento secuencial" → **st1**
> - "IOPS intensivo" → **io1 / io2**
> - "Uso general" → **gp3**
> - "Muy barato, poco acceso" → **sc1**

**Datos importantes sobre EBS:**

- Tamaño máximo: **16 TB** por volumen
- Los **snapshots** (copias) se guardan en **Amazon S3**
- Si se detiene la instancia EC2, los datos EBS **persisten**

---

### Amazon S3 (Simple Storage Service)

> [!IMPORTANT] ¿Qué es S3? Almacenamiento de **objetos** extremadamente escalable y duradero. Un **objeto** = archivo + sus metadatos (nombre, permisos, etc.). Los objetos se guardan en **Buckets** (contenedores principales).

**Características clave:**

- Tamaño máximo de un objeto: **5 TB**
- Acceso mediante URL o API
- Ideal para: sitios web estáticos, backups, big data, distribución de contenido
- Altísima durabilidad: 99,999999999% (11 nueves)

#### Clases de Almacenamiento S3

| Clase                                | Acceso                  | Coste           | Cuándo usar                                                                                 |
| ------------------------------------ | ----------------------- | --------------- | ------------------------------------------------------------------------------------------- |
| **S3 Standard**                      | Frecuente               | Alto            | Datos activos de acceso frecuente                                                           |
| **S3 Intelligent-Tiering**           | **Impredecible**        | Medio           | Se optimiza automáticamente según el patrón de acceso                                       |
| **S3 Standard-IA**                   | Infrecuente             | Menor           | Datos que se acceden pocas veces pero deben estar disponibles rápido                        |
| **S3 One Zone-IA**                   | Infrecuente             | Aún menor       | Como IA pero en **una sola zona de disponibilidad** (menos redundancia)                     |
| **S3 Glacier**                       | Archivo (minutos/horas) | Muy bajo        | **Archivado barato** con recuperación en minutos u horas                                    |
| Amazon S3 Glacier Flexible Retrieval |                         | bajo            | archivos que pueden esperar<br>desde unos minutos (con recuperación acelerada) hasta horas. |
| **S3 Glacier Deep Archive**          | Archivo (horas)         | **El más bajo** | Archivado a muy largo plazo, recuperación en horas                                          |

> [!TIP] Truco de examen — Clases de S3
> 
> - "Acceso frecuente" → **S3 Standard**
> - "Acceso impredecible, optimización automática" → **S3 Intelligent-Tiering**
> - "Solo una zona de disponibilidad" → **S3 One Zone-IA**
> - "Archivado barato" → **S3 Glacier**
> - "Coste más bajo de toda la nube" → **S3 Glacier Deep Archive**
> - "Datos que se borran en 30 días" → **S3 Standard** (sin penalización por borrado temprano)

**Funcionalidades avanzadas de S3:**

|Función|Para qué sirve|
|---|---|
|**Versioning**|Recuperar archivos borrados o sobrescritos|
|**Lifecycle Policies**|Mover datos entre clases de almacenamiento según reglas (ej: mover a Glacier a los 90 días)|
|**Cross-Region Replication (CRR)**|Replicar objetos automáticamente entre buckets en distintas regiones|
|**S3 Lifecycle Manager**|Mover datos entre clases según reglas automáticas|

**S3 Object lock** 
garantiza que un objeto no pueda ser eliminado ni sobrescrito por nadie, incluso por el usuario raíz, durante un periodo de tiempo determinado


### Amazon EFS (Elastic File System)

> [!IMPORTANT] EFS Sistema de archivos compartido que puede ser accedido **por varias instancias EC2 simultáneamente** (a diferencia de EBS que solo puede conectarse a una instancia a la vez).
> 
> Uso típico: **servidores de archivos compartidos**, aplicaciones que necesitan acceso concurrente a los mismos archivos.

> [!TIP] EFS vs EBS — diferencia clave
> 
> - **EBS** = disco duro de una sola instancia (como el disco C:)
> - **EFS** = carpeta de red compartida accesible desde múltiples instancias a la vez

---

### Resumen Comparativo de Almacenamiento

|                       |EBS|S3|EFS|Instance Store|
|---|---|---|---|---|
| **Tipo**              |Bloque|Objetos|Archivos|Bloque efímero|
| **Acceso simultáneo** |Una instancia|Cualquiera por URL|Múltiples instancias|Una instancia|
| **Persistencia**      |✅ Sí|✅ Sí|✅ Sí|❌ No (se borra al detener)|
| **Snapshots en**      |S3|—|—|—|
| **Caso de uso**       |Disco de SO / BD|Archivos, web, backup|Archivos compartidos|Caché temporal|

---

## Bloque 6 — Redes en AWS (VPC)

### VPC (Virtual Private Cloud)

> [!IMPORTANT] ¿Qué es una VPC? Una **red virtual privada y aislada dentro de AWS**. Es el "centro de datos virtual" en la nube. Permite definir rangos de IP (CIDR), subredes, tablas de rutas y políticas de acceso.
> 
> - Puede abarcar **varias Zonas de Disponibilidad**
> - No puede pertenecer a varias regiones (es regional)
> - El cliente define las reglas de comunicación

---

### Subredes

> [!IMPORTANT] ¿Qué es una subred? Una **división de la VPC** para organizar recursos y controlar la disponibilidad y seguridad. Las subredes se crean dentro de una AZ específica.

|Tipo|Característica|Uso típico|
|---|---|---|
|**Subred pública**|Tiene ruta directa hacia un **Internet Gateway**|Servidores web, balanceadores de carga|
|**Subred privada**|**Sin acceso directo a Internet**|Bases de datos, servidores de aplicación internos|

> [!IMPORTANT] Diseño básico de una VPC para aplicación web Crear al menos una **subred pública** (para el balanceador/web) y una **subred privada** (para la base de datos). Los recursos críticos como bases de datos **deben alojarse en subredes privadas**.

**Cálculo de IPs en una subred /24:**

> Una subred /24 tiene 256 direcciones IP totales. AWS reserva 5 → **251 disponibles** para el cliente.

---

### Componentes de Red Clave

| Componente                 | Función                                                                                                                                                                                                       |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Internet Gateway (IGW)** | Conecta la VPC con Internet. **Imprescindible** para que una subred sea pública , es bidireccional                                                                                                            |
| **NAT Gateway**            | Permite a subredes privadas acceder a Internet de forma **saliente** (sin exponer la IP privada). Se coloca en subred pública. pero las instancias priadas no tienen ip publica, solo usan la del NAT gateway |
| **Tabla de rutas**         | Define hacia dónde se envía el tráfico (ej: tráfico a 0.0.0.0/0 → IGW)                                                                                                                                        |
| **Grupos de seguridad**    | **Firewall virtual a nivel de instancia**. Define reglas de entrada y salida. Solo permite, no deniega explícitamente. son stateful                                                                           |
| **VPC Peering**            | Conecta dos VPCs entre sí de forma privada                                                                                                                                                                    |

> [!TIP] Para que una subred tenga acceso a Internet, necesitas:
> 
> 1. Un **Internet Gateway (IGW)** adjunto a la VPC que permite la comunicacion  entre recursos vpc e internet
> 2. Una **tabla de rutas** con una regla que envíe el tráfico (0.0.0.0/0) al IGW Ambos pasos son necesarios.

> [!IMPORTANT] Grupos de Seguridad
> 
> - Operan a **nivel de instancia** (firewall virtual)
> - Son **stateful**: si permites entrada, la respuesta saliente se permite automáticamente
> - Solo tienen reglas de **permitir**, no de denegar explícitamente
> - Se puede limitar el tráfico saliente a un servidor específico

---

### Amazon Route 53

> [!IMPORTANT] Route 53 Servicio DNS de AWS que **traduce nombres de dominio en direcciones IP**. Además actúa como **mecanismo de control de tráfico y disponibilidad**.

**Políticas de enrutamiento:**

|Política|Función|
|---|---|
|**Simple**|Un nombre → una IP fija|
|**Latency (Latencia)**|Dirige al usuario a la región con **mejor tiempo de respuesta**|
|**Weighted (Peso)**|Divide el tráfico por porcentaje → **pruebas A/B**|
|**Failover**|**Redirige tráfico a un backup** si el principal falla|
|**Geolocation**|Dirige según la ubicación geográfica del usuario|

> [!TIP] Truco de examen — Route 53
> 
> - "Mejor experiencia / menor demora" → **Latency Routing**
> - "Pruebas A/B / dividir tráfico por porcentaje" → **Weighted Routing**
> - "Redirigir a backup si el principal falla" → **Failover Routing**
> - "Conectar el nombre de dominio con la infraestructura" → Route 53 (DNS)

---

### Amazon CloudFront (CDN)

> [!IMPORTANT] CloudFront — Red de Entrega de Contenido (CDN) **Almacena en caché archivos solicitados con frecuencia** en Edge Locations cercanas al usuario. Reduce la latencia entregando el contenido desde el punto más cercano al usuario final.

> [!NOTE] Las 5 direcciones IP que AWS reserva en cada subred
> En toda subred, AWS reserva automáticamente **5 direcciones** que el cliente no puede usar:
>
> | Dirección | Ejemplo en 192.168.10.0/24 | Motivo |
> |---|---|---|
> | Primera | 192.168.10.0 | Dirección de red |
> | Segunda | 192.168.10.1 | Router (gateway de la VPC) |
> | Tercera | 192.168.10.2 | DNS de AWS |
> | Cuarta | 192.168.10.3 | Reservada para uso futuro de AWS |
> | Última | 192.168.10.255 | Dirección de broadcast |
>
> **Fórmula para IPs usables:** 2ⁿ − 5 (donde n = bits del host)
> - Subred /24 → 256 IPs totales − 5 = **251 IPs usables**
> - Subred /25 → 128 IPs totales − 5 = **123 IPs usables**
> - Subred /26 → 64 IPs totales − 5 = **59 IPs usables**

> [!TIP] Truco de examen — IPs en una subred
> La pregunta puede dar el bloque CIDR y pedir IPs **totales** o IPs **usables**. Son cosas distintas:
> - **/24 total** = 256 | **/24 usables** = 251
> - Si la pregunta dice "disponibles para instancias" → responde **251**, no 256.


## Bloque 7 — Bases de Datos en AWS

### Amazon RDS (Relational Database Service)

> [!IMPORTANT] ¿Qué es RDS? **Servicio gestionado de bases de datos relacionales**. AWS se encarga del parcheado del SO, los backups automáticos, la alta disponibilidad y el mantenimiento. El cliente solo gestiona sus datos y consultas.

**Motores compatibles con RDS:**

> MySQL, PostgreSQL, MariaDB, Oracle y SQL Server (y Amazon Aurora)

**Lo que AWS gestiona en RDS:**

- Parcheado del sistema operativo
- Backups automáticos
- Actualizaciones del motor de base de datos
- Alta disponibilidad (Multi-AZ)

> [!TIP] ¿Cuándo usar RDS vs DynamoDB?
> 
> - **RDS** = ERP, facturación, sistemas con relaciones complejas y transacciones ACID
> - **DynamoDB** = aplicaciones de tiempo real (likes, juegos, mensajes), catálogos dinámicos, serverless

---

### Amazon Aurora

> [!IMPORTANT] Amazon Aurora **Base de datos relacional nativa de AWS**. Compatible con MySQL y PostgreSQL pero con hasta 5x mejor rendimiento. Completamente gestionada por AWS.

---

### Amazon DynamoDB

> [!IMPORTANT] ¿Qué es DynamoDB? Base de datos **NoSQL de clave-valor gestionada** (también soporta documentos JSON). Característica principal: **serverless** (no administras servidores ni escalas manualmente).

**Características clave:**

- **Esquema flexible**: clave-valor o documentos JSON (sin esquema rígido)
- Escalado automático de capacidad de lectura/escritura según la demanda
- Baja latencia: milisegundos para lectura
- Unidad básica: **Tablas** → compuestas por **Ítems** (filas) y **Atributos** (columnas)

**Servicios complementarios de DynamoDB:**

|Servicio|Función|
|---|---|
|**Amazon DAX**|**Caché en memoria** para reducir la latencia de DynamoDB (microsegundos en lugar de milisegundos)|
|**DynamoDB Streams**|**Captura y gestiona cambios en los datos en tiempo real** (como un log de cambios)|
|**PartiQL**|Lenguaje SQL-like para consultar DynamoDB con **sintaxis conocida**|

---




**Redshift**
es un almacén de datos (Data Warehouse) diseñado para realizar consultas analíticas complejas sobre petabytes de datos

### Comparativa de Bases de Datos

| |RDS / Aurora|DynamoDB|
|---|---|---|
|**Tipo**|Relacional (SQL)|NoSQL (clave-valor / JSON)|
|**Esquema**|Rígido (tablas, claves foráneas)|Flexible|
|**Caso de uso**|ERP, facturación, datos complejos|Tiempo real, serverless, catálogos|
|**Gestión**|Gestionada por AWS (SO + backups)|Completamente serverless|
|**Escalado**|Manual o automático con réplicas|**Automático nativo**|

---

## Bloque 8 — Monitorización, Escalado y Alta Disponibilidad

### Amazon CloudWatch

> [!IMPORTANT] ¿Qué es CloudWatch? **Servicio de monitorización y observabilidad de AWS**. Centraliza métricas, logs y alarmas de todos los servicios. Es esencial para mantener arquitecturas estables y eficientes.

**Funcionalidades:**

|Función|Descripción|
|---|---|
|**Métricas**|Monitorizar uso de CPU, memoria, red, etc. de EC2|
|**Alarmas**|Crear **alertas basadas en umbrales** (ej: CPU > 80%)|
|**Logs**|Recopilar y centralizar logs de aplicaciones y servicios|
|**CloudWatch Logs Insights**|**Búsquedas avanzadas** en los logs|
|**Dashboards**|Visualizar métricas en tiempo real|

> [!TIP] La métrica más común para disparar escalado El **porcentaje de utilización de CPU de EC2** es la métrica más habitual para configurar alarmas de escalado automático.

**Integración CloudWatch + Lambda:**

> CloudWatch puede **disparar funciones Lambda** ante eventos, permitiendo **correcciones automáticas** ante incidencias (arquitectura autónoma/auto-healing).

---

### Auto Scaling

> [!IMPORTANT] Auto Scaling Proceso que **aumenta o disminuye automáticamente el número de instancias EC2** según métricas de CloudWatch. Se gestiona mediante **Auto Scaling Groups (ASG)**.

**Auto Scaling + ELB = Arquitectura elástica:**

> La combinación de Auto Scaling y un balanceador de carga crea una **arquitectura elástica que crece o decrece sola** según la demanda.

---

### Elastic Load Balancing (ELB)

> [!IMPORTANT] ELB — Balanceador de Carga **Distribuye el tráfico de forma inteligente** entre múltiples instancias EC2. El usuario llega a una única dirección pública y el ELB decide qué instancia atiende cada petición.

**Health Checks:**

> El ELB realiza comprobaciones de salud (health checks) periódicas. Si una instancia **falla el health check**, el balanceador **deja de enviarle tráfico** automáticamente.

> [!WARNING] Mito sobre los balanceadores de carga Un único balanceador de carga **NO puede servir tráfico global solo**. Para optimizar la experiencia global hay que combinar **Route 53 con balanceadores regionales**.

---

### Alta Disponibilidad y Recuperación ante Desastres

|Estrategia|Descripción|Protección|
|---|---|---|
|**Multi-AZ**|Desplegar en varias AZs dentro de una región|Protege contra fallos de una AZ|
|**Multi-Región**|Desplegar en dos o más regiones geográficas|Protege contra desastres regionales|

> [!IMPORTANT] RTO y RPO
> 
> |Término|Definición|
> |---|---|
> |**RTO** (Recovery Time Objective)|**Tiempo máximo** para recuperar un sistema tras un fallo|
> |**RPO** (Recovery Point Objective)|**Pérdida máxima de datos** tolerable medida en tiempo|

---

### Amazon SNS — Notificaciones

> [!IMPORTANT] Amazon SNS (Simple Notification Service) Servicio para **enviar notificaciones inmediatas** (email, SMS, HTTP, Lambda) ante anomalías o alarmas de CloudWatch. Se integra con CloudWatch Alarms para alertar cuando se supera un umbral.

---

## Bloque 9 — Seguridad en AWS

### IAM — Gestión de Identidades y Accesos

> [!IMPORTANT] Principio de Mínimo Privilegio en AWS **Dar solo los permisos necesarios para una tarea específica**. Nunca conceder permisos de administrador total si no son necesarios.

**Mejores prácticas IAM:**

- Asignar un **Rol de IAM** a las instancias EC2 (no guardar claves de acceso en la instancia)
- Usar **roles** para acceso temporal entre cuentas (no crear usuario IAM por cada externo)
- Usar **MFA** para la cuenta root y usuarios privilegiados

**AWS STS (Security Token Service):**

> Gestiona **credenciales temporales** para servicios y usuarios federados. Para acceso temporal entre cuentas, crear un **rol IAM que puedan asumir usuarios externos**.

> [!IMPORTANT] ¿Qué es una política IAM (IAM Policy)?
> Un **documento JSON que define permisos**: especifica qué acciones están **permitidas (Allow) o denegadas (Deny)** sobre qué recursos de AWS y bajo qué condiciones.
>
> Estructura básica de una política:
> - **Effect**: Allow o Deny
> - **Action**: qué operación (ej: `s3:GetObject`, `ec2:StartInstances`)
> - **Resource**: sobre qué recurso (ej: un bucket S3 concreto o `*` para todos)
>
> **Tipos de políticas IAM:**
>
> | Tipo | Descripción |
> |---|---|
> | **Gestionada por AWS** | Políticas predefinidas por AWS (ej: `AmazonS3ReadOnlyAccess`) |
> | **Gestionada por el cliente** | Políticas personalizadas creadas por la empresa |
> | **Inline** | Política embebida directamente en un usuario, grupo o rol concreto |
>
> Las políticas se **adjuntan** a usuarios, grupos o roles IAM para otorgarles permisos.

> [!WARNING] Regla de denegación explícita
> Si hay un **Deny explícito**, tiene **prioridad absoluta** sobre cualquier Allow. Por defecto, todo está denegado si no hay un Allow que lo cubra.

### AWS Artifact — Portal de Cumplimiento
> [!IMPORTANT] ¿Qué es AWS Artifact? Es un **portal de autoservicio y recurso centralizado para el cumplimiento de normativas**. Permite acceder bajo demanda a informes de seguridad y certificaciones emitidos por auditores externos[reference:0] que verifican el cumplimiento de AWS. Su función principal es **demostrar que la infraestructura de AWS cumple con normativas** como ISO 27001, PCI DSS, SOC o RGPD[reference:1].

> [!TIP] ¿En qué se diferencia de CloudTrail y AWS Config?
> 
> - **AWS Artifact** se centra en **documentar el cumplimiento de AWS** (es una "biblioteca de pruebas" de que AWS cumple con las normas).
> - **CloudTrail** registra **la actividad de los usuarios y las API** (responde a "¿quién hizo qué?").
> - **AWS Config** evalúa **la configuración de los recursos** (responde a "¿este recurso está configurado según las reglas?").
> Los tres servicios se complementan para una estrategia de seguridad y gobernanza completa.


---

### AWS CloudTrail

> [!IMPORTANT] CloudTrail **Registra toda la actividad de la cuenta y las llamadas a la API de AWS**. Esencial para auditoría, cumplimiento legal y detección de actividades sospechosas.

---

### AWS Config

> [!IMPORTANT] AWS Config Servicio para **auditar y evaluar configuraciones** de recursos AWS. Monitorea cambios de configuración y evalúa si cumplen con las políticas definidas.

---

### AWS IAM Access Analyzer

> [!IMPORTANT] IAM Access Analyzer Analiza si hay **recursos expuestos públicamente** cuando no deberían estarlo (ej: un bucket S3 que debería ser privado pero está público).

---

### AWS Secrets Manager

> [!IMPORTANT] Secrets Manager Servicio para **rotar y proteger contraseñas de bases de datos y credenciales** de forma automática. Las aplicaciones obtienen las credenciales actualizadas sin intervención manual.

---


> [!IMPORTANT] AWS WAF — Web Application Firewall
> Firewall especializado en **capa de aplicación (HTTP/HTTPS)** que protege aplicaciones web filtrando peticiones maliciosas antes de que lleguen al servidor.
>
> **Qué puede bloquear WAF:**
> - Inyecciones SQL (SQL Injection)
> - Cross-Site Scripting (XSS)
> - Peticiones de IPs o países bloqueados
> - Patrones de tráfico anómalos (bots, scrapers)
>
> **Dónde se despliega:** delante de CloudFront, un Application Load Balancer o API Gateway.

> [!TIP] Shield vs WAF — diferencia clave
> - **AWS Shield** → protege contra ataques **DDoS** (volumétricos, capas 3 y 4, saturación de red)
> - **AWS WAF** → protege contra ataques a la **aplicación web** (capa 7: SQL injection, XSS, bots)
> - En ataques DDoS a nivel de red → **Shield**. En peticiones HTTP maliciosas → **WAF**.



### Seguridad de Datos

|Necesidad|Servicio / Acción|
|---|---|
|Datos **en tránsito**|**HTTPS/TLS** — protocolos cifrados|
|Datos **en reposo**|**Cifrado activado por el cliente** (S3, EBS, RDS)|
|Proteger contraseñas|**AWS Secrets Manager**|
|Crear copias seguras|**AWS Backup**|

> [!WARNING] La nube NO es segura por defecto Es un mito que la nube sea segura automáticamente. El **cliente debe activar el cifrado**, configurar los grupos de seguridad y gestionar los permisos IAM correctamente.

---

### AWS Shield y GuardDuty

|Servicio|Función|
|---|---|
|**AWS Shield**|Protección ante ataques DDoS|
|**Amazon GuardDuty**|Detección de amenazas e intrusiones mediante ML|
|**Amazon Macie**|Descubre datos sensibles almacenados en S3|
|**Amazon Inspector**|Evalúa vulnerabilidades en instancias EC2|

---

## Bloque 10 — Gestión de Costes en AWS

### Herramientas de Gestión de Costes

|Herramienta|Función|
|---|---|
|**AWS Cost Explorer**|Visualizar y analizar tendencias históricas de coste (últimos 3 meses, por servicio, región...)|
|**AWS Budgets**|**Definir límites de gasto y recibir alertas** (al 80% y 100% del presupuesto)|
|**Panel de Facturación**|Muestra servicios con **mayor gasto del mes actual**|
|**Facturación Consolidada**|**Unifica el pago de varias cuentas** en una sola (organizaciones)|
|**AWS Cost Anomaly Detection**|**IA para detectar picos de gasto inesperados**|
|**SSM Automation**|Herramienta para **automatizar tareas de ahorro** (apagar instancias fuera de horario, etc.)|

> [!WARNING] Mito sobre AWS Budgets **AWS Budgets NO detiene los servicios** al superar el presupuesto. Solo envía alertas. El cliente debe tomar acciones manualmente o configurar automatizaciones para detener recursos.

> [!TIP] Herramientas de coste en el examen
> 
> - "Visualizar costes últimos 3 meses" → **AWS Cost Explorer**
> - "Recibir alertas de gasto" → **AWS Budgets**
> - "Detectar picos inesperados con IA" → **AWS Cost Anomaly Detection**
> - "Ver servicios con mayor gasto del mes" → **Panel de Facturación**

> [!IMPORTANT] ¿Qué es un Tag (etiqueta) en AWS?
> Un tag es un **par clave-valor** que se puede asignar a casi cualquier recurso de AWS (instancias EC2, buckets S3, bases de datos RDS, etc.).
>
> **Formato:** `Clave: Valor` → Ejemplo: `Proyecto: WebApp`, `Entorno: Producción`, `Departamento: Marketing`
>
> **Para qué sirven los tags:**
>
> | Uso | Ejemplo |
> |---|---|
> | **Filtrar costes** | Ver cuánto gasta el proyecto "WebApp" en el mes |
> | **Organizar recursos** | Agrupar todos los recursos de un entorno (producción vs dev) |
> | **Automatización** | Scripts que actúan sobre recursos con un tag concreto |
> | **Control de acceso** | Políticas IAM que permiten acciones solo sobre recursos con cierto tag |
> | **Búsqueda** | Encontrar rápidamente recursos entre cientos de servicios |

> [!TIP] Tags en el examen
> Si la pregunta habla de "organizar recursos por proyecto", "filtrar costes por departamento" o "identificar a qué entorno pertenece un recurso" → la respuesta es **usar tags (etiquetas clave-valor)**.
> Sin tags bien definidos, es imposible saber qué parte de la factura corresponde a cada equipo o proyecto.


### Estrategias de Ahorro

**Acciones para evitar sobrecostes:**

- **Apagar recursos inactivos** y revisar semanalmente
- Usar **etiquetas (tags)** para filtrar costes por proyecto o departamento
- Usar instancias **Spot** para procesos tolerantes a interrupciones
- Aplicar **Lifecycle Policies** en S3 (mover datos a clases más baratas)
- Usar instancias **Reservadas** para cargas predecibles

---

## Bloque 11 — Arquitecturas Modernas

### Microservicios vs Monolito

> [!IMPORTANT] Aplicación Monolítica Un sistema donde **todo el código vive en un bloque único**. Cuando la aplicación crece, **se convierte en un cuello de botella difícil de mantener**: si una parte falla, puede fallar todo; un cambio pequeño requiere redesplegar todo.

> [!IMPORTANT] Microservicios Arquitectura donde la aplicación se divide en **servicios independientes, especializados y desplegados por separado**. Cada microservicio:
> 
> - Tiene **su propia base de datos**
> - Se **despliega de forma independiente**
> - Si falla uno, los demás **siguen operativos** (mayor resiliencia)
> - Permite **escalar módulos concretos** según la demanda

**Ventaja principal de microservicios:**

> **Independencia, especialización y despliegue modular**. Aceleran el desarrollo y despliegue de nuevas funcionalidades.

---

### El Stack Serverless Base

> [!IMPORTANT] Stack Serverless típico en AWS
> 
> ```
> API Gateway → Lambda → DynamoDB → S3
> ```
> 
> - **API Gateway**: gestiona los endpoints de la API
> - **Lambda**: ejecuta la lógica de negocio
> - **DynamoDB**: base de datos NoSQL
> - **S3**: almacenamiento de archivos

---

### Amazon API Gateway

> [!IMPORTANT] API Gateway Servicio que **gestiona los endpoints de una API moderna**. Actúa como puerta de entrada para las peticiones HTTP, enrutándolas hacia funciones Lambda u otros servicios.

---

### Arquitecturas Distribuidas en AWS

> [!IMPORTANT] Base de arquitecturas distribuidas La combinación de **Route 53 + balanceadores ELB** forma la base de las arquitecturas distribuidas en AWS, permitiendo alta disponibilidad y distribución global del tráfico.

---

### Backup y Archivado

> [!IMPORTANT] Diferencia Backup vs Archivado
> 
> ||Backup|Archivado|
> |---|---|---|
> |**Propósito**|Recuperación rápida ante fallos|Almacenamiento a largo plazo|
> |**Frecuencia de acceso**|Frecuente (para restaurar)|Rarísima|
> |**Coste**|Mayor|**Mucho menor**|
> |**Servicio AWS**|AWS Backup / EBS Snapshots|S3 Glacier / Deep Archive|

**Buen plan de backup:**

> **Automatización + versiones + ubicaciones alternativas**. No depender de copias manuales.

**AWS Backup:**

> Herramienta que **automatiza las copias** de seguridad de EC2, EBS y RDS de forma centralizada.

---

### AWS Storage Gateway

> [!IMPORTANT] Storage Gateway Servicio que **conecta almacenamiento local (on-premise) con la nube**. Permite a organizaciones con hardware local usar AWS como extensión de su almacenamiento.

> [!IMPORTANT] AWS Organizations — Gestión centralizada de múltiples cuentas
> Servicio que permite **gestionar varias cuentas AWS desde una cuenta principal (management account)**. Es la base de las arquitecturas empresariales en AWS.
>
> **Funcionalidades clave:**
> - **Facturación consolidada**: unifica el pago de todas las cuentas en una sola factura
> - **SCP (Service Control Policies)**: políticas que limitan qué servicios o acciones pueden usarse en cuentas hijas, aunque tengan permisos IAM
> - **Estructura jerárquica**: las cuentas se agrupan en **Unidades Organizativas (OU)**
>
> **Ejemplo de uso:** una empresa con cuentas separadas para Producción, Desarrollo y QA usa Organizations para centralizar la facturación y aplicar restricciones de seguridad globales.

> [!TIP] Organizations en el examen
> - "Gestionar múltiples cuentas AWS de forma centralizada" → **AWS Organizations**
> - "Unificar el pago de varias cuentas en una factura" → **Facturación Consolidada** (función de Organizations)
> - Las SCP se aplican a cuentas enteras y **prevalecen sobre los permisos IAM individuales*

## Bloque 12 — Well-Architected Framework y Buenas Prácticas

### Los 6 Pilares del Well-Architected Framework

> [!IMPORTANT] AWS Well-Architected Framework Una **guía de mejores prácticas para evaluar y diseñar arquitecturas** en la nube. Se compone de **6 pilares**:

|Pilar|¿Qué evalúa?|
|---|---|
|**Excelencia Operativa**|Mejorar procesos y **responder a eventos automáticamente**|
|**Seguridad**|Proteger datos, sistemas e identidades|
|**Fiabilidad**|Capacidad del sistema de **recuperarse de fallos**|
|**Eficiencia en el Rendimiento**|Usar los recursos de forma eficiente|
|**Optimización de Costes**|Análisis de uso para **aprovechar bien los costes**|
|**Sostenibilidad**|Minimizar el impacto ambiental|

> [!TIP] Qué pilar corresponde a cada pregunta
> 
> - "Escalado en EC2" → **Eficiencia en el Rendimiento** (CloudWatch + Auto Scaling)
> - "Recuperarse de fallos" → **Fiabilidad**
> - "Procesos automáticos ante eventos" → **Excelencia Operativa**
> - "Análisis de uso de costes" → **Optimización de Costes**

---

### Diseño de Redes — Resumen de Buenas Prácticas

```
INTERNET
    │
Internet Gateway (IGW)
    │
┌───────────────────────────────┐
│              VPC               │
│  ┌─────────────────────────┐  │
│  │     Subred PÚBLICA      │  │
│  │  Balanceador (ELB)      │  │
│  │  NAT Gateway            │  │
│  └─────────────────────────┘  │
│  ┌─────────────────────────┐  │
│  │     Subred PRIVADA      │  │
│  │  Instancias EC2         │  │
│  │  Bases de datos (RDS)   │  │
│  └─────────────────────────┘  │
└───────────────────────────────┘
```

**Reglas de oro del diseño de VPC:**

1. Recursos críticos (BD) → siempre en **subred privada**
2. Recursos públicos (web, balanceador) → **subred pública**
3. Para que una subred privada acceda a Internet → **NAT Gateway en subred pública**
4. Múltiples AZs → mayor **resiliencia**

### Infraestructura como Código (IaC) — AWS CloudFormation

> [!IMPORTANT] ¿Qué es AWS CloudFormation?
> Servicio que permite crear y gestionar **infraestructura como código (IaC)**: defines todos tus recursos AWS (instancias, redes, bases de datos, permisos) en un archivo de plantilla (**YAML o JSON**) y CloudFormation los despliega y gestiona automáticamente.
>
> **Beneficios clave:**
> - **Reproducibilidad**: el mismo entorno se puede desplegar en cualquier región o cuenta
> - **Control de versiones**: las plantillas se guardan en Git como cualquier código
> - **Automatización**: elimina la configuración manual y los errores humanos
> - **Rollback automático**: si algo falla durante el despliegue, CloudFormation deshace los cambios
>
> **Concepto clave: Stack**
> Un **stack** es el conjunto de recursos que CloudFormation crea y gestiona a partir de una plantilla. Eliminar el stack elimina todos sus recursos.

> [!TIP] CloudFormation en el examen
> - "Infraestructura como código" → **CloudFormation**
> - "Desplegar entornos repetibles desde una plantilla" → **CloudFormation**
> - No confundir con **AWS SAM** (que es CloudFormation especializado en aplicaciones serverless) ni con **AWS CDK** (que permite escribir IaC en Python/TypeScript en lugar de YAML)


## 🎯 Resumen de Conceptos Trampa para el Examen

> [!WARNING] Los errores más frecuentes — estudia esta tabla con atención

|Pregunta trampa|Opción incorrecta frecuente|Respuesta correcta|
|---|---|---|
|¿Qué define el SO inicial de EC2?|"Snapshot" / "Par de claves"|**AMI**|
|¿Qué tipo de almacenamiento es EBS?|"Objetos" / "Archivos"|**Bloque**|
|¿Qué tipo de almacenamiento es S3?|"Bloque" / "Sistema de archivos"|**Objetos**|
|¿Instancia para desarrollo ligero?|"P3" / "X1"|**T3**|
|¿Instancia para memoria intensiva?|"C5" / "T3"|**R5**|
|¿Instancia para cómputo intensivo?|"R6" / "T4"|**C5 / C6**|
|¿Instancia que puede interrumpirse?|"Reservada" / "Dedicada"|**Spot**|
|¿Datos del Instance Store al detener?|"Se migran" / "Se mantienen"|**Se borran**|
|¿S3 para acceso impredecible automático?|"Standard-IA" / "Glacier"|**S3 Intelligent-Tiering**|
|¿S3 solo una zona de disponibilidad?|"Standard-IA" / "Glacier"|**S3 One Zone-IA**|
|¿S3 más barato de toda la nube?|"S3 Glacier"|**S3 Glacier Deep Archive**|
|¿Tamaño máximo objeto S3?|"5 GB" / "50 GB"|**5 TB**|
|¿Tamaño máximo volumen EBS?|"1 TB" / "10 TB"|**16 TB**|
|¿Dónde se guardan snapshots de EBS?|"EFS" / "DynamoDB"|**S3**|
|¿EFS vs EBS — diferencia clave?|"EFS es más barato"|**EFS accedido por varios servidores simultáneamente**|
|¿Ejecutar contenedores sin servidores?|"EKS" / "ECS"|**AWS Fargate**|
|¿ECS vs EKS?|"ECS es Kubernetes"|**ECS = nativo AWS; EKS = Kubernetes gestionado**|
|¿Registro de imágenes de contenedores?|"ECS" / "EKS"|**ECR**|
|¿Trigger de Lambda?|"Compra instancia reservada"|**Subida de archivo a S3**|
|¿Qué significa serverless?|"Servidores eliminados físicamente"|**Abstracción: el cliente no los gestiona**|
|¿AWS Budgets detiene servicios?|Sí (muchos lo creen)|**NO, solo envía alertas**|
|¿RDS o DynamoDB para ERP?|"DynamoDB"|**RDS (relaciones complejas, ACID)**|
|¿DynamoDB o RDS para likes/juegos?|"RDS"|**DynamoDB (tiempo real, NoSQL)**|
|¿Qué hace Amazon DAX?|"Cifra datos RDS"|**Caché en memoria para DynamoDB**|
|¿Datos EBS si se detiene la instancia?|"Se borran"|**Persisten (por defecto)**|
|¿Para qué sirve CloudTrail?|"Monitorizar métricas"|**Registrar llamadas a la API / actividad de cuenta**|
|¿Para qué sirve CloudWatch?|"Registrar actividad API"|**Monitorización y observabilidad**|
|¿Para qué sirve AWS Config?|"Monitorizar métricas de CPU"|**Auditar y evaluar configuraciones**|
|¿Qué hace Route 53 Latency Routing?|"Pruebas A/B"|**Dirigir a región con menor latencia**|
|¿Qué hace Route 53 Weighted?|"Failover si falla"|**Pruebas A/B (dividir tráfico por %)**|
|¿Qué hace Route 53 Failover?|"Latencia baja"|**Redirigir a backup si el principal falla**|
|¿Subredes dentro de una VPC?|"Rangos independientes"|**Divisiones del rango de la VPC (no se superponen)**|
|¿Para conectar VPC a Internet?|"Direct Connect" / "Política IAM"|**Internet Gateway (IGW)**|
|¿Para que subred privada salga a Internet?|"IGW en subred privada"|**NAT Gateway en subred pública**|
|¿IPs disponibles en /24?|"256"|**251** (AWS reserva 5)|
|¿Quién parchea SO en EC2?|"AWS"|**El cliente** (EC2 es IaaS)|
|¿Quién parchea SO en RDS?|"El cliente"|**AWS** (RDS es gestionado)|
|¿Jerarquía AWS de mayor a menor?|"AZ → Región → Edge"|**Región → AZ → Edge Location**|
|¿Qué son las Edge Locations?|"Backup de regiones"|**Puntos de caché para reducir latencia**|
|¿Multi-AZ protege de qué?|"Desastres regionales"|**Fallos de una sola AZ**|
|¿Multi-Región protege de qué?|"Fallos de una AZ"|**Desastres regionales completos**|
|¿RTO o RPO = tiempo máximo recuperación?|"RPO"|**RTO**|
|¿RTO o RPO = pérdida máxima de datos?|"RTO"|**RPO**|
|¿Pilares del Well-Architected Framework?|"3" / "10"|**6 pilares**|

---

## 🔑 Glosario de Servicios AWS

|Servicio|Categoría|Función en una línea|
|---|---|---|
|**EC2**|Cómputo|Servidores virtuales bajo demanda|
|**Lambda**|Serverless|Ejecuta código por eventos sin gestionar servidores|
|**ECS**|Contenedores|Orquestación de contenedores nativa AWS|
|**EKS**|Contenedores|Kubernetes gestionado|
|**ECR**|Contenedores|Registro de imágenes de contenedores|
|**Fargate**|Serverless|Contenedores sin gestionar servidores|
|**EBS**|Almacenamiento|Disco duro virtual para EC2 (bloque)|
|**S3**|Almacenamiento|Almacenamiento de objetos masivo y duradero|
|**EFS**|Almacenamiento|Sistema de archivos compartido (múltiples instancias)|
|**Glacier**|Almacenamiento|Archivado de larga duración a bajo coste|
|**RDS**|Bases de datos|BD relacional gestionada (MySQL, PostgreSQL...)|
|**Aurora**|Bases de datos|BD relacional nativa AWS (compatible MySQL/PostgreSQL)|
|**DynamoDB**|Bases de datos|BD NoSQL serverless clave-valor|
|**DAX**|Bases de datos|Caché en memoria para DynamoDB|
|**ElastiCache**|Bases de datos|Caché en memoria (Redis/Memcached)|
|**VPC**|Redes|Red virtual privada en AWS|
|**Route 53**|Redes|DNS + control de tráfico global|
|**CloudFront**|Redes|CDN — entrega de contenido con baja latencia|
|**ELB**|Redes|Balanceador de carga elástico|
|**NAT Gateway**|Redes|Salida a Internet para subredes privadas|
|**CloudWatch**|Monitorización|Métricas, logs y alarmas|
|**CloudTrail**|Auditoría|Registra llamadas a la API y actividad|
|**AWS Config**|Auditoría|Audita configuraciones de recursos|
|**IAM**|Seguridad|Gestión de identidades y permisos|
|**AWS STS**|Seguridad|Credenciales temporales|
|**Secrets Manager**|Seguridad|Gestión y rotación de contraseñas/secretos|
|**IAM Access Analyzer**|Seguridad|Detecta recursos expuestos públicamente|
|**GuardDuty**|Seguridad|Detección de amenazas con ML|
|**Shield**|Seguridad|Protección ante DDoS|
|**Macie**|Seguridad|Descubre datos sensibles en S3|
|**Inspector**|Seguridad|Evalúa vulnerabilidades en EC2|
|**Cost Explorer**|Costes|Análisis de tendencias históricas de coste|
|**Budgets**|Costes|Alertas de límites de gasto|
|**SNS**|Mensajería|Notificaciones (email, SMS, Lambda)|
|**API Gateway**|APIs|Gestiona endpoints de APIs modernas|
|**AWS Backup**|Backup|Automatiza copias de EC2, EBS y RDS|
|**Storage Gateway**|Híbrido|Conecta almacenamiento local con la nube|
|**SAM**|Serverless|Despliega aplicaciones serverless desde CLI|
|**Auto Scaling**|Escalado|Ajusta número de instancias según métricas|
|**WSUS**|(on-premise)|Parches de Windows centralizados|

---

_Apuntes generados para 2º SMR — Módulo: Nube (AWS)_ _Basados en el test de repaso del módulo — Optimizados para Obsidian_


/16 es la ms pequeña y mas grande /28 mascaras de subred

tipos de balanceador de carga  capa y corta deficinicion
Nota: Recordad máscara /16 a /28

EN subredes /24 nº de ips? 256-2(red y broadcast) -3AWS = 251 disponibles
