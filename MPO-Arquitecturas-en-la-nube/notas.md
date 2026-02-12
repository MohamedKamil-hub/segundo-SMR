**Tipos de servicio en la nube**

**IaaS** mantienes máxima flexibilidad sobre los recursos de IT  
**PaaS** gestionas datos y aplicaciones pero evitas gestionar sistemas operativos.  
**SaaS**

La principal ventaja de la nube (aprovisionamiento en la nube) es que escalas o reduces recursos rápidamente según la demanda.  
Es elástica, osea amplía o reduce recursos automáticamente.

**Las economías de escala** reducen costos variables y permiten escalar más allá de lo local, a más crece un proveedor de nube (AWS, Azure...) más barato le resulta ofrecer cada servicio, lo cual beneficia a los clientes.

---

**Perspectiva empresarial del marco AWS**

Se enfoca en **el "por qué" del negocio** justificar la inversión en la nube y priorizar lo que trae más valor, no en los detalles técnicos.  
Crear argumento de negocio y priorizar (habla de dinero y estrategia).  
_"vamos a construir un edificio porque dará ganancias"_ (perspectiva empresarial), no _"cómo lo construiremos"_ (eso es otra perspectiva).

---

**Costos en AWS**

**Explorador de costos de AWS** permite ver por ejemplo, los costos de EC2 los últimos 3 meses.  
**El panel de facturación para identificar ahorros** muestra servicios con mayor gasto del mes.

---

**Infraestructura global de AWS**

Cada región tiene zonas de disponibilidad; cada zona tiene centros de datos.  
Una región cercana a los usuarios reduce la latencia.

---

**Modelo de responsabilidad compartida**

- Los clientes gestionan sus datos
    
- AWS protege la infraestructura física
    

---

**Identidad y acceso**

**ROL IAM** da acceso temporal entre cuentas, ya que asume usuarios externos.

---

**Seguridad en red**

Para proteger datos en tránsito se usa el TLS para cifrarlos.

---

**Redes en AWS (VPC)**

Una **VPC** puede abarcar varias zonas de disponibilidad.

Para una aplicación web se suele crear una subred pública y una privada.  
Una subred en una VPC es una división de la VPC para organizar recursos.

Dividir una subred permite organizar recursos y controlar la disponibilidad y seguridad.

Una subred privada permite que esa subred solo acceda a recursos internos de AWS.

En la VPC 10.0.0.0/16 y las subredes 10.0.1.0/24 y 10.0.2.0/24 las subredes son divisiones del rango de la VPC y no pueden superponerse.

**Cálculo de subredes**  
**10.0.1.0/24** cuántas IPs privadas hay en esa subred?  
32 - /24 = 8 → 2 elevado a 8 = 256 pero restamos 5 ya que AWS reserva 5 direcciones de cada subred. así que 251.

Para que una subred tenga acceso a internet tienes que adjuntar una puerta de enlace de internet a la VPC y actualizar la tabla de rutas.

---

**DNS y distribución de contenido**

El enrutamiento de latencia de Amazon Route 53 dirige el tráfico a la región con mejor experiencia.

Una red de entrega de contenido CDN almacena en caché archivos solicitados con frecuencia.

---

**Seguridad en instancias**

Los grupos de seguridad solo aplican a instancias, no aplican a la red, limitan el tráfico entrante y saliente a un servidor (instancia) específico.

---

**Servicios AWS**

- **S3** permite almacenar objetos de datos. debe actualizar todo el archivo

- **EBS** almacena los archivos como bloque, solo cambias lo que quieres del archivo
    
- **EC2** da servidores, máquinas virtuales, escalables
    
- **RDS** da bases de datos relacionales gestionadas. datos que no cambian rápido
    
- **Lambda** ejecuta código sin usar servidores
    

---

**Monitoreo y auditoría**

**AWS CloudTrail** registra actividad de la cuenta y llamadas a API.