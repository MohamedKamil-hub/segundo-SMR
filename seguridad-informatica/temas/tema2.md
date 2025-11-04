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

#### NFTables (Sustituto de IPTables)

- **Comandos básicos**:
    
    - `sudo nft list ruleset`: Muestra la configuración actual.
        
    - `sudo nft add table <familia> <nombre>`: Crea una tabla.
        
    - `sudo nft add chain <familia> <tabla> <cadena> {type filter hook <hook> priority <valor>;}`: Crea una cadena.
        
    - `sudo nft add rule <familia> <tabla> <cadena> <condición> <acción>`: Añade una regla.
        
- **Familias de protocolos**: `ip` (IPv4), `ip6` (IPv6), `inet` (IPv4 e IPv6), `arp`, `bridge`, `netdev`.
- **Hooks**: `prerouting`, `input`, `output`, `forward`, `postrouting`.
- **Acciones**: `accept`, `drop`, `log`, `counter`.
- **Ejemplos de reglas**:
    - `ip saddr <IP> drop`: Bloquear por IP de origen.
        
    - `tcp dport <puerto> drop`: Bloquear por puerto de destino.
        
    - `limit rate <tasa> accept`: Limitar tráfico.

####  Controles Detectivos

- **Objetivo**: Identificar incidentes mientras ocurren o después.
- **Herramientas**:
    - **Snort (NIDS)**: Detección de intrusos en red.
        
        - Comandos: `sudo snort -T -i eth0 -c /etc/snort/snort.lua` (test), `sudo snort -A console -i eth0 -c /etc/snort/snort.lua` (consola).
            
    - **OSSEC/Wazuh (HIDS)**: Monitorea logs y archivos del sistema.
        
        - Comando: `sudo tail -f /var/ossec/logs/ossec.log`.
            
    - **Zeek**: Analizador de tráfico que genera logs detallados (conn.log, http.log, dns.log).
        
        - Comando: `sudo zeek -i eth0`.
            


#### Controles Correctivos**

- **Objetivo**: Mitigar daños y restaurar la normalidad tras un incidente.
    
- **Ejemplos**:
    
    - Restauración de backups.
        
    - Reparación de sistemas físicos.
        
    - Actualización de políticas.
        
    - Reentrenamiento del personal.
        
- **Herramientas**:
    - **Fail2Ban**: Bloquea IPs tras intentos fallidos.

        - Configuración en `/etc/fail2ban/jail.d/`.
            

#### Plan de Recuperación ante Desastres (DRP)

- **Objetivo**: Recuperar sistemas y operaciones críticas tras un desastre.
- **Componentes clave**:
    
    - **BIA (Análisis de Impacto en el Negocio)**: Identifica procesos críticos.
        
    - **RTO (Tiempo Objetivo de Recuperación)**: Tiempo máximo para restaurar operaciones.
        
    - **RPO (Punto Objetivo de Recuperación)**: Cantidad máxima de datos perdidos aceptable.
        
    - **Estrategias**: Copias de seguridad, redundancia, sistemas alternativos.
        
    - **Pruebas y mantenimiento**: Simulaciones y actualizaciones periódicas.
        

#### Comandos Importantes

- **NFTables**:
    - `sudo nft list ruleset`
        
    - `sudo nft add rule ip tabla cadena ip saddr 192.168.1.1 drop`
        
    - `sudo nft flush ruleset` (borra todas las reglas)
        
- **Snort**:
    - `sudo snort -T -i eth0 -c /etc/snort/snort.lua`
        
- **Fail2Ban**:
    - `sudo fail2ban-client status sshd`


**Resumen Final para el Examen**  
Controles preventivos = primera línea de defensa.  
Elementos clave: antivirus, firewall, actualizaciones y copias de seguridad.  
Caso WannaCry ³ evidenció la importancia de parches y backups (más de  
200.000 equipos afectados en 150 países).  
Prevención = reducción de riesgos, ahorro de costes y continuidad del negocio.