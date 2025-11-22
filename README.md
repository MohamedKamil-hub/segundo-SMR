
**Para guardar cambios del Obsidian en GitHub desde WSL o Git Bash :**

```bash
cd ~/Downloads/segundo-SMR-main
git add .
git commit -m "Actualización de notas"
git push origin main
```

---

**Si hay error porque el repositorio remoto tiene cambios que tu copia local no tiene:**

```bash
cd ~/Downloads/segundo-SMR-main
git pull origin main --allow-unrelated-histories --no-rebase
git add .
git commit -m "Resolviendo conflictos y actualizando notas"
git push origin main
```



añadir capturas de imágenes para que se vean en GitHub


   ```markdown
   ![](../fotos/NOMBRE_DE_LA_IMAGEN.png)
```

- No se necesita texto alternativo si no quieres mostrarlo.
    
- Usa `%20` en lugar de espacios en los nombres de archivo si es necesario.  
    Ejemplo: `Pasted image 20251112094523.png` → `Pasted%20image%2020251112094523.png`
    

2. La ruta siempre debe ser **relativa** desde donde está tu archivo `.md`:
    
    - Si tu archivo `.md` está dentro de `sor/` y las imágenes en `fotos/` (misma raíz), la ruta es: `../fotos/…`
        
3. Ejemplo completo:
    
    ```markdown
    ![](../fotos/Pasted%20image%2020251112094523.png)
    ```
    













