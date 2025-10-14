
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
