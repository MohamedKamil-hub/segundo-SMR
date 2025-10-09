
**Para guardar cambios del Obsidian en GitHub desde WSL:**

```bash
cd /mnt/c/Users/mohamed/Downloads/segundo-SMR-main
git add .
git commit -m "Actualización de notas"
git push origin main
```

---

**Si hay error porque el repositorio remoto tiene cambios que tu copia local no tiene:**

```bash
cd /mnt/c/Users/mohamed/Downloads/segundo-SMR-main
git pull --rebase origin main
git add .
git commit -m "Actualización de notas"
git push origin main
```
