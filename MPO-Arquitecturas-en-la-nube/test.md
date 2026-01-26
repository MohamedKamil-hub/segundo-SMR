P: ¿Qué requisito de TI indica elegir IaaS?
A) Mantener la máxima flexibilidad sobre recursos de TI. *
B) Ejecutar una instancia administrada para clientes.
C) Controlar aplicaciones evitando mantenimiento de servidores.
D) Usar un servicio de correo web.

P: Ventaja de PaaS sobre otros modelos:
A) Es similar a infraestructura local.
B) Reduce la implementación de aplicaciones.
C) Da el mayor control de recursos.
D) Evita gestionar sistemas operativos. *

P: Una empresa pasa de infraestructura local a la nube. Principal ventaja:
A) Prever capacidad excesiva de TI.
B) Escalar recursos según demanda. *
C) Mantener control total de hardware.
D) Incrementar gastos fijos.

P: Cómo ayudan las economías de escala en la nube:
A) Escalan servidores horizontalmente.
B) Permiten implementar recursos globalmente.
C) Reducen costos variables y permiten escalar más allá de lo local. *
D) Dan control total de infraestructura.

P: Qué mejora el aprovisionamiento en la nube:
A) Bloquear recursos a nivel individual.
B) Los recursos se amplían o reducen según la demanda. *
C) Pronosticar costos exactos siempre.
D) Picos y valles de uso como en local.

P: Perspectiva empresarial del marco AWS:
A) Evaluar estructuras y roles organizativos.
B) Usar modelos de arquitectura para entender sistemas de TI.
C) Crear argumento empresarial sólido y priorizar adopción. *
D) Centrarse en habilidades y procesos de TI.

P: Visualizar costos de EC2 últimos 3 meses:
A) AWS Budgets
B) Página AWS Bills
C) Explorador de costos AWS *
D) Calculadora de precios

P: Panel de facturación para identificar ahorros:
A) Muestra modelos de precios y nivel gratuito.
B) Enumera cuentas con actividad 6 meses.
C) Enumera costos por región y cuentas vinculadas.
D) Muestra servicios con mayor gasto del mes. *

P: Verdadero sobre regiones AWS:
A) Todas habilitadas por defecto.
B) Región cercana a usuarios reduce latencia. *
C) Todas las cuentas acceden a todas las regiones.
D) No hay restricciones geográficas.

P: Relación regiones – zonas de disponibilidad – centros de datos:
A) Cada zona incluye centros de datos de distintas regiones.
B) Cada región tiene zonas de disponibilidad; cada zona tiene centros de datos. *
C) Zonas conectan regiones.
D) Cada región tiene centros de datos asignados a zonas.

P: Responsabilidad compartida AWS:
A) Los clientes gestionan sus datos. 
B) AWS protege la infraestructura física. *
C) AWS decide qué cifrar en S3.
D) AWS configura grupos de seguridad.

P: Acceso temporal entre cuentas:
A) Crear política IAM para acceso directo.
B) Crear rol IAM que puedan asumir usuarios externos. *
C) Crear usuario IAM por cada externo.
D) Crear grupo IAM y agregar usuarios externos.

P: Protección de datos en tránsito:
A) HTTP se cifra con TLS.
B) KMS cifra datos entre servicios.
C) TLS cifra datos en tránsito. *
D) Certificados TLS gestionables con ACM.

P: Capacidad de VPC:
A) Cambiar rango de IP tras creación.
B) Puede abarcar varias zonas de disponibilidad. *
C) Aislamiento físico real.
D) Puede pertenecer a varias regiones.

P: Configurar VPC para aplicación web:
A) Crear tabla de enrutamiento principal.
B) Crear subred pública y privada. *
C) Especificar rango IP VPC.
D) Eliminar ruta local de tabla.

P: Amazon Route 53 – enrutamiento latencia:
A) Detectar interrupciones y redirigir.
B) Dirigir tráfico a región con mejor experiencia. *
C) Solo donde hay derechos de distribución.
D) Enrutamiento A/B por porcentaje.

P: Red de entrega de contenido (CDN):
A) Conexiones entre servidores de origen.
B) Almacena en caché archivos solicitados con frecuencia. *
C) Grupo regional de servidores.
D) Acelera resolución de nombres.

P: Uso válido de grupo de seguridad:
A) Limitar acceso a subred privada.
B) Limitar tráfico saliente a servidor específico. *
C) Regla de denegación de tráfico.
D) Denegar acceso desde Internet.

P: ¿Qué significa “SaaS” en la nube?
A) Servicio de almacenamiento seguro
B) Software como servicio *
C) Sistema como servicio
D) Seguridad como servicio

P: ¿Cuál es un beneficio principal de la nube?
A) Mayor necesidad de servidores físicos
B) Escalabilidad rápida según demanda *
C) Necesidad de infraestructura local
D) Costos fijos más altos

P: ¿Qué servicio de AWS permite almacenar objetos de datos?
A) Amazon S3 *
B) Amazon EC2
C) Amazon RDS
D) AWS Lambda

P: ¿Qué es una subred en una VPC?
A) Un centro de datos completo
B) Una división de la VPC para organizar recursos *
C) Una cuenta de usuario de AWS
D) Un tipo de CDN

P: ¿Qué significa “elasticidad” en la nube?
A) Capacidad de cambiar proveedor de nube
B) Capacidad de ampliar o reducir recursos automáticamente *
C) Seguridad de datos en reposo
D) Reducción de costos fijos

P: Si tienes una VPC con rango 10.0.0.0/16 y creas una subred 10.0.1.0/24, ¿cuántas direcciones IP privadas hay en esa subred?
A) 16
B) 128
C) 256
D) 251 *

P: En AWS, ¿qué debes hacer para que una subred 10.0.2.0/24 tenga acceso a Internet?
A) Crear otra VPC
B) Adjuntar una puerta de enlace de Internet a la VPC y actualizar la tabla de rutas *
C) Cambiar el rango de la VPC
D) Configurar AWS Shield

P: Si quieres aislar instancias dentro de 10.0.3.0/24 para que solo accedan a recursos internos de AWS, ¿qué tipo de subred debes usar?
A) Subred pública
B) Subred privada *
C) Subred compartida
D) Subred híbrida

P: En una VPC con red 10.0.0.0/16, ¿cuál es el propósito de dividirla en varias subredes?
A) Evitar el uso de grupos de seguridad
B) Organizar recursos y controlar la disponibilidad y seguridad *
C) Reducir la latencia de Internet
D) Permitir que la VPC se conecte a otra región automáticamente

P: ¿Cuál es la relación entre la VPC 10.0.0.0/16 y las subredes 10.0.1.0/24 y 10.0.2.0/24?
A) Son rangos de IP independientes fuera de la VPC
B) Deben estar en diferentes regiones
C) Las subredes son divisiones del rango de la VPC y no pueden superponerse *
D) Las subredes siempre deben ser públicas

P: ¿Para qué sirve AWS CloudTrail?
A) Ejecutar instancias de EC2
B) Registrar actividad de la cuenta y llamadas a API *
C) Monitorear el clima
D) Crear bases de datos SQL

P: ¿Qué función tiene un grupo de seguridad en AWS?
A) Crear regiones
B) Controlar tráfico entrante y saliente de instancias *
C) Almacenar datos
D) Analizar costos de la nube