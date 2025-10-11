Acceso remoto seguro (SSH, RDP, VNC, NX) 

**SSH vs Telnet. Instalación, configuración y gestión de servidores/clientes SSH. Autenticación, logs, túneles, SFTP/SCP** 

**SSH (Secure Shell).** sustituye a Telnet, que enviaba usuario, contraseña y datos en texto claro. SSH cifra la comunicación, autentica al usuario y habilita funciones como túneles, reenvío de puertos y transferencias seguras (SCP/SFTP). 
Con SSH puedes ejecutar comandos, automatizar tareas, mover ficheros y exponer servicios internos de forma segura . 
En Linux/Unix, el servicio es sshd (OpenSSH). 
En Windows, OpenSSH Server 

**Telnet**: legado, inseguro, solo para entornos de laboratorio aislados. 
**SSH**: protocolo seguro con servidor (sshd) y clientes (ssh, scp, sftp). 
**Autenticación**: claves (Ed25519/RSA) » contraseñas. 
**Observabilidad**: logs en Linux (journal/syslog) y Event Viewer en Windows. 
**Funciones avanzadas**: SFTP/SCP para ficheros y túneles para exponer servicios internos 
sin abrir puertos externos. 



#### Herramientas y Consejos (aplicabilidad inmediata) 
**Claves modernas y seguras** 
Genera y protege claves con derivación robusta: 
`ssh-keygen -t ed25519-a 100 -C "tu_correo@empresa"` 
-a 100 aumenta el coste de derivación (mejor contra fuerza bruta).
Protege la clave privada con passphrase y gestórala con ssh-agent. 

**Despliegue de la clave pública** 
Crea ~/.ssh/authorized_keys en el servidor con permisos correctos: 
`ssh-copy-id usuario@host` 
Verifica permisos: `chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys.` 

#### Endurecimiento de sshd (Linux)
Edita /etc/ssh/sshd_config con estas directivas para seguridad: 

`Protocol 2` 
`PermitRootLogin no` 
`PasswordAuthentication no` 
`PubkeyAuthentication yes` 
`ChallengeResponseAuthentication no` 
`AllowUsers usuario1 usuario2` 
`ClientAlivelnterval 300` 
`ClientAliveCountMax 2` 

Reinicia: sudo `systemctl restart ssh` o `sshd`. 
Opcional: cambia el puerto solo como medida complementaria 
#### OpenSSH en Windows 
**Instalación**: "Características opcionales" → OpenSSH Server. 
**Inicio**: `Get-Service sshd | Start-Service y Set-Service -Name sshd -StartupType 'Automatic'.` 
**Firewall**: `New-NetFirewallRule -Name ssh -DisplayName 'OpenSSH-Server' -Enabled True - Direction Inbound -Protocol TCP -Action Allow -LocalPort 22.` 

Transferencia Segura de Archivos  

SFTP (interactivo)
		sftp usuario@host  
		sftp> put backup.tar.gz  
		sftp> get logs.tar.gz  
		sftp> ls -la  
 
SCP (copia directa)  
		scp archivo.txt  
		usuario@host:/ruta/destino/  
		scp -r carpeta/  
		usuario@host:/ruta/remota/

**Túneles y Redirección de Puertos**  

**Local (-L)**   Accede a un servicio remoto como si fuera local.  
`ssh -L 8080:127.0.0.1:80 usuario@bastion`
`Navega a http://localhost:8080`

**Remoto (-R)**  Expone un puerto local en el servidor remoto
`ssh -R 9000:localhost:22 usuario@bastion` 

**Dinámico (-D)** Crea un proxy SOCKS para enrutar tráfico selectivamente. 
`ssh -D 1080 usuario@bastion` 

##### **Seguridad y Automatización** 

**fail2ban + firewall** 
Instala fail2ban, habilita jail para SSH y define ban temporal tras N intentos.  
Combina con UFW/iptables y allowlist de IPs corporativas
 
**Observabilidad y auditoría** 
Linux: journalctl -u ssh,  /var/log/auth.log, last -a, who.  
Windows: Event Viewer Applications and Services Logs 
OpenSSH/Operational. Integra con SIEM para alertas y  retención.

**Automatización de despliegue** 
Ansible (sobre SSH) para configurar usuarios, llaves, paquetes, servicios. Git + hooks para versionar sshd_config y plantillas de autorizaciones. 


**Resumen Final (para examen)** 
**SSH cifra; Telnet no**. SSH es el estándar para administración remota profesional. **Autenticación recomendada**: clave pública/privada (Ed25519/RSA) y, si procede, MFA. 
**Funciones clave: SFTP/SCP** para ficheros y túneles (-L/-R/-D) para servicios 
internos. 
**Endurecimiento y auditoría**: PermitRootLogin no, PasswordAuthentication no, fail2ban, logs y SIEM. 

### Escritorio remoto: RDP, VNC, NX. Instalación_y_ configuración en Linux y Windows. Casos de uso profesional 

Los tres protocolos principales en entornos profesionales son
RDP (Remote Desktop Protocol), 
VNC (Virtual Network Computing) 
NX (en sus implementaciones modernas como X2Go). 
comparten mismo objetivo: permitir al usuario controlar un entorno gráfico remoto como si estuviera físicamente frente al equipo. 

#### RDP: rendimiento y madurez en entornos Windows 
El Remote Desktop Protocol (RDP) es un protocolo propietario desarrollado por Microsoft e integrado en las versiones profesionales de Windows. 

**Compresión y optimización** 
el tráfico se envía comprimido y con priorización de eventos de teclado, ratón y vídeo. 

**Redirección de recursos** 
permite usar dispositivos locales en la sesión remota. 

**Soporte de múltiples sesiones**
simultáneas (en servidores).

**Autenticación de nivel de red (NLA)** 
cliente se autentica antes de establecer la sesión, reduciendo la exposición a ataques. 

**Cifrado TLS nativo** 
en versiones recientes de Windows. 

las mejores prácticas son:  
- Encapsular RDP dentro de una VPN corporativa o un gateway RDP.  
- Activar NLA y cifrado TLS. Restringir accesos por listas blancas de IP y políticas de grupo.  
- Añadir autenticación multifactor (MFA) para administradores.  
- Supervisar los accesos  mediante Event Viewer y  sistemas SIEM


#### VNC: la opción multiplataforma y universal 
VNC (Virtual Network Computing) es un protocolo independiente del SO, basado en la arquitectura cliente-servidor y en el envío de imágenes del escritorio remoto a través de la red.su seguridad por defecto es limitada

- Encapsular VNC en SSH o VPN. 
- Configurar contraseñas fuertes y únicas. 
- Desactivar accesos anónimos o sin confirmación. 
- Usar versiones con soporte TLS (como RealVNC o TightVNC Enterprise). 
#### NX/X2Go: eficiencia optimizada en entornos Linux  
la opción más  eficiente para entornos gráficos remotos.  
combina rendimiento alto, cifrado fuerte y bajo consumo de recursos


**Sus ventajas más destacadas:** 
Compresión agresiva del flujo gráfico, optimizada para conexiones lentas. 
Transporte cifrado vía SSH.
Soporte de sesiones persistentes y reconectables. 
Ejecución remota de aplicaciones individuales
Compatibilidad con entornos de escritorio ligeros 

#### Seguridad transversal: VPN, MFA y auditoría 
Los protocolos de escritorio remoto exponen la interfaz de usuario del sistema operativo. su seguridad debe tratarse con el mismo rigor que una base de datos. 

Buenas prácticas : 
- Nunca exponer directamente los puertos RDP (3389), VNC (5900/5901) o X2Go (22). 
- Aplicar autenticación multifactor (MFA). 
- Encapsular todo acceso dentro de una VPN corporativa. 
- Configurar NLA en RDP y túneles SSH en X2Go. 
- Registrar sesiones y accesos. 
- Segmentar redes y limitar usuarios por rol. 

En entornos empresariales, los accesos gráficos suelen gestionarse desde bastion hosts o gateways que controlan y auditan las conexiones.

**Herramientas y Consejos** 
**RDP (Windows): Configuración Profesional** 
• Activa NLA: 
	Configuración del sistema remoto → Permitir conexiones solo con autenticación de 
	nivel de red. 
Usa certificados TLS válidos (CA interna o Let's Encrypt). 
• Restringe acceso con 
	gpedit.msc → Computer Configuration → Administrative Templates → Remote Desktop Services. 

Registra eventos: 
	Event Viewer → Applications and Services Logs → Microsoft → Windows → TerminalServices. 

**VNC (Linux/Windows): buenas prácticas** 
Usa implementaciones seguras: TigerVNC, RealVNC, TightVNC Enterprise. 
Encapsula el tráfico en SSH: 
`ssh -L 5901:localhost:5901 usuario@hostvncviewer localhost:5901` 
Configura contraseñas individuales, desactiva acceso sin confirmación y limita IPs. 

**X2Go (Linux): instalación y optimización** 
• Instala servidor: 
`sudo apt install x2goserver x2goserver-xsession` 
Cliente disponible para Windows/macOS/Linux: https://wiki.x2go.org 
• Configura entorno ligero (XFCE/MATE) . 
• Usa autenticación SSH con claves públicas. 

**VPNs seguras para encapsular escritorios remotos** 
• WireGuard: simple y rápido; ideal para equipos móviles. 
• OpenVPN: flexible y ampliamente soportado. 
- IPsec: estándar corporativo robusto para gateways. 

Configura reglas de firewall para permitir solo tráfico RDP/VNC/X2Go a través de la VPN. 

**Monitorización y auditoría** 
• Windows: Event Viewer / Security → ID 4624 (login). 
• Linux: journalctl -u x2goserver o grep sshd /var/log/auth.log. 
SIEM: envía logs a Splunk, Graylog o Wazuh para detección de intrusiones. 

**Optimización de rendimiento** 
Usa compresión y códecs en RDP. 
• Elige escritorios ligeros en X2Go. 
Mide latencia y ancho de banda con ping y iperf3. 
• Ajusta profundidad de color (16 bits en entornos lentos). 

**Formación y políticas** 
Educa a los usuarios en seguridad
• Define políticas de rotación de contraseñas y MFA obligatorio. 


**"Basta con abrir RDP a Internet con una contraseña fuerte."** → FALSO. RDP es uno 
de los vectores de ataque más explotados. La única práctica segura es encapsularlo en una VPN o gateway, usar MFA y limitar accesos por IP. 

**"VNC y RDP son equivalentes."** → FALSO. RDP es más eficiente y seguro (TLS, NLA, compresión avanzada), mientras que VNC es multiplataforma y simple, pero 
necesita cifrado adicional. 

**Resumen Final (para examen)** 
- RDP (Windows): mayor rendimiento, soporte de NLA/TLS; usar tras VPN o gateway. 
- VNC: multiplataforma, pero requiere cifrado (SSH o VPN). 
- X2G0/NX: óptimo para Linux, cifrado nativo por SSH, alta compresión. 
- Buenas prácticas: VPN + MFA + listas blancas + auditoría de accesos. 
- Nunca exponer puertos gráficos directamente a Internet 
