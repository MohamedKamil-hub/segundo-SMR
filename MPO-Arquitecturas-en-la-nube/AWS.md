
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













Módulo

7: Almacenamiento

•

Módulo

8: Bases de datos

•

Módulo

9: Arquitectura en la nube

•

Módulo 10: Escalado automático

y supervisión

AWS Training and Certification

Introducción al curso

© 2024, Amazon Web Services, Inc. o sus filiales. Todos los derechos reservados.

10