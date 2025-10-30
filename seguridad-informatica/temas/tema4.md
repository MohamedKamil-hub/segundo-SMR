# Resumen Unidad 4: Administración Remota y Servicios de Impresión

## Acceso Remoto Seguro (Sesión 7)

### Protocolos de Administración Remota

- **SSH (Secure Shell)**: Protocolo estándar en Linux/Unix para control remoto cifrado por terminal. Usa cifrado asimétrico y autenticación por clave pública. Permite transferencia segura de archivos (SCP/SFTP).
- **RDP (Remote Desktop Protocol)**: Protocolo de Microsoft para acceso remoto con interfaz gráfica a entornos Windows. Requiere medidas de seguridad adicionales (VPN, MFA).
- **VNC (Virtual Network Computing)**: Sistema multiplataforma para control remoto de escritorio. No cifra por defecto; debe usarse con túnel SSH o VPN.
- **VPN (Virtual Private Network)**: Crea un túnel cifrado entre el dispositivo remoto y la red corporativa, protegiendo los datos en redes públicas.

### Fail2ban

- Servicio que supervisa logs del sistema y bloquea automáticamente IPs con múltiples intentos fallidos de acceso. Defensa eficaz contra ataques de fuerza bruta en SSH, RDP, etc.

### Buenas Prácticas

- **SSH**: Deshabilitar acceso por contraseña, usar claves públicas, cambiar puerto por defecto (22), activar 2FA, usar Fail2ban.
- **RDP**: No exponer puerto 3389 a Internet, usar VPN o túnel SSH previo, activar NLA y MFA, limitar acceso a administradores.
- **VPN**: Usar OpenVPN, WireGuard o IPsec; emplear certificados digitales; supervisar logs.
- **Generales**: Aplicar MFA, mantener software actualizado, usar DNS seguro, documentar accesos.

### Caso de Estudio: Ataques masivos por RDP (2020)

- Contexto: Teletrabajo masivo con RDP expuesto sin VPN ni MFA.
- Consecuencias: Ataques de fuerza bruta y ransomware.
- Solución: VPN obligatoria, MFA, limitación de IPs, Fail2ban/firewalls inteligentes.
- Resultado: Reducción del 90% en intentos no autorizados.

---

## Servicios de Impresión (Sesión 8)

### Protocolos y Sistemas

- **CUPS (Common Unix Printing System)**: Sistema estándar en Linux/macOS. Usa **IPP (Internet Printing Protocol)**. Ofrece interfaz web, gestión de colas y soporte para TLS.
- **Servicios de Impresión en Windows**: Gestionados mediante **SMB (Server Message Block)** e **IPP**. Control de permisos y auditoría desde Panel de control o Administrador de Impresión.

### Seguridad en Impresión

- Riesgos: Información sensible, punto de entrada para atacantes (ej. **PrintNightmare**).
- Política Segura: Control de acceso, actualizaciones, cifrado (TLS), auditoría, restricción de instalación de impresoras.

### Caso de Estudio: PrintNightmare (CVE-2021-34527)

- Vulnerabilidad crítica en servicio de impresión de Windows.
- Impacto: Ejecución remota de código, instalación de malware, control de dominio.
- Estrategias: Deshabilitar servicio, restringir instalación de drivers, aplicar parches, segmentar red (VLANs), auditar logs.

### Herramientas y Consejos

- **CUPS**: Interfaz en `https://localhost:631`, usar TLS, crear usuarios con permisos limitados, configurar logs.
- **Windows**: Usar Administrador de impresión, GPOs, aplicar actualizaciones.
- **Seguridad**: Usar SMBv3 o IPP con TLS, cambiar contraseñas por defecto, segmentar red (VLAN), activar logs de impresión.
- **Buenas Prácticas**: Eliminar impresoras obsoletas, actualizar drivers y firmware, formar a usuarios en confidencialidad.

### Mitos y Realidades

- **Mito**: "Los servidores de impresión no son un objetivo." → **Falso**. Son objetivos reales para ejecución de código remoto.
- **Mito**: "No hace falta actualizar drivers si funciona." → **Falso**. Los drivers desactualizados contienen vulnerabilidades.