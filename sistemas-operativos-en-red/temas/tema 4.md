# Resumen Teórico Unidad 4: Servicios de red esenciales

## Sesión 6: Configuración de red

### Dirección IP
- Identificador único de 32 bits (IPv4) para un equipo en la red.
- Compuesta por parte de red y parte de host.
- Rangos privados (RFC1918): 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16.
- Debe ser única en la red para evitar conflictos.

### Máscara de Subred
- Define cuántas direcciones pertenecen a la red local.
- Notación CIDR: /24 = 255.255.255.0 (256 direcciones, 254 útiles).
- Determina qué dispositivos están en la misma subred (vecinos).

### Puerta de Enlace (Gateway)
- Ruta por defecto hacia otras redes (normalmente el router local).
- Sin gateway, no hay salida fuera de la subred local.

### DNS (Domain Name System)
- Traduce nombres de dominio a direcciones IP y viceversa.
- El resolver consulta caché local y luego servidores DNS configurados.

### Configuración Estática vs. Dinámica (DHCP)
- **Estática:** Parámetros definidos manualmente. Ideal para servidores e impresoras.
- **Dinámica (DHCP):** Parámetros asignados automáticamente por un servidor. Ideal para clientes.

### Verificación y Diagnóstico
- `ipconfig /all` (Windows) o `ip a` (Linux) para ver configuración.
- `ping` para probar conectividad (gateway, IP pública).
- `nslookup` o `dig` para probar resolución DNS.
- `tracert` (Windows) o `traceroute` (Linux) para ver rutas de tráfico.

---

## Sesión 7: Servidor DHCP

### Definición y Propósito
- Protocolo para asignación automática de parámetros de red (IP, máscara, gateway, DNS).
- Evita la configuración manual en entornos grandes.

### Proceso DORA
- **Discover:** Cliente busca servidores DHCP (broadcast).
- **Offer:** Servidor ofrece una IP libre.
- **Request:** Cliente solicita formalmente la IP ofrecida.
- **Acknowledge:** Servidor confirma la concesión (lease).

### Componentes de un Servidor DHCP
- **Ámbitos (Scopes):** Rangos de direcciones IP asignables.
- **Opciones:** Parámetros adicionales (DNS, gateway, tiempo de concesión).
- **Reservas:** Asignan una IP fija a una dirección MAC específica.

### Puertos
- Servidor: UDP 67
- Cliente: UDP 68

### Consideraciones
- Evitar solapamientos con IPs estáticas.
- Tiempo de concesión corto para Wi-Fi público, largo para oficinas.
- Seguridad: DHCP Snooping en switches para evitar servidores falsos.

---

## Sesión 8: Servidor DNS

### Definición y Propósito
- Sistema jerárquico y distribuido que traduce nombres de dominio a IPs (resolución directa) y viceversa (resolución inversa).
- Permite la conectividad basada en nombres.

### Zonas
- **Zona Directa:** Traduce nombre → IP.
- **Zona Inversa:** Traduce IP → nombre.

### Tipos de Registros DNS
- **A:** Asocia un nombre a una IPv4.
- **AAAA:** Asocia un nombre a una IPv6.
- **CNAME:** Alias de otro nombre.
- **MX:** Define servidores de correo para el dominio.
- **NS:** Indica servidores de nombres autorizados para la zona.
- **PTR:** Registro inverso (IP → nombre).

### Herramientas de Verificación
- `nslookup`, `dig`, `host`.

### Mitos y Realidades
- Cambiar DNS no aumenta el ancho de banda.
- Las zonas inversas son fundamentales para correo, diagnósticos y autenticaciones.