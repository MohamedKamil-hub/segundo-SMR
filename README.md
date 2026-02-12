
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

- No se necesita texto alternativo   
- Usa `%20` en lugar de espacios en los nombres de archivo si es necesario.  
    Ejemplo: `Pasted image 20251112094523.png` → `Pasted%20image%2020251112094523.png`
  

2. La ruta siempre debe ser **relativa** desde donde está tu archivo `.md`:
    
Si tu archivo `.md` está dentro de `sor/` y las imágenes en `fotos/` (misma raíz), la ruta es: `../fotos/…`

2. Ejemplo completo:

    ```markdown
    ![](../fotos/Pasted%20image%2020251112094523.png)
    ```



|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| "I'm applying for [job title] at [company]. Here's the job description: [paste JD]. Identify the top 10 hard skills, soft skills, and keywords that appear most critical. Rank them by importance and tell me which ones I should prioritize in my resume."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| "You are an experienced recruiter and hiring manager in [TARGET INDUSTRY] who regularly screens resumes for roles like [TARGET ROLE TITLE].<br><br>Step 1 – Ask me questions:<br>Ask me up to 15 concise questions to understand:<br>- The exact job I want now (role, level, location/remote, salary band)<br>- The job description (I’ll paste it)<br>- My career stage (student/new grad, junior, mid, senior, lead, executive)<br>- My top 10 skills (technical + soft)<br>- My 5–10 biggest achievements<br>- Any constraints: employment gaps, career switch, short tenures, non-standard path, etc.<br>- Country I’m applying in (so you follow local resume norms)<br><br>Do NOT start writing a resume yet.<br><br>Step 2 – Summarize positioning:<br>After I answer:<br>- Summarize my ideal target role in 3–4 bullet points<br>- List 5–7 key value propositions that matter MOST for this role<br>- List 5–10 MUST-HAVE skills/keywords from the job description<br>- Highlight any risk factors (gaps, weak areas) and how we’ll strategically handle them in the resume<br><br>Wait for my confirmation on this summary before drafting anything." |









