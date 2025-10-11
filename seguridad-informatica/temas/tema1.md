# Resumen: Fundamentos de Seguridad Informática

## 🔐 La Tríada CIA - Base Fundamental

### Confidencialidad
- **Objetivo**: Solo accede quien debe
- **Controles**: 
  - Cifrado (en tránsito y en reposo)
  - Control de accesos (IAM)
  - Políticas de permisos mínimos

### Integridad
- **Objetivo**: Datos exactos y completos
- **Controles**:
  - Hashes y firmas digitales
  - Control de cambios y versionado
  - Logs y validaciones

### Disponibilidad
- **Objetivo**: Sistemas operativos cuando se necesitan
- **Controles**:
  - Redundancia y alta disponibilidad
  - Copias de seguridad verificadas
  - Monitorización y alertas

## 🚨 Amenazas Principales

### Tipos de Amenazas
- **Malware/Ransomware** → Impacta C, I, D
- **Phishing/Ingeniería social** → Impacta C
- **DoS/DDoS** → Impacta D
- **Errores humanos** → Impacta C, I, D

### Consecuencias del Fallo
- Pérdidas económicas
- Sanciones legales
- Daños reputacionales
- Paradas de servicio

## ⚠️ Vulnerabilidades Más Comunes

### Las 3 Críticas
1. **Contraseñas débiles o reutilizadas**
   - Exposiciones en filtraciones
   - Falta de MFA

2. **Software desactualizado**
   - Sin parches para fallos conocidos
   - Explotación de CVEs públicas

3. **Configuraciones inseguras**
   - Puertos innecesarios abiertos
   - Servicios por defecto
   - Permisos excesivos

## 🔄 Ciclo de Gestión de Vulnerabilidades

### Proceso Completo
1. **Inventario de activos** - Catalogación de sistemas y aplicaciones
2. **Escaneo de vulnerabilidades** - Identificación automatizada de debilidades
3. **Análisis de riesgo** - Evaluación de probabilidad e impacto
4. **Plan de remediación** - Priorización y planificación de correcciones
5. **Verificación** - Re-escaneo y pruebas de efectividad

## 🛡️ Medidas de Protección Esenciales

### Controles Clave
- **Gestión de credenciales**: Gestores de contraseñas + MFA
- **Actualizaciones sistemáticas**: Parches para OS y aplicaciones
- **Monitorización**: Zabbix/Prometheus con centralización de logs
- **Copias de seguridad**: Estrategia 3-2-1 + pruebas de restauración
- **Principio de mínimos privilegios**: Revisión periódica de permisos
- **Formación continua**: Simulaciones anti-phishing

### Herramientas Recomendadas
- **Gestión de parches**: WSUS/SCCM/Intune (Windows), Ansible (Linux)
- **Escáneres**: OpenVAS/Greenbone, Nessus
- **Endurecimiento**: CIS Benchmarks
- **Inventario**: GLPI/Snipe-IT

## 📋 Principios Fundamentales

### Mentalidad de Seguridad
- La seguridad es un **proceso continuo**, no un producto único
- Asumir que **todo sistema puede fallar**
- Diseñar **controles por capas**
- **Actualizar, hacer copias y formar usuarios** es decisivo

### Enfoque Profesional
- Descubrir y subsanar puntos débiles **antes** de que sean explotados
- La mayoría de ataques son **masivos y automatizados**
- Sin inventario, no hay parcheo ni control real
- La verificación es esencial para confirmar la efectividad

---
