# Informe sobre la Aplicación de la Sostenibilidad y la Economía Circular en un Centro de Datos

Mohamed Kamil El Kouarti Mechhidan
20/12/2025
## Introducción

Si fuera un especialista contratado por un proveedor de nube, propondría medidas para transformar el centro de datos principal que consume como una ciudad de 50K habitantes en un modelo de economía circular. Mi objetivo sería bajar el consumo energético, optimizar el uso de recursos y minimizar residuos, sin comprometer la fiabilidad del servicio.
voy a proponer ideas prácticas y justificadas, alineadas con los criterios ASG, con los ODS y con los conceptos de sostenibilidad.

## Conceptos Clave

### Sostenibilidad
Poder **satisfacer necesidades del presente sin comprometer las de las generaciones futuras** equilibrio entre actividades humanas y la preservación de recursos naturales de nuestro planeta, Asi el desarrollo económico, social y ambiental sea viable a largo plazo.

**En mi contexto, la sostenibilidad está influida por su eficiencia energética**, medida por el **PUE** *(efectividad del uso de energía)*. que depende de la edad y el diseño de la instalación, el uso de los equipos, la eficacia de los sistemas de enfriamiento, los requisitos de redundancia y el clima .

### Economía Circular
modelo de producción y consumo que promueve alquilar, reutilizar, reparar, renovar y reciclar productos para alargar su vida útil y reducir residuos.
mientras la economía lineal desecha tras el uso, la circular **optimiza los recursos y minimiza el desperdicio**, creando un **círculo virtuoso** donde los desechos de un proceso se vuelven el inicio de otro, extendiendo así la vida útil del hardware y recuperando materiales.

**Se integra en todas las etapas**, desde producción hasta el fin de vida, con métricas como **ScE** *(eficiencia de servidores)* y **DCcE** *(eficiencia del data center)* para medir la circularidad.

### Criterios ASG
marco para evaluar el desempeño ético y sostenible de una organización. Tiene tres aspectos:
- El aspecto **Ambiental** abarca el impacto medioambiental, emisiones y uso de recursos, y se relaciona con las operaciones de TI para mejorar la eficiencia.
- El **Social** evalúa las relaciones con la sociedad e incluye el bienestar de la comunidad.
- El  **Gobernanza** abarca la gestión responsable, las políticas transparentes y el cumplimiento normativo.

miden cómo un centro de datos contribuye a un desarrollo global y consideran áreas transversales para reportar emisiones mediante los **Alcance 1 (directas), Alcance 2 (indirectas por energía comprada) y Alcance 3 (cadena de suministro)**.
Se traducen en marcos que analizan categorías operativas, como la gestión de TI y de la instalación y la estrategia transversal, siguiendo métricas como PUE,consumo de agua, emisiones de C y la gestión del ciclo de vida del hardware.

### Objetivos de Desarrollo Sostenible (ODS)
17 objetivos establecidos por NU en la Agenda 2030, para acabar con la pobreza, protejer el planeta y dar prosperidad a todos.  resuelve problemas globales como el hambre, la desigualdad y el cambio climatico.
En mi contexto, los ODS más importantes son el **7 (Energía asequible y no contaminante)**, el **9 (Industria, innovación e infraestructura)**, el **12 (Producción y consumo responsables)**, el **13 (Acción por el clima)** y el **6 (Agua limpia y saneamiento)**, ya que promueven la eficiencia energética, la innovación sostenible, la gestión circular de recursos y el balance entre eficiencia operativa y reducción de la huella de carbono.

## Propuestas para la Sostenibilidad y Economía Circular

presentare ideas para aplicar estos conceptos al data center. Cada propuesta la justifico basandome en prácticas recomendadas, la relaciono con los criterios ASG y los ODS, y busco el equilibrio entre la mejora de la eficiencia y la reducción de impactos ambientales.

### 1. Optimización Energética a Través de la Gestión de Equipos de TI
el equipo de TI introduce caracteristicas de manejo de consumo energético, aprovecha la virtualización y maximiza el uso de cada servidor. ay que registrar el uso de energía y ajustar las operaciones para evitar la subutilización, con tareas en menos servidores activos.

**justificación:** la energía consumida por un centro de datos se vuelve calor que se desperdicia en el ambiente. Factores como la edad de las instalaciones afectan el PUE, por lo que maximizar el uso de los servidores *(ej. consolidando tareas)* reduce el consumo innecesario, equilibra eficiencia energética, emisiones de carbono, ahorra recursos y costos operativos, y mejora el rendimiento.

**Relación con ASG:**
- **Ambiental:** reduce el consumo energético y las emisiones asociadas *( Alcance 2).*
- **Social:** Mejora la eficiencia del servicio, haciéndolo mas accesible y confiable para la comunidad.
- **Gobernanza:** necesitas politicas documentadas para el monitoreo y reporte de métricas energéticas, asegurando transparencia.

**Relación con ODS:** Se alinea con:
- **ODS 7:** prioriza la eficiencia energética, justificada por la optimización del PUE.
- **ODS 9:** fomenta la innovación en infraestructura a través de la virtualización y gestión inteligente.
- **ODS 12:** promueve consumo responsable al optimizar el uso de recursos existentes sin expansiones innecesarias.

maximizar el uso de servidores mediante virtualización y gestión del consumo, midiendo con **ScE** *(tiempo que tarda un servidor en realizar su servicio primario)* y **DCcE** *( ScE promedio en el centro de datos)* para evitar sub-uso.  Es clave definir los servicios primarios y secundarios de cada equipo.

### 2. Aprovechamiento del Calor Residual
Capturar el calor generado por los servidores y reusarlo para otros fines, como calefacción en edificios cercanos o para sistemas internos, colaborando con municipios y proveedores de energia.

**Justificación lógica:** La energia usada en centros de datos se vuelve  calor. pero el 90% de esa energia puede recuperarse con intercambiadores de calor, sistemas de transporte y bombas de calor *(usando agua como medio, más eficiente que el aire)*.  reduce el desperdicio, y estabiliza la eficiencia energética al quitar la dependencia de chillers. convierte un efecto colateral en un recurso promueve un ciclo cerrado.
usa **servidores con refrigeración liquida** aunque parezca contraproducente genera calor mas concentrado y aprovechable. Usar agua como medio estabiliza el PUE y vuelve el desperdicio en recurso circular 

**relación con ASG:**
- **Ambiental:** Reduce el impacto térmico y, al reutilizar la energia, evita emisiones de otras fuentes *(reduce emisiones de Alcance 3 para los usuarios del calor).*
- **Social:** Beneficia a la comunidad local al dar calefacción asequible, mejorando el bienestar.
- **Gobernanza:** Exige la creación de acuerdos y marcos de colaboración con proveedores de energía y consumidores de calor, fomenta la gestión responsable.

**Relación con ODS:**
- **ODS 7:** Al reutilizar energia térmica, prioriza energía no contaminante y mejora la eficiencia global.
- **ODS 9:** Innova en el uso de infraestructuras existentes para nuevos propósitos.
- **ODS 13:** Mitiga el cambio climático al reducir la demanda de energia primaria para calefaccion, disminuyendo emisiones indirectas.

*Implementación:* capturar y reutilizar hasta el 90% del calor con sistemas de agua para calefaccion locales, cerrando el ciclo de la energía.

### 3. Gestión Sostenible del Agua
tener un registro detallado del uso de agua y un plan de reducción, que incluya la captacion de agua de lluvia y reutilizarla en ciclos de enfriamiento.

**Justificación:** Los centros de datos consumen agua para enfriamiento y factores como el clima o la antiguedad de las instalaciones influyen en la eficiencia . llevar un registro permite identificar ineficiencias y bajar el consumo, crucial para conservar un recurso escaso y mantener operaciones estables. Usar agua del entorno como sumidero térmico es eficiente y baja la necesidad de sistemas mecanicos, ya que el agua refrigera el calor y permite temperaturas de trabajo de 18-27°C sin afectar el PUE. 

**Relación con ASG:**
- **Ambiental:** Conserva recursos hidricos y minimiza la contaminacion y el estrés sobre fuentes locales *(impacto en Alcance 3).*
- **Social:** Al reducir la extraccion de agua, se mejora su disponibilidad para las comunidades y ecosistemas cercanos.
- **Gobernanza:** Requiere mecanismos de reporte, auditoría y cumplimiento de directivas de eficiencia hidrica, integrando planes de conservación en la gestion de instalaciones.

**relación con ODS:** 
- **ODS 6:** Gestiona el agua de manera sostenible, justificado por la mejora de la métrica WUE (*efectividad del uso del agua*).
- **ODS 12:** Fomenta un consumo responsable del recurso.
- **ODS 13:** Contribuye a la resiliencia climática al reducir la vulnerabilidad ante sequías.

*Implementacion:* Registrar y reducir el uso de agua con captación de lluvia y sistemas de reutilización hasta 7 ciclos, midiendo y optimizando el **WUE**,  fácil de medir y  util para la circularidad en el enfriamiento.

### 4. Aplicación de Principios de Economía Circular en el Hardware
reparar, reutilizar y reciclar hardware, alargando la vida útil de servidores con mantenimiento predictivo y creando un banco de componentes para reusar piezas en aplicaciones menos críticas.

**Justificación :** el hardware tiene un ciclo de vida finito, pero el desmonte y  reutilización evitan los residuos electrónicos. Evaluar el ciclo de vida maximiza el valor de los activos existentes, reduce la necesidad de nuevos materiales y minimiza impactos ocultos, como las emisiones en la fabricación.

antes de comprar hardware, solicita una **Declaración Ambiental de Producto (EPD)** para evaluar sus emisiones de producción y los impactos en todas las etapas de su vida.

La **modularizacion mediante centros de datos en contenedores** facilita la reutilizacion y la flexibilidad operativa. Se recomienda su uso porque son componentes prefabricados, repetibles y fáciles de ensamblar, logran mayor eficiencia energética y mayores densidades de potencia.

**Relación con ASG:**
- **Ambiental:** reduce residuos electronicos y las emisiones asociadas a la manufactura de nuevos equipos *(Alcance 3).*
- **Social:** promueve empleos locales en sector de reparacion, reacondicionamiento y reciclaje.
- **Gobernanza:** establece políticas para la gestion de activos, la selección de proveedores sostenibles y la implementación de cadenas de suministro circulares.

**Relación con ODS:** 
- **ODS 9:** A través de la innovación en infraestructura reutilizable y modular.
- **ODS 12:** al implementar una producción y un consumo responsables, justificado por la extensión de la vida útil y la minimización de residuos.
- **ODS 13:** Al reducir la huella de carbono del ciclo de vida completo del hardware.

*Implementación:* Extender la vida útil del hardware hasta 6 años o mas con mantenimiento predictivo y un banco de componentes, siempre considerando las emisiones incorporadas desde la producción.

### 5. Estrategia General de Sostenibilidad y Reporte
asegurar que el diseño del centro y la selección del terreno se alineen con objetivos de sostenibilidad, establecer planes para medir y reducir emisiones *(alcances 1, 2 y 3)*, y reportar métricas como capacidad, utilización y tráfico de datos.

**Justificación :** Tener objetivos claros y mecanismos de reporte es crucial para equilibrar la eficiencia energética y la reducción de carbono. Evaluar los riesgos climáticos y adoptar energías renovables previene interrupciones futuras y garantiza la resiliencia.

**Ampliar los límites de temperatura y humedad** dentro de los rangos permitidos por estándares como **ASHRAE** mejora la eficiencia energética sin dañar el equipo, ya que reduce la necesidad de enfriamiento mecánico y permite mayor uso de enfriamiento gratis con aire exterior. Los rangos típicos vienen de hardware anticuado.

usar métricas como el **DCcE** y reportar las emisiones de manera transparente fomenta la mejora continua y la rendición de cuentas. necesitas un plan de eficiencia en marcha que capture, registre y reporte estas métricas .

**Relación con ASG:**
- **Ambiental:** aborda de manera integral las emisiones directas e indirectas y los riesgos climáticos físicos y de transición.
- **Social:** Integra los principios de sostenibilidad en los servicios de nube, generando un beneficio societal más amplio.
- **Gobernanza:** enfatiza la estrategia organizacional de alto nivel, las políticas de compra verde, la transparencia y el reporte a inversores y reguladores.

**Relación con ODS:** 
- **ODS 7:** al priorizar la adopción de energías renovables para el centro.
- **ODS 13:** Al tomar acción climática concreta mediante la medición y reducción de la huella de carbono.
- **ODS 12:** al garantizar un consumo y un reporte responsables ante todos los grupos de interés.

*Implementación:* Alinear el diseño y la operación con objetivos documentados, reportando anualmente las emisiones *(Alcances 1-3)* y optimizando los rangos operativos de temperatura y humedad según los estandares actuales.

## Conclusión

La aplicación de la sostenibilidad y la economía circular en este centro de datos no necesita tecnicas complejas, sino un enfoque en optimización de recursos, reutilización y gestión responsable. Estas propuestas si se aplican bien van a reducir impactos ambientales mientras mantienen la fiabilidad. Y posicionaría a la empresa como líder en infraestructuras digitales sostenibles.

## Referencias
[Navigating the Energy Efficiency Directive](https://uptimeinstitute.com/uptime_assets/33b60d1dc5b8fb1e606b875bf4611b2594edd449b0dea13ffaa81fc5739d7849-GA-2025-08-navigating-the-energy-efficiency-directive.pdf)  
[Consumo de electricidad en España](https://data.worldbank.org/indicator/EG.USE.ELEC.KH.PC?view=map)  
[Calculating Work Capacity for Server and Storage Products](https://uptimeinstitute.com/uptime_assets/2033f0416dba01c18d81ffc0ac7e856af2b0786d302d92616b5cbea69f3b9362-GA-2025-06-calculating-work-capacity-server-storage-products.pdf)  
[Reuso del calor, Uptime](https://intelligence.uptimeinstitute.com/sites/default/files/2023-10/Briefing%20Report%20114_Heat%20reuse%20a%20management%20primer.pdf)  
[The Ultimate Liquid Cooling Heat Rejection into Water](https://journal.uptimeinstitute.com/the-ultimate-liquid-cooling-heat-rejection-into-water/)  
[Webinar Sustainability and Water](https://connect.uptimeinstitute.com/webinars/webinar-sustainability-and-water-emerging-challenge)  
[Large Data Centers Are Mostly More Efficient](https://journal.uptimeinstitute.com/large-data-centers-are-mostly-more-efficient-analysis-confirms/)  
[Sustainability 3-pager (Dec 2024)](https://datacenter.uptimeinstitute.com/rs/711-RIA-145/images/Dec2024.Sustainability.3pager.pdf?version=0)  
[Open Compute Project – Hardware Management](https://www.opencompute.org/projects/hardware-management)  
[Uptime Institute Sustainability Assessment](https://uptimeinstitute.com/about-ui/press-releases/uptime-institute-launches-uptime-institute-sustainability-assessment-for-digital-infrastructure?utm_source=chatgpt.com)  
[OCP Carbon Disclosure Specification](https://www.opencompute.org/documents/carbon-disclosure-ocp-base-specification-20250730-pdf?utm_source=chatgpt.com)  
[Deploying and Using Containerized Modular Data Center Facilities](https://www.thegreengrid.org/system/files/store/2025-02/WP%2342_Deploying%20And%20Using%20Containerized%20Modular%20DataCenter%20Facilities.pdf)  
[Data Centre Life Cycle Assessment Guidelines](https://www.thegreengrid.org/system/files/store/WP45v2DataCentreLifeCycleAssessmentGuidelines.pdf)  
[Data Center Efficiency and IT Equipment Reliability](https://www.thegreengrid.org/system/files/store/2025-02/WP%2350-Data%20Center%20Efficiency%20and%20IT%20Equipment%20Reliability%20at%20Wider%20Operating%20Temperature%20and%20Humidity%20Ranges.pdf)  
[Water Usage Effectiveness (WUE)](https://www.thegreengrid.org/system/files/store/WUE_v1.pdf)  
[Data Center Compute Efficiency (DCcE)](https://www.thegreengrid.org/system/files/store/DCcE_White_Paper_Final.pdf)