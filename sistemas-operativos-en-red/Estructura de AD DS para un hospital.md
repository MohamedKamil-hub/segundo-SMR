**Mohamed  Kamil El Kouarti**
**12 de diciembre de 2025**  
[Repositorio de GitHub: Estructura AD DS del hospital](https://github.com/MohamedKamil-hub/segundo-SMR/blob/main/sistemas-operativos-en-red/Estructura%20de%20AD%20DS%20para%20un%20hospital.md)


Se ha hecho la estructura de Active Directory requerida mediante comandos PowerShell.
#### 1. Creación de la OU raíz
Cree la unidad organizativa raíz "HOSPITAL" y le puse protección de borrado accidental
``` powershell
New-ADOrganizationalUnit -Name "HOSPITAL" -Path "DC=hospital,DC=local" -ProtectedFromAccidentalDeletion $true
```
#### 2. Creación de las sub-OUs principales

Dentro de HOSPITAL cree las 4 sub-unidades organizativas
ejecute este comando 4 veces cambiando únicamente el nombre (departamentos, usuarios, grupos y equipos) y también les puse protección contra borrado.
``` powershell
New-ADOrganizationalUnit -Name "Departamentos" -Path "OU=HOSPITAL,DC=hospital,DC=local" -ProtectedFromAccidentalDeletion $true
``` 

#### 3. Creación de las OUs de departamentos
Dentro de la unidad organizativa de departamentos cree las OU correspondientes
urgencias, UCI, administración e informática
``` powershell
New-ADOrganizationalUnit -Name "Urgencias" -Path "OU=Departamentos,OU=HOSPITAL,DC=hospital,DC=local" 
``` 

#### 4. Creación de grupos de seguridad globales
una vez tenia la estructura formada cree los 4 grupos de seguridad globales GG_Urgencias GG_UCI
GG_Administracion y GG_Informatica
``` powershell
New-ADGroup -Name "GG_Urgencias" -SamAccountName "GG_Urgencias" -GroupCategory Security -GroupScope Global -Path "OU=Grupos,OU=HOSPITAL,DC=hospital,DC=local"
```

#### 5. Creación de usuarios y asignación a grupos
A cada departamento le añadí un usuario correspondiente en la OU de Usuarios :

Mohamed Kamil -> informática
Ana lopez -> urgencias
Carlos Ruíz  -> UCI
Laura garcia  -> administración

Con la contraseña inicial siendo A123456.    pero hay que cambiarla después del primer inicio de sesión.
``` powershell

New-ADUser -Name "Mohamed Kamil" ` -GivenName "Mohamed" ` -Surname "Kamil" ` -SamAccountName "mkamil" ` -UserPrincipalName "mkamil@hospital.local" ` -Path "OU=Usuarios,OU=HOSPITAL,DC=hospital,DC=local" ` -AccountPassword (ConvertTo-SecureString "A123456." -AsPlainText -Force) ` -Enabled $true ` -ChangePasswordAtLogon $true

Add-ADGroupMember -Identity "GG_Informatica" -Members "mkamil"
``` 
![Comprobación OU](../fotos/Pasted%20image%2020251212115019.png)


![Imagen](../fotos/Pasted%20image%2020251217162507.png)

#### 6. Comprobaciónes finales 
Se ve la OU raiz , las 4 sub OU directas de raiz y las 4 OUs de departamentos dentro de departamentos

``` powershell
PS C:\Users\Administrador> Get-ADOrganizationalUnit -Filter * -SearchBase "OU=HOSPITAL,DC=hospital,DC=local" -Properties Name | Select-Object Name, DistinguishedName | Sort-Object DistinguishedName | Format-Table -AutoSize

Name           DistinguishedName
----           -----------------
Administracion OU=Administracion,OU=Departamentos,OU=HOSPITAL,DC=hospital,DC=local
Departamentos  OU=Departamentos,OU=HOSPITAL,DC=hospital,DC=local
Equipos        OU=Equipos,OU=HOSPITAL,DC=hospital,DC=local
Grupos         OU=Grupos,OU=HOSPITAL,DC=hospital,DC=local
HOSPITAL       OU=HOSPITAL,DC=hospital,DC=local
Informatica    OU=Informatica,OU=Departamentos,OU=HOSPITAL,DC=hospital,DC=local
UCI            OU=UCI,OU=Departamentos,OU=HOSPITAL,DC=hospital,DC=local
Urgencias      OU=Urgencias,OU=Departamentos,OU=HOSPITAL,DC=hospital,DC=local
Usuarios       OU=Usuarios,OU=HOSPITAL,DC=hospital,DC=local
```

**Los usuarios, sus grupos y sus Unidades Organizativas**
![Usuarios](../fotos/Pasted%20image%2020251212121145.png)


**los grupos de seguridad y su ambito**
![Grupos de seguridad](../fotos/Pasted%20image%2020251212121417.png)


**Esta es la estructura en active directory**
![Estructura AD - parte 1](../fotos/Pasted%20image%2020251212115511.png)


![Estructura AD - parte 2](../fotos/Pasted%20image%2020251212115635.png)

![[Pasted image 20251217162644.png]]


**Al iniciar sesión por primera vez me pide un cambio de contraseña**
![](../fotos/Pasted%20image%2020251112093511.png)

![](../fotos/Pasted%20image%2020251112093552.png)



**Conclusión** 
Se han cumplido todos los requisitos del proyecto: 
estructura de OUs completa, 
grupos de seguridad globales en su OU correspondiente, 
usuarios con atributos requeridos contraseña inicial con obligación de cambio y pertenencia correcta a los grupos departamentales.