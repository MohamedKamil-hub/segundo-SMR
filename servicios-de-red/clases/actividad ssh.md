


# Configuración de SSH con clave pública/privada sin contraseña

Este documento explica cómo se configuró una conexión SSH que **solo funciona con clave pública y privada**, sin necesidad de usar contraseña, entre un host Windows y un servidor Ubuntu 24.04.

---

## 1. Generar la pareja de claves en el host

En Windows PowerShell:

```powershell
ssh-keygen -t ed25519 -C "mohamedkamil@host"
````

- Cuando pregunta la ubicación para guardar la clave, se usó: `pareja`
    
- Esto genera dos archivos en el host:
    
    - `pareja` → clave privada
        
    - `pareja.pub` → clave pública
        
- Se puede dejar vacía la passphrase para no pedir contraseña localmente.
    

---

## 2. Copiar la clave pública al servidor

1. Conectar al servidor y crear la carpeta `.ssh` si no existe:
    

```bash
ssh mohamedkamil@192.168.1.220 "mkdir -p ~/.ssh && chmod 700 ~/.ssh"
```

2. Editar el archivo `authorized_keys` y pegar la clave pública completa (`pareja.pub`):
    

```bash
nano ~/.ssh/authorized_keys
```

- Pegar contenido de `pareja.pub`:
    

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIfI5Jihofl20ww5Fbpz3iajwXZey1qrDLws+p1OEmzV mohamedkamil@host
```

3. Ajustar permisos:
    

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chown -R mohamedkamil:mohamedkamil ~/.ssh
```

---

## 3. Configurar SSH para usar solo la clave

Editar el archivo de configuración del servidor:

```bash
sudo nano /etc/ssh/sshd_config
```

Agregar o modificar estas líneas:

```
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
PasswordAuthentication no
```

Reiniciar el servicio SSH:

```bash
sudo systemctl restart ssh
```

---

## 4. Conectarse desde el host

Desde Windows PowerShell, usar la clave privada para conectarse:

```powershell
ssh -i C:\Users\mohamed\pareja mohamedkamil@192.168.1.220
```

- Ahora la conexión **no pedirá contraseña**.
    
- Solo se puede acceder al servidor con la clave correcta.
    

---

## 5. Notas importantes

- La clave pública **debe estar en el usuario correcto** del servidor (ej. `/home/mohamedkamil/.ssh/authorized_keys`), no en root si no te conectas como root.
    
- Los permisos son críticos:
    
    - `.ssh` → 700
        
    - `authorized_keys` → 600
        
- Deshabilitar el acceso por contraseña aumenta la seguridad.
    

