## Unidad 3: HTML5 y  estructuras  básicas

#### Sesión 3: Estructura básica en HTML5, etiquetas semánticas y validación con W3C  

# Introducción a HTML5

Cuando hablamos de **HTML (HyperText Markup Language)**, hablamos de un lenguaje de marcado, no de programación.  
Su objetivo no es definir la **estructura y el significado** de los elementos que forman una página web.  

---

## Antes de HTML5  
Las páginas se organizaban con etiquetas genéricas como `<div>` o `<span>` sin indicar qué tipo de contenido contenían.  
Esto dificultaba tanto la accesibilidad como la interpretación de los buscadores.  

### HTML5 introdujo etiquetas semánticas:
- `<header>` → identifica el encabezado de una página o sección.  
- `<nav>` → agrupa los enlaces de navegación principales.  
- `<main>` → contiene el contenido más importante y único de la página.  
- `<article>` → representa una unidad de contenido independiente, como una noticia.  
- `<section>` → agrupa contenido temáticamente relacionado dentro de una página o artículo.  
- `<aside>` → contiene información secundaria o complementaria.  
- `<footer>` → cierra la estructura incluyendo información de contacto o créditos.  

---

## Ventajas del enfoque semántico
- **Accesibilidad:** los lectores de pantalla y herramientas de asistencia entienden mejor la jerarquía y función de cada parte.  
- **Mantenimiento:** un código semántico y bien estructurado es más fácil de leer, mantener y escalar.  
- **SEO / Posicionamiento:** los motores de búsqueda identifican qué es cada elemento, mejorando indexación y ranking.  

---

## Estructura básica de un documento HTML5

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Mi primera página</title>
</head>
<body>
  <header>
    <h1>Título principal</h1>
  </header>
  <main>
    <article>
      <h2>Subtítulo</h2>
      <p>Contenido del artículo...</p>
    </article>
  </main>
  <footer>
    <p>© 2025 Tu Nombre</p>
  </footer>
</body>
</html>
```


`Cada parte cumple un rol definido: 
<!DOCTYPE html> declara que se usa la versión HTML5;`  
`<head> incluye metadatos invisibles para el usuario (como el título o la codificación); y <body>`  contiene todo lo que el visitante verá.  
 
## futuros y mejora la accesibilidad

![[Pasted image 20251018203734.png]]




### Herramientas y Consejos para tu Futuro Profesional  

**01  Valida siempre tu código con  el W3C Validator**  
- El validador mostrará advertencias y errores detallados, con sugerencias para corregirlos.  
- mejora la calidad del  código, previene errores de visualización y facilita el mantenimiento.  

**02  Aplica la lógica "de arriba  abajo"**  
Piensa tu página como un documento con jerarquía, igual que un periódico: encabezado,  
navegación, contenido principal, secciones,  artículos y pie. 

**03  Usa un editor con soporte  HTML5 y linting**  
Visual Studio Code, Sublime Text o Brackets detectan errores en tiempo real y  
te sugieren etiquetas válidas.  
Extensiones como  HTMLHint o  Prettier  ayudan a mantener un código limpio e indentado.  
**04  Revisa la accesibilidad con herramientas complementarias**  
Wave Accessibility Tool para comprobar si tus etiquetas semánticas están bien utilizadas as.  
**05  No olvides los metadatos**  
Dentro del `<head>`, incluye etiquetas como `<meta charset="UTF-8">, <meta name="description">` o  `<meta name="viewport">`. Son invisibles para el usuario, pero esenciales para el SEO, la compatibilidad móvil y la indexación de tu web.

#### **Mitos y Realidades**  

**Mito: Las etiquetas semánticas solo sirven para el SEO.** 
FALSO.  su objetivo principal es la accesibilidad y la estructura lógica.  
Gracias a ellas, los lectores pueden navegar por secciones o menús de forma ordenada.

**Mito: Si la página se ve bien, el HTML está correcto.**  
FALSO. Los navegadores modernos renderizan incluso código mal formado. los errores en HTML pueden generar problemas de compatibilidad, roturas de diseño en otros dispositivos y fallos de indexación SEO.  

#### **Resumen Final (para repaso y examen)**  
HTML5 = lenguaje de estructura y significado de la web.  
Estructura básica: `<!DOCTYPE html>, <html>, <head>, <body>.`  
Etiquetas semánticas: `<header>, <nav>, <main>, <article>, <section>, <footer>.`  
Ventajas: accesibilidad, SEO y mantenimiento.  
Validación W3C: asegura cumplimiento de estándares internacionales  
y evita errores.


**Formularios, multimedia y atributos ARIA para accesibilidad. Ejemplos en CodePen** 

HTML5 no solo organiza el contenido, también potencia  la interactividad, la accesibilidad y la experiencia del usuario. Tres de los avances más  significativos del estándar son:  
1. la evolución de los formularios
2. la incorporación de elementos multimedia nativos
3. y la integración de los atributos ARIA (Accessible Rich Internet Applications).

#### Formularios en HTML5: más inteligentes y accesibles  
Los formularios son el punto de contacto directo entre el usuario y una aplicación web.  
HTML5 los ha mejorado incorporando nuevos tipos de campos (input) que reducen  
errores y mejoran la usabilidad. Por ejemplo:  

`<input type="email">` valida automáticamente que el texto contenga una dirección de  
correo válida.  
`<input type="date">` muestra un selector de calendario nativo en móviles y  
navegadores compatibles.  
`<input type="range">` permite seleccionar valores mediante un control deslizante.  
`<input type="number">, <input type="tel"> o <input type="color">` se adaptan al contexto y dispositivos.  

#### Multimedia sin plugins: audio y vídeo nativos  
Con HTML5, los elementos `<video>` y `<audio>` permiten integrar contenido multimedia de forma nativa y accesible:  


**Atributos ARIA: accesibilidad para todos**  
Las WAI-ARIA (Web Accessibility Initiative Accessible Rich Internet Applications) son un  
conjunto de atributos que proporcionan info adicional a los lectores de pantalla 

Entre los atributos más comunes están:  
- aria-label: proporciona una descripción textual.  
- aria-labelledby: vincula el elemento a una etiqueta visible.  
- aria-describedby: asocia el elemento con un texto que ofrece información adicional.  
- aria-required="true": indica que un campo de formulario es obligatorio.  
- role: define la función de un elemento cuando no es semánticamente claro.  

**CodePen: laboratorio en línea para aprender haciendo**  
CodePen.io es una plataforma que permite escribir HTML, CSS y JavaScript  
directamente en el navegador y ver los resultados al instante. 

#### Herramientas y Consejos para tu Futuro Profesional

 CodePen
- Laboratorio online para probar HTML, CSS y JS en tiempo real.
- Útil para practicar formularios, inputs y validación nativa.

Atributos ARIA
- `aria-label`: en botones o iconos sin texto.
- `aria-describedby`: asociar mensajes de ayuda/error a inputs.
- No repetir roles ya implícitos (ej: `<button>` no necesita `role="button"`)

Multimedia accesible
- Usar varios formatos de vídeo: **mp4, webm, ogg**.
- Añadir descripciones: `<track kind="captions">`, `<track kind="descriptions">`.
- Evitar autoplay: dificulta la navegación.

Validación de accesibilidad
- **WAVE (WebAIM):** analiza etiquetas, ARIA, contrastes, errores.
- **Lighthouse (Chrome):** informes de accesibilidad, SEO y rendimiento.
- **NVDA:** lector de pantalla gratuito para probar experiencia de usuarios ciegos.

 Validación W3C
- Formularios y multimedia deben cumplir estándares.
- Validar en **validator.w3.org** para asegurar compatibilidad y accesibilidad.

#### Mitos y Realidades  

**Mito**: Los atributos ARIA son solo para usuarios con discapacidad.
benefician a todos. Un  formulario etiquetado con ARIA es más claro, reduce errores y mejora  la interacción general.  

**Mito**: Los elementos `<video>` `<audio>` funcionan igual en todos los navegadores.  
FALSO. Cada navegador soporta distintos formatos.

**Resumen Final (para repaso y examen)**  
1 HTML5 amplía sus  capacidades con  formularios inteligentes, elementos  multimedia y atributos ARIA.  
2 Formularios: nuevos tipos de input y validación nativa (email, date, range).  
3 Multimedia:  <video> y <audio>  permiten  reproducir  contenido sin plugins externos.  
4 Accesibilidad:  ARIA (Accessible  Rich Internet  Applications)  mejora la  experiencia para todos los usuarios.  
5 Herramienta clave: CodePen, ideal para  practicar HTML, CSS y JavaScript en línea.  
6 Buenas prácticas:  validar el código  con W3C y  comprobar la accesibilidad con  WAVE o Lighthouse