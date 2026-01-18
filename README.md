
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



# 1. Dual N-Back Training (Working Memory Upgrade)  
This exercise pushes your brain to hold multiple pieces of information at once — a core skill behind problem-solving and intelligence.  
  
It strengthens your working memory the same way weights strengthen your muscles.  
Even 10–15 minutes a day can improve focus, reasoning, and information processing speed.  
Think of it as a mental gym session that compounds over time.  
  
2. Active Recall Sessions (Think Deep, Not Hard)  
Instead of rereading or highlighting, active recall forces your brain to pull information out — not just look at it.  
This creates stronger neural connections, making your thinking faster and sharper.  
  
When you quiz yourself, your brain is forced into “effort mode,” which is where real intelligence grows.  
It’s simple: test more, study less, remember 10× better.  
  
3. Thinking in Mental Models (Sharper Decisions)  
Smart people don’t use random thoughts — they use frameworks.  
  
Mental models like first principles, inversion, and the 80/20 rule help you understand problems from angles others miss.  
They strip away noise, reveal what actually matters, and guide you to clearer decisions.  
  
Once you start thinking in models, life becomes easier, decisions become sharper, and your mind becomes stronger.



|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ```<br>"I'm applying for [job title] at [company]. Here's the job description: [paste JD]. Identify the top 10 hard skills, soft skills, and keywords that appear most critical. Rank them by importance and tell me which ones I should prioritize in my resume."<br>```                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ```<br>"You are an experienced recruiter and hiring manager in [TARGET INDUSTRY] who regularly screens resumes for roles like [TARGET ROLE TITLE].<br><br>Step 1 – Ask me questions:<br>Ask me up to 15 concise questions to understand:<br>- The exact job I want now (role, level, location/remote, salary band)<br>- The job description (I’ll paste it)<br>- My career stage (student/new grad, junior, mid, senior, lead, executive)<br>- My top 10 skills (technical + soft)<br>- My 5–10 biggest achievements<br>- Any constraints: employment gaps, career switch, short tenures, non-standard path, etc.<br>- Country I’m applying in (so you follow local resume norms)<br><br>Do NOT start writing a resume yet.<br><br>Step 2 – Summarize positioning:<br>After I answer:<br>- Summarize my ideal target role in 3–4 bullet points<br>- List 5–7 key value propositions that matter MOST for this role<br>- List 5–10 MUST-HAVE skills/keywords from the job description<br>- Highlight any risk factors (gaps, weak areas) and how we’ll strategically handle them in the resume<br><br>Wait for my confirmation on this summary before drafting anything."<br>``` |









