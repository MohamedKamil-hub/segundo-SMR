# Servicios de Red - DNS (BIND9) y DHCP

## 1. FUNDAMENTOS DE DNS

### ¿Qué es DNS?
- **Sistema de Nombres de Dominio**: Traduce nombres legibles (google.com) → direcciones IP (142.250.190.78)
- **Sin DNS**: Internet sería inusable (solo recordar números IP)

### Estructura Jerárquica
```
Raíz (.) → TLD (.com, .org, .es) → Dominio (example.com) → Subdominio (blog.example.com)
```

### Componentes Clave
- **Resolvers**: Programas en clientes que consultan servidores DNS
- **Servidores DNS**: Responden consultas de resolución
- **Archivos de zona**: Contienen información de dominios gestionados

### Tipos de Consultas
- **Iterativa**: Servidor responde con lo que sabe o redirige
- **Recursiva**: Servidor busca completa la respuesta por el cliente

## 2. SERVIDOR DNS - CONFIGURACIÓN Y GESTIÓN

![[Pasted image 20251007162717.png]]
![[Pasted image 20251007162804.png]]
### Registros DNS Esenciales
| Registro | Función | Ejemplo |
|----------|---------|---------|
| **A** | Nombre → IPv4 | server → 192.168.1.10 |
| **AAAA** | Nombre → IPv6 | server → 2001:db8::1 |
| **MX** | Servidor de correo | mail.example.com |
| **CNAME** | Alias | www → server.example.com |
| **TXT** | Información adicional | SPF, DKIM |
| **NS** | Servidores de nombre | ns1.example.com |

### DNS Dinámico (DDNS)
- **Propósito**: Actualización automática de registros
- **Útil en**: Redes con DHCP donde IPs cambian
- **Funcionamiento**: Clientes actualizan sus registros automáticamente

### Implementaciones Comunes
- **BIND9** (Linux): Estándar mundial, archivos en `/etc/bind/`
- **Microsoft DNS Server**: Integrado con Active Directory

## 3. SEGURIDAD EN DNS

### Medidas de Seguridad
1. **Restricción de transferencias de zona**
   - Solo entre servidores autorizados
2. **DNSSEC (Domain Name System Security Extensions)**
   - Firmas digitales para validar autenticidad
   - Protege contra cache poisoning
3. **Filtrado de consultas recursivas**
   - Limita ataques de amplificación
   - Solo para clientes autorizados

## 4. PROTOCOLO DHCP

### Propósito y Ventajas
- **Asignación automática** de configuración de red
- **Evita conflictos** de direcciones IP
- **Reduce errores** en configuración manual
- **Escalable** para redes grandes

### Proceso DORA
```
Discover → Offer → Request → Acknowledge (Ack)
```

**Detalle del proceso**:
1. **Discover**: Cliente busca servidor DHCP (broadcast)
2. **Offer**: Servidor ofrece IP disponible
3. **Request**: Cliente solicita IP específica
4. **Ack**: Servidor confirma concesión

### Parámetros Asignados por DHCP
- Dirección IP
- Máscara de subred
- Puerta de enlace predeterminada
- Servidores DNS
- Tiempo de concesión

## 5. CONFIGURACIÓN DE SERVIDOR DHCP

### Elementos de Configuración

#### Ámbitos (Scopes)
- **Definición**: Rangos de direcciones asignables
- **Ejemplo**: 192.168.1.100 - 192.168.1.200

#### Reservas
- **Propósito**: IP fija para dispositivo específico (por MAC)
- **Uso**: Servidores, impresoras, proyectores

#### Exclusiones
- **Propósito**: Direcciones dentro del rango que NO se asignan
- **Uso**: IPs asignadas manualmente a servidores

#### Duración de Concesión
- **Corto** (4h): Redes con muchos dispositivos temporales
- **Largo** (8 días): Oficinas estables

### Implementaciones

#### Linux (ISC DHCP Server)
- **Archivo configuración**: `/etc/dhcp/dhcpd.conf`
- **Flexibilidad**: Múltiples subredes, opciones avanzadas

#### Windows Server
- **Rol**: "Servidor DHCP"
- **Ventaja**: Interfaz gráfica, replicación para alta disponibilidad

## 6. HERRAMIENTAS DE DIAGNÓSTICO Y MONITOREO

### Comandos DNS
```bash
# Consultas básicas
nslookup dominio.com
dig dominio.com

# Diagnóstico avanzado
dig +trace dominio.com          # Sigue resolución completa
named-checkconf                 # Valida configuración BIND
named-checkzone dominio archivo # Valida archivo de zona
```

### Comandos DHCP
```bash
# Windows
ipconfig /all                   # Muestra concesiones activas

# Linux
dhclient -v                     # Renueva concesión y muestra mensajes
```

## 7. ADMINISTRACIÓN Y MEJORES PRÁCTICAS

### Monitorización
- **Concesiones DHCP**: Detectar conflictos y uso
- **Logs**: Identificar fallos e intrusiones
- **Servidores no autorizados**: Detectar rogue DHCP servers

### Consideraciones de Red
- **Broadcast**: DHCP usa broadcast inicial
- **Router**: Puede necesitar configuración para relay DHCP
- **Tiempos de concesión**: Balancear entre estabilidad y flexibilidad

## 8. CASOS DE USO COMUNES

### Escenario Empresarial
- **DNS interno**: Resolución nombres locales + externos
- **DHCP con reservas**: Dispositivos críticos con IP fija
- **Seguridad**: DNSSEC, restricciones de transferencia

### Escenario Proveedor
- **Múltiples ámbitos**: Diferentes subredes
- **DNS dinámico**: Clientes actualizan sus registros
- **Alta disponibilidad**: Múltiples servidores DHCP/DNS

## PUNTOS CLAVE PARA EXAMEN

### DNS
- [ ] Entender estructura jerárquica DNS
- [ ] Diferenciar consultas iterativas vs recursivas
- [ ] Conocer tipos de registros (A, AAAA, MX, CNAME, TXT)
- [ ] Comprender DNSSEC y medidas de seguridad
- [ ] Saber configurar archivos de zona en BIND9

### DHCP
- [ ] Recordar proceso DORA completo
- [ ] Diferenciar ámbitos, reservas y exclusiones
- [ ] Entender tiempos de concesión
- [ ] Saber diagnosticar problemas comunes
- [ ] Conocer implementaciones Linux vs Windows

### Seguridad
- [ ] Medidas protección DNS (transferencias, DNSSEC)
- [ ] Detección servidores DHCP no autorizados
- [ ] Monitorización de concesiones y logs

