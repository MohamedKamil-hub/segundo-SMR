### **📘 Resumen: Unidad I – Sistemas Operativos en Red**

#### **1. Concepto de Sistema Operativo en Red (SON)**
- Software que **coordina usuarios, equipos y servicios** en una infraestructura tecnológica.
- Gestiona **recursos compartidos**: archivos, impresoras, aplicaciones y comunicaciones.
- A diferencia de un SO de escritorio, está diseñado para **múltiples usuarios**.

---

#### **2. Diferencias entre SO Cliente y SO Servidor**

| **SO Cliente** | **SO Servidor** |
|----------------|------------------|
| Ejemplos: Windows 10, Ubuntu Desktop | Ejemplos: Windows Server, Ubuntu Server |
| Consume recursos de la red | Proporciona servicios y recursos |
| Interactúa con el usuario final | Gestiona usuarios, seguridad y estabilidad |
| Está optimizado para uso individual | Optimizado para cargas simultáneas y alta disponibilidad |

---

#### **3. Virtualización: Concepto y Herramientas**
- Permite **simular redes completas** en una sola máquina física.
- **Herramientas comunes**:
  - **VirtualBox**: Gratuito, ideal para aprendizaje.
  - **VMware Workstation Pro**: De pago, mayor rendimiento.
- **Ventajas**:
  - Reduce costes de hardware.
  - Permite practicar sin afectar entornos reales.

---

#### **4. Consejos para Configuración de Máquinas Virtuales**
- Asignar **mínimo 2 GB de RAM a servidores**, 1 GB a clientes.
- Activar **virtualización por hardware (VT-x/AMD-V)** en la BIOS.
- Usar **snapshots** para guardar estados y experimentar sin riesgo.

---

#### **5. Mitos y Realidades**

| Mito | Realidad |
|------|----------|
| “Se necesita hardware caro para un servidor” | En redes pequeñas o pruebas, puede usarse hardware modesto |
| “La virtualización ralentiza el sistema” | Con hardware moderno, la pérdida de rendimiento es mínima |

---

#### **6. Caso de Estudio (Ejemplo Práctico)**
- Empresa con 50 empleados.
- **Servidor físico con Windows Server 2022** para archivos, impresoras y autenticación.
- **Clientes con Windows 10** se conectan al servidor.
- **Laboratorio virtual en VirtualBox** para probar configuraciones sin interrumpir el servicio real.

---

#### **7. Resumen Final**
- **SO Cliente**: consume recursos.
- **SO Servidor**: proporciona y gestiona recursos.
- **Virtualización**: herramienta clave para simular, aprender y desplegar redes de forma segura y económica.

---
