# Controles preventivos: antivirus, firewall, actualizaciones, copias de seguridad  

La **seguridad informática preventiva** se centra en anticiparse a los ataques antes de que  ocurran.
Los **controles preventivos más comunes** son:  

**Antivirus**  
detecta, bloquea y elimina software malicioso.  analiza archivos, descargas y procesos en ejecución, comparándolos  con firmas conocidas de malware y, 
en  muchos casos, usando análisis heurístico  para detectar amenazas nuevas. 
la mayoría incluyen  protección en la nube, sandboxing o control de comportamiento.  

**Firewall**  
muralla digital que  regula el tráfico de red entrante y saliente según reglas predefinidas. 
Puede ser **hardware** (appliance en empresa) o  **software** (Windows Defender Firewall).
bloquea accesos no autorizados, previene escaneos de puertos y limita la exposición a ataques externos.  

**Actualizaciones**  
exploits como EternalBlue, que dio origen  al ransomware WannaCry, afectaron  
principalmente a sistemas que no habían  instalado actualizaciones críticas.  

**Copia de seguridad**  
en caso de pérdida de datos, puedan ser restaurados.  anticipan el peor escenario: 
un fallo de hardware, un  ransomware o un error humano. 


**Esquema Visual**  
![[Pasted image 20251010192906.png]]
**Descripción detallada del esquema:**  
El **Antivirus** protege contra malware mediante detección y análisis en tiempo real.  
El **Firewall** filtra tráfico y bloquea accesos no autorizados.  
Las **Actualizaciones** corrigen vulnerabilidades y cierran puertas a atacantes.  
Las **Copias de Seguridad** aseguran la restauración de datos y la continuidad de la  
actividad en caso de incidente.



### **Herramientas y Consejos**
#### Antivirus recomendados: 
**Windows Defender:** integrado en Windows  
**ESET, Avast, Bitdefender:** con funciones avanzadas para entornos corporativos.  

#### Firewalls profesionales y domésticos: 
**pfSense**: solución open source   
**Fortinet o Palo Alto:** firewalls de nivel empresarial con funciones de filtrado  
avanzado y detección de amenazas.  

#### Sistemas de backup confiables:  
**Veeam** (empresas), **Acronis** (usuarios profesionales), **duplicity** (entornos Linux).  
aplica la regla 3-2-1:
3 copias, 2 en soportes distintos, 1 fuera de la ubicación  principal.


**Resumen Final para el Examen**  
Controles preventivos = primera línea de defensa.  
Elementos clave: antivirus, firewall, actualizaciones y copias de seguridad.  
Caso WannaCry ³ evidenció la importancia de parches y backups (más de  
200.000 equipos afectados en 150 países).  
Prevención = reducción de riesgos, ahorro de costes y continuidad del negocio.