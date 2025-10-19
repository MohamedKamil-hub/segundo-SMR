
## **Unidad 3: Redes y cómputo en la nube**

### **Sesión 6: VPC y subredes públicas/privadas**

- **VPC**: Red privada virtual aislada dentro de un proveedor cloud (AWS, Azure, GCP).
  - Ventajas:
    - Flexibilidad total para modificar topologías.
    - Seguridad granular con Security Groups y Network ACLs.
    - Escalabilidad automática con servicios de cómputo.

- **Subredes**:
  - **Subred pública**: Recursos accesibles desde Internet (ej: servidores web). Conectada a un **Internet Gateway**.
  - **Subred privada**: Recursos internos (ej: bases de datos). Sin acceso directo a Internet; usan **NAT Gateway** para salida controlada.

- **Componentes clave**:
  - **Security Groups**: Filtran tráfico a nivel de instancia.
  - **Network ACLs**: Reglas a nivel de subred.
  - **Tablas de rutas**: Dirigen el tráfico dentro de la VPC.

---

### **Sesión 7: Balanceo de tráfico y DNS en AWS**

- **Alta disponibilidad**: Garantizar que el servicio funcione incluso ante fallos.

- **Load Balancers**:
  - **ALB**: Nivel 7 (HTTP/HTTPS), ideal para aplicaciones web y APIs.
  - **NLB**: Nivel 4 (TCP/UDP), baja latencia.
  - **GLB**: Para integración de firewalls y appliances.

- **Route 53**:
  - Servicio DNS gestionado.
  - Funciones:
    - Asignación de dominios.
    - Enrutamiento inteligente (latencia, geografía, peso, failover).
    - Health checks y failover automático.

- **Arquitectura HA típica**:
  - Instancias en múltiples AZ.
  - Route 53 + Load Balancer + Health Checks + Failover.

---

### **Sesión 8: EC2, Contenedores y Lambda**

- **EC2**:
  - Máquinas virtuales con control total del SO.
  - Ideal para aplicaciones tradicionales o que requieren personalización.
  - Responsabilidad: mantenimiento, parches, seguridad.

- **Contenedores (Docker, ECS, EKS)**:
  - **Docker**: Empaqueta aplicación y dependencias.
  - **ECS**: Servicio gestionado para contenedores (con Fargate o EC2).
  - **EKS**: Kubernetes gestionado por AWS.
  - Ideales para microservicios y CI/CD.

- **Lambda**:
  - Cómputo serverless.
  - Ejecuta código en respuesta a eventos.
  - Pago por uso, escalado automático, sin mantenimiento de servidores.

- **Comparativa**:
  - **Control**: EC2 (alto) → Contenedores (medio) → Lambda (bajo).
  - **Escalado**: EC2 (manual/Auto Scaling) → Contenedores/Lambda (automático).
  - **Coste**: EC2 (por instancia) → Contenedores (por tarea) → Lambda (por invocación).

---

## **Resumen Final para Examen**

- **VPC**: Red virtual con subredes públicas/privadas, IGW, NAT Gateway.
- **Seguridad**: Security Groups (instancia) y Network ACLs (subred).
- **Alta disponibilidad**: Load Balancer + Route 53 + múltiples AZ.
- **Cómputo**:
  - **EC2**: Control total, mantenimiento por usuario.
  - **Contenedores**: Aislamiento, ideal para microservicios.
  - **Lambda**: Serverless, ideal para eventos y automatizaciones.
- **Herramientas clave**:
  - Redes: VPC, IGW, NAT, Security Groups, ACLs.
  - HA: ALB, NLB, Route 53, Health Checks.
  - Cómputo: EC2, ECS, EKS, Lambda, Auto Scaling, CloudWatch.
