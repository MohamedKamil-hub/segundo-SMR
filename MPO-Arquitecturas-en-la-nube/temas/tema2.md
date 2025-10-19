## Infraestructura y seguridad esencial

#### Sesión 3: Regiones, zonas y alta disponibilidad (los 6 nueves)
La infraestructura global de los grandes proveedores cloud ofrece servicios accesibles, rápidos y resilientes desde cualquier lugar del mundo. Esto se logra con una organización en capas geográficas y de redundancia:

**Regiones**
Cada región es un área geográfica amplia. Una región suele contener varias zonas de disponibilidad.

**Zonas de disponibilidad (AZs)**
Son centros de datos físicos e independientes dentro de una región, conectados con baja
latencia. Su independencia permite que, si uno falla, otro asuma la carga.

**Edge locations**
Son puntos de presencia en diferentes ciudades que sirven para caché, CDN y entrega acelerada
de contenidos, acercando los datos al usuario.

El objetivo de esta arquitectura es lograr alta disponibilidad que no implica que nunca haya fallos, sino que la probabilidad de impacto para el usuario es mínima gracias a redundancia y recuperación rápida.

#### **Herramientas y Consejos**  

**Diseña multi-AZ desde el inicio**  
Usa servicios gestionados que ya soportan este diseño: Amazon RDS Multi-AZ, Azure SQL 
Consejo: nunca despliegues toda tu aplicación en una sola zona

**Aprovecha Content Delivery Networks (CDNs)**  
Herramientas: Amazon CloudFront, Azure Front Door, Google Cloud CDN.  
Consejo: cachea contenidos estáticos (imágenes ...) en edge locations para reducir latencia global.  

**Replicación de datos automática**  
Usa almacenamiento con replicación integrada: Amazon S3 Cross-Region Replication, Azure Blob 
Consejo: activa replicación en regiones  distintas para protegerte frente a desastres.  

**Revisa los SLA de tus servicios**  
Consulta las garantías de disponibilidad  que ofrece cada proveedor 
Consejo: usa estos datos para diseñar  redundancia adicional si tu negocio necesita más fiabilidad

#### Mitos y Realidades  

Mito: "Si mi aplicación está en la nube, ya es  automáticamente  altamente disponible."  
La realidad: la alta disponibilidad depende de cómo diseñes la arquitectura, no solo del proveedor. 

Mito: "Los seis nueves significan cero fallos."  
FALSO.  significa que la probabilidad de caída es extremadamente baja, pero no  inexistente.  

###### Resumen Final  
Regiones = áreas geográficas con múltiples AZs.  
Zonas de disponibilidad = centros de datos independientes dentro de una región.  
Edge locations = aceleran entrega de contenido cerca del usuario.  
Alta disponibilidad (6 nueves) requiere diseño con redundancia y replicación, no basta con usar la nube


#### Sesión 4: Modelo de responsabilidad compartida  
La seguridad en la nube sigue un modelo de **responsabilidad compartida**: el proveedor cubre una parte y el cliente debe encargarse de la otra.

**Proveedor cloud (seguridad de la nube):**  
Gestiona la seguridad física de los centros de datos, el hardware, la infraestructura de red, la virtualización y la disponibilidad de los servicios básicos. los  servidores están en edificios protegidos con controles de acceso  biométricos, electricidad redundante y  climatización óptima.  

**Cliente (seguridad en la nube):**  
Decide cómo se usan esos servicios. incluye la configuración de accesos (IAM), definición de políticas de seguridad, cifrado de datos, gestión de credenciales y la arquitectura de la aplicación. 

Un error común es pensar que al subir tus datos a la nube ya están seguros por defecto. 
Este modelo se adapta según el tipo de servicio:  

En **IaaS**, el cliente gestiona más (sistema operativo, parches, configuraciones).  
En **PaaS**, el cliente se enfoca en la aplicación y los datos.  
En **SaaS**, la responsabilidad se reduce a la gestión de accesos y configuración de usuarios.  

#### Herramientas y Consejos  

**Refuerza la gestión de identidades y accesos**  
Usa servicios como AWS IAM, Azure Active Directory (Entra ID) o Google IAM.  
Aplica el principio de mínimos privilegios: da a cada usuario solo los permisos necesarios.  
Consejo: revisa mensualmente las políticas para detectar accesos innecesarios.  

**Automatiza auditorías de seguridad**  
Herramientas: AWS Trusted Advisor, Azure Security Center (Defender for Cloud), GCP Security Command Center.  
Detectan buckets abiertos, configuraciones inseguras o vulnerabilidades.  
Consejo: activa alertas automáticas para actuar antes de que ocurra un incidente.  

**Protege datos con cifrado y autenticación fuerte**  
Cifra datos en tránsito (TLS/SSL) y en reposo (AES-256, KMS, HSM).  Activa MFA en cuentas críticas. 
Consejo: centraliza claves y secretos con AWS KMS, Azure Key Vault o Google Cloud KMS.  

**Documenta responsabilidades internas**  
Define claramente qué tareas corresponden a TI, desarrollo y compliance.  
Consejo: incluye la seguridad en cada sprint o ciclo de desarrollo (DevSecOps)



#### Mitos y Realidades  

Mito: "El proveedor se encarga de toda la seguridad."  
FALSO. El proveedor asegura la infraestructura física y la virtualización,  el cliente asegura accesos, datos y configuraciones. 

Mito: "La responsabilidad compartida es igual en todos los servicios."  
FALSO. En IaaS, gestionas mucho más. En SaaS, solo accesos y datos.  

##### Resumen Final  
Responsabilidad compartida: proveedor asegura la nube, cliente asegura su uso.  
Proveedor = centros de datos, hardware, redes.  
Cliente = accesos, configuraciones, cifrado, usuarios.  
Errores más comunes: configuraciones inseguras (ej. buckets públicos)


#### Sesión 5: IAM básico y MFA  
La gestión de identidades y accesos (IAM, Identity and Access Management) permite controlar quién puede hacer qué dentro de una cuenta cloud, cada persona, aplicación o servicio tiene únicamente los permisos necesarios.  

los errores más comunes vienen de usar una cuenta (root) para todo o compartir credenciales **IAM** soluciona este problema creando usuarios individuales, grupos con permisos específicos, roles temporales para servicios y  políticas que definen reglas de acceso en formato JSON. La clave es aplicar el principio de  mínimos privilegios: dar el permiso justo y necesario, nunca más.  

A IAM se le suma un refuerzo crítico: la autenticación multifactor (MFA, Multi-Factor  
Authentication). MFA exige un segundo factor de validación.


#### Herramientas y Consejos  

**1  No uses nunca la cuenta root para tareas diarias** .solo para configuraciones iniciales críticas.  
guarda sus credenciales en un gestor seguro y activa MFA.  
**2  Crea usuarios individuales y aplica mínimos privilegios**  ,AWS IAM, Azure Active Directory 
Consejo: asigna permisos graduales;
**3  implementa MFA obligatoria en accesos críticos** Microsoft Authenticator, Authy, YubiKey.  
Consejo: empieza por administradores y luego extiende MFA a todos los usuarios.  
**4  Automatiza auditorías de accesos** IAM Access Analyzer (AWS), Azure AD Identity Protection, 
Consejo: revisa permisos al menos una vez al trimestre para detectar excesos.  
**5  Integra IAM con SSO (Single Sign-On)**  Permite que los empleados usen una sola identidad corporativa para acceder a  varios sistemas.  Herramientas: Azure AD SSO, Okta, Auth0.  



#### Mitos y Realidades  

Mito: "Con una contraseña segura basta para proteger la  nube."  
La realidad: sin MFA, un atacante con la contraseña entra sin obstáculos.  

Mito: "IAM es solo para empresas grandes."  
La realidad: IAM escala desde pequeñas empresas hasta multinacionales.  

**Resumen Final**  
IAM: gestiona identidades, accesos y permisos (usuarios, grupos, roles, políticas).  
MFA: añade una segunda capa de seguridad esencial contra robos de contraseñas.  
Buenas prácticas: no usar root, aplicar mínimos privilegios, activar MFA en cuentas críticas.  
IAM + MFA = base de la seguridad cloud y requisito en auditorías de cumplimiento