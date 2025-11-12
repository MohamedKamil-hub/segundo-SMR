Mohamed  Kamil
12 de noviembre de 2025  

montar una estructura de Active Directory para un hospital, **todo desde PowerShell**, sin tocar la GUI.  



**Abrí PowerShell como admin** y cargué el módulo:  
```powershell
Import-Module ActiveDirectory   
```

**Creé la OU raíz:**  
``` powershell
New-ADOrganizationalUnit -Name "HOSPITAL" -Path "DC=mohamed,DC=local" -ProtectedFromAccidentalDeletion $true
```
**Dentro de HOSPITAL creé las 4 sub-OUs:**  
``` powershell
New-ADOrganizationalUnit -Name "Departamentos" -Path "OU=HOSPITAL,DC=mohamed,DC=local"
```
![](../fotos/Pasted%20image%2020251112094222.png)


**Dentro de Departamentos creé las OUs de cada área:**  
![](../fotos/Pasted%20image%2020251112094328.png)
``` powershell
New-ADOrganizationalUnit -Name "Administracion" -Path "OU=Departamentos,OU=HOSPITAL,DC=mohamed,DC=local" ProtectedFromAccidentalDeletion $true
```


**Creé los 4 grupos globales de seguridad en la OU Grupos:**  
``` powershell
New-ADGroup -Name "GG_Urgencias" -GroupScope Global -GroupCategory
Security -Path "OU=Grupos,OU=HOSPITAL,DC=mohamed,DC=local" ```
![](../fotos/Pasted%20image%2020251112094523.png)

   


**Creé 2 usuarios por departamento (8 en total) en la unidad organizativa Usuarios:**  
 Contraseña: A123456.  
 con cambio obligatorio al primer login  


**Los metí en su grupo correspondiente**  

``` powershell

New-ADUser -Name "Ana López" -SamAccountName "a.lopez" -UserPrincipalName "a.lopez@hospital.local" -Path "OU=Usuarios,OU=HOSPITAL,DC=mohamed,DC=local" -AccountPassword (ConvertTo-SecureString "A123456." -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $true
Add-ADGroupMember -Identity "GG_Urgencias" -Members "a.lopez"

```
### **CAMBIAR UPN a @hospital.local **

``` powershell
Get-ADUser -Filter * -SearchBase "OU=Usuarios,OU=HOSPITAL,DC=mohamed,DC=local" | ForEach-Object {
    $sam = $_.SamAccountName
    Set-ADUser -Identity $sam -UserPrincipalName "$sam@hospital.local"
}

```

#### **Comprobación final (lo que me salió en PowerShell)**
 ``` powershell
 
 PS C:\Users\Administrador> Get-ADOrganizationalUnit -Filter * -SearchBase "OU=HOSPITAL,DC=mohamed,DC=local" | Select Name

Name
----
HOSPITAL
Departamentos
Usuarios
Grupos
Equipos
Urgencias
UCI
Administracion
Informatica
 ```

**Los usuarios, sus grupos y sus UO**
![](../fotos/Pasted%20image%2020251112121136.png)


**Esta es la estructura en active directory**
![](../fotos/Pasted%20image%2020251112092548.png)
![](../fotos/Pasted%20image%2020251112092626.png)



**al iniciar sesión por primera vez me pide un cambio de contraseña**
![](../fotos/Pasted%20image%2020251112093511.png)


![](../fotos/Pasted%20image%2020251112093552.png)



