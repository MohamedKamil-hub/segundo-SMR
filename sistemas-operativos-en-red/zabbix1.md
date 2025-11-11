# Informe Zabbix - mohamed kamil - 11/11/2025
Ubuntu server zabbix server
WINDOWS 10 zabbix cliente

**comandos** 
Instalé todo

`sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent mysql-server`

Configuré MySQL
 
`sudo mysql -e "CREATE DATABASE zabbix CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"`
`sudo mysql -e "CREATE USER 'zabbix'@'localhost' IDENTIFIED BY 'zabbix123';"`
`sudo mysql -e "GRANT ALL ON zabbix.* TO 'zabbix'@'localhost';"`

 Importé esquema
`sudo zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql -u zabbix -p zabbix`

Configuré server  y añadí DBPassword=zabbix123 + ListenPort=10051
`sudo nano /etc/zabbix/zabbix_server.conf`

Reinicié
`sudo systemctl restart zabbix-server zabbix-agent apache2 mysql`
`sudo systemctl enable zabbix-server zabbix-agent`

# Instalé agente Windows (MSI)
Server=192.168.1.136
ServerActive=192.168.1.136
Hostname=Windows-Client


### Problemas 

 **No conectaba a la base de datos**  
 Error: `Access denied for user 'zabbix'@'localhost' (using password: NO)`  
Añadí `DBPassword=zabbix123` en `zabbix_server.conf`

**"Zabbix server is not running" en la web**  sunque `systemctl` decía `active`  
Añadí `ListenPort=10051` + `DBPassword` + reinicié

**Puerto 10051 no aparecía**  ss -tulpn | grep 10051` 
Config correcta y `systemctl restart zabbix-server`

 **Trigger no se creaba**  Error de sintaxis  
Usé **Expression constructor** → `last(/Windows-Client/system.cpu.util)>80`

## Resultado final
  login![Pasted image 20251111134644](./../../fotos/Pasted%20image%2020251111134644.png)

![Pasted image 20251111152442](./../../fotos/Pasted%20image%2020251111152442.png)
para aumentar la cpu en Powershell  

![Pasted image 20251111152830](./../../fotos/Pasted%20image%2020251111152830.png)
![Pasted image 20251111152904](./../../fotos/Pasted%20image%2020251111152904.png)
aumento a 99%  

![Pasted image 20251111153016](./../../fotos/Pasted%20image%2020251111153016.png)
lo que se vio reflejado en las alertas  

![Pasted image 20251111153050](./../../fotos/Pasted%20image%2020251111153050.png)

![Pasted image 20251111153212](./../../fotos/Pasted%20image%2020251111153212.png)
y se solucionó automáticamente  

![Pasted image 20251111153300](./../../fotos/Pasted%20image%2020251111153300.png)
