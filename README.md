notas para guardar cambios del obsidian

    cd "/home/user-pc/Documentos/Obsidian Vault/segundo-SMR"
    git add .
    git commit -m "Actualización de notas"
    git push


si hay error por que el repositorio remoto (segundo-SMR) ya tiene cambios que no existen en tu copia local,

    cd "/home/user-pc/Documentos/Obsidian Vault/segundo-SMR"
    git pull --rebase origin main
    git push
