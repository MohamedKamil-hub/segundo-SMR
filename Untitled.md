# Guía Maestra de Defensa: Proyecto OEDON (PaaS Invisible)

## 1. La Esencia de OEDON: El Elevator Pitch

OEDON no es simplemente otra herramienta de despliegue; es una respuesta estratégica a la "fatiga de interfaces" y a la complejidad innecesaria en la administración de sistemas. Definido como un **Invisible Control Plane**, su nombre rinde homenaje a la mística de _Bloodborne_: un ser que carece de forma física pero cuya presencia es omnipresente. En términos de ingeniería, esto se traduce en un sistema que no exige atención continua, no consume recursos visibles y devuelve al administrador el control total desde el terminal.

- **Definición Estratégica:** OEDON es una plataforma PaaS (Platform-as-a-Service) autoalojada y minimalista, diseñada para el despliegue de aplicaciones contenidas en hardware modesto. Su arquitectura se basa exclusivamente en **Nginx Alpine, Docker y una CLI robusta escrita en Bash**.
- **La Filosofía KISS:** Al eliminar radicalmente las interfaces gráficas (GUIs) y las bases de datos de configuración, OEDON reduce la superficie de ataque y elimina la opacidad operativa. El control se ejerce mediante texto plano, garantizando que el administrador siempre sepa qué está ocurriendo bajo el capó.
- **Indicadores de Valor:**
    - **Eficiencia Extrema:** Una huella de memoria inferior a **10MB de RAM** en estado idle (gracias al uso de Nginx Alpine).
    - **Velocidad de Respuesta:** Despliegue de un servidor completo, seguro y funcional en menos de **15 minutos**.
    - **Reproducibilidad IaC:** Implementación real de Infraestructura como Código; el repositorio Git es la fuente de verdad única y absoluta.

La simplicidad de OEDON no es falta de potencia, sino la máxima sofisticación técnica aplicada para resolver problemas reales en entornos donde cada ciclo de CPU es un recurso crítico.

--------------------------------------------------------------------------------

## 2. El Diagnóstico: El Problema con el "ClickOps"

En la formación de un administrador de sistemas, herramientas como _Nginx Proxy Manager_ o _Portainer_ son útiles para el aprendizaje inicial, pero representan un techo técnico y una vulnerabilidad estratégica para perfiles senior que buscan automatización real y soberanía de datos.

1. **Análisis de Deficiencias:** Basándonos en las limitaciones del mercado actual, las soluciones convencionales presentan fallos inasumibles:
    - **Dependencia de Bases de Datos:** Herramientas como NPM requieren MariaDB o SQLite para gestionar simples virtual hosts, añadiendo puntos de fallo y latencia innecesaria.
    - **Consumo Desproporcionado:** Interfaces basadas en Node.js o agentes de monitorización como Netdata consumen entre 150MB y 300MB de RAM. En un hardware de 512MB, esto es un desperdicio del 60% de los recursos antes de desplegar la primera app.
    - **Opacidad y Falta de Versionado:** Las configuraciones "escondidas" en bases de datos impiden el uso de Git para auditoría y recuperación ante desastres.
2. **El "So What?" Layer:** Para el profesional que busca soberanía técnica, depender de un panel web es aceptar una "deuda de control". Si la GUI falla o el socket de Docker se corrompe, el administrador queda ciego. OEDON elimina el intermediario para asegurar que la automatización sea resiliente y auditable.
3. **Justificación del Nicho:** OEDON no compite con gigantes como Heroku, sino que lo interrumpe. Mientras Heroku impone costes de **7 USD/mes por dyno** y limita el control sobre el SO, y alternativas como Railway, Render o Fly.io abstraen la infraestructura hasta hacerla inútil para requisitos específicos de hardware, OEDON permite al usuario ser su propio proveedor de cloud con control total y coste cero de software.

--------------------------------------------------------------------------------

## 3. Arquitectura Técnica: El Plano de Control Invisible

La longevidad de un servidor depende de una arquitectura desacoplada y basada en archivos de texto. OEDON garantiza que el estado sea efímero y la configuración sea permanente y versionable.

- **Flujo de Despliegue:** El proceso utiliza el registro declarativo `apps.list`. Mediante el comando `oedon deploy`, el sistema invoca `envsubst` para inyectar variables en plantillas dinámicas, generando Vhosts de Nginx validados en tiempo real.
    - _Ejemplo de registro:_ `wordpress | 9000 | blog.dominio.local`
- **Componentes Core:** La arquitectura se organiza en tres capas de aislamiento, comunicadas a través de la red aislada `oedon-network`:

|   |   |   |
|---|---|---|
|Nivel|Componente|Función Principal|
|**Security Layer**|Portero Digital / UFW|Acceso _stealth_ (Port Knocking) y filtrado restrictivo.|
|**Proxy Layer**|Nginx Alpine (Docker)|Terminación SSL, enrutamiento y `oedon-network` isolation.|
|**Application Layer**|Docker Containers|Microservicios (WordPress, Notary, Static Apps).|

- **La Capa de Automatización:** El binario `oedon` actúa como dispatcher central, orquestando el ciclo de vida completo (subcomandos `monitor`, `health`, `stats`, `add`, `remove`). Es una implementación pura de IaC que permite que un `git clone` y un `oedon deploy` reconstruyan un centro de datos entero en minutos.

--------------------------------------------------------------------------------

## 4. El Factor Diferencial: Portero Digital y Notary Service

En OEDON, la seguridad es un componente de diseño, no un añadido posterior.

1. **Portero Digital (Stealth Access):** Es un servidor de _Port Knocking_ basado en **Pure Python** (sin dependencias externas). Utiliza **HMAC-SHA256 con marcas de tiempo (timestamps)** y una tolerancia de ±30 segundos para prevenir ataques de _replay_. Al recibir un paquete UDP firmado en el puerto 62201, abre el puerto 22 solo para la IP del emisor durante 60 segundos. Esto elimina por completo la superficie de ataque de fuerza bruta en SSH.
2. **Notary Service (Integridad):** Un microservicio Flask que protege la _supply chain security_. Gestiona un registro JSON de hashes de las aplicaciones autorizadas. Mediante los endpoints `/verify` (consulta pública) y `/sign` (protegido por la cabecera **X-Oedon-Key**), permite detectar modificaciones no autorizadas en el código desplegado, marcando aplicaciones como `COMPROMISED` si hay discrepancias.
3. **Hardening Activo:** Integración nativa de UFW y Fail2Ban con "jails" personalizadas para Nginx. El sistema no solo bloquea, sino que aprende de los patrones de tráfico malicioso, manteniendo una postura de denegación por defecto.

--------------------------------------------------------------------------------

## 5. Operaciones y Resiliencia: El Guardián del Sistema

La observabilidad es crítica en sistemas sin supervisión humana constante. OEDON está diseñado para la auto-recuperación autónoma.

- **Watchdog y Alertas:** El script `oedon-watchdog.sh` se ejecuta vía cron cada **5 minutos**. Verifica umbrales de salud (Disco >85%, RAM >90%) y el estado de los contenedores. Si detecta una caída, ejecuta un reinicio automático y notifica vía Telegram. Incluye un mecanismo de **cooldown de 30 minutos** para evitar tormentas de alertas.
- **Mantenimiento Automatizado:**
    - `**janitor**`**:** Limpieza de imágenes huérfanas y rotación de logs.
    - `**backup**`**:** Dumps de bases de datos y tarballs de infraestructura enviados a Telegram.
- **Dashboard de Terminal (MOTD):** Al conectar por SSH, el administrador visualiza un dashboard dinámico con métricas críticas: **Top CPU**, **Top MEM**, estado de los contenedores en `oedon-network` y **Failed login attempts (últimas 24h)**. Esta visibilidad inmediata permite diagnosticar problemas antes de ejecutar el primer comando.

--------------------------------------------------------------------------------

## 6. Simulador de Defensa: Preguntas Críticas del Jurado

_La defensa de OEDON debe basarse en una premisa: la simplicidad es la máxima sofisticación._

- **¿Por qué Bash y no Kubernetes?** Kubernetes es para clusters masivos. En el nicho de "hardware modesto" (Raspberry Pi/VPS barato), K8s consumiría el 80% de los recursos. OEDON opera con menos de 10MB de RAM, dejando el hardware libre para la aplicación, no para la orquestación.
- **¿Qué ocurre si la configuración de Nginx es errónea?** OEDON implementa un **rollback atómico** en `sync_apps.sh`. Antes de aplicar cambios, ejecuta `nginx -t`. Si la validación falla, el sistema restaura la última configuración conocida como buena, garantizando el _uptime_.
- **¿Cómo se gestiona SSL en diferentes entornos?** OEDON utiliza un flujo dual: **mkcert** para certificados locales de confianza en desarrollo y **Certbot** para la generación automática y renovación de certificados válidos en producción.
- **¿Es seguro Portero Digital si se compromete el secreto?** La seguridad se basa en HMAC-SHA256 y la rotación. Si hay sospecha de compromiso, el comando `oedon rotate` permite actualizar todos los secretos de la infraestructura de forma inmediata, invalidando cualquier paquete de acceso previo.
- **¿Cómo se garantiza la reproducibilidad?** A través del script `install.sh` y el registro `apps.list`. Al no existir estado oculto en bases de datos o interfaces gráficas, el sistema es totalmente portable: de servidor virgen a PaaS funcional en menos de 15 minutos.

**Consejo de Mentor:** Recuerde al jurado que en administración de sistemas, menos piezas móviles significan menos puntos de fallo. OEDON no es menos porque no tenga botones; es más porque no los necesita.