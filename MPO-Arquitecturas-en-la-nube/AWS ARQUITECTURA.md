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
