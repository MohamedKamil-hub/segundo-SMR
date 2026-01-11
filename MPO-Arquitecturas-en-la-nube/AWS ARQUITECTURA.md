#  [Módulo 2: Presentación de Cloud Architecting](https://awsacademy.instructure.com/courses/145509/modules/1877558)

Arquitectura en la nube 
es la practica de aplicar caracteristicas de la nube a una solucion que usa servicios y caracteristicas de nube para satisfacer las necesidades tecnics de una organizacion.
es aplicar caracteristicas de la nube a una solucion que usa servicios y caracteristicas de nube para satisfacer las necesidades de una organizacion.

El arquitecto de la nube diseña una solución que es como un plano para un edificio.
![[Pasted image 20251125143202.png]]

![[Pasted image 20251125150316.png]]

**Pilar excelencia operativa**
capacidad de ejecutar sistemas y obtener información sobre sus operaciones para entregar valor empresarial, además de mejorar continuamente los procesos y procedimientos de apoyo.
reducir defectos y corregirlos de manera rapida y segura.
hacer posible la observacion con registro, la instrumentacion y las metricas para obtener info sobre lo que ocurre dentro de la arquitectura.
En AWS se puede ver como codigo toda la carga de trabajo y se puede definir y actualizar todas las partes de dicha carga de trabajo con codigo.

**Pilar de seguridad**
capacidad de proteger la info, los sistemas y los activos al tiempo que se obtienen valor empresarial con evaluaciones de riesgo y estrategias de mitigación.
Esto es mas solido si se usa una solida base de datos, se mantiene trazabilidad
se aplica seguridad en todas las capas, se automatiza la practicas recomendadas de seguridad y se protegen tanto los datos en transito como en reposo

**Pilar de fiabilidad**
capacidad de un sistema para recuperarse de errores o interrupciones y adquirir de manera dinámica recursos de computo para seguir satisfaciendo la demanda.
Además de la capacidad de mitigar las interrupciones como errores de configuración o problemas de red.
sirve para tener una arquitectura diseñada teniendo en cuenta la alta disponibilidad la tolerancia a errores y la redundancia general.

**Pilar de eficiencia del rendimiento**
mediante el uso eficiente de los recursos de computación y mantener el rendimiento a medida que cambie la demanda.
si es difícil implementar una tecnología por uno mismo se debe de considerar recurrir a un proveedor, quien se hace cargo de la complejidad y el conocimiento.
la compatibilidad mecánica es cuando utiliza una herramienta o un sistema con conocimientos sobre como funciona mejor.

**Pilar de optimización de costos**
adopte el modelo de consumo que mejor se le adapte , en el que pagues solo por los recursos usados. 

**Pilar de sostenibilidad**
capacidad para crear arquitecturas que maximicen la eficiencia y reduzcan el desperdicio.
comprender el impacto de sus cargas de trabajo y trabajar para reducir el impacto posterior.
es un esfuerzo continuo centrado en la reduccion y la eficacia energetica en todos los componentes de una carga de trabajo , sacando maximo beneficio de los recursos aprovisionados y minimizar los recursos totales requeridos, que pueden incluir un lenguage de programacion inteligente , uso de algoritmos modernos y almacenamiento eficiente de datos.
tambien puede ser la implementacion de una infraestructura de computo eficiente y de tamaño adecuado y minimizar requisitos de hardware para el usuario.





HERRAMIENTA
AWS Well-Architected  ![[Pasted image 20251125155117.png]]

permite ver el estado de las cargas de trabajo y comparalas con las recomendaciones de AWS.
permite acceder a los conocimietnos y a las practicas recomendadas de AWS.
proporciona un plan de accion  para crear mejores cargas de trabbajo.
permite la revision y medidas de sus arquitecturas en la nube.
es una herramienta de autoservicio, que da acceso bajo demanda a las practicas recomendadas de AWS, permite revisar el estado de las cargas de trabajo y compararlas con las practicas recomendadas de AWS , dando acceso a las practicas t conocimientos usados por los arquitectos de AWS.
disponible n la consola de Administracion de AWS WA,
permite medir y revisar las arquitecturas en la nube ya que permite recopilar datos y obtener recomendaciones sobre minimizacion de errores del sistemas y costos operativos.
profundicacion en procesos eempresariales y de infraestructura.
guiar sobre practicas recomendadas.

- Proporciona un enfoque coherente para evaluar las arquitecturas de nube y orientar la implementacion de diseños-
- AWS WA se organiza en 6 pilares.
- cada pilar contiene preguntas para saber si una arquitectura especifica se alinea bien con las practicas recomendadas.
- ayuda a revisar el estado de las cargas de trabajo y a compararlas con las practicas  recomendadas de arquitectura AWS .

**PRACTICAS RECOMENDADAS AWS**
- Al diseñar una solucion evalue las ventajas y desventajas  para escoger bien. base decisiones de diseño en datos empiricos.
- Asegurese  de que la arquitectura pueda manejar cambios en demanda, que los usuarios no experimenten interrupcion de servicio, si la capacidad maxima esta apunto de ser alcanzada se envia una alerta a EC2 autoscaling y  escala horizontalmente (añadir una nueva instancia.
- automatice el aprovisionamiento , la terminacion y la configuracion de los recursos de modo que  cuando el servidor de aplicaciones falla, Amazon CloudWatch lo detecta  y notifica a un administrador  y registra automaticamente la accion en una solucion de administracion de cambios., EC2 autoscaling se inicia y configura un server identico,  
- uso de IaC para aprovisionar la infraestructura informatica mediante codigo en lugar de manualmente. esto hace que se implemente rapidamente en entonos duplicados mediante plantillas. reduce errores , y propaga cambios con  coherencia.
- tratamiento de recursos como desechables, automatice implementacion de recursos nuevos con configuraciones identicas, detenga aquellos no utilizados , pruebe actualizaciones en recursos nuevoos y reeplace los viejos por los actualizados. considera la infraestructura como software en lugar de como hardware.
- diseñe arquitecturas con componentes independientes, en lugar de servidores web estrechamente acoplados a los servidores de aplicaciones usa Amazon Elastic Load Balancing (ELB) como intermediario, que enrute  las solicitudes entre servidores web y de aplicaciones, y actue como balanceador de carga
- diseña servicios no servidores, si corresponde use contenedores o servicios serverless, esto ahorra aprovisionar configurar y administrar una instancia EC2
- Eleccion de base de datos adecuada, adecue la tecnologia a la carga de trabajo no al revers, ten en  cuenta durabilidad, latencia, tamaño, permisos, usuarios, consultas  etc...
- evita puntos unicos de falla, supon que todo puede fallar, siempre tenr un recurso secundario en espera
- optimiza costos, eligiendo tamaño y tipo adecuado de recursos, supervisando las metricas requeridas, desactivando los recursos  no usados,... aprovisiona solo los recursos que  necesite y deten servicios no usados.
- uso de almacenamiento en cache , minimice las operaciones de recuperacion de datos redundantes , mejorando rendimiento y coste, el cache aumenta el rendimiento de la recuperacion de datos ya que no requiere  acceder a la capa de almacenamiento mas lenta
- protege la infraestructra incorporando seguridad en cada capa, utilizando servicios administrados registrando el acceso a recursos aislando partes de la infraestructura, cifrando datos en transito y reposo, aplicando granularidad de control de acceso, con el principio de minimo privilegio, use MFA, automatic las implementaciones para mantener la coherencia de la seguridad.

Cuando diseñe soluciones, evalúe las compensaciones y fundamente sus decisiones en datos empíricos.
Siga estas prácticas recomendadas cuando cree soluciones en AWS:

•Implemente la escalabilidad.
•Automatice su entorno.
•Trate los recursos como desechables.
•Utilice componentes de acoplamiento débil.
•Diseñe servicios, no servidores.
•Elija la solución de base de datos adecuada.
•Evite los puntos únicos de error.
•Optimice el costo.
•Use el almacenamiento en caché.
•Proteja la infraestructura completa.


INFRAESTRUCTURA GLOBAL AWS
Al diseñar arquitecturas se debe considerar en que region implemenatarlas
una region es una ubicacion geografica fisica con 2 o mas zonas de disponibilidad, las zonas de disponibilidad cuentan con 2 o mas centros de datos.

Seleccion de regiones
una region es un area geografica con 2  o mas zonas de disponibilidad, la comunicacion entre regiones  es mediante ISP , tambien estan conectadas a una red  troncal privada , que da menor costo y mayor uniformidad de latenia entre regiones , tu habilitas y controlas la replicacion de datos entre regiones.
las regiones estan aisladas unas de otras para dar mayor tolerancia a errores y estabilidad, cuando almacenas datos en una region los datos no se replican a otras regiones, si el negocio requiriera eso seria su propia responsabilidad.

Seleccion de zonas de disponibilidad
cada zona de disponibilidad se conforma por uno o mas centros de datos, ningun centro de datos puede formar parte de mas de una zona de disponibilidad, estan  diseñadas para aislar errores ya que  cada zona esta alimentada por diferentes redes de servicios publicos, esta interconectado con otras zonas de disponibilidad en una region por medio de enlaces privados de alta velocidad, se recomienda replicacion entre zonas de disponibilidad.


Uso de zonas locales
permiten ejecutar partes de aplicaciones sensibles a la latencia mas cercana a los usuarios finales y los recursos de una zona especifica.
son una extension de una region, ubican servicios de computo, almacenamiento , base de datos y otros servicios seleccionados mas cerca de la poblacion, donde no hay una region en la actualidad, 
permite ejecutar partes sensibles a la latencia mas cercana  de los usuarios y los recursos.
se puede usar para ofrecer latencia  muy baja,
cada zona local es una extension de una region ose son administrados por AWS

Rol de los centros de datos
en ellos se almacenan y se procesan los datos, alojan miles de servidores, todos los centros de datos se encuentran en linea y a disposicion de los clientes.
tu no especificas el centro de datos que quieras usar

PoP de AWS
son 400 ubicaciones perifericas y 13 caches regionales de nivel intermedio, son el destino final de una solicitud de cloudfront, garantiza que el contenido frecuentemente solicitado se ofrezca rapidamente, 
las caches perifericas regionales acercan mas contenido a los clientes incluso si no es popular, son el predeterminado por cloudfront, se usa cuando hay contenido que no es tan popular como para estar en una ubicacion periferica,


Resumen

La infraestructura global de AWS está compuesta por regiones,zonas de disponibilidad y ubicaciones periféricas

La elección de una región suele basarse en los requisitos de cumplimiento o en reducir la latencia

Cada zona de disponibilidad se encuentra separada de forma física de otras zonas de disponibilidad y tiene alimentación, redes y conectividad redundantes.

Las ubicaciones periféricas y las caché de regiones periféricas mejoran el rendimiento al almacenar en caché el contenido más cerca de los usuarios.

# Modulo 3 proteccion del acceso
Modelo de responsabilidad compartida AWS
**CLIENTE:** responsabilidad EN la nube, osea sus  datos, plataforma, aplicaciones, administracion de identidades y accesos configuracion del SO , la red y el firewall. cifrado integridad y autenticacion de los datos del lado del cliente. cifrado del servidor del sistema de archivos y datos. proteccion del trafico de redes, incluyendo cifrado, integridad e identidad.

**AWS:** responsable de la seguridad DE la nube , osea servicios basicos de AWS para computacion, almacenamiento, bases de dato y redes y la infraestructura global de AWS(regiones, zonas de disponibilidad y ubicaciones perifericas)

la **seguridad y el cumplimiento** son responsabilidades compartidas entre AWS y nuestros clientes.
AWS  opera, administra y controla la seguridad DE la nube, esta responsabilidad incluye asegurar los componentes, desde el SO hasta el hardware. es responsable de proteger la infraestructura global que ejecuta todos los servicios que ofrece AWS

el CLIENTE tiene la responsabilidad y la administracion EN la nube, proteger el SO de las instancias EC2 proteger las apps que se lanzan en grupos de recursos,
tambien debe de seleccionar y gestionar la configuracion de los grupos de seguridad, firewalls y las redes, ademas de administrar sus cuentas , datos y opciones de cifrado

**SEGURIDAD**
es uno de los 6 pilares de AWS WA
PRINCIPIOS:
- implementar una solida base de identidad, principio de minimo privilegio y aplicar separacion de obligaciones con autorizacion justa  para el rol requerido, centralizar administracion de identidades y eliminar credenciales estaticas de largo plazo.
- proteger controlar, cifrar y tokenizar datos en transito y reposo
- aplicar seguridad en todas las capas varios controles de seguridad en cada capa
- mantener a las personas lejos de los datos, reduciendo el riesgo de mala gestion o modificacion.
- mantener trazabilidad, recopila metricas, registros y crear alertas
- preparacion ante incidentes, dispon de procesos y politicas de investigacion y administracion de incidentes, ejecute simulaciones de incidentes.
- automatizar practicas recomendadas de seguridad

**permisos de usuario para acceder a los recursos**
un usuario solo se pueda leer Bucket de 53 2 , tenga cceso totoal a Bucket 53 1 y tenga denegacion total a una tabla de dynamo db.

**principio de minimo privilegio**
conceder solo los permisos necesario para las tareas especificas del usuario.
comenzar con 0 permisos e ir concediendolos segun sea necesario.
determina que deben de hacer los usuarios y elabore politicas que permitan realizar solo dichas tareas

**cifrado**
datos en transito: 
datos que se mueven activamente de un sitio a otro, para asegurarlos se deben de cifrar mientras se desplazan

datos en reposo:
proteger datos que se almacenan en cualquier lugar
del cliente el cliente cifra los datos antes de enviarlos a AWS
del servidor datos se envian no cifrados  y els ervidor los cifra al almacenarlos y descifra cuando se le solicita


**Autenticacion y Autorizacion**
Autenticacion
saber quien solicita acceso, establece la identidad del solicitante

Autorizacion
determina si permitir o denegar la solicitud.


**AWS manejo de identidad y acceso (IAM)**
- controla de forma segura el acceso individual y grupal a sus recursos de AWS
- integracion con otros servicios de AWS
- admite  administracion de identidad federada
- admite autenticacion multifactor y permisos granulares

terminologia IAM
**recurso**  usuario rol grupo politica o proveedor almacenado en IAM
**entidad** objetos de recursos de IAM que AWS usa para la autenticacion (usuarios y roles)
**identidad** objetos de recursos IAM que se pueden autorizar en las politicas parar que hagan acciones (usuario, grupo o rol)
**entidad principal** persona o app que puede iniciar sesion y hacer solicitudes a AWS

**usar IAM para controlar el acceso a recursos de AWS mediante:**

**usuario** persona o aplicacion que puede autenticarse con una cuenta de AWS, recibe un conjunto de credenciales.
**grupo** coleccion de usuarios a los que se les da una autorizacion identica.
**Rol** identidad que se usa para dar un conjunto temporal de permisos para realizar solicitudes de servicios AWS
**politica** documento que define a que recursos se puede acceder y el nivel de acceso de cada uno.

**Credenciales de IAM para la autenticacion**
autenticarse desde consola requiere usuario y contraseña
mediante la CLI o SDK se requiere clave de acceso AWS(id de clave de acceso y clave de acceso)
realizar llamadas programadas a AWS requiere identificador de clave de acceso de AWS


**Practicas recomendadas**
seguir principio de minimo privilegio
habilitar MFA
exigir a los usuarios humanos que accedan a AWS con credenciales temporales
rotar claves de acceso
usar contraseñas seguras y complejas
proteger credenciales locales guardandolas en un administrador de contraseñas
usar AWS organizations para administracion
habilitar AWS cloudtrail  para tener un registro de acciones que se realicen
proteger al usuario raiz, no lo uses a menos que sea necesario
![[Pasted image 20251129171011.png]]


**Practicas recomendadas usuarios y grupos de IAM**
adjuntar politicas a grupos y luego a esos grupos asignarles usuarios, ya que el usuario hereda los permisos de su grupo pero tambien se le pueden añadir mas permisos de manera adicional.

**Rol de IAM**
proporciona credenciales de seguridad temporales, no esta asociado unicamente con una persona sino que puede ser  asumido por una persona, aplicacion o servicio, es communmente usado para delegar el acceso.

**politicas y permisos de IAM**
una politica define los permisos para la identidad o el recurso al que esta asociado, permite ajustar los permisos que se conceden a las entidades principales. esta en formato JSON
tienen dos tipos
politicas basadas en identidad adjuntadas a una identidad
politicas basadas en recursos adjutadas a un recurso.

**Determinacion de los permisos en el momento de la solicitud**
cuando IAM analiza una solicitud primero busca una politica de denegacion explicita aplicable, si no existe, comprueba si hay alguna politica de autorizacion aplicable, si ninguna de las dos existe, se deniega de manera predeterminada.
solo se puede hacer una accion que no este denegada explicitamente y se permita explicitamente.


**Estructura del documento de politica de IAM**
esta en JSON
**version** del idioma de la politica a usar
**enunciado**,define lo que se permite o niega en funcion de las condiciones
**efecto**, puede ser permitir o negar
entidad principal, si la politica esta basada en recursos se debe indicar la cuenta, usuario, rol o usuario federado al que se va a denegar o admitir el acceso. si esta basada en identidad la entidad principal esra implicita.
**accion** accion que la politica permite o deniega
**recurso**
**condicion**(opcional) circunstancias en las que la politica otorga permisos

# Módulo 4: incorporación de una capa de almacenamiento con Amazon S3

## Definicion de S3

tipos de almacenamiento:
- **en bloque,** los datos se almacenan en un dispositivo en bloques de tamaño fijo, cada bloque se puede almacenar en distintos SO.
- **de archivos,** los datos se almacenan en una estructura jerárquica.
- **de objetos,** los datos se almacenan como objetos en función de los atributos y metadatos, al igual que en el almacenamiento de bloques cuando se hacen cambios en el archivo se actualiza todo el objeto de archivo. 


**Amazon S3**
almacena cantidades casi ilimitadas de datos no estructurados.
almacena archivos de datos como objetos en bucket que tu defines con un nombre unico a nivel mundial.
cada unico objeto tiene un tamaño máximo de 5 TB,  una URL unica a nivel mundial, ademas de una clave, ID, valor, metadatos y sobrecursos.


**Componentes de Amazon S3**

**Bucket** contenedor de objetos almacenados en S3, organizan el espacio de nombres de S3 e identifican la cuenta responsable del alamcenamiento y transferencia de datos, tambien tienen un papel en el control de acceso.

**Objeto** entidad que se almacena en S3 , puede ser cualquier tipo de archivo incluyendo multimedia, un objeto consiste en datos y metadatos de objeto (describen el objeto)

**Clave de objeto** identifica de forma exclusiva el objeto de un bucket., cada bucket es regional, los objetos almacenados en una region nunca la dejaran salvo que se les transfiera de manera especifica. el codigo de region indica la region.


**Beneficios de Amazon S3**
**Durabilidad** la redundancia ayuda a que los datos no se pierdan con 11 nueves 99,999999999% durabilidad
**Disponibilidad** acceso a datos cuando sea necesario, 4 nuves de disponibilidad 99,99%
**Alto rendimiento** realiza miles de transacciones por segundo al cargar y recurperar el almacenamiento, se escala automaticamente.



**Como usan Amazon S3 los clientes**
en picos de demanda, alojar sitios estaticos, analisis financiero, recuperacion de desastres.
Amazon S3 se utiliza con frecuencia para hacer lo siguiente:
- Almacenar y distribuir videos, fotos, archivos de música y otros medios.
- Admitir contenido estático, incluidos archivos HTML, imágenes y videos.
- Almacenar datos para computación y análisis a gran escala.
- Proporcionar una solución de respaldo de datos.

**Almacenamiento de datos en S3**
no hay limite de objetos, para cargarse se necesita permiso de escritura en el bucket.
los objetos se cifran de forma predeterminada durante la carga y se descifran durante la descarga.

**Opciones de carga en S3**
**consola de administración** enfoque basado en un asistente para mover datos hacia o desde AWS. 160 GB y los de abajo son hasta 5TB
**AWS CLI** cargue o descargue desde un símbolo de un terminal o desde la llamada de un script.
**SDK de AWS** utilice los SDK para cargar los objetos mediante programacion
**API de REST de Amazon S3** envie una solicitud PUT para cargar datos en una operacion.


**CARACTERISTICAS DE S3 : Carga multiparte**
permite cargar un unico objeto en partes independientes y en cualquier orden, cuando se cargan todas las partes S3 las monta y crea el objeto.
mejoran el rendimiento, permiten recuperacion rapida ante problemas de red, permite pausar y reanudar cargas de objetos y comenzar una carga antes de saber el tamaño final del objeto.

**S3 Transfer Acceleration**
proporciona transferencias rapidas y seguras a largas distancias, optimiza las velocidades de transferencia a los buckets de S3 mediante ubicaciones perifericas en CloudFront y mejora la velocidad (50-500)% en promedio para la transferencia de objetos grandes entre paises.

**AWS transfer FAMILY**
producto administrado, se usa para transferir archivos al alamcenamiento de S3 o EFS mediante SFTP, SSH, FTP, FTPS AS2.
no necesita modificar aplicaciones ni ejecutar ninguna infraestructura de protocolo de transferencia de archivos, solo paga por uso.


**Clases de almacenamiento de objetos**
**S3 STANDRARD** es de uso general, ofrece baja latencia y alto rendimiento, ofrece minimo entre 3 zonas de disponibilidad.
**S3 STANDARD-IA** Su version de acceso poco frecuente  ofrece todo lo que S3 Standard ofrece pero almacena datos de acceso poco frecuente y es mas caro recuperar datos desde el.
**S3 ONE ZONE** acceso poco frecuente, almacena datos en una sola zona de disponibilidad
**S3 INTELLIGENT-TIERING,** reduce costos de almacenamiento al mover automaticamente los datos al nivel de acceso mas rentable en funcion de la frecuencia de acceso, latencia muy baja y alto rendimiento.
**S3 Glacier Instant Retrieval** ofrece el almacenamiento de menor costo para datos de larga duración a los que se accede poco y necesitan recuperación rapida.  ideal para datos que necesitan acceso inmediato
**S3 Glacier Flexible Retrieval** es para datos que no requieren acceso inmediato, pero que necesitan la flexibilidad de recuperar grandes datos de 1 a 2 veces al año, y se recuperan sin costo alguno.
**Amazon S3 Glacier Deep Archive** es la clase de almacenamiento de menor costo. Admite la retención a largo plazo y la preservación de datos a los que se puede acceder 1 o 2 veces al año. 
**S3 en Outposts** ofrece almacenamiento de objetos a su entorno de AWS Outposts en las instalaciones y utiliza las API y características de S3 disponibles. da una única clase de almacenamiento de Amazon S3, OUTPOSTS, que usa las API de Amazon S3 y está diseñada para almacenar datos de forma duradera y redundante en varios dispositivos y servidores de


![[../../fotos/Pasted image 20251205192856.png]]

**Configuracion del ciclo de vida de S3**
conjunto de reglas que definen acciones que S3 aplica a un grupo de objetos.  2 tipos de acciones:
**acciones de transicion;** definen el momento en el que los objetos pasan a otra clase de almacenamiento.
**acciones de vencimiento** definen el momento en que vencen los objetos, S3 elimina automaticamente los objetos que han vencido.

**Control de versiones de S3**
![[Pasted image 20251205194844.png]]

puede estar activado, desactivado o suspendido

**Resumen del control de versiones en Amazon S3:**

**Subir un objeto (PUT):**  
Al guardar un archivo en un bucket con control de versiones habilitado, S3 no sobrescribe la versión anterior, mantiene la versión original y crea una nueva con un ID único.

**Eliminar sin ID de versión (DELETE):**  
Al eliminar un objeto sin especificar una versión, S3 no lo borra . Solo añade un "marcador de eliminación" que oculta la última versión, pero todas las versiones anteriores se mantienen guardadas y se pueden recuperar.

**Recuperar un objeto (GET):**  
- Al pedir un objeto sin especificar versión, S3 devuelve la última versión activa (no el marcador de eliminación).  
- Si la última versión es un marcador de eliminación, recibirás un error 404 (no encontrado).  
- Puedes recuperar cualquier versión anterior si conoces su ID específico.

**Eliminar permanentemente:**  
Para borrar un objeto de forma irreversible, debes ejecutar DELETE especificando su ID de versión. Solo el propietario del bucket puede hacer esto, y no se añadirá ningún marcador de eliminación.


**Compatibilidad con el uso compartido de recursos entre origenes CORS** 
es una forma para que las apps web del cliente que estan cargadas en un dominio interactuen  con los recursoso de otro dominio, puede crear aplicaciones web completas del lado del cliente con S3 y permitir acceso entre origenes a sus recursos de S3 de manera selectiva.

**Modelo de consistencia de datos de S3**
es consistente en todas las regiones,


El almacenamiento S3 Standard es adecuado para aplicaciones en la nube, sitios web dinámicos, distribución de contenido, aplicaciones para  móviles y de videojuegos y análisis de macrodatos

Configura una política de ciclo de vida de S3 y sus datos se transferirán automáticamente a una clase de almacenamiento distinta sin generar ningún cambio en su aplicación. 

El control de versiones, puede recuperarse de acciones no deseadas del user y errores de la aplicación.

CORS define una forma en la que las aplicaciones web clientes cargadas en un dominio pueden interactuar con los recursos de un dominio distinto.

El modelo de consistencia de datos de Amazon S3 simplifica la migración de cargas de trabajo de análisis en las instalaciones al eliminar la necesidad de hacer cambios para admitir aplicaciones.

**Configuracion de seguridad predeterminada de S3**
los buckets son privados y estan protegidos, con cifrado, el cifrado del servidor con claves de cifrado administradas por S3, 

**cifrado de objetos en S3**
del lado del servidor se cifran los objetos antes de guardarlos en el disco y se descifran al ser descargados
del lado del cliente se cifran los datos y se cargan a S3.

![[Pasted image 20251205201701.png]]


**tres enfoques generales diferentes para configurar el acceso** 
![[Pasted image 20251205201821.png]]
**consideraciones antes de elegir una region**
leyes de privacidad de datos y conformidad normativa, proximidad a los datos, disponibilidad del servicio y las caracteristicas y rentabilidad.


La protección de los datos es una práctica recomendada de

seguridad que Amazon S3 admite mediante estas configuraciones

predeterminadas: cifrado de objetos, privatización de objetos

y bloqueo del acceso público.

•

Puede proteger los datos en Amazon S3 con la limitación del acceso

mediante políticas de IAM y la habilitación del control de versiones.

•

La selección de una arquitectura es una práctica recomendada para

la eficiencia del rendimiento con la cual Amazon S3 es compatible

mediante su capacidad de almacenamiento de cantidades masivas

de datos no estructurados.

•

Amazon S3 incluye opciones que mejoran el rendimiento,

como S3 Transfer

Acceleration

y la carga

multiparte

.

•

La selección de recursos rentables es una práctica recomendada

de optimización de costos que Amazon S3 admite mediante

características como las políticas de ciclo de vida, la organización

inteligente por niveles y el Inventario de Amazon S3.

•

La administración de errores es una práctica recomendada

de fiabilidad para la que se ha diseñado Amazon S3 con sus

características de durabilidad y disponibilidad.

•

Puede utilizar Amazon S3 para respaldar los datos y mejorar

la administración de errores de sus aplicaciones y datos.
# Módulo 5: incorporación de una capa de cómputo con Amazon EC2

#### **Amazon EC2** 
ofrece computo, proporciona maquinas virtuales , puede escalar automaticamente
**virtualizacion**:
una instancia de EC2 es una maquina virtual que se ejecuta en un host fisico
se ejecuta sobre una capa de hipervisor mantenida por AWS.
algunas instancias cuentan con un almacen de instancias, que esta conectado al host de manera fisica y proporciona almacenamiento temporal a nivel de bloque a una instancia

muchas instancias usan EBS para el disco de arranque , EBS proporciona almacenamiento persistente.
las instancias optimizadas para EBS dan un acceso mas rapido a un volumen de EBS

se usa para controlar recursos de computo , optimizar costos  

1. primero se necesita una imagen AMI
2. despues selecciona tipo de instancia
3. si lo vas a usar especifique claves SSH o RDP
4. especifique la ubicacion de la red
5. asigne el grupo de seguridad
6. eleccione la opcion de almacenamiento
7. adjunta un rol IAM a la instancia
8. opcional adjuntar datos de usuario


**imagen de maquina de amazon (AMI)**
Da informacion necesaria para iniciar una instancia:
plantilla para el volumen riz; sistema operativo y lo que tenga instalado
permisos de lanzamiento que controllan quien puede acceder a la AMI
especificar el almacenamiento a adjuntar a la instancia

la AMI da capacidad de repeticion reutilizacion y de recuperacion.
Una AMI se debe de elegir en funcion de la region, el sistema operativo, tipo de al,acenamiento raiz, arquitectura y tipo de virtualizacion.

AMI con respaldo en el almacén de instancias frente a AMI con respaldo en Amazon EBS
![[Pasted image 20251207163020.png]]

**EC2 IMAGE BUILDER**
da una interfaz grafica para producir AMI 
permite crear imagenes con solo los componenetes necesarios, tambien permite validar sus imagenes

**Nombre del tipo de instancia de EC2**
![[Pasted image 20251207164409.png]]


idoneidad de los tipos de instancias para cargas de trabajo

|Tipo de instancia|Ejemplos de cargas de trabajo|Ejemplos de tipos de instancia|
|---|---|---|
|Uso general|• Servidores web o de aplicaciones• Aplicaciones empresariales• Servidores de juegos• Entornos de desarrollo o prueba|M7, Mac, M6, M5, M4, T4, T3, T2|
|Optimizadas para el cómputo|• Procesamiento por lotes• Analítica distribuida• Cómputo de alto rendimiento (HPC)|C7, C6, C5, C4|
|Optimizadas para el almacenamiento|• Bases de datos de alto rendimiento• Análisis en tiempo real• Cargas de trabajo transaccionales|I4, Im4, Is4, I3, D2, D3, H1|
|Optimizadas para la memoria|• Cachés en memoria• Bases de datos de alto rendimiento• Análisis de macrodatos|R7, R6, R5, R4, X2, X1, Z1|
|Computación acelerada|• Inteligencia artificial (IA) y machine learning• HPC|P5, P4, P3, P2, DL1, Trn1, Inf2, Inf1, G5, G4, G3, F1, VT1|
|Optimizadas para HPC|• Cargas de trabajo de aprendizaje profundo• HPC con uso intensivo de cómputo|Hpc7, Hpc6|

empieze con una instancia con especificaciones ligeramente inferiores y escalar segun sea necesario

**AWS compute optimizer**

recomienda una configurcion del tipo y tamaño de instancia y el grupo de escalado automatico.
analiza los patrones de carga de trabajo y hace recomendaciones.
 

**Información general del almacenamiento de Amazon EC2**
![[Pasted image 20251207165833.png]]


**Almacenamiento de instancias**
da almacenamiento no persistente a una instancia, se almacena en el mismo servidor que ejecuta la instancia

#### **Amazon EBS**
Da almacenamiento persistente conectado a la red a una instancia EC2.
se puede adjuntar a cualquier instancia  de la misma zona de disponibilidad.
se puede cifrar y soporta instantaneas almacenadas en S3,
los datos persisten independientemente del estado de la instancia

**tipos de volúmenes con respaldo en Amazon SSD son:**
• SSD de uso general (gp2): predeterminado para las instancias de EC2. son adecuados para  las aplicaciones interactivas de baja latencia y los volúmenes de arranque.
• SSD de IOPS aprovisionadas (io1): la opción de mayor rendimiento.  para bases de datos y aplicaciones críticas y con uso intensivo de E/S, y cargas de trabajo que requieren rendimiento.

**Los volúmenes con respaldo en Amazon HDD son de dos tipos:**
• Disco duro optimizado para el rendimiento (st1): ideal para cargas de trabajo de alto rendimiento y de acceso frecuente con grandes conjuntos de datos y grandes tamaños de E/S.
• Disco duro en frío (sc1): ofrece el costo por GB más bajo de todos. para cargas de trabajo a las que se accede con menos frecuencia con conjuntos de datos grandes y fríos.

**Instancias Optimizadas para EBS**
tienen una conexion de red dedicada entre la instancia y EBS, da  mayor rendimiento
EBS solo deberia de asjuntarse a una instancia a la vez

**Amazon elastic file system EFS**
da almacenamiento en sistemas de archivos para cargas de trabajo basadas en linux.
sistema de archivos elastico administrado que escala automaticamente hacia arriba o abajo.
soporta NFS, monta el sistema de archivos en la instancia EC2, compatible con las AMI basadas en linux.


**Amazon FSx para Windows file server**
da almacenamiento de sistemas de archivos compartidos , administrado para instancias de EC2 windows,
usa NTFS, usa SMB



Las opciones de almacenamiento para las instancias de EC2 incluyen el almacén de instancias, Amazon EBS, Amazon EFS y Amazon FSx para Windows File Server.

• Para un volumen raíz, utilice un almacén de instancias o Amazon EBS con respaldo en SSD.

• usa el almacén de instancias o el almacenamiento de Amazon EBS para un volumen de datos que sirva solo a una instancia, .

• usa Amazon EFS para un volumen de datos que sirva a varias instancias de Linux, .

•Para un volumen de datos que sirva a varias instancias de Microsoft Windows, utilice
Amazon FSx para Windows File Server.


**Datos de usuario de la instancia EC2**
al iniciar una instancia de EC2, puedes pasar los datos del usuario al sistema operativo de la instancia, esto permite dar un script que se puede usar para inicializarlo

**Recuperacion de metadatos de la instancia**
los metadatos son informacion sobre la instancia, se puede recuperar de un script de datos del usuario.
dan informacion sobre la IP publica, privada, nombre del host publico, ID de instancia, grupos de seguridad, region, zona de disponibilidad y mas...


para **trabajar con datos de usuario en instancias en ejecucion** debe detener la instancia, modificar el script de datos de usuario, luego, eliminar el archivo config_scripts_user mediante el SSH, por ultimo, reiniciar la instancio o ejecutar el comando /var/lib/cloud/instance/scripts/part-001
**practica recomendada** Cada vez que hagas cambios manuales en tu servidor, actualiza también el script de datos de usuario para que puedas volver a crear la misma instancia sin olvidar nada.


**Modelos de implementación de AMI**
**AMI básica**
configurada solo con el sistema operativo, completamente configurable y actualizable , tiempo de reconstrucción mas corto pero tiempo de arranque mas lento.
**AMI plateada**
mutable proporcionadas por AMS, configuracion a medida aunque algunas deben de realizarse manualmente o mediante scripts de datos de usuario, da un equilibrio entre velocidad de arranque y construccion.
**AMI dorada** 
inmutable personalizada, configuraciones completamente incorporadas en la AMI, vida util mas corta, tiempos de arranque mas cortos pero tiempos de construccion mas largos.

**Grupos de ubicacion**
permiten controlar donde se ejecuta un grupo de instancias interdependientes en una zona de disponibilidad. Esto aumenta el rendimiento de red entre instancias.
solo se puede iniciar una insyancia en un grupo de ubicacion a la vez.



**Nivel gratuito de AWS: EC2**
12 meses gratis
750 hrs/mes en t4g.small  tambien otras 750 de t2 o t3 micro de linux y otras de windows

**Modelos de precios de Amazon EC2**
modelos de compra; enfasis en proporcionar grandes ahorros a traves de diferentes casos practivos.
modelos de capacidad reservada; proporciona instancias reservadas para garantizar que las tenga cuando las necesite.
modelos dedicativos; proporciona hardware dedicado que ayude a cumplir con requisitos de cumplimiento y regulacion.

**Opciones de compra de EC2**
bajo demanda; pagas por el computo por hora o segundo sin compromisos
reservado; compromiso de 1 o 3 años a menor precio
savings plans, mismo decuento que resevado con mas flexibilidad pero es compromiso de $/hora
amazon EC2 spot; permite pujar por instancias EC2 no utilizadas


**Reserva de capacidad de EC2**
reserva bajo demanda;  siempre tienes acceso a la capacidad de EC2 cuando la necesite y por cuanto la necesites.
bloques de capacidaad de EC2; reservas para una fecha futura. ML

**Opciones dedicadas EC2**
**instancias dedicadas** se ejecutan en hardware dedicado a un solo cliente, pueden compartir hardware con otras instancias de la misma cuenta AWS que no sean instancias dedicadas.
**host dedicado** es un servidor fisico explusivo para ti, se puden comprar bajo demanda.


**Practicas recomendadas**
automatizar la proteccion de computo y red
controlar el trafico en todas las capas
escale las mejores opciones de computo para su carga de trabajo.
configure y ajuste el tamaño correcto delos recursos de computo.
seleccione el tipo, tamaño y cantidad de recursos correctos y el mejor modelo de precios
usa la cantidad minima de hardware para satsifacer sus necesidades
usa los tipos de instancia con menor impacto
usa servicios administrados por AWS

# Módulo 6: incorporación de una capa de base de datos

**consideraciones al escoger base de datos**
escalabilidad
requirimientos de almacenamiento
caracteristicas de los datos
durabilidad de los datos

**hay dos tipos de base de datos:**
**relacional** esta en forma tabular y tiene reglas de esquema estrictas, para tablas ej. transacciones
Amazon ofrece Amazon RDS, administrado por AWS
**no relacional** tiene variedad en modelos de estructura y esquemas flexibles, para acceso rapido
Amazon ofrece DynamoDB, Neptune, ElasticCache
![[Pasted image 20251209145042.png]]

Si usas un servicio de bases de datos administrado por AWS solo te tienes que preocupar de optimizar la aplicacion

**planear capacidad de base de datos**
1. Analiza la capacidad actual
2. Predice los requerimientos de capacidad
3. Determina si usas escalado vertical, horizontal o ambos.



**Amazon RDS**
es un servicio de bases de datos relacional administrada que despliega y escala bases de datos relacionales.
soporta multiples ingenierias de bases de datos
usa volumenes de EBS para guardar los logs y las bases de datos
una instancia RDS puede contener multiples bases de datos aisladas.
es util en transacciones

**Aurora**
es un sistema de administracion de bases de datos relacionales manegado por RDS y con muy buena compatibilidad con MySQL y PostreSQL
gran rendimiento y disponibilidad funcion del precio
constantes copias de seguridad a S3 y replica en 3 zonas de disponibilidad

**Aurora Serverless**
es el modelo sin servidor de auto escalado arriba o abajo

![[Pasted image 20251209151532.png]]

**RDS proxy**
base de datos de alta disponibilidad completamente administrado.
hace que las aplicaciones sean mas:
**escalables;** 
RDS esta entre la aplicacion y la base de datos, el proxy busca las conexiones abiertas que no esten haciendo nada y reusa la conexion para atender otras conexiones de aplicaciones
**resilientes;**
cuando hay un error se detecta de inmediato y conserva cualquier aplicacion que no este haciendo una transaccion activa y pone en cola a las entrantes y los redirige a otra instancia
**seguras;**
se aplica IAM y quita las contraseñas en el codigo


tiene backups automaticas y snapshots
los datos se cifran durante la transferencia y tambien cuando estan descansando.
replica los datos

**Amazon DynamoDB**
Es una base de datos, completamente administrada y sin servidor.
soporta modelos de documentos de datos y llaves de valor
tiene un rendimiento de milisegundos y escala tablas para ajustar capacidad automaticamente
se usa para desarrollar aplicaciones , cargas de trabajo criticas que necesitan velocidad, escalabilidad y duracion de los datos, desarrollar aplicaciones de software, crear tiendas de metadata de media, escalar plataformas gaming

contiene una tabla que contiene un item que contiene atributos que contiene  una llave de particion y una lista de atributo.

por defecto DynamoDB se replica solo dentro de una sola region, si quieres replica en varia regiones usa las tablas globales de DynamoDB

usa roles, politicas, condiciones de IAM,   usa AWS config y cloudtrail paea nibitorizar



**Bases de datos personalizadas**
Amazon Redshift es un servicio de almacenamiento de datos diseñado para administrar cargas de trabajo analiticas a escala de petabytes.
se usa para el procesamiento de analisis en linea
6 opciones:
![[Pasted image 20251210133951.png]]

encontar la base de datos que encaje con tu carga de trabajo tu modelo de datos las caracteristicas ybeneficios y los casos de uso comunes.

**Amazon DocumentDB** 
esta diseñada para almacenar y consultar datos como documentos tipo JSON, es compatible con MongoDB
es adecudada para documentos complejos, dinamicos y que requieren consultas.

**Amazon Keyspaces**
servicio de bases de datos administrado que puede procesar datos a altas velocidades para apps que requieran latencia bajisima

**MemoryDB**
es un servicio de base de datos en la memoria, elimina la necesidad de acceder a los discos, puede almacenar cache

**Neptune**
base de datos de graficos, almacena datos y la relacion entre estos con otros datos

**Timestream**
base de datos de series temporales para datos secuenciados por tiempo para analisis rapido se puede usar para analizar lo que genera un dispositivo IOT

**Amazon QLDB**
da un registro de transacciones transparente, inmutable y verificable criptograficamente, se usa para mantener registro de reclamaciones y almacenar transacciones financieras




**Migrar datos a las bases de datos de AWS**
**AWS DMS**
es un servicio administrado de migracion y replicacion que ayuda a mover bases de datos y cargas de trabajo existentes hacia AWS. de un lugar a otro llamado endpoints
soporta a la mayoria de bases de datos y replica los datos en demanda o en un horario para replicar cambios de una fuente.

si ambos endpoints tienen el mismo motor es homogenea y no usa servidor y es automatica
si los endpoints tiene distinto motor es heterogenea se usa AWS DMS fleet advisor, AWS SCT, AWS DMS schema conversion que convierten el codigo.


**Aplicar los principios de AWS WA a tu base de datos**

evalua como las compensaciones afectan a los clientes y a la eficiencia de la arquitectura
implementa una administracion segura de claves y aplicar el cifrado en reposo usa AWS KMS

# Módulo 7: creación de un entorno de redes

**VPC**
cada región tiene zonas de disponibilidad, y cada una de estas tiene centros de datos con routers

una red virtual se construye sobre esta red física y la emula , aislada
una VPC pertenece a una región esta por defecto aislada de otras redes
al crearla especificas su rango de ips CIDR para determinar el tamaño de la red
2 componentes importantes son las tablas de enrutamiento y las subredes
una regla de enrutamiento que no se puede cambiar es que los elementos dentro del vpc se puedan ver entre si
una subred es un contenedor de políticas de enrutamiento que pertenece a una zona de disponibilidad
una subred puede ser publica o privada, una instancia ec2 que necesite acceder a internet necesita IP publica para asegurarte de que no cambie la ip usa una ip publica elástica
los recursos de una red privada no pueden acceder ni pueden accederse desde internet

un dispositivo **NAT** reemplaza la IP privada del solicitante con su IP publica por lo que no se expone la IP real del recurso privado
puedes usar un NAT gateway o crear tu propio ec2 dispositivo para hacer esa función.



**Proteccion recursos de red**
seguridad en todas las capas
**grupos de seguridad** para proteger recursos , son firefalls , por defecto no hay reglas de entrada asi que no se permite trafico de entrada y si de salida. se puede cambiar, en grupos de seguridad solo puedes crear reglas para permitir no para denegar, puede estar en varias zonas de disponibilidad
**ACL de red para proteger subredes** sin estado permiten o denegan trafico cada subnet en la vpc tiene que estar asociada con el ACL y por defecto se permite todo el trafico * deniega todo
![[Pasted image 20251214154152.png]]

**firewall de red de AWS** añade una capa extra de seguridad, administrado por AWS detecta y previene intrusiones

host bastion minimiza ataques y mantiene acceso restringido suele correr en una instancia ec2 y se accede  a ella mediante grupos de seguridad

**Conexión a los servicios administrados de AWS**
no hay conexion de una instancia ec2 a un bucket s3 sin ir por el internet
un punto de conexion VPC es un recurso que se usa para conectarse de manera directa y privada a productors de AWS desde la VPC se le pueden poner politicas IAM
tambien se puede usar un un punto de conexion VPC de puerta de enlace que se conecte deirectamente a amazon
![[Pasted image 20251214161434.png]]

gateway load balance endpoint como funciona:

se usa con balanceadores de carga de puerta de enlace para inspeccionar trafico con aplicaciones de seguridad

**supervision de red**
flow logs permite capturar informacion del trafico de los VPC y acptar denegar y capturar informacion especifica y enviarlo a s3 o  cloudwatch en registro de flujos

analizador de alcance; para testear la conectividad entre un recurso destino y uno fuente en un VPC
analizador de accceso de red para identificar acceso no deseado a  tus recursos AWS

duplicacion de trafico hace una copia del trafico de red y la envia para seguridad y monitoreo

**Aplicación de los principios del Marco de AWS Well-Architected a una red**
para fiabilidad asegurate de de que la asignacion de la subred IP cuente para la expansion y la disponibilidad.
para seguridad crea capas de red y aplica control , inspección y protección a cada capa
para eficiencia de rendimiento entiende como la red afecta el rendimiento y escoge protocolos que ayuden a mejorar el rendimiento y evalua las caracteristicas de la red disponibles
para optimizacion de coste eliga regiones basandote en el precio


# Módulo 8: conexión de redes
hay dos tipos de diseño de red con varias VPC
arquitectura de malla completa ; cada nodo esta conectado con los demas nodos, util solo en redes pequeñas
arquitectura hub-and-spoke; haz un hub central  un nodo solo necesita conectarse a ese hub


AWS gateway de transito
es un router regional centralizado para conectar redes VPC y en premisa a un unico gateway llamado gateway de transito, escala automaticamente, se pueden conectar entre si en  misma region o entre regiones , basandose en la arquitectura hub-and-spoke
tiene flow logs para capturar

transit gateway peering attachment para conectar vpc de 2 cuentas aws
es seguro porque no va por internet publico

cobra por hora por el numero de conexiones y la cantidad de trafico

conectar varias vpc en aws con vpc peering
para ello se debe de hacer una solicitud a la otra vpc y que esta la acepte
y en sus tablas de enrutamiento cada uno tiene que agregar la ip del otro 
si las CIDR se  sobreponen de las vpc usa link privado con balanceador de carga de red.


como conectarse a una vpc desde una red remota
por defecto la vpc no puede comunicarse con la red de premisa

para ello se usa AWS site-to-site VPN
crea una conexion segura entre el gateway de un cliente en premisa y el gw¡ateway de AWS
usa IPsec para cear tuneles VPN

VPN cloudhub

AWS global accelerator para acelerar conexiones VPN site-to-site
pudes conectar varias redes en premisa a un gateway privado virtual

aws direct connect usa vlan para hacer una conexion remota desde tu premisa
se usa en entornos hibridos, centros de datos grandes
requiere rendimiento de red predecible y seguridad.
tienes 2 opciones
dedicada o de host
puedes crear 3 tipos de interfaces de red, publica privada o de transito

Aplicación de los principios del Marco de AWS Well-Architected a la conectividad de red
fiabilidad 
provisiona conectividad redundante entr redes privadas en la nube y entornos en premisa
prefiere topologias hub-and-spoke antes que malla

seguridad controla el trafico de toodas las capas y fuerza la encripcion en transito

eficiencia de rendimiento
escoge bien la conectividad dedicada o vpn para cargas hibridas y escoge la localizacion de tus cargas basandote en requerimientos de red

optimizacion de coste 

# Módulo 9: protección del acceso de los usuarios, las aplicaciones y los datos
**manejar permisos**
AWS IAM
los grupos de IAM se usan para darle permisos a multiples usuarios de una, le das permisos a un grupo añades a usuarios a dicho grupo y estos los heredan.
no puedes iniciar sesion con un grupo, solo son una forma de administrar permisos de usuarios.
los usuarios pueden pertencer a mas de un grupo
no se pueden anidar grupos
aunque un grupo permita algo si ese usuario tiene una politica de usuario que se lo deniega explicitamente no puede hacer esa accion

role based acces control RBAC
attribute based access control ABAC define permisos basado en atributos que son pares de llaves llamados tags que se pueden aplicar a recursos AWS y IAM, es mejor que RBAC para escalar manejo depermisos

**federar usuarios**
un sistema de confianza entre dos lados para autenticar usuarios y convergir informacion que se necesite para autorizar acceso a recursos quien proporciona la identidad es responsable para la autencticacion del usuario
quien proporciona el servicio es responsable de controlar el acceso a sus recursos

AWS centro de identidades IAM 
puede crear o conectar identidades y manejar acceso centralmente a traves de tus cuentas AWS

AWS STS es un servicio web API que permite hacer solicitudes temporales con credenciales con privilegios limitdaos, estas credenciales pueden ser usadas por usuarios IAM , usuarios federados o aplicaciones

Amazon Cognito 
es un servicio administrado que da autenticacion, autorizacion y manejo de usuarios para aplicaciones webs y moviles. identidades federadas para firmar con proveedores de identidad, grupos de usuarios que mantienen un directorio con perfiles de usuario de tokens de autenticación, grupos  de identidad que permiten habilitar la creacion de identidades unqicas y permisos de asignacion para usuarios.


Administracion del acceso a multiples cuentas
AWS organizations se usa para eso, crear, manejar y facturar cuentas de manera centralizada
y agrupar cuentas en una jerarquia
SCP de organizaciones ofrecen control central sobre el maximo de permisos disponibles para todas las cuentas en la organizacion
habilita control sobre que servicios son accesibles a los usuarios de IAM in cuentas miembri
define permisos que afectan a una cuenta entera
maneja y limita las acciones que un admin de cuenta puede delgera a usuarios y roles de IAM
los SCPs no pueden ser sobreescritos por el administrador local
mejor que IAM mas facil de escalar
solo da permisos que no esten explicitamente denegados y si esten explicitamente permitidos
los limites de permiso solo se aplican a una entidad IAM , determinar a que recursos puede acceder un usuario y los SCP se aplican a una organizacion denegar acceso a un conjunto de recursos

![[Pasted image 20251217201045.png]]

AWS control tower
permite poner control y manejo

**encriptar datos en reposo**
encripcion simetrica
usa la misma llave para encriptar y desenciptar 
mas rapido y eficiento para grandes cantidades de datos util en local de la red AWS
muy usado y bastante seguro

encripcion asimetrica 
usa llave publica para encriptar y privada para decriptar
mas seguro pero mas lento


encipcion del lado del cliente , antes de enviar a AWS , manejas tu tus llaves y solo tu lo sabes
encripcion del lado del servidor, encriptan tus datos antes de escribirlo al dusco y lo decriptan antes de que accedas a ellos llaves manejadas por AWS


AWS KMS  da la habilidad de crear y manejar llaves criptograficas y las protege con modulos de seguridad de hardware y permite usar politicas para determinar que usarios pueden usar las llaves
![[Pasted image 20251217204636.png]]


servicios de seguridad adicionales
aplicar seguridad a todas las capas
**bordes**
	AWS WAF firewall de aplicaciones web monitorea solicitudes http https 
	AWS shield
 
**datos** 
	Amazon Marcie usa ML para descubrir y clasificar datos sensibles que migran a AWS y notidfica al admin EC2 contenedores y funciones de lambda

**deteccion y respuesta a amenazas** 
	Amazon Inspector, servicio de manejo de vulnerabilidades que escanea cargas de trabajo continuamente
	Amazon Detective, recolecta datos de registro de tus recursos AWS
	AWS Security Hub, recolecta datos de seguridad en todas las cuentas, servicios y productos AWS e identifica problemas de seguridad
![[Pasted image 20251217213148.png]]

# Módulo 10: implementación de la supervisión, la elasticidad y la alta disponibilidad
**Supervision de recursos**
aplicaciones deben responder con la menor latencia posible 
metricas sobre la salud operacional, utilizacion de recursos y el rendimiento de la aplicacion.


**cloudwatch**
colecciona y rastrea metricas para servicios AWS atraves de regiones en un repositorio de mtricas
colecciona logs con Amazon CloudWatch Logs
calcula estadisticas de metricas y los muestra graficos de las estadisticas de la metricas
da alarmas para arquitecturas que responden a eventos
da notificaciones para hacer cambios a recursos monitoreados.

puedes centralizar los registros de todas las aplicaciones en un unico flujo de eventos ordenados por tiempo.
cuando creas una alarma cloudwatch compara la metrica actual con el umbral que se ha especificado y realiza una accion , enviando una notificacion

Cloudwatch dashboards puede usar los paneles para comparar metricas o alarmas que podrian estar en diferentes regiones

las metricas se tienen que agregar a lo largo del tiempo
puedes especificar un periodo

**EventBridge**
usa eventos para conectar los componentes de la aplicacion con buses (usan reglas para hacer coincidir eventos entrantes y enviarlos a los objetivos para su procesamiento ) y pipes que son integraciones entre una fuente y un objetivo

toma decisiones de enrutamiento con reglas configurables 

**Escalado de los recursos de cómputo**
aplicaciones necesitan manejar grandes cantidades de datos en menos de segundo y estar siempre encendidas y operativas.
escalado elastico escala dinamica mente

**EC2 auto scaling**
maneja una coleccion logica de instancias EC2 llamado grupo de auto escalado EC2 a traves de varias zonas de disponibilidad.
lanza o retira instancias EC2 configuradas por plantillas de lanzamientos
cambia el tamaño de la instancia basandose en eventos de politicas de escalafo, notificaciones de salud o acciones programadas.
se integra con ELB elastic load balancing para enviar nuevas registros de instancias y recibir notificaciones de salud.
balancea el numero de instancias a traves de zonas de disponibilidad.
**mecanismos de escalado**
acciones pprogramadas; basandose en una fecha y hora para cargas predecibles
politicas dinamicas; basado en  metricas para cargas impredecibles.
politicas predictivas; escala basado en patrones previos de trafico 
**AWS autocaling**
	usa un plan de excalado para varios recursos y servicios
**AWS aplication auti scaling** 
	escala varios recyrsis con un registro objetivo y escala varios servicios


**Escalado de las bases de datos**
cada servicio de base de datos escala diferente
en **Amazon Aurora** puedes escalar verticalmente para aumentar almacenamiento y puedes escalar horizontalmente y poner replicas, el volumen cluster abarca las 3 zonas de disponibilidad.
en **una base  de datos relacional RDS** se puede escalar verticalmente cambiando la clase o tamaño de la instancia o horizonatlmente añadiendo una base de datos de replica .
en **una tabla de DynamoDB** se puede usar el modo de capacidad bajo demanda para escalar bandose en lecturas y escrituras reales, reduce la carga en la tabla de la base con un index global secundario tablausa el modo de capacidad provisionada que encadena DynamoDB autoscaling, cloudwatch y aplicacion autoscaling para ajustar aprovisionamiento basado en patrones de trafico.
es util para aplicaciones con rendimiento consitente y predecible 


**Uso de equilibradores de carga para crear entornos de alta disponibilidad**
**ELB**
distibuye trafico a traves de varios objetivos en una o mas zona de disponibilidad, puede recivbir trafico publico o privado, monitorea la slud de los objetivos con chequeos de salud. enruta trafico a objetivos saludables y escala basandose en el trafico entrante.
**tipos de balanceadores de carga**
de aplicacion; se usa para trafico de HTTP, HTTPS, opera en la capa 7 de OSI se usa para arquitecturas de aplicacion
de red ; funcion en la capa de transporte y se usa para UDP, Ips estatica..
puerta de entrada; opera en la capa 3 del modelo OSI 
balanceador de carga clasico; se usa para EC2 de red clasicos, opera en la capa 3 y 7 del modelo OSI

cuando un balanceador de carga recibe una solicitud, evalua las reglas de escucha por orden de prioridad, y selecciona un objetivo del grupo de ojetivos d¡para hacer la accion.
si hay un problema en la zona de disponibilidad solo se envia trafico a las instancias de EC2 en buen estado de otra zona de disponibilidad.

usando un balanceador de carga de puerta de enlace  especifica para analizar el trafico entrante y saliente mediante dispositivos virtuales escucha y reenvia trafico en una region.

**Route 53**
es un servicio web DNS que maneja registros de nombres de dominio y les da zonas alojadas.
da servidores de nombre autorizativos para resolucion DNS y realiza enrutamiento DNS para enrutar trafico a  puntos finales saludables.
realiza chequeos de estado a direcciones ip o dominios para manejar fallos regionales o de zonas de disponibilidad.
puede ninnitorear alarmas de CloudWatch
tiene varias politicas de enrutamiento
para enrutar trafico de VPC se usan zonas alojadas privadas,
para enrutar trafico a internet se usan zonas alojadas publicas,

**Aplicación de los principios del marco de AWS Well-Architected a sistemas de alta disponibilidad**
fiabilidad;  despliega las cargas en varias localizaciones, automatiza la recuperacion para componentes de una sola localizacion.,
envia notificaciones cuando un evento impacte la disponibilidad.

eficiencia de rendimiento; escala tus recursos de computo dinamicamente

# Módulo 11: automatización de la arquitectura
Los procesos manuales son propensos a errores, poco fiables e inadecuados para respaldar un negocio ágil.
donde te esfuerzas mas, en el diseño o el la implementacion


**riesgos derivados de los procesos manuales**
no permite repetibilidad a escala, se añaden cosas manualmente
no tienes control de versiones, no se puede revertir a una version anterior
carece de pistas de auditoria, ver cambios en la configuracion
tiene configuraciones inconsistentes, mantener coherencia

**Beneficios de la automatización**
**Reduce la intervención manual o el acceso**, te centras en en la configuracion, implementacion y soporte de la infraestructura y aplicaciones de los entornos de produccion
**Permite entornos reproducibles** escalado  automatico
**Mejora la productividad**
**Automatiza las pruebas y el escalado**


**Informacion general de la IaC**
IaC es el proceso de escribir una **plantilla** que aprovisiona y administra tus recursos en la nube
los humanos la pueden leer y las maquinas lo pueden enteneder y permite que puedas replicar volver a implementar y reasignar infraestructura.

permite implementar entornos complejos rapidamente con  ima sola o varias plantillas. por ejemplo una pila puede incluir todos los recursos necesarios para ejecutar  una aplicacion web, como servidor web base de datos y reglas de redes si ya no necesitas es aplicacion web solo eliminas la pila y ya

se puede crear una plantilla con 3 pilas diferentes una para desarrollo otra para pruebas y otra para el entorno de produccion,
para actualizar se puede enviar la actualizacion a la plantilla para actualizar todas las pilas 

![[Pasted image 20260109122045.png]]

**cloudformation**
forma simple de modelar, crear y administrar una coleccion de recursos AWS
un grupo de recursos  se denomina pila de CloudFormation, solo pagas por uso.
permite cargar actualizar y eliminar pilas
permite control de versiones de las implementaciones
tratas la infraestructura como codigo

**servicios de IaC de AWS que usan CloudFormation** 
**AWS Elastic Beanstalk;** servicio administrado que auto inicia un entorno  de AWS con el codigo de aplicacion cargado.
**AWS Quick Starts;** arquitecturas de referencia automatizadas basadas en plantillas de CloudFormation.  de codigo abierto
**AWS Serverless Aplication Model SAM;** extension de CloudFormation con sintaxis abreviada oara crear infraestructura comun sin servidores.
**AWS Amplify** un marco de trabajo de desarrollo de aplicaciones web y moviles que necista menos codigo y conocimiento.
**AWS Cloud Development Kit AWS CDK;** un marco de trabajo de desarrollo de codigo abierto para modelar y aprovisionar recursos con CloudFormation usando lenguajes de programacion ya existentes.


**Funcionamiento de CloudFormation**
1. defines los recursos de AWS que deseas crear, los recursos se definen en una plantilla de CloudFormation, puedes crear una plantilla de 0 o usar un prediseño, si la caracteristica no esta soportada por cloudformation puedes  invocar una funcion AWS Lmbda  durante la creacion de la pila que llame a la API.
2. cargas la plantilla en CloudFormation o puedes almacenar la plantila en S3 y decir a cloudformation donde esta
3. ejecutas la accion create stack, cloudformation lee lo que pone la plantilla y crea los recursos deseados en su cuenta AWS. una sola pila puede crear y configurar recursos en un region en varios servicios.
4. puedes ver el progreso del proceso de creacion de pila  y cuando acabe , el objeto de la pila queda como id 
la plantilla puede estar en JSON o YAML  ( YAMLmas facil de leer ocupa menos lineas, admite comentarios  y es mas facil de depurar que JSON,
JSON  es mas confiable  y menos complejo de generar y analizar que YAML)
.Elija YAML para un formato más legible para humanos y JSON para la compatibilidad cruzada


**Anatomía de una plantilla de CloudFormation**
**Metadatos:**  incluye objetos que proporcionan información adicional sobre la plantilla.
**Parámetros:**  los valores que se pasan a la plantilla en el tiempo de ejecución (cuando se crea o actualiza una pila).
**Reglas:**  valida un parámetro o una combinación de parámetros pasados a una plantilla durante la creación o actualización de una pila.
**Mapeos:**  incluye un mapeo de claves y valores asociados que puede usar para especificar valores de parámetros condicionales, de forma similar a una tabla de búsqueda.
**Condiciones:** incluye las condiciones que controlan si ciertos recursos se crean o si se asigna un valor a ciertas propiedades de recursos durante la creación o actualización de la pila.
**Transformación:**  En el caso de aplicaciones sin servidor, la sección Transformación especifica la versión de **AWS SAM** que se va a utilizar.  
Al especificar una transformación, puede usar la sintaxis de AWS SAM para declarar los recursos de la plantilla.
**Recursos (obligatorio):**  En esta sección se especifican los recursos de la pila y sus propiedades, como una instancia de **EC2** o un **bucket de S3**.
**Salidas:**  
Esta sección describe los valores que se devuelven cuando se consultan las propiedades de su pila.

**Plantilla de recursos: creación de una instancia de EC2**
los recursos (seccion obligatoria) definen lo que debe crearse en la cuenta AWS
Las salidas especifican los valores devueltos al crear la pila

**AWS CloudFormation Designer (Designer)**
herramienta grafica para ver crear y modificar plantillas de cloudformation
editor de JSON y YAML integrado

**Condiciones de uso**
Una misma plantilla de CloudFormation permite crear y mantener consistencia entre entornos como desarrollo y producción, mientras que condiciones dentro de la plantilla permiten adaptar diferencias específicas como la escala, garantizando repetibilidad y reduciendo riesgos.


**Conjuntos de cambios de CloudFormation**
se pueden usar conjuntos de cambios para obtener una vista previa de los cambios antes de implementarlos
creas un conjunto de cambios
ves el conjunto de cambios
usas DeletionPolicy para conservar o hacer una copia de segurdidad de un recurso cuando se elmine o actualice su pila.

**Deteccion de desviaciones**
se puede ejecutar en una pila para detectar desviaciones y ver si la pila se ha desviado de la configuracion de plantilla esperada, la deteccion de desviaciones devuelve info detallada sobre el estado de desviaciones de cada recurso que admite la deteccion de desviaciones en la pila.
si al eliminar la pila  hay dependencias de recursos sin resolver es posible que falle

**Determinación del alcance y organización de plantillas**
![[Pasted image 20260109142951.png]]
las plantillas anidadas son parte de otras pilas

**AWS Quick Starts**
son implementaciones de referencia , basadas en las prácticas recomendadas de AWS en materia de seguridad y alta disponibilidad
se pueden usar para crear arquitecturas completas rápidamente o para experimentar o como base de una arquitectura propia.
cada Quick Start  tiene una plantilla de CloudFormation y una guía con detalles de implementación y configuración.


**Desafios de escribir la infraestructura como codigo**
errores humanos
diferentes niveles de habilidad y estilos entre los desarrolladores
tamaño y complejidad de las plantillas
vulnerabilidades de seguridad

**Amazon Q Developer**
asistente de codificacion impulsado por IA generativa
genera codigo y ayuda acomprender, crear, ampliar y operar las aplicaciones de AWS
escanea codigo en busca de vulnerabilidades 
realiza actualizaciones y mejoras en el codigo 


**planificar** Amazon Q para hacer preguntas y recibir recomendaciones y practicas
**crear** recomienda código en linea y genera nuevas características , puedes hacerle preguntas a Amazon Q
**probar y asegurar** ayuda a confirmar que el código funciona y es seguro
**operar** Amazon Q ayuda a solucionar errores
**Mantener y modernizar** moderniza código y lo mantiene  acorde a versiones del lenguaje mas recientes.


**Prácticas recomendadas de automatización del marco de AWS Well Architected**
**excelencia operativa** efectué operaciones como código, haz cambios frecuentes, pequeños y reversibles, automatice por completo la integración e implementación.
**seguridad** automatice las practicas recomendadas de seguridad.
**fiabilidad** implemente cambios con automatizacion  y use la automatizacion para obtener o escalar recursos.
**optimizacion de costos** realice la automatizacion de las operaciones.

![[Pasted image 20260109145859.png]]

# Módulo 12: almacenamiento de contenido en caché
**Almacenar contenido en cache**
el cache es una capa de almacenamiento de datos de alta velocidad que almacena un subconjunto de datos para que solicitudes futuras de esos datos se entreguen mas rapido y reduce la frequencia con la que se accede a la base de datos principal.
el cache es mas veloz que una base de datos

**En el cache se deberia almacenar**
datos estaticos y de acceso frecuente, solo si es una ventaja en velocidad y coste.
resultados de calculos con uso intensivo de computos
resultados de consultas de bases de datos complejas de uso frecuente

**beneficios del almacenamiento en cache**
- **reduce latenica de respuesta**
- **reduce costos**
- **alivia la carga en el origen de los datos**
- **da un rendimiento predecible**
- **mejora la disponibilidad**

**desafios del almacenamiento en cache**
- **requiere ingenieria adicional**
- **requiere que alguien determine como almacenr el cache y tratar objetos obsoletos**


**tipos de almacenamiento en cache  y servicios de almacenamiento en cache AWS**
- **Almacenamiento en cache estatico, periferico** usa servidores de almacenamiento en cache para guardar el contenidor mas cerca de los usarios mediante la CDN que usa la ubicacion mas cercana al cliente para enviarle una copia en cache del contenido. CLOUDFRONT
- **Almacenamiento en cache de bases de datos** la cache es una capa cercana a la base de datos para mejorar el rendimiento de las aplicaciones **ElastiCache**

**Red de entrega de contenido CDN**
es un sistema distribuido globalmente de servidores de cache , tiene servidores intermediarios entre el cliente y la acplicacion, almacena en cache copias de archivos solicitados communmente (contenido estatico)
entrega una copia local del contenido solicitado desde una periferia de cache cercano o un punto de presencia.

puede almacenar imagenes, videos, objetos web, 
NO puede almacenar datos generados por el usuario ni contendio generado dinamicamente

**CloudFront**
Es un servicio CDN que entrga contenido de forma segura con baja latencia y altas velocidades.
Proporciona una dsitribucion de contenido de alta velocidad mediante la entrega de velocidades perifericas.
mejora la resiliencia de las aplicaciones frente a DDoS 

**La red global periferica de Amazon CloudFront se compone de**
- **ubiaciones perifericas de CloudFront** mas numerosas y cerca de los usuarios, tienen caches mas pequeñas, ayudan a garantizar que el contenido popular se pueda ofrecer rapidamente a los espectadores
- **caches perifericas regionales en CloudFront** son menos y estan mas alejadas de los usuarios, tienen caches mas grandes. ayudan con el contenido menos poular.

![[Pasted image 20260110144410.png]]
**como funciona el almacenamiento en cache en CloudFront**
1. el usuario solicita acceso a una imagen
2. el DNS dirige la solicitus a la ubicacion periferica con menor latencia , si el contenido esta en el cache, lo entrega directamente al usuario (paso5) y acaba
3. si no esta en la cache, cloudfront solicita a la ubicacion de origen
4. la ubicacion de origen devuelve el objeto a la ubicacion periferica
5. luego cloudfront reenvia el archivo al usario y lo guarda en su cache para la proxima vez.

TTL es la configuracion que determina cuanto tiempo la ubicaciones deben guardar en cache el contenido.


**distribucion en Cloudfront**
-- especifica una ubicacion de origen de la cual cloudfront obtiene los archivos.
-- configure la distribucion , indica a cloudfront origenes personalizados de los que obtener archivos
-- cloudfront pasa a estar disponible 
-- cloudfront envia la configuracion de su distribucion a las ubicaciones perifericas.

**controlar por cuanto tiempo se almacena contenido en cache**
poner un TTL maximo, mas bajo mas rapido expira el contenido.
implementar el control de versiones de contenido, obtiene y almacena en cache nuevos archivos de forma inmediata. con id de version
especificar encabezados de control de cache, para ver el vencimiento de l contenido de los archivos individuales.

utilizar las solicitudes de invalidacion de cloudfront para provocar el vencimiento de caches perifericas

**Uso de CloudFront para streaming de video**
se usa un codificador como (Amazon Elastic Transcoder) para formatear  y empaquetar el contenido de video antes de que Cloudfront pueda distribuirlo.
![[Pasted image 20260110150735.png]]


**Mitigación de ataques de DDoS**
CloudFront mejora la resiliencia de las aplicaciones en AWS ante ataques DDoS, distribuyendo el contenido estatico y dinamico
ademas un servicio DNS como Route 53  conecta solicitudes de usuarios  con CloudFront y la distribucion de CloudFront envia por procy las solicitudes de contenido dinamico a la infraestructura 
AWS WAF analiza solicitudes entrantes y bloque amenaxzas antes de que lleguen a los servidores.
Shield inspecciona el trafico en busca de Cloudfront y permite que solo el trafico valido para las aplicaciones pasen al servicio

**¿Cuándo almacenar en caché la base de datos?**
- te preocupan los tiempos de respuesta del cliente
- tienes muchas solicitudes que sobrecargan la base de datos
- quieres reducir los costos de las bases de datos


**ElastiCache**
es un almacen de datos en memoria de valor clave completamente administrado con latencia de menos de 1 milisegundo, automatiza tareas comunes como deteccion de errores
esta entre la app y un almacen de datos de origen
reduce la latencia de acceso y alivia la carga de bases de datos y aplicaciones
proporciona una cache en memoria rentable y de alto rendimiento
compatible con motores Redis y  MemCached de codigo abierto


**ElastiCache para Memcached**
es mas basico , puede ejecutar nodos grandes con varios nucleos o subprocesos puede escala horizontalmente, requiere menos matenimiento, multiproceso

**ElastiCache para Redis**
admite tipos de datos mas complejos
ordena o clasifica los conjuntos de datos en memoria
proporciona alta disponibilidad con conmutacion or  error automatica
admite mensajeria de publicacion y suscripcion
persiste el almacen de claves




**Componentes de ElastiCache**

Un nodo es el bloque mas pequeño de una implementacion de elasticache.
es una porcion de RAM segura conectada a la red de tamaño fijo
Un clúster de ElastiCache es una agrupación lógica de uno o más nodos

Con el motor Memcached, los datos se dividen en hasta 20 nodos de un clúster. Con el motor Redis , puede escalar verticalmente hasta 250 nodos.


**TTL**
se agrega un valor TTL a cada escritura y especifica el numero de segundos o milisegundos que transcurren hasta que vence la clave.
si el TTL acabo se trata como si los datos no estuvieran en la cache
Una vez se vence el TTL, la aplicacion consulta la base de datos en busca de los datos.

**Gestion datos obsoletos**
![[Pasted image 20260110154404.png]]


La **carga diferida** 
la aplicación primero consulta la caché. Si los datos están disponibles, se produce un _hit de caché_ y la respuesta es rápida. Si no están, ocurre un _error de caché_, la solicitud se envía a la base de datos, los datos se devuelven al usuario y se guardan en la caché para futuras peticiones. útil cuando los datos se leen con frecuencia pero se modifican poco, . Su ventaja es que solo se almacena en caché lo que realmente se solicita, evitando llenar la memoria con datos innecesarios. Su desventaja es la latencia en los errores de caché y el riesgo de que los datos queden obsoletos.

La **escritura indirecta** es una estrategia en la que cada vez que se actualizan los datos, primero se escriben en la base de datos y luego se actualiza inmediatamente la caché. Es un enfoque proactivo que garantiza que la caché siempre esté actualizada y reduce la probabilidad de errores de caché. Su principal desventaja es que puede almacenar datos que no se usarán, lo que puede aumentar los costos. Se recomienda cuando los datos necesitan estar actualizados en tiempo real.


**Prácticas recomendadas de almacenamiento en caché del Marco de AWS Well Architected**

**Eficiencia de rendimiento**
implementa patrones de acceso a los datos que usen el almacenamiento en cache
implementa estrategias para mejorar el rendimiento de las consultas en el almacen de datos

**Fiabilidad**
Utilice una conectividad de red de alta disponibilidad para los puntos de conexion publicos de su carga de trabajo.

**Optimizacion de Costos**
haz un modelado de transferencia de datos.
selecciona los componentes para optimizar los costos de la transferencia de datos.
implemente servicios para reducir los costos de la transferencia de datos.

# Módulo 13: creación de arquitecturas desacopladas
**acoplamiento ajustado** sistema en el que los componentes enlazados dependen unos de los otros en la medida en que los cambios o errores en  e un componentes hacen lo mismo en otros.
esto aumenta la complejidad del escalado ya que una interrupcion de la aplicacion afecta a todos los servidores web conectados y cada servidor neesita varias conexiones que deben actualizarse en el codigo.

una forma de aliviar los problemas de una arquitectura de acoplamiento es introducir un componente intermedio entre la capas dependientes.
![[Pasted image 20260111125052.png]]

el acoplamiento ajustado tambien puede aplicarse dentro de una aplicacion donde los cambios en una funcion requieren mantenimiento de toda la aplicacion.

**arquitectura de microservicios** divide las funciones de la aplica ion en partes que pueden escalarse y fallar de forma independiente, cada microservicio es atonomo para que las aplicaciones tengan componentes reutilisables y escalables, se recomienda que las interraciones de los componentes sean asincronas, asi la interracion no necesita respuesta inmediata.

**boker de Amazon MQ** el boker almacena los mensajes mediante el servicio Amazon Elastic File System o Amazon elastic block store.

**Acoplamiento debil** resuelve problemas de integracion ajustada .
ayuda a asilar el comportamiento de un componente de otros componentes que dependen de el , lo que aumenta la resiliencia y la agilidad, la implementacion de un  acoplamiento debil entre dependencias avita que un error en un componente afecte  a otro componente.
puede ser sincrona( un intermediario entre capas) o asincrona (mediante mensajes o colas)

**mensajería punto a punto**
puede desacoplar las aplicaciones de forma asincrona 
se usa cuando la aplicación remitente envia un mensaje solo a una aplicacion receptora especifica
aplicacion remitente es productor
aplicacion receptora es consumidor.
el productor coloca un mensaje en la cola, la cola almacena el mensaje hasta que se recupera, el consumidor obtiene el mensaje de la cola


**Amazon Simple Queue Service SQS**
servicio de cola de mensaje administrado por aws
integra y desacopla sistemas de software y componentes de aplicaciones. y asi las aplicaciones se ejecuten y fallen de forma independiente.
proporciona capacidades de colocacion en cola de mensajes de alta disponibilidad, seguras y duraderas.
proporciona una interfaz de la consola de administracion de AWS y una API de servicios web.

- evitas la necesidad de administrar el software de mensajeria o mantener la infraestructura.
- entregas grandes valumenes de datos sin perder mensajes
- envia informacion confidencial de forma segura entre aplicaciones
- escala automaticamente segun uso

**componentes basicos de amazon SQS**
- **mensaje** 256 KB max, puede estar en ka cola hasta que se elimine explicitamente o supere el periodo de retencion de mensajes en cola.
- **cola** 2 tipos: estandar, primero en entrar primero en salir FIFO
- **cola de mensajes fallidos** se puede asociar a cualquier cola y almacena mensajes que no se pueden consumir bien.

**tipos de cola**
- **cola estandar** entrega al menos una vez, mensajes pueden entregarse a distinto orden del que fueron enviados, rendimiento ilimitado
- **cola FIFO** entrega FIFO, procesa solo 1 vez, alto rendimiento. 300 llamadas a APi por segundo por operacion API
usa cola estándar cuando la aplicacion del consumidor pueda procesar mensajes no ordenados y que llegan mas de una vez, si no usa cola FIFO


**configuracion de colas**

**tipo de sondeo**
- **sondeo breve** tiempo de espera para recibir mensajes es 0 segundos
- **sondeo prolongado** de mas de 0 segundos hasta 20 seg

**visibilidad de los mensajes**
periodo durante el cual ammazon SQS impide que otros consumidores reciban y procesen el mismo mensaje
ayuda a garantizar que un mensaje no se procese varias veces y provoque duplicaciones.

**Cómo funciona la cola de mensajes de SQS**
1. un productor envia mensaje a la cola y  el mensaje se distribuye entre los servidores de la cola redundantemente.
2. el consumidor  recupera el mensaje  de la cola y comienza el tiempo de espera de visibilidad, durante este tiempo otros consumidores no pueden procesar el mensaje.
3. tras procesar el mensaje el consumidor lo elimina de la cola durante el tiempo de espera para evitar que el mensaje se reciba de unuevo cuando caduque el tiempo.


**casos practicos de amazon SQS**
- para colas de trabajo
- operaciones por lote y bufer
- descarga de solicitudes
- activacion de amazon ec2 auto scaling

**mensajeria de publicacion y suscripcion**
puede desacoplar las aplicaciones de forma asincronica, la mensajeria de pub/sub se usa cuando la aplicacion remitente envia un mensaje a varias aplicaciones receptoras y tiene poco o ningun conocimiento sobre las aplicaciones receptoras
aplicacion remitente es publicador
receptora es suscriptor

**Amazon Simple Notification Service SNS**
es un servicio de mensajeria ilimitada en cualquier mmento de pub/sub completamente administrado
ayuda a desacoplar aplicaciones mediante notificaciones.
proporciona capacidades de notificacion escalables , seguras y rentables.
proporciona una interfaz de la consola de administracion de AWS y una API de servicios web


**tipos de suscriptores**
- **Correo electrónico:** Mensaje enviado a una dirección de correo registrada (texto o JSON).
- **Mensajería de texto móvil (SMS):** Mensaje enviado a un número de teléfono registrado.
- **Notificaciones push móviles:** Mensaje enviado a dispositivos móviles como notificación push.
- **Punto de conexión HTTP/HTTPS:** Mensaje enviado a una URL mediante HTTP POST.
- **Función AWS Lambda:** Mensaje enviado a una función Lambda para ejecutar lógica personalizada.
- **Cola SQS:** Mensaje enviado a una cola SQS para su procesamiento posterior.
- **Amazon Kinesis Data Firehose:** Mensaje enviado a un flujo de Firehose para almacenamiento y análisis.

**casos practicos de Amazon SNS**
notificacion de alertas de aplicaciones y sistemas
notificacion por correo electronico y mensaje de texto
notificaciones push moviles

**consideraciones importantes a la hora de utilizar Amazon SNS:**
cada mensaje de notificacion contiene un unico mensaje publicado
cuando un mensaje se entrega no se puede recuperar

**Comparación de Amazon SNS y Amazon SQS**
![[Pasted image 20260111155759.png]]

**Amazon MQ**
es un servicio de broker de mensajes completamente administrado.
facilita la configuracion , funcionamiento y administracion de un broker de mensajes Apache ActiveMQ o RabbitMQ
proporciona una solucion basada en temas y colas para aplicaciones de acoplamiento debil
permite que las aplicaciones y los componentes de software se comuniquen mediante varios lenguajes de programacion , sistemas operativos y protocolos  de mensajeeria formales.

si intentas integrar aplicaciones en las instalaciones con aplicaciones en la nube AWS, recomienda utilizar Amazon MQ, es compatible con API y protocolos de estandares abiertos
![[Pasted image 20260111160408.png]]

# Módulo 14: creación de arquitecturas y microservicios sin servidor

