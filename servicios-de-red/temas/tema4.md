# Resumen Unidad 4: Servicios web y transferencia de ficheros

## HTTP/HTTPS

- **HTTP (HyperText Transfer Protocol)**: Protocolo para transferir recursos web. Modelo **cliente-servidor** (petición → respuesta). Usa texto claro sobre **TCP puerto 80**.
- **Estructura del mensaje**:
  - Línea inicial (método + ruta o código de estado)
  - Cabeceras (metadatos)
  - Cuerpo (contenido)
- **Métodos HTTP comunes**: GET (obtener), POST (enviar), PUT (reemplazar), DELETE (borrar).
- **Códigos de estado**:
  - 2xx: Éxito
  - 3xx: Redirección
  - 4xx: Error del cliente
  - 5xx: Error del servidor
- **HTTPS**: HTTP + **TLS** (Cifrado). Usa **TCP puerto 443**. Garantiza confidencialidad, integridad y autenticidad.

### Cabeceras HTTP (Headers)

- Transportan información crítica: `Host`, `User-Agent`, `Accept`, `Content-Type`, `Cache-Control`, `Set-Cookie`/`Cookie`.
- Cabeceras de seguridad: `Strict-Transport-Security (HSTS)`, `Content-Security-Policy`, `X-Frame-Options`, `X-Content-Type-Options`, `Referrer-Policy`.

### Cookies

- Pequeños datos de estado que el servidor envía con `Set-Cookie` y el cliente devuelve en peticiones posteriores.
- Atributos de seguridad: `Secure` (solo HTTPS), `HttpOnly` (no accesible por JavaScript), `SameSite` (control de envío entre sitios).

### Servidores Web (Apache/Nginx)

- Sirven contenido desde un `DocumentRoot` (ej: `/var/www/html`).
- **Instalación básica**: Paquetes del sistema, habilitar servicio, publicar contenido.
- **HTTPS con Let's Encrypt**: Herramienta `certbot` para obtener y renovar automáticamente certificados TLS.

---

## Configuración Avanzada de Servidores Web

### Virtual Hosts

- Permiten alojar **múltiples sitios web** en un solo servidor.
- **Tipos**:
  - **Basados en nombre**: Múltiples dominios comparten una IP. El servidor decide el sitio basándose en la cabecera `Host`.
  - **Basados en IP**: Cada sitio tiene su propia IP (menos común).
- Configuración en Apache: Archivos en `/etc/apache2/sites-available/`.

### Autenticación y Control de Acceso

- **Autenticación Básica**: Protege directorios con usuario/contraseña.
  - Archivo `.htaccess`: Define directivas de control.
  - Archivo `.htpasswd`: Almacena credenciales cifradas.
- **Restricciones por IP**: `Require ip ...`.

### Logs y Monitorización

- **access.log**: Registra todas las peticiones (IP, recurso, código de estado, etc.).
- **error.log**: Registra errores y advertencias.
- **Herramientas de análisis**: AWStats, GoAccess (informes visuales).
- **Monitorización en tiempo real**: Módulo `mod_status` de Apache (muestra peticiones activas, uso de recursos).

---

## FTP (File Transfer Protocol)

- Protocolo para transferencia de archivos. Modelo **cliente-servidor**.
- **Canales**:
  - **Control (Puerto 21)**: Para comandos y respuestas. Siempre abierto.
  - **Datos (Puerto dinámico)**: Para transferir archivos o listados. Se abre y cierra por sesión.
- **Modos de Conexión**:
  - **Modo Activo**: El servidor inicia la conexión de datos (desde puerto 20). Problemas con firewalls/NAT.
  - **Modo Pasivo**: El cliente inicia ambas conexiones. Ideal para entornos con firewall.

### Seguridad en FTP

- **FTP estándar**: Credenciales en texto claro → Inseguro.
- **FTPS (FTP Secure)**: FTP + cifrado TLS/SSL.
- **SFTP (SSH File Transfer Protocol)**: Protocolo diferente basado en SSH (puerto 22). Todo el tráfico cifrado.

### Servidores y Clientes

- **Servidores comunes**: `vsftpd` (Very Secure FTP Daemon), `ProFTPD`.
- **Clientes comunes**: FileZilla (GUI), `lftp` (CLI), WinSCP (Windows, soporta SFTP).

### Administración y Seguridad

- **Aislamiento de usuarios**: `chroot_local_user=YES` (en `vsftpd.conf`) para restringir usuarios a su directorio.
- **Cuotas de disco**: Limitan el espacio por usuario (`setquota`).
- **Logs**: `/var/log/vsftpd.log` para auditoría.
- **Buenas prácticas**: Usar modo pasivo, siempre cifrar (FTPS/SFTP), revisar logs, implementar cuotas.