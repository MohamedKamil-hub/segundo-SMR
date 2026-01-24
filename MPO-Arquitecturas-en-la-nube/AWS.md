
- Definir la nube de AWS.
    
- Explicar la filosofía de precios de AWS.
    
- Identificar los componentes de la infraestructura global de AWS.
    
- Describir las medidas de seguridad y cumplimiento de la nube de AWS, incluida **AWS Identity and Access Management (AWS IAM)**.
    
- Crear una **Amazon Virtual Private Cloud (Amazon VPC)**.
    
- Demostrar cuándo usar **Amazon Elastic Compute Cloud (EC2)**, **AWS Lambda** y **AWS Elastic Beanstalk**.
    
- Diferenciar entre **Amazon S3**, **Amazon EBS**, **Amazon EFS** y **Amazon S3 Glacier**.
    
- Demostrar cuándo utilizar los servicios de base de datos de AWS, incluidos **Amazon Relational Database Service (RDS)**, **Amazon DynamoDB**, **Amazon Redshift** y **Amazon Aurora**.
    
- Explicar principios arquitectónicos básicos de la nube de AWS.
    
- Explorar conceptos clave relacionados con **Elastic Load Balancing (ELB)**, **Amazon CloudWatch** y **Auto Scaling**.


# Módulo  1: Información general sobre los conceptos de la nube


la informatica en la nube es la entrega bajo demanada de potencia computacional , bases de datos, almacenamiento, aplicaciones y otros recursos.
te permite pensar en hardware como si fuer asoftware.

**modelos de servicio en la nube**

- **infraestructura como servicio** mas control sobre recursos, da acceso a red , almacenamiento y tiene el mayor nivel de flexibilidad permite ver y usar el hardware como si fuera software                          permite acceder a las caracteristicas de redes, equipos  y al espacio de almacenamiento de datos.
- **plataforma como servicio** quita la necesidad de manegar almacenamiento y sistema operativo y solo te tienes que preocupar por la administración y despliegue de aplicaciones
- **software como servicio** menos control sobre rescursos, suele ser para el usuario final solo te enfocas en usar esa pieza de software, ej. una apliacion de email.

**modelos de despliegue de nube**
**nube** se encuentra completamente implementada en la nube
**hibrido**  conecta recursos en la nube y recursos existentes
**nube privada, infraestructura local**


![[{EFD79650-3DEC-49BE-9A76-14D2AAD46821}.png]]

**ventajas de la nube**
1. solo pagas por lo que consumes
2. economias de escala 
3. no tienes que estimar la capacidad necesaria
4. mayor velocidad y agilidad
5. no gastas en ejecutar y mantener la infraestructura
6. adquieres escala mundial en poco tiempo


**SERVICIO WEB**
aplicacion aprovisionada atraves de internet
solo te preocupas por los datos que envias al servicio y los datos que recibes.

AWS es una plataforma agrupa varios servicios web


**MIGRACION A LA NUBE**
CAF de AWS ofrece orientacion para ayudar amigarar
en 6 areas de enfoque , perspectivas:
	perspectiva de negocios
	perspectiva personal
	perspectiva de gobernanza
	perspectiva de plataforma
	perspectiva de sguridad
	perspectiva de operaciones


# Módulo 2: Economía y facturación de la nube


![[{02F80697-81A0-413F-B6E6-CDFA93677F78}.png]]


![[{ED45F6D0-05A6-486E-8BC8-97F12BCE6C81}.png]]
pagas menos si usas mas


![[{12880E18-CF31-4DA6-8502-B4D4EAB15539}.png]]

![[{49EDC8BF-47B6-49B9-844B-EE067A5B6F71}.png]]

####  AWS organizations
 permite poner usuarios en una organizacion y darle ramas a cada unidad organizativa y ramificaciones tipo arbol
 politicas IAM es compatible con organizaciones, grupos y usuarios
![[{C29E5C78-1962-40D1-95BB-96C10D7FDBED}.png]]

**![[{5AE41BD5-4C07-484B-B2A4-E2DD098D9429}.png]]**



![[{39096794-86E9-4574-A995-5309BDFBB83F}.png]]
![[{60BF4901-6A9A-4137-B952-0AD3A9536F60}.png]]

# Módulo 3: Información general sobre la infraestructura global de AWS


![[{9A63E85A-CDAE-4361-A32A-D6F4217A055B}.png]]
![[{BA39D905-22DB-4A1A-84EA-78D45D8EC7B4}.png]]


![[{A44CE029-1803-4198-B0B7-A50D81445EF2}.png]]
cada region tiene varias zonas de disponibilidad, que es una particion completamente aislada de la infraestructura AWS, que contiene multiples data centers, y estos a su vez incluyen cientos de servidores
![[{931A6517-5274-45C4-8DDC-62D3F1984B56}.png]]
puntos de presencia cloudfront es edge server?

caracteristicas de la infraestructura aws
elasticidad y escalabilidad
tolerancia a errores
alta disponibilidad


categorias de servicio

**base de datos** amazon relational database service, amazon aurora, amazon redshift, amazon dynamoDB,
**informatica** amazon ec2, ec2 autoscaling, ecs, ec2 container registry, aws elastic beanstalk, lambda,, amazon eks, aws fargate
**costo de costos**  informe de uso y costo aws, presupuestos aws, aws cost explorer
**administracion y gobernanza** consola y administracion de aws, aws config, amazon cloudwatch, aws autoscaling, interfaz de linea de comandos aws aws trusted advisor, aws well architected tool, aws cloudtrail
**redes y entrega de contenido** amazon vpc, elastic load balancing, cloudfront, aws transit gateway, route 53, direct connect, aws vpn
**seguridad, identidad y conformidad** IAM, AWS ORGANIZATIONS, Amazon cognito, AWS artifact, aws key management service, aws shield
**almacenamiento**  amazon s3, ebs, efs, glacier





# Módulo 4: Seguridad en la nube de AWS

**Modelo de responsabilidad compartida**
dicta que partes de la seguridad estan a cargo de AWS y cuales estan a cargo del cliente
![[{82430A0A-33FD-43EF-B802-140A7B03ECFC}.png]]

#### **seguridad de la nube**

![[{11F2B11C-E2D8-497F-BE79-D665C09745ED}.png]]  

![[{EF971DF8-9C38-407F-93B7-3522035FE9FD}.png]]



#### caracteristicas del servicio y responsabilidad en materia de seguridad

![[{A4F36478-BA92-4EFB-9D12-E132687DD4C0}.png]]


![[{59E812C5-A85C-40BE-8325-CD156E7A994C}.png]]

#### manejo de identidad y acceso en aws (IAM)
IAM permite definir usuarios y administrar acceso, es una herramienta gratuita y global de AWS 
maneja quien y como se pueden acceder a los recursos.
![[{DDB6D751-FBD1-44FD-9446-C945E94C49C0}.png]]


un usuario puede tener 2 **tipos acceso** :
**acceso mediante programación**, que se autentica con una clave de acceso secreta y un id de clave de acceso
**acceso a la consola de administración de aws**  que se autentia con id de cuenta o alias de 12 digitos nombre de usuario de iam y contraseña de iam 

a esto se le puede añadir autenticacion de doble factor MFA  que da mas seguridad
**Autorizacion** se refiere a que despues de que un usuario se a autenticado necesita determinar que acciones puede realizar.
por defecto un usuario no tiene ningun permiso por el principio de 0 seguridad.

**politicas de IAM** 
es un documento que define permisos habilita el control de acceso detallado
y estas pueden estar:
- basados en identidad
	asociando una política a cualquier entidad de IAM ,es decir especifica que acciones puede y no puede realizar la entidad
basados en recursos 
	asociados a un recurso

si hay un conflicto en el que un permiso esta permitido y denegado a la vez la denegacion siempre prevalece.
![[{0B72409B-9E47-4D77-8F5E-B16EC5021C3C}.png]]

**GRUPOS IAM**
son un conjunto de usuarios que se usa para darles permisos a la vez  un usuario puede pertenecer a varios grupos y los grupos no pueden estar anidados

Proteccion de una cuenta nueva en AWS
no use la cuenta root a menos que sea necesario, 
activa mfa 
usa cloudtrail para hacer seguimiento a la actividad de los usuarios en su cuenta
habilita un informe de  facturXION, COMO EL INFORME DE USO Y COSTO DE aws
 
#### **proteger cuentas**
con AWS organizations
![[{FB79AD61-9F99-4F80-91D7-5A6E54B24B62}.png]]
![[{276E3781-7EC1-42A0-AE59-10A6D4F67CBA}.png]]
![[{670F2415-3559-4792-8774-77DA8D5222C1}.png]]
![[{7B64C58D-C297-42D9-A0C7-B2CB9E6E2FA9}.png]]

AWS SHIELD ayuda a protejer ante ataques ddos

#### proteccion de datos en AWS
cifrado de datos en reposo
codifica datos  con una clave secreta 

cifrado de datos en transito, que viajan a traves de la red
se logra a traves de TSL 

las politicas de bucket se usan cuando el usuario o  el isitema no puede autentcarse mediante IAM puede dar acceso publico o privado a S3



#### garantizar conformidad
certificaciones y acreditaciones
leyes
![[{825671E8-7FB2-4B54-8174-FB7ADC09FEDA}.png]]
![[{698254AB-8646-428B-98E8-2A74D60866DF}.png]]














# Módulo 5: Redes y entrega de contenido
#### conceptos basicos de redes
una red son 2 o mas maquinas conectadas con un enrutador para comuunicarse identificandose a traves de una combinacion de numeros decimales en 4 grupos de un maximo de 8 bits osea entre 0 a 255
ipv4 tiene 32 bits 4 grupos de 8
ipv6 128 bits  8 grupos de 16 0 a ffff

En este ejemplo, el CIDR es 192.0.2.0/24. El último número (24) le informa que los primeros 24bits no se pueden cambiar. Los últimos 8 bits son flexibles, lo que significa que hay 28(o 256) direcciones IP disponibles para la red, que van desde 192.0.2.0 a 192.0.2.255. Se permite que el cuarto dígito decimal cambie de 0 a 255. 

![[{6F7FE841-B2CC-48D4-9AF8-940813A40A57}.png]]
MODELO OSI
![[{BDE66E57-15AB-4E1F-A8EA-7B7997A4EA5E}.png]]
	

#### amazon vpc
permite controlar recursos de red virtual, osea intervalo de IPs , creacion de subredes tanto publicas como privadas, configuracion de tablas de enrutamiento y gateways de red y tambien utilizar varias capas de seguridad.
es tu pequeño trozo de la red AWS
![[{669BD306-2E7E-4248-A077-7715F21DFE15}.png]]
![[{66C279A1-6411-40D8-9C27-C42707E960C6}.png]]
por cada subred que crees aws reserva 5 direccciones ip en ese bloque para:
![[{000C3605-4FB1-4836-B8C7-0126CB9F4EA6}.png]]


![[{177A89D3-6F22-4769-8B97-FF773AA1E062}.png]]
una interfaz de red elastica es una interfaz de red virtual que se puede asociar y desasociar de una instancia, cuando se asocia a una interfaz tambien lo hacen sus atributos.

**Tablas de enrutamiento y rutas**
contienen un conjunto de reglas que puede configurar para dirigir el trafico de red de la subred 
cada ruta / regla tiene un destino y un objetivo, cada subred esta asociada a una tabla de enrutamiento 

#### Redes de VPC
un gateway es un componente de VPC escalable, redundante y altamente disponible que permte comunicacion entre instancias de un VPC
tiene dos funciones 
1. dar un objetivo en las tablas de enrutamiento VPC para el trafico de internet
2. realizar la traduccion de dirreciones de red
la NAT proporciona traduccion de direcciones ip privadas a publicas




mejor usar un gateway nat que una instancia gateway
![[{6626BE42-8DA2-4E32-A30E-E0163A90B599}.png]]


inetrconexion de VPC puedes conectar VPC en su propia cuenta de AWS, entre regiones o cuentas de AWS sempre que las IPs no se superpongan .



AWS direct connect


puntos de enlace de la vpc
![[{FD895F0D-91A3-4D23-AA84-4E2823BB0DCB}.png]]

#### seguridad de VPC

grupos de seguridad
funcionan en el nivel de la instancia, para filtarr el trafico entrante y saliente
son el equivalente a firewalls. 
contienen reglas para configurar trafico entrante, el sliente siempre esta permitido


listas de control de acceso a la red
funcionan  en el nivel de subred, cada subred del VPC tiene que estar asociada a una ACL de subred.
por defecto admite todo el trafico ipv4 de entrada y salida
no tiene estado

![[{CB2F8444-C4BD-4102-ABE7-6D7F217415F2}.png]]

#### Amazon route 53
es un servicio web de DNS 
por ejemplo puede redirigir al balanceador de carga mas cercano al usuario

![[{E73C0B2B-2D84-4EE7-8522-970C3EFF06A7}.png]]
el failover permite mejorar la disponibilidad de las aplicaciones ofreciedndo copias de seguridad y ofrece healthcheck.


#### cloudfront
ayuda al rendimiento de la red
es un servicio rapido de entrega de contenido (CDN)
red global de edge servers 
precios de pago por uuso , modelo de autoservicio.



¡Claro! Aquí tienes un **resumen corto pero completo** de redes en AWS que te permitirá responder correctamente preguntas como las que hemos visto:


**1. VPC (Virtual Private Cloud)**
- **Tu red privada en AWS** - Aislamiento total
- **Al crear una VPC**: 
  - ✅ Se crea automáticamente: **Tabla de rutas principal**
  - ✅ Se crea automáticamente: **NACL por defecto** 
  - ✅ Se crea automáticamente: **Grupo de seguridad por defecto**
  - ❌ NO se crea: Internet Gateway, subredes, NAT Gateway

 **2. SUBNETS**
- **Tamaño mínimo**: `/28` = 16 IPs (11 utilizables)
- **Públicas**: Tienen ruta a Internet Gateway → Acceso directo a Internet
- **Privadas**: NO tienen ruta a Internet Gateway → Solo acceso saliente via NAT
- **Por defecto**: AWS NO crea subredes automáticamente

 **3. COMPONENTES CLAVE**
- **Internet Gateway**: Conexión a Internet para subredes públicas
- **NAT Gateway/NAT Instance**: Permite a subredes privadas acceso saliente a Internet
- **Tablas de Rutas**: Definen cómo fluye el tráfico
- **Security Groups**: Firewall a nivel de instancia (STATEFUL)
- **NACLs**: Firewall a nivel de subred (STATELESS)

 **4. CONECTIVIDAD INTERNET**
```
Subred Pública: EC2 → Internet Gateway → Internet
Subred Privada: EC2 → NAT Gateway → Internet Gateway → Internet
```

 **5. INFRAESTRUCTURA GLOBAL**
- **Regiones**: Ubicaciones geográficas principales
- **Availability Zones**: Centros de datos dentro de regiones
- **Edge Locations**: Puntos perimetrales para CloudFront (baja latencia)

**6. SEGURIDAD**
- **Security Groups**: Protegen instancias EC2 (la respuesta correcta)
- **Por defecto**: Todo denegado (Security Groups) / Todo permitido (NACL por defecto)


1. **¿Qué se crea por defecto en VPC?** → Tabla de rutas principal
2. **¿Subred privada acceso Internet?** → Falso (solo via NAT)
3. **¿Mínimo tamaño subred?** → /28
4. **¿CloudFront baja latencia?** → Edge Locations
5. **¿Proteger instancias EC2?** → Security Groups


# Módulo 6: Cómputo

![[{135C5436-8ECC-4D44-8C5F-C4F64349EB2E}.png]]
![[{D2739204-24CA-4D09-A9C3-3FD4C3D4BAD5}.png]]

#### AMAZON EC2
ELASTIC COMPUTE CLOUD
PROPORCIONA CAPACIDAD DE COMPUTO
proporciona MV  en la nube (maquinas virtuales de normalmente linux)
se lanzan desde AMI que son las imagenes como una ISO

**lanzar una instancia EC2**
1. elegir AMI , la plantilla que contiene un sistema Windows o Linux y algun otro software instalado.
2. elegir el tipo de instancia, lo que determina la RAM, CPU, ALMACENAMIENTO, RED, el nombre de la instancia consta de familia generacion tamaño, ej. t3.large.
3. configuracion de red. donde implementar la instancia, identificar la VPC yla subred, decidir la asignacion de IP publica etc...   
4. Rol de IAM (opcional), asociarle el rol de IAM adecuado, nunca almacenar credenciales de AWS en una instancia sino, dale un rol de IAM a la instancia.
5. especificar un script de datos de usuario (opcional) que se ejecuta la primera vez que se inicia
6. especificar el almacenamiento , configurar el volumen raiz, por cada volumen hay que especificar el tamaño del disco GB, tipo de volumen (EBS, EC2, EFS, S3), si el volumen es volatil o persistente y si usar ciifrado o no.
7. AGREGAR ETIQUETAS que es la forma en que se asocian metadatos a una instancia EC2, para filtrado, automatizacion y control.
8. configurar el grupo de seguridad, conjunto r¡de reglas de firewall que controla el trafico a la instancia, creas reglas que especifican el origen y los puertos que las comunicacioes de red pueden usar
9. par de claves existente o crear uno nuevo, que consta de clave publica que AWS almacena y una privada que tu almacenas

tambien se puede lanzar desde la CLI como:
![[{6C2D153D-6CE9-4410-A21E-A6C65E01FF03}.png]]

![[{0B1CF433-05AE-4203-8D10-C9FA18918BDE}.png]]
![[{5B64F280-8AEF-401D-9731-466F54398A4E}.png]]
METADATOS DE UNA INSTANCIA
son los datos de la instancia que  se pueden ver asi - En un navegador: `http://169.254.169.254/latest/meta-data/`
    
- En una ventana de terminal: `curl http://169.254.169.254/latest/meta-data/`

![[{B235F495-B7A0-4158-9511-6EAD3DEF8F8A}.png]]
#### OPTIMIZACION DE COSTE
![[{FA64E62D-D1F0-4ABE-8CB8-4353D06F9876}.png]]

![[{E5D7132E-9A5A-4958-8C13-D32DD8ADD1BC}.png]]
![[{F4F31519-8CA1-4B24-B1D8-FE0D0433B48B}.png]]

LOS CUATRO PILARES DE OPTIMIZACION DE COSTE
- Adaptacion del tamaño , usa metricas de amazon cloudwatch.
- Aumento de la elasticidad, detenga instancias inactivas , usa escalado automatico.
- Modelo de precios optimo, combine tipos de compra
- Optimizacion de las opciones de almacenamiento, cambie el tamaño y tipo de volumen EBS

#### servicios de contenedores
son un metodo de virtualizacion del sistema operativo, que  contiene una aplicacion y sus dependencias y configuraciones correspondientes, en vex de contener in sistema operativo como una maquina virtual corre en el sistema operativo existente.
contiene todo lo que necesita una aplicacion de software para ejecutarse.
lo que las hace repetibles, rapidas, autonomas y mas pequeñas que una vm.

**Docker**
es una plataforma que permite crear probar e implementar aplicaciones ,
permite ejecutar contenedores

![[Pasted image 20260120205527.png]]


**Kubernetes**
es un software de codigo abierto para la organizacion de ocntenedores, permite administrar contenedores a escala y complementa a docker el cual permitia ejecutar varios contenedores en un mismo host y kubernetes permite organizar varios hosts de docker.

![[{9FA9EEF0-5F95-4FB1-9F26-8150E86D8C48}.png]]
![[{B9BB5B44-1DEB-4DF4-BD72-27F6C4F08E90}.png]]


#### AWS lambda
ejecutar funciones, codigo sin servidores, soslo se ejecuta cuando se desencadena por un evento
![[{663D2B5C-1A3D-4590-ACCF-5B6C4EC103D5}.png]]


**Amazon elastic beanstalk**
pone en marcha aplicaciones web gestiona los siguiente: 
![[{D9CAA399-6A91-40EF-88C7-A077CB9B8CDC}.png]]

subes el código y beanstalk lo implementa en servidores automáticamente




8-12






# Módulo 7: Almacenamiento
#### Amazon EBS
almacenamiento no volatil, que se adjuntan a una instancia EC2 y se replica en cada zona de disponibilidad
puedes escalar arriba o abajo
permite crear volumenes de almacenamiento individuales y asociarlos a una instancia de EC2.
EBS ofrece alamcenamiento a nivel de bloques.
los volumenes se replican automaticamente dentro de la zona de disponibilidad.
una snapshot  captura una copia del EBS .

caracteristicas:
- snapshots de un mmento dado que permite crear un volumen nuevo en cualquier momento., el coste es de GB mensual de datos almacenados
- cifrado volumen de EBS cifrados sin coste adicional, 
- elasticidad, aumento de capacidad
- las transferencias entrantes son gratuitas pero las transferencias de datos salientes entre regiones valen dinero
![[{82F4AA59-B824-49A9-A767-B3E6E5196FF0}.png]]
Amazon EBS proporcionavolúmenesde almacenamientoenelnivelde bloquepara utilizarloscon instanciasAmazon EC2. Los volúmenesde Amazon EBS son almacenamientofuerade la instanciaque persistecon independenciade la vidaútilde unainstancia. Son análogasa losdiscos virtualesde la nube. Amazon EBS proporcionatrestiposde volúmenes: SSD de usogeneral, SSD de IOPS provisionadasy magnético. Los trestiposde volúmenesdifierenencuantoa las característicasde rendimientoy elcosto, porlo que puedeelegirelrendimientoy elpreciode almacenamientoadecuadospara las necesidadesde las aplicaciones.Los beneficiosadicionalesincluyenla replicaciónenla mismazona de disponibilidad, elcifradofácily transparente, volúmeneselásticosy elrespaldomedianteelusode instantáneas

#### AMAZON S3
ALAMCENA DATOS COMO OBJETOS DENTRO DE RECURSOS DENOMINADOS BUCKETS
osea si deseas modificar un archivo despues de la modificacion tienes que subir el archivo modificado completo
![[{42B310FC-29D0-4F72-9706-D5BD39D54EB8}.png]]

puedes controlar quien interactua y como con el bucket, un bucket se asocia con una regin y en esta region se agrega redudndancia conectandola con varias zonas de disponibilidad.
es un buen lugar para albergar copias de seguridad y almacenamiento.
![[{5F714A75-DE09-48A9-B253-F055D9C7B30A}.png]]
![[{BF17EAEA-C767-4702-B1D9-EB56A23E9E67}.png]]

#### AWS EFS (ELASTIC FILE SYSTEM)
Almacena archivos en la nube aws, capacidad elastica y compatibilidad con todas las AMIS  de linux.
es ideal para big datas, analisis , flujos de trabajo de procesamiento de medios digitales 
solo pagas por lo que usas.
![[{22B77F9F-E934-4C1F-AA85-DC601C509E74}.png]]
propiedades:

![[{C4710B4C-E26A-4228-A8A0-09F082EF6ECE}.png]]
![[{A3721BFA-177E-422F-ACAC-2792F73F5D1F}.png]]
#### AWS S3 GLAZIER
servicio de almacenamiento de datos seguro duradero y de muy bajo coste pero los datos  tardan mucho en salir (horas) 
hay 3 maneras de sacar datos
standard 3-5 hr              bulk  5-12 hr                expedite 1-5 min

con políticas de ciclo de vida se puede mover o  eliminar objetos en función de su antigüedad.
![[{0FA03012-FDEB-4DDE-95B4-7AD0342260BA}.png]]

S3 GLAZIER tiene mayor latencia, mayor almacenamiento menor costo y mayor precio de recuperacion que amazon S3
ademas en S3 glazier el cifrado es opcional no como en S3 donde es la forma predeterminada
se le puden poner acceso IAM y cifrar con SHA256

![[{0B0ADE1E-AC0D-4FE3-A9D7-BBB3EC1DBF83}.png]]

![[{A1763CE5-A003-4D54-BA4C-E418A756CA5B}.png]]
# Módulo 8: Bases de datos
servicios  administrados; escalado, tolerancia a errores y disponibilidad son integrados en el servicio.
no administrados; tu administras el escalado, la tolerancia a errores y la disponibiidad


bases de datos relacionales; eres responsable del mantenimiento, parches, seguridad...
RDS es para administrar las bases de datos relacionales
![[{63F24A7A-F24B-4757-B769-68D3CE425E33}.png]]
![[{F25499D2-7ABA-4E0E-A720-E322DDB070E4}.png]]

permite replicas que se pueden promover a principal si es necesario
![[{C32A0442-6E6A-4C00-B8A4-7847CCC0EDE0}.png]]
transferencias entrantes son gratis las salientes no

#### DYNAMO DB
trabaja con  bases de datos no relacionales (noSQL)
diferencias entre amabas:
![[{D8C64F40-686B-49BF-B456-24776D766471}.png]]

DYNAMODB servicio de base de datos NoSQL rapido y flexible a escala,
todos los datos se almacenana en solido.
componentes principales son los elementos, las tablas y los atributos.
tiene dos tipos diferentes de claves principales:
clave de particion                                                            clave de particion y organizacion


#### Amazon Redshift
almacen de datos para analisis de datos
consta de un nodo principal que administra las comunicaciones con los programas cliente 
y los nodos de cómputo

ejecutan el código compilado y devuelven resultados parciales al nodo principal para su

agregación final
![[{729F7CB6-49FB-4A90-AA76-34709AAB8BDE}.png]]

#### Amazon Aurora
Base de datos relacional de clase empresarial compatible con Myql y postgreSQL
Automatiza tareas.
es altamente disponible y facil de configurar
paga por lo que usas
# Módulo 9: Arquitectura en la nube
#### Marco de una buena arquitectura
una guia para el diseño de infraestructuras sean seguras tengan buen rendimiento resilientes y eficaces.
**tiene 5 pilares:**
#### excelencia operativa,
ejecute y monitoriza sistemas para ofrecer valor de negoocio y mejorar procesos y procedimientos.
realiza operaciones como codigo, comentar sobre la documentacion , hacer cambios pequeñis, frecuentes y reversibles.
prever errores y aprender de ellos.
#### seguridad,
proteger informacion , sistemas y recursos mientras se aporta valor al negocio con evaluaciones de riesgo.
una base solida de identidades, habilitar trazabilidad, aplicar seguridad en todas las capas, automatizar practicas de seguridad, proteger datos en transito y reposo, mantener los datos fisicamente protegidos, preparase para eventos de seguridad.

#### fiabilidad,
evita los errores y recuperate rapidamente de ellos, 
configuracion, requisitos entre proyectos planificacion de la recuperacion, gestion de cambios.
prueba procedimientos de recuperacion, recuperate automaticamente de errores, escala horizontalmente  para aumentar disponibilidad, evita tener  que estimar la capacidad, administra cambios en la automatizacion.

planifica y espera que todo falle
![[{EBD55CC8-33D1-48E6-9E68-A414CC9E3B10}.png]]
![[{675080A6-E9EF-47CA-B6A6-CEF67D2F282B}.png]]



#### eficacia del rendimiento, 
Utiliza la IT y los recursos informaticos de forma eficaz para cumplir los requisitos del sistema y mantener la eficacia a medida que cambia la demanda y evolucionan las tecnologias.

democratiza las tecnologias avanzadas, adquiere escala mundial  en minutos, utiliza arquitecturas sin servidor, ten compatibilidad mecanica
#### optimizacion de costos.
ejecuta sistemas para aportar valor al negocio al menor precio
adopta un modleo de consumo, mejora la eficacia general, deja de gastar dinero en las operaciones de data centers, analiza y atribuye los gastos, utiliza servicios administrados del nivel de aplicacion 

**AWS TRUSTED ADVISOR**
permite diseñar y revisar tu arquitectura que da consejos sobre optimizacion de coste, rendimiento, seguridad, tolerancia a errores y limites de servicio



# Módulo 10: Escalado automático y supervisión

#### ELASTIC LOAD BALANCING
distrbuye trafico entrante de las aplicaciones o de la red entre varios destinos en una zona de disponibilidad o varias,
hay 3 tipos:
![[{79096F04-AA44-4127-BB61-3B7A62949815}.png]]


un balanceador de carga lleva a cabo comprobaciones de estado para monitorear los destinos registrados.
![[{64B847BB-6CE5-4491-8FB8-19CE61204E08}.png]]
#### Amazon cloudwatch
para monitorear AWS  de manera eficiente
monitorea recurosos y aplicaciones ejecutandose en AWS
recopila metricas estandar o personalizadas.
puedes enviar notificaciones y alarmas que envien o hagan algo.

puedes crear alarmas en funcion de un limite estatico, detecccion de anomalias o expresion matematica de metricas

##### EC2 autoscaling
mantiene la disponibilidad de las aplicaciones,
permite agregar o eliminar automaticamente instancias EC2 y detecta si esta s estan dañadas y las reemplaza.
si tu trafico es mas o menos predecible se puede usar escalado automatico.

grupos de autoscaling una coleccion de instancias de EC2 que se pueden configurar con limites de capacidad.
![[{B08E4507-C0F8-4387-99ED-572E2D62183D}.png]]
![[{C71FF57E-DE35-429E-A32C-7977345CEADE}.png]]
