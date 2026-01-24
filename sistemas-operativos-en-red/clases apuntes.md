
# 01/10/2025
 Conexión Windows Server - Ubuntu Server

## 🖥️ CONFIGURACIÓN DE MÁQUINAS VIRTUALES

### **Especificaciones Técnicas**
- **Windows Server**: 40GB disco
- **Ubuntu Server**: 10-15GB disco  
- **Memoria RAM**: 2-4 GB para cada máquina
- **Hipervisor**: VirtualBox (tipo 2 - sobre SO) / Hyper-V (tipo 1 - sobre hardware)
- **Red**: Configurada en modo Puente (Bridge)

### **Credenciales de Acceso**
```
Usuario: mohamed-user
Contraseña: abcdef

Administrador Windows: 
Contraseña: A123456.
```

### **Sistema Operativo**
- **Windows Standard Experiencia de Escritorio 2022**

## 🌐 CONFIGURACIÓN DE RED Y CONECTIVIDAD

### **Verificar Funcionamiento de Tarjeta de Red**

**En Windows Server (PowerShell):**
```powershell
ipconfig
Get-NetIPAddress
```

**En Ubuntu Server (Bash):**
```bash
ip addr show
ifconfig
```

### **Comprobar Conectividad entre Equipos**
```bash
# Desde Ubuntu hacia Windows
ping [IP-Windows]

# Desde Windows hacia Ubuntu  
ping [IP-Ubuntu]
```

## 🔒 GESTIÓN DE FIREWALL Y SEGURIDAD

### **Opciones de Configuración**
- **Desactivar firewall completamente**
- **Crear reglas** para permitir tráfico entre equipos

### **Herramientas de Conexión**
- **Putty** para conexión SSH entre equipos
- **Ping** para verificación básica de conectividad

## 💻 CONCEPTOS DE VIRTUALIZACIÓN

### **Roles de Sistemas Operativos**
- **SO Servidor**: Proporcionan recursos y servicios de red
- **SO Cliente**: Consumen recursos de red

### **Herramientas de Virtualización**
- **VirtualBox** y **VMware** para entornos de aprendizaje
- Permiten crear laboratorios completos en una sola máquina física

### **Ventajas de la Virtualización**
- Simular entornos de red sin grandes costes
- Aprender, practicar y desplegar configuraciones
- Entornos seguros y eficientes para pruebas

## ✅ VERIFICACIÓN FINAL

1. Ambas máquinas con tarjeta de red funcionando
2. Ambas con dirección IP asignada
3. Firewall configurado (desactivado o con reglas)
4. **Ping exitoso** entre Windows Server y Ubuntu Server
5. Posibilidad de usar Putty para conexiones adicionales

**Objetivo logrado**: Los dos equipos se hacen ping y tienen conectividad de red completa.

# 08-10-2025
ip ubuntu server 192.168.1.142
ip win server 192.168.1.139
tener el firewall desactivado y el modo puente y dhcp automatico

ping prueba en win

![[Pasted image 20251008162145.png]]


https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html

tener un WSL con un ubuntu  dentro

https://blogdesistemas.com/instalar-ubuntu-server-20-04/


`sudo apt update`
`sudo apt install openssh-server -y`
`sudo systemctl status ssh si no esta activo sudo systemctl start ssh`
`sudo systemctl enable ssh`


==nunca poner el dhcp automático ya que si se apaga y enciende cambia de ip y muchas configuraciones se estropean siempre estática. siempre usar la version grafica windows==

ACTIVIDAD
- **instalar active directory graficamente** 
- **crear un user en powershell con comandos**


192.168.1.200 como Ipv4
127.0.0.1 como DNS

INSTALAR DIRECTORIO ACTIVO EN WINDOWS SERVER Y CREAR UN USUARIO DESDE POWERSHELL UTILIZANDO LOS COMANDOS DE CREACIÓN DE USUARIOS DEL DIRECTORIO ACTIVO


    S C:\Users\Administrador> $contraseña = Read-Host "Escribe una contraseña para el nuevo usuario" -AsSecureString
    Escribe una contraseña para el nuevo usuario: ********
    PS C:\Users\Administrador> New-ADUser 
    >>  -Name "Mohamed Kamil" 
    >>  -GivenName "Mohamed" 
    >>  -Surname "Kamil" 
    >>  -SamAccountName "mkamil" 
    >>  -UserPrincipalName "mkamil@kamil.local" 
    >>  -Path "CN=Users,DC=kamil,DC=local" 
    >>  -AccountPassword $contraseña 
    >>  -Enabled $true 
    >>  -ChangePasswordAtLogon $true 
    >>  -DisplayName "Mohamed Kamil" 
    >>  -Description "Usuario de prueba"
    PS C:\Users\Administrador> Get-ADUser -Identity mkamil -Properties Name,Enabled,DistinguishedName | Format-List
    
    
    DistinguishedName : CN=Mohamed Kamil,CN=Users,DC=kamil,DC=local
    Enabled           : True
    GivenName         : Mohamed
    Name              : Mohamed Kamil
    ObjectClass       : user
    ObjectGUID        : c5f873d3-4270-4a39-a67c-da4b791b5d31
    SamAccountName    : mkamil
    SID               : S-1-5-21-2798617740-3423093550-2798146572-1105
    Surname           : Kamil
    UserPrincipalName : mkamil@kamil.local
    
    
    
    PS C:\Users\Administrador>






<<<<<<< HEAD
![Instalación de Active Directory](activedirectory1.png)

![Instalación de Active Directory](comporobacionusers.png)
![Instalación de Active Directory](comporobacionusers.png)

=======
![Instalación de Active Directory](../../fotos/activedirectory1.png)

![Instalación de Active Directory](../../fotos/comporobacionusers.png)
>>>>>>> c1cb0e5ac46b22c1dccde0002bde454f283b2c02




# 15-10-2025


Win scp
mohamed.local dominio raiz
MOHAMED    netBIOS



pc-kamil


carpeta compartida centralizada para que haya un control sobre o que se controla

DNS suele ser el eslabón débil

asignar ip estática sumando 100 a la que te de el dhcp automático
siempre usar ip estática

en VirtualBox 
1 adaptador puente
1 en NAT

como tendremos un DNS selfhosted apuntar el DNS a 127.0.0.1


usar .local 
nivel funcional  poner mas bajo si tienes varios servidores

crear usuarios linux
adduser


useradd MAS SIMPLE NO CREA NI SHELL NI CARPETAS NI NADA DE ESO


# 22/10/2025
u    dueño                                                        r 4     leer        
g   grupo del dueño                                        w 2    escribir
o    otros                                                          x 1     ejecutar     

carpetas compartidas windows serv
predominan los permisos nfts

Get-Acl
para ver permisos en powershell
Set-Acl -AclObject $almacencontinepermios

**directorio activo**
1. maquina en puente
2. ping funciona
3. firewall desactivado
4. habilitar accesi remoto
5. conexion remoto y poner la ip de la maquina objetivo  desde el anfitrion
#### actividad
crear una estructura de clase con varios ciclos cursos y estudiantes solo crear la estructura
nueva unidad organizativa
grupos 
usuarios


![AD Completo](./../../fotos/{6A57EF82-2BF4-4C9C-BD78-A5AE097C1CBD}.png)



![AD Grupos](./../../fotos/{427E4417-2FE4-418B-ACA5-EE23BF4D1E6F}.png)

Usar el bypass oficial durante OOBE
Cuando aparezca la pantalla de Microsoft Account:
 Presiona **Shift + F10** → abre CMD. `OOBE\BYPASSNRO`
# 29/10/2025
la puerta de enlace no es necesari

dns
el domino hay que meterle equipos que lo localicen  con el dns del servidor

xampp en el localhost para que al poner marca.com te lleve a tu xampp


  

PowerShell

|     |                                                                                                             |
| --- | ----------------------------------------------------------------------------------------------------------- |
|     | New-NetIPAddress -InterfaceAlias Wi-Fi -IPAddress 192.168.1.56 -PrefixLength 24 -DefaultGateway 192.168.1.1 |
|     | Get-NetIPAddress                                                                                            |
|     |                                                                                                             |


subredes distintas en la misma interfaz7



ubuntu
ip addr


sudo nano etc/netplan/50-cloud init yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp3s0:
      addresses:
        - 10.10.10.2/24
      gateway4: 10.10.10.1
      nameservers:
          search: [mydomain, otherdomain]
          addresses: [10.10.10.1, 1.1.1.1]




automatizar asignacion de ips de dhcp en win server
![[{4D67EC11-7B07-4262-9D6A-48BBC40FB53B}.png]]aislar red entre ubuntu server y win server
para que la ip le llegue al

# 05/11/2025
Máscara de subred, encontrar equipos en la misma zona, dominio de colisión
- DHCP:
    - puede configurar con Windows
        
    - agregar roles y características DHCP
        
    - activar ámbito

- Aislar la red poniendo las máquinas en red interna

- Relacionar Ubuntu y Windows Server

- `/etc/resolv`

- IP del servidor → dirección del DNS

### configurar dns entre ubuntu y windows server en red interna y comprobar resolución de nombres

![Pasted image 20251105212450](./../../fotos/Pasted%20image%2020251105212450.png)



# 12/11/2025
hacer peticion a dns linux y responder

en la vbox ambas en red interna

user
123456

probar
ping al router funciona 
ping a DNS externo como 8.8.8.8


sudo apt install bind9 -y


try y catch en powershell

resolve-dnsname get content nombres txt

para trartarlo de uno en uno se usa :
foreach $elemento in get -content nombre txt 
resolve-dnsname $ elemento


![[Pasted image 20251112175022.png]]ISO

Práctica

[](https://github.com/jesusninoc/ClasesSOR/blob/main/2025-11-10.md#pr%C3%A1ctica)

## En Linux, instala BIND9, configura una zona directa en /etc/bind/named.conf.local y define sus registros en un archivo de zona. Usa nslookup desde un cliente para comprobar que ambos resuelven los nombres correctamente. Lo hacemos entre dos Ubuntu Server, uno de ellos con dos interfaces de red (uno aislado y otro Puente) y el otro un interfaz de red (red aislada), lo hacemos así para poder conectarnos por SSH.

[](https://github.com/jesusninoc/ClasesSOR/blob/main/2025-11-10.md#en-linux-instala-bind9-configura-una-zona-directa-en-etcbindnamedconflocal-y-define-sus-registros-en-un-archivo-de-zona-usa-nslookup-desde-un-cliente-para-comprobar-que-ambos-resuelven-los-nombres-correctamente-lo-hacemos-entre-dos-ubuntu-server-uno-de-ellos-con-dos-interfaces-de-red-uno-aislado-y-otro-puente-y-el-otro-un-interfaz-de-red-red-aislada-lo-hacemos-as%C3%AD-para-poder-conectarnos-por-ssh)

```shell
# Instalar BIND9
sudo apt install bind9 -y

# Editar configuración de zonas
sudo nano /etc/bind/named.conf.local
# Añadir al final:
# zone "smr.local" {
#     type master;
#     file "/etc/bind/db.smr.local";
# };

# Crear archivo de zona a partir de plantilla
sudo cp /etc/bind/db.local /etc/bind/db.smr.local

sudo tee /etc/bind/db.smr.local >/dev/null <<'EOF'
$TTL 604800
@   IN  SOA ns.smr.local. admin.smr.local. (
        2025110501 ; Serial
        604800     ; Refresh
        86400      ; Retry
        2419200    ; Expire
        604800 )   ; Negative Cache TTL
;
@       IN  NS  ns.smr.local.
ns      IN  A   192.168.1.20
server  IN  A   192.168.1.20
EOF

sudo chown root:bind /etc/bind/db.smr.local
sudo chmod 0644 /etc/bind/db.smr.local

sudo named-checkzone smr.local /etc/bind/db.smr.local
# Debe decir algo como: "loaded serial 2025110501" y "OK"

sudo systemctl restart bind9
journalctl -u bind9 -n 30 --no-pager

# Prueba contra BIND
dig @127.0.0.1 server.smr.local A +short

# Reiniciar el servicio
# sudo systemctl restart bind9

# Probar la resolución
# nslookup server.smr.local 192.168.1.20
```

# 19/11/2025
## Temas a repasar
- Conectarse por SSH a Linux
- Copiar con WinSCP (Secure copy protocol, SCP)
- Permisos en Linux
- Creación de usuarios en Windows y Ubuntu
- Permisos especiales Linux: Mayúscula (S/T) = permiso especial sin x; minúscula (s/t) = permiso especial con x. Y en /tmp es t minúscula porque tiene sticky bit y permiso de ejecución para otros (modo 1777).
- Borrar directorio aunque tenga contenido: rm -r
- Script para crear usuarios en Windows con PowerShell
```PowerShell
# Contenido del fichero usuarios.txt
# juan,ContraJuan123
# ana,PasswordAna!
# pepe,Pepe2025!

# Ruta del fichero con usuarios y contraseñas
$fichero = "C:\ruta\usuarios.txt"

# Leer cada línea del fichero
Get-Content $fichero | ForEach-Object {
    # Separar por coma: primer valor = usuario, segundo = contraseña
    $partes = $_ -split ","

    $nombreUsuario  = $partes[0].Trim()
    $passwordPlano  = $partes[1].Trim()

    # Convertir la contraseña en SecureString (obligatorio para New-LocalUser)
    $passwordSecure = ConvertTo-SecureString $passwordPlano -AsPlainText -Force

    # Crear el usuario local
    New-LocalUser -Name $nombreUsuario -Password $passwordSecure -FullName $nombreUsuario -PasswordNeverExpires:$true

    Write-Host "Usuario creado: $nombreUsuario"
}
```

-------------
-------------

conexion remota linux
ssh protocolo que ofrece conexion a la shell encriptada
para ello tiene que estar instalado un ssh servidor y cliente respectivamente
y el ping entre ambos tiene que funcionar
no permite interceptar el trafico y aque lo cifra

scp permite usar multimedia en ssh
winscp


permite conexion en tunel
para que pase por un equipo



**permisos en linux**
drwxrwxr-x  el d es un directorio y el - es un archivo p es pipe(comunicacion entre procesos)
usuario grupo otros
cambiar permisos 
chmod ugo+rwx fichero
	o
chmod 777 fichero


chgrp para usuarioss de grupo
sudo chgrp sudo fichero
sudo chown root:group fichero
sudo su cu



crear usuario

useradd necesita que se le indique todos los parametros manualmente
userdel
-s para indicar la shell
-m 
sudo passwd usuario

adduser es asistido y mas facil
deluser tambien eliina grupos


**POWERSHELL**
ver usuarios en el sistema Get-LocalUser
Get-LocalGroup
New-LocalGroup
New-LocalUser para añadir usuario en powershell es
$pass = CovertTo-SecureString -String "P@ssword1" -AsPlainText -Force
parametros -Name nombre -Password $pass

Get-Contentt ./archivo.txt
foreach($linea in Get-Content ./archivo.txt)
{
		$valores = $linea.split(",")
		$linea
		Start-Sleep -Seconds 5
}



![[Pasted image 20251119165329.png]]




``` powershell

Get-LocalUser
Get-LocalGroup

$pass = ConvertTo-SecureString -String "P@ssword1" -AsPlainText -Force
New-LocalUser -Name prueba -Password $pass

Get-Content .\usuarios.txt

foreach($linea in Get-Content .\usuarios.txt)
{
    $valores = $linea.split(",")
    $pass = ConvertTo-SecureString -String $valores[1] -AsPlainText -Force
    New-LocalUser -Name $valores[0] -Password $pass -WhatIf
    Start-Sleep -Seconds 5
}
```







## Temas a repasar
- Conectarse por SSH a Linux
- Copiar con WinSCP (Secure copy protocol, SCP)
- Permisos en Linux
- Creación de usuarios en Windows y Ubuntu

-------------
## Preguntas test

### Tema 2

¿Qué es VirtualBox?
a) Un editor de texto
**b) Un hipervisor para crear y ejecutar máquinas virtuales**
c) Un navegador web

¿Para qué se recomienda usar una IP estática en servidores?
a) Para que cambie cada vez que reinicias
**b) Para que siempre tengan la misma dirección y sean fáciles de localizar**
c) Para conectarse más rápido a Internet

¿Qué servicio debes habilitar en Ubuntu para permitir conexiones remotas por terminal?
a) FTP
**b) SSH**
c) RDP

Desde un PC cliente Windows, ¿con qué programa te conectas por SSH al Ubuntu Server?
a) Bloc de notas
**b) PuTTY**
c) Paint

Desde un PC con Linux, ¿cómo te conectarías al servidor Ubuntu por SSH?
a) ping usuario@ip_del_servidor
**b) ssh usuario@ip_del_servidor**
c) rdp usuario@ip_del_servidor

En tu Windows Server, ¿qué funcionalidad debes habilitar para conectarte con Escritorio Remoto?
a) Compartir archivos
**b) Escritorio Remoto en las propiedades del sistema**
c) Hyper-V

¿Cómo se llama la herramienta de cliente para conectarte al Escritorio Remoto en Windows?
**a) Conexión a Escritorio Remoto (mstsc)**
b) Conexión SSH
c) Conexión Telnet

¿Qué requisito básico debe cumplirse para que el cliente pueda conectarse por Escritorio Remoto al servidor?
a) Tener un navegador instalado
**b) Estar en la misma red o tener conectividad IP con el servidor**
c) Que el servidor tenga WiFi

### Tema 3

¿Qué rol debes instalar en Windows Server para crear un dominio de Active Directory?
a) Servicios de Escritorio Remoto
**b) Servicios de dominio de Active Directory**
c) Servicios de archivos e impresión

Después de instalar “Servicios de dominio de Active Directory”, el siguiente paso es:
a) Formatear el disco
**b) Promover el servidor a Controlador de Dominio**
c) Instalar un navegador web

¿Qué es un Controlador de Dominio (Domain Controller)?
a) Un servidor que almacena copias de seguridad
**b) Un servidor que gestiona usuarios, grupos y la autenticación del dominio**
c) Un servidor dedicado solo a impresión

¿Para qué sirve crear usuarios y grupos en Active Directory?
a) Para organizar mejor los cables de red
**b) Para administrar permisos y accesos de forma centralizada**
c) Solo para cambiar el fondo de pantalla a los usuarios

En Linux, el comando sudo useradd juan sirve para:
a) Crear una carpeta compartida
**b) Crear un nuevo usuario llamado juan**
c) Cambiar la contraseña del usuario juan

¿Qué hace el comando sudo passwd juan?
a) Elimina al usuario juan
**b) Cambia o asigna la contraseña al usuario juan**
c) Mueve al usuario juan a otro grupo

¿Para qué sirve el comando sudo usermod -aG sudo juan?
**a) Añadir al usuario juan al grupo de administradores (sudo)**
b) Borrar todos los grupos del usuario juan
c) Cambiar el nombre del usuario juan

Después de ejecutar sudo usermod -aG sudo juan, el usuario juan podrá:
a) Apagar el sistema únicamente
**b) Ejecutar comandos como administrador usando sudo**
c) Solo cambiar su contraseña

¿Qué diferencia principal hay entre crear usuarios en Active Directory y en Linux localmente (como juan)?
a) En AD el usuario solo existe en el navegador
**b) En AD el usuario es del dominio y en Linux el usuario es local al servidor**
c) No hay ninguna diferencia

### Tema 4

¿Dónde se configura una IP estática en Windows Server?
a) En el Bloc de notas
**b) En el “Centro de redes y recursos compartidos”**
c) En el Visor de eventos

¿Qué archivo debes editar en Ubuntu Server para configurar una IP estática con Netplan?
a) /etc/network/interfaces
**b) /etc/netplan/*.yaml**
c) /etc/sysconfig/network

¿Qué comando te permite comprobar la conectividad entre máquinas?
a) test
**b) ping**
c) dir

Si un cliente Windows 10 está configurado en modo DHCP, debería obtener su IP desde:
a) El propio ordenador
**b) El servidor DHCP de la red**
c) No se puede, tienes que poner la IP a mano

Cuando un cliente recibe IP por DHCP, normalmente obtiene también:
a) Fecha y hora
b) Información de CPU
**c) Puerta de enlace y DNS**

¿Qué rol debes instalar en Windows Server para gestionar resolución de nombres?
a) DHCP
**b) DNS**
c) Hyper-V

¿Qué tipo de registro DNS se usa para asignar un nombre (p. ej. server1.smr.local) a una IP?
a) Registro MX
b) Registro CNAME
**c) Registro A**

En Linux, el servidor DNS más usado y que instalas con apt install es:
a) Apache
**b) BIND9**
c) MariaDB

El archivo donde se declaran las zonas DNS en BIND9 es:
a) /etc/bind/named.conf.local
**b) /etc/bind/resolv.conf**
c) /etc/dns/zones.txt

¿Qué comando puedes usar desde Windows o Linux para comprobar que el DNS funciona?
a) dns-check
**b) nslookup**
c) resolver-test

Si nslookup servidor.smr.local responde con la IP correcta, significa que:
a) El ping funciona más rápido
**b) El DNS está resolviendo correctamente**
c) El equipo tiene activado el proxy

Para que un cliente Windows obtenga IP automáticamente, debes configurarlo como:
a) “Usar la siguiente dirección IP”
**b) “Obtener una dirección IP automáticamente (DHCP)”**
c) “Modo puente”

¿Qué indica si un cliente Windows recibe una IP 169.254.x.x?
**a) Todo está funcionando bien**
b) No ha encontrado un servidor DHCP
c) El DNS está caído

Cuando creas una zona en Windows DNS, debes especificar:
**a) Un dominio (p. ej., smr.local)**
b) El nombre del procesador del servidor
c) La versión de Windows

¿Qué deben resolver correctamente tanto Windows DNS como BIND9 en la práctica?
a) Cuentas de usuario
**b) Nombres de dominio y sus direcciones IP**
c) Tamaño de disco


# 26/11/2025

carpetas compartidas que se vean en distintos so
mediante protocolo samba ver equipos de windows carpetas en linux
nfs tambien cumple dicha funcion

compartir en una red heerogenea

ntfs sistema archivos windows

``` bash
sudo apt update
sudo apt install samba -y
sudo mkdir -p docs
ls
sudo groupadd grupo
sudo chown :grupo docs/
sudo chmod 2700  docs
sudo useradd usuario
sudo passwd 123456
sudo usermod -aG grupo usuario
sudo nano /etc/samba/smb.conf



[documentos]
        path = /home/user/docs
        browseable = yes
        writeable = yes
        valid users = @grupo
        create mask = 0660
        directory mask = 0770

sudo smbpasswd -a usuario
sudo smbpasswd -e usuario


```
c$ en win para ver los datos de un usuario


impresora

imorimir remotamente


compartir carpetas impresoras
protocolos que haycomo sehace la carpeta remota






# 03/12/2025
tema 6
seguridad  en so 
firewall
ufw permitir solo ssh

gpo para usuarios o a grupos
cambiar y aplicar gpo necesita equipo en dominio y en gpo

para saber si el firewall esta activado 
sudo ufw statu
permitir solo saliente no entrante
sudo ufw allow opensssh
para permitir trafico de entrada sudo ufw default allow incoming

ufw permite el ping por defecto
en windows el ping no esta permitido por defecto


accept drop
sudo ufw disable


en windows firewall
acceder a ficheros de configuracion cuando algo no funciona en linux esta en var y en windows estan en : firewall, configuracion avanzada propiedades, en perfil de dominio darle a personalizar en la ruta copiarla y ver registro de lo que quieres, allow, deny, drop

ficheros de configuracion


copias de seguridad

tipos
completa copia todo
incremental ultima copia de cualquier tipo
diferencial copia ultima completa
SOR2025R


# 10/12/2025
cron y tareas programadas

en windows programador de tareas
en linux se usa el servicio cron

tar para empaqutar algo
-z para comprimir
pwd
touch fichero

tar -cf fichero.tar carpeta/

tar -tf fichero.tar
carpeta/
carpeta/fichero2.txt
carpeta/fichero


tar -xf fichero.tar para extraer
![[Pasted image 20251210163952.png]]
fecha=$date+4f


programar tareas cron
programar cron se usa crontab

sudo crontab -e
minuto, hora, dia del mes, mes , dia de la semana

52 16 *** /home/ubuntu/

esto corre siempre a las 16  horas 52 minutos
https://www.jesusninoc.com/11/02/curso-online-de-powershell-noviembre-2025/
Sor2025@

en powershell un comando es cmdlet get-process > procesos.txt
Get-Process | group | select name

los comandos en linux son texto en windows es objetos y propiedades

Get-Process | Where cpu -gt 10
Get-Process | Where cpu -gt 10 | ssort name

for usuario in cat usuario do
echo $usuario
useradd -m "usuario"
done
# 17/12/2025
automatizacion y scripting en la red

hacer test
https://github.com/jesusninoc/ClasesSOR/blob/main/2025-12-15.md


https://www.jesusninoc.com/11/02/curso-online-de-powershell-noviembre-2025/


programador de tareas y crontab
Get-Service para ver si un servicio esta corriendo o no
| pipe permite comunicacion entre 2 procesos  toma la info del comando anterior
-EQ es equal =
-GT greater than >

Get-Service | where status -EQ  "Running" | Out-File archivo.txt

sacar procesos cuyo consumo de cpu  mayor 
el orden si importa
Get-Process | sort name | select -First 5 | where cpu -Gt 1

Get-Process -computer "127.0.0.1" | where cpu -GT 3 | sort cpu
con que permisos se ejecuta el script en programador de tareas en la parte de propiedades del script

linux
# 14-01-2026
en powershell cada resultado es un objeto
alias

un hash es un identificador unico de cada cosa

get process -name notrpad | select modlues) .modules
foreach (elemento in 1..10)
elemento
start sleep seconds 5
get filehash elemento | select hash.path


este mismo script en linux
whereis init

cd proc tiene identificadores de los procesos


readlink -f proc 9 exe 


fichero =readlink -f proc/i/exe
ps -eo pid | while read pid; do ficherosreadlink -f proc pid exe
sha256sum "fichero"
done


![[Pasted image 20260116193325.png]]

sudo ps -eo pid= | while read pid; do readlink -f /proc/$pid/exe  ;done | sort -u | xargs sha256sum




mezcalar powershell y linux  en un script que saque procesos y se los pase a a powershell
foreach ($fichero in (ps name notepad) modules.filename

wsl sha256sum $fichero.replace(/"/".  replace ":"."")
procesos.txt


#da la url en con la barra lateral mal como cambiar eso convirtiendo la ruta haciendo que llas barras vayan a un lado a otro c

![[Pasted image 20260116194433.png]]

o wslpath -a
wsl wslpath -a $fichero



