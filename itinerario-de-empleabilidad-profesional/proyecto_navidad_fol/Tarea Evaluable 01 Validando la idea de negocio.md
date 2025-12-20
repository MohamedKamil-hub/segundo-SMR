[ver en GitHub]()
### 1. La idea
Soy Mohamed Kamil el kouarti la idea que e propuesto se me ocurrió mientras trabajaba con Zabbix. Estaba ajustando umbrales de alerta para CPU y pensé que en vez de solo avisar cuando ya está todo mal, sería mucho mejor que el sistema pudiera predecir problemas y dejar probar sus soluciones sin riesgo.

Lo llamaría **Arki** y seria una herramienta Monitorización Predictiva con Agentes Ligeros y Sandbox de Simulación que combina:
1. **Agentes ligeros** de 10MB RAM escritos en Rust 
2. **Análisis predictivo** basado en tendencias y correlaciones no solo umbrales fijos
3. **Sandbox integrado** pruebas soluciones sin tocar servidores reales


### 2. Descripción detallada 
ARKI , un sistema de monitorización de servidores y aplicaciones, un agente siempre presente como **daemon** escrito en Rust, que pesa 10 MB de RAM y latencia de milisegundos .

**El flujo completo seria:**
1. Un **agente Rust** en cada server que recoge métricas cada 30s
2. Envía los datos ya comprimidos al **TimescaleDB**
3. El motor de análisis detecta patrones e identifica las tendencias y correlaciones
4. Si se detecta algún problema se ve en el panel y cuanto falta hasta que ocurra.
5. Se puede probar la solución en un sandbox de **Docker**.
6. Ver los resultados y decidir si aplicar la solución o no.

Lo que lo diferencia de Zabbix es que en vez de umbrales fijos, usa umbrales dinámicos basados en relaciones entre métricas y permite probar la solución en un entorno aislado antes de ver si aplicar o no dicha solución.

##### Para evitar falsos positivos:
**no alerta por picos temporales** de menos de 2 minutos, además se **considera el contexto y patrones conocidos** como un backup nocturno o si ya se alertó recientemente sobre lo mismo. Usa un **sistema de votación simple con 3 algoritmos básicos** , uno busca la tendencia, otro la correlación y  el tercero un patrón histórico y solo alerta si al menos 2 coinciden.
las alertas son en Email por SMTP o a Telegram.
Tras una alerta hay un enfriamiento de 30 minutos

El **dashboard en Grafana** incluiría un plugin personalizado para mostrar el tiempo estimado hasta fallo, predicciones activas, y botón para activar el sandbox. 
se podría meter ML para predecir fallos avanzados, simulaciones automáticas en el sandbox, analizar resultados y dar mas opciones. 

**ARKI Identifica el eslabón perdido:** Entre la alerta y la acción hay un vacío de **confianza**. Mi  sandbox es el puente para llenar ese vacío.
#### Stack
**Agentes en Rust**
- 5-10MB RAM   con latencia de menos de 10ms 
- Se instala como servicio normal .rpm
- recoge CPU, memoria, discos, procesos, servicios, logs...

**Backend**
- FastAPI fácil de mantener
- TimescaleDB PostgreSQL para series temporales
- Autenticación JWT y API keys 
- Algoritmos de predicción en Python numpy, pandas para ML 

**Dashboard: Grafana y plugin personalizado:**
- Plugin nuestro para predicciones activas, sandbox, gestión de alertas

**Sandbox con Docker**
- Contenedores de solo lectura, sin red, sin privilegios
- Levanta copias de servicios como Apache, MySQL ,Nginx ...
- Permite ejecutar comandos y ver sus resultados

**MONETIZACION**
Seria gratis y de código abierto cualquiera puede usarlo y modificarlo sin pagar.
Ganaría dinero con soporte técnico, consultorías, versión gestionada en la nube SaaS, características avanzadas para grandes empresas y donaciones voluntarias.




### 3. MVP
- **Agente básico en Rust:** 
	Un daemon que monitoriza y solo recolecta métricas de CPU y memoria RAM, cada 30 segundos, con latencia baja.

- **Backend mínimo:** 
	FastAPI para recibir datos de los agentes con 3 puntos finales de metricas, alertas y el sandbox. y guardarlos en TimescaleDB. autenticación con API keys.

- **Predicción simple:** 
	Umbrales dinámicos basados en tasas de cambio  y correlaciones entre métricas.  votación con un solo algoritmo en vez de 3 . que  calcula la tendencia lineal de la RAM en las últimas 2 horas. Si la proyección indica que se alcanzará el 90% en las próximas **4 horas**, genera una alerta predictiva.
    *Se omite la correlación múltiple y los otros 2 algoritmos para simplificar.*

- **Dashboard**: Grafana (un solo panel que muestra RAM a tiempo real y su tendencia) y un plugin simple que muestre predicciones activas y el boton de activar sandbox.

- **Sandbox:** 
	Un contenedor Docker básico donde probar 2 comandos,  reiniciar servicio y eliminar conexiones/cache, 
	al pulsarlo se despliega un contenedor aislado con una replica del servidor y registra el resultado.

- **Frontend:** 
	Dashboard en Grafana con paneles para métricas, predicciones, y botón para activar sandbox.

- **Notificaciones** Webhook a Telegram, mas facil que SMTP

Me enfocaría en lo básico para ver si la idea funciona sin gastar ni tiempo ni recursos. En **el MVP no se incluiría**  la monitorización del resto de métricas, el ML completo, automatización , soporte para muchos tipos de métricas, Dashboard personalizable, autenticación compleja, enfilamiento de alertas, ni  firecracker  para dar a Docker mas aislamiento .



La prioridad es el sandbox es la cualidad de ARKI mas unica, lo primero que desarrollatria seria el contenedor de aislamiento ya que es lo que diferencia a ARKI de su competencia.
El MVP de Arki se centra en validar la **propuesta de valor central**: la predicción simple y la posibilidad de probar una solución en el sandbox.


**Validación del MVP:**
- **Técnicas:** ¿El agente consume mas o menos 10MB? ¿La latencia es  menor a 10ms? ¿La predicción se dispara con 40m-4h de antelación en tests controlados?

- **De Usuario:** De las 15-20 personas que lo prueben:
    - mas del 70% considera útil la **alerta predictiva** frente a una alerta tradicional?
    - mas del 70% ve valor en el **sandbox** para probar la acción "limpiar cache"?
    - al menos un 30% preguntaría por **soporte** o una versión más completa?

Este MVP es limitado. Su éxito no se mide por las características, sino por la **validación** de las dos hipótesis principales: que los usuarios quieren un entorno seguro para probar soluciones.

### 4. Público ideal
Administradores de sistemas , equipos de DevOps,  freelancers y pequeñas empresas que gestionan sus propios servidores.  Gente que ya usa Zabbix o similar pero se frustra con alertas constantes y quiere algo más inteligente sin pagar licencias . 


### **5. Cuestionario para consultar si la idea es viable**
**Hipótesis** es que el publico general usaría gratis el sistema predictivo, y algunos pagarían por soporte y consultoría.

Para **validar** haría un cuestionario  de 10 preguntas en Google Forms y lo compartiría en foros como Reddit, LinkedIn y a compañeros del curso. Y conseguirá un grupo de 15-20 personas que pruebe el MVP

- **Preguntas sobre el problema:** 
1. ¿Cuántas veces al mes recibes alertas falsas o innecesarias en tu monitorización ?
2. ¿Has tenido downtime que podría haberse evitado con alertas más tempranas?
3. ¿Te ha pasado que una acción correctiva empeoró la situación?

- **Sobre la solución:**
1. ¿Usarías un sistema que predice fallos con tendencias en vez de umbrales fijos?  
2. ¿Te parece útil probar soluciones en un sandbox antes de aplicarlas en producción? 
3. ¿Te sería útil recibir alertas predictivas en lugar de reactivas?  
4. ¿Prefieres algo ligero y modular o suites complejas?

- **Sobre el beneficio:** 
1. Cuánto tiempo y dinero ahorrarías con alertas predictivas , 30-60min antes?
2. ¿Pagarias por soporte si el software es gratis?
3. ¿Usarías una versión de nube gestionada por 30€ mes?

####  Comprobar hipótesis
Buscaría que al menos el 70% valoren la característica del entorno aislado y las alertas preventivas, el 30% estén dispuestos a pagar por soporte y consultas y el 40% valore la versión de nube

Si **no logro los resultados deseados** reevaluaría el modelo y vería que característica cambiar, eliminar o añadir.
**los** **riesgos** serian que Rust es menos popular y mas difícil que Python, Zabbix y prometheus son  muy conocidos y la mayoría de empresas son muy conservadoras en ese aspecto y mantener TimescaleDB, Docker y Rust podria ser complejo.

[Ver en GitHub](https://github.com/MohamedKamil-hub/segundo-SMR/blob/main/itinerario-de-empleabilidad-profesional/Tarea%20Evaluable%2001%20Validando%20la%20idea%20de%20negocio.md)