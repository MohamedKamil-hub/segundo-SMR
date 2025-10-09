
# Unidad 1: Fundamentos y preparación del entorno

**Sesión 1: Concepto de SO en red: Diferencias entre SO cliente y**
**servidor. Virtualización con VirtualBox/VMware para laboratorio**

**Fundamentos**
Un sistema operativo en red (SON) es el software que coordina usuarios, equipos y servicios dentro de una infraestructura tecnológica. 
el SON gestiona recursos compartidos: archivos, impresoras, aplicaciones y comunicaciones entre múltiples usuarios.

La distinción entre un SO cliente y un SO servidor es  :

	Un SO **cliente** (Windows 10, Ubuntu
	Desktop) consume recursos e interactua directamente con el usuario.

	Un SO **servidor** (Windows Server,Ubuntu Server) proporciona servicios, 
	administra usuarios y asegura estabilidad, disponibilidad y seguridad en la 
	red.

## ***Arquitectura Cliente-Servidor***

**SO Cliente**
Consume recursos y solicita servicios en la red
**SO Servidor**
Proporciona recursos y gestiona servicios de red
**Virtualización**
Crea laboratorios y múltiples SO en una sola máquina

**Herramientas y consejos**

**VirtualBox**: gratuito, ideal para laboratorios de aprendizaje.
**VMware Workstation Pro**: mayor rendimiento, aunque es de pago.
**Asigna** **mínimo** 2 GB de RAM a servidores y1 GB a clientes en máquinas virtuales.
Activa la **virtualización por hardware** (VT-x/AMD-V) en la BIOS .
**Usa** instantáneas **(snapshots)** para guardar el estado de las máquinas de laboratorio.

Mitos y realidades

**Mito**
"La virtualización siempre ralentiza el sistema."
	Con hardware moderno y configuración adecuada, 
	la pérdida de rendimiento esmínima frente a las ventajas que ofrece.

**Resumen final**
Los SO cliente consumen recursos, los SO servidor los proporcionan y gestionan.
La virtualización es la herramienta para simular entornos de red sin grandes costes.

