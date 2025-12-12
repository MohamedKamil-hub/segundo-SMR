

4444447




























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