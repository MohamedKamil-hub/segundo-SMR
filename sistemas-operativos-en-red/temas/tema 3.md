## Sistemas operativos en red Unidad 3: Gestión de usuarios y permisos 


**Administración de usuarios y grupos en Windows (Active Directory) y Linux. Políticas de contraseñas**

**Windows: Active Directory**
un servicio de directorio que permite administrar de forma centralizada la autenticación (inicio de sesión) y la autorización (permisos y accesos). los administradores pueden crear Unidades Organizativas (OUs) que reflejan la estructura de la empresa y dentro de ellas asignar grupos de seguridad. 

los permisos se dan a grupos, y los usuarios heredan esos permisos al unirse a ellos. basta con mover a un usuario de un grupo a otro para ajustar sus accesos de forma inmediata.

**Linux: Gestión Local**
Cada máquina gestiona sus propios usuarios mediante herramientas como useradd, usermod y userdel, que permiten crear, modificar y eliminar cuentas.
Los permisos se gestionan mediante la pertenencia a grupos de sistema, lo que proporciona un control sencillo y directo. 
**Linux puede integrarse con Active Directory** u otros servicios de directorio para entornos híbridos.

**Políticas de Contraseñas**
Otro aspecto crítico en la administración de usuarios son las políticas de contraseñas. 
Estas políticas definen la longitud mínima, la complejidad , la caducidad  y el historial.
En entornos modernos, estas políticas suelen complementarse con la autenticación multifactor (MFA), que añade una segunda barrera de seguridad .
 

**Esquema Visual**
![[{5778E247-B3F5-4225-8D2A-3B5D5E44C496}.png]]


 -  **Windows**: Active Directory es el enfoque centralizado, con un Controlador de Dominio como cerebro de la red, y las OUs y Grupos como mecanismo de organización y asignación de permisos.
 -  **Linux**: Comandos locales son el enfoque tradicional, basado en utilidades de sistema (useradd, usermod, userdel), y la posibilidad de integrarse a un directorio centralizado. 
 - **Ambos** flujos convergen en las Políticas de Contraseñas, fundamentales para mantener un nivel de seguridad mínimo aceptable en cualquier organización. 


**Herramientas para Windows**
- Usuarios y equipos de Active Directory (dsa.msc): consola gráfica para crear, modificar y organizar usuarios y grupos en AD. 
- Política de Grupo (GPO): permite definir políticas de contraseñas, bloqueo de cuentas y restricciones de software a nivel organizacional. 
- PowerShell: scripts como New-ADUser o Add-ADGroupMember automatizan la gestión masiva de cuentas. 

**Herramientas para Linux** 
- useradd, usermod, userdel: comandos básicos para la gestión de usuarios. 
- passwd: cambia contraseñas y fuerza caducidades.
- groups e id: muestran pertenencia a grupos y detalles de permisos. 
- Integraciones: como SSSD permiten integrar Linux en entornos Active Directory. 

**Consejos prácticos** 
- Asigna permisos a grupos, no a usuarios individuales: escalabilidad y evita errores. 
- Documenta la estructura de OUs y grupos: evita duplicidades y reduce incidencias.
- Complementa contraseñas con MFA: especialmente en cuentas críticas.
- Automatiza tareas repetitivas: en Windows con PowerShell, en Linux con scripts Bash. 

**Mitos y Realidades** 
Active Directory es solo para empresas grandes. FALSO.  en redes pequeñas ofrece ventajas claras: inicio de sesión único (SSO), políticas centralizadas, y simplificación en la gestión de carpetas y recursos compartidos. 

Las contraseñas complejas son suficientes para la seguridad. FALSO , no bastan. las contraseñas deben complementarse con MFA y una política de rotación . 

#### Resumen Final para Examen 
Active Directory: centraliza usuarios y grupos en Windows. Linux: gestión local con comandos (useradd, usermod, passwd), aunque puede integrarse con AD. Grupos > usuarios: asignar permisos a grupos es la mejor práctica. Políticas de contraseñas: reglas de complejidad, caducidad e historial. Seguridad adicional: MFA para cuentas críticas. 


#### Permisos NTFS y ACL en Windows; permisos, sudo y cuotas en Linux
Es necesario establecer con precisión qué acciones puede realizar cada usuario sobre los archivos, carpetas y recursos del sistema. 

###### En **Windows**,
los **permisos** sobre archivos y carpetas se gestionan mediante el sistema de archivos NTFS (New Technology File System) y se **aplican** mediante Listas de Control de Acceso (**ACL**, Access Control Lists), un listado que **define quién puede hacer qué**: leer, escribir, ejecutar, modificar o tener control total sobre un recurso
**Windows permite heredar permisos**: si una carpeta tiene reglas, sus subcarpetas las heredan, salvo que se especifique lo contrario.

###### En **Linux**, el enfoque es distinto y más minimalista. 
Cada archivo tiene asociados tres niveles de permisos: 
- Propietario (el usuario que creó el archivo). 
- Grupo (usuarios que comparten el mismo grupo). 
- Otros (cualquier otro usuario del sistema). 
Y cada uno de esos niveles se gestiona con tres letras: rwx (read, write, execute).
Linux dispone también de ACL extendidas, permiten definir permisos más parecidos a los de Windows, asignando derechos específicos más allá del (propietario, grupo, otros).

**Un elemento distintivo de Linux es sudo.** En lugar de trabajar permanentemente como superusuario (root), lo que sería peligroso, los usuarios pueden ejecutar puntualmente comandos con privilegios administrativos mediante sudo. añade seguridad y trazabilidad, ya que las acciones quedan registradas y pueden limitarse a determinados comandos.  **tanto en Windows como en Linux encontramos los sistemas de cuotas**. Estos mecanismos permiten asignar límites de almacenamiento por usuario o grupo.
En conjunto, los permisos, las ACL, sudo y las cuotas son el sistema inmunológico de la informática: controlan qué puede hacer cada usuario, evitan abusos y aseguran que los recursos estén disponibles de manera segura y equitativa. 

Esquema Visual 
![[{71EC78E9-96F3-4745-AFB7-B3340C4E8B90}.png]]
 Windows Los permisos se basan en NTFS y ACL, que permite una configuración detallada. Linux El modelo tradicional rwx gestiona accesos de forma clara, con la opción de sudo para tareas administrativas puntuales. 
 Ambos sistemas se benefician de cuotas de disco, que controlan el uso del almacenamiento y evitan abusos. 


#### **Herramientas y Consejos** 
**En Windows (NTFS y ACL)** 
- Propiedades Seguridad: desde la pestaña Seguridad de un archivo o carpeta se pueden definir permisos específicos para usuarios y grupos
- icacls: herramienta de línea de comandos para gestionar ACL
- Auditoría de seguridad: habilitar registros para saber quién accede y modifica archivos. 

**En Linux (permisos y sudo)**
- chmod: cambia los permisos (ejemplo: chmod 755 archivo.txt)
- . chown: modifica el propietario de un archivo o carpeta. 
- ls -l: lista archivos mostrando permisos, propietarios y grupos.
- visudo: edita de forma segura el archivo de configuración de sudo. 
- ACL extendidas: con setfacl y getfacl se definen permisos adicionales más allá de rwx. 

**Cuotas de disco** 
- Windows: desde la pestaña de cuotas en las propiedades del disco NTFS. 
- Linux: herramientas como edquota y repquota permiten configurar y supervisar límites de almacenamiento por usuario. 

**Consejos prácticos:** 
- Evita dar permisos de Control total a usuarios individuales; asigna el mínimo necesario
- Documenta la política de permisos y cuotas, todos los usuarios entiendan sus límites. 
- Revisa periódicamente los permisos y ajusta cuando los roles cambien. Usa visudo para editar la configuración de sudo y evitar errores de seguridad. 

Mitos y Realidades 
Los permisos en Linux son inseguros porque son demasiado simples. FALSO. La simplicidad del modelo rwx facilita la comprensión y la auditoría. Linux dispone de mecanismos como ACL extendidas y SELinux . 

sudo es peligroso porque da acceso de root. FALSO. Precisamente lo contrario: sudo es más seguro que trabajar directamente como root. Permite registrar todas las acciones, limitar comandos específicos y pedir autenticación.

**Resumen Final para Examen**
Windows (NTFS + ACL): permisos granulares: leer, escribir, modificar, control total. Linux (rwx): permisos básicos para propietario, grupo y otros. sudo: ejecuta comandos administrativos de forma temporal y segura. Cuotas de disco: limitan el espacio que puede usar cada usuario. Mejor práctica: asignar permisos a grupos, aplicar el principio de mínimo privilegio y usar sudo en lugar de root. 