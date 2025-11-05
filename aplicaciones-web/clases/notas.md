**vemos mas etiquetas html**

index es el primer archivo que consulta el servidor web
html es un arbol de nodos

es una metaetiqueta 

`<meta charset="UTF-8"> <!--#es como el shebang # codificaciones (todo eso es para el explorador) #web responsive que se adapta a los dispositivos el tamaño y la estructuracion -->>`

# **cargar una imagen**

**desde HTML** guardar la imagen a una carpeta local (sin copyright) en jpg
guardarla con un nombre intuitivo

siempre usar rutas relativas en src=""

`<br> <img src="img/mono.jpg">`


## insertar links

`<a href="aqui pones la url" target="blank"> pulsa este boton</a>`
en vez de link poner # para que no lleve a ninguna parte
`href="#"`
## listas

**listas ordenadas ol para englobar y li para cada elemento**
`<ol type="A">`

`<li>comprar patata</li>`

`<li>adoptar cachorros</li>`

`</ol>`

**listas no ordenadas ul**
`<ul type="i">`

`<li>comprar mas patata</li>`

`<li>adoptar mas cachorros</li>`

`<li>pasarla bien</li>`

`</ul>`
**listas por definicion dt termino , dd (definicion)  y dl  para englobar**

`<dl>`

`<dt>esternocleido mastpodep</dt>`

`<dd>musculo</dd>`

`</dl>`


**dar tipo de lista con `<ol poner type="">`**

![[Pasted image 20251007195059.png]]

**siguiente tcontenido seran tablas y landing page**




**tablas html**
tr es para filas de tablas

            th es encabezado de tabla

            td es para campos de tabla


`    <table border="1">   border es para poner bordes

        <caption>esto es el titulo de la tabla</caption>

        <!--tr es para filas de tablas

            th es encabezado de tabla

            td es para campos de tabla-->

            <tr>

                <th>ciudad</th>

                <th>aeropuerto</th>

                <th>playa</th>

                <th>habitantes</th>

            </tr>

  

            <tr>

                <td>Reus</td>

                <td>si</td>

                <td>no</td>

                <td>100000</td>

            </tr>

  

            <tr>

                <td>tarragona</td>

                <td>no</td>

                <td>si</td>

                <td>130000</td>

            </tr>

  

            <tr>

                <td>madrid</td>

                <td>si</td>

                <td>no</td>

                <td>130000</td>

            </tr>

  

            <tr>

            <td>barcelona</td>

            <td>si</td>

            <td>si</td>

            <td>1600000</td>

  

            </tr>`







combinar varias cloumnas 
`<td colspan="2">1 eso a</td>`

combinar columnas<!




# css basico

# Notas rápidas (MD) — **CSS básico** — para entender y memorizar fácil

---

# ¿Qué es CSS?

CSS (Cascading Style Sheets) controla el aspecto de HTML: colores, tipografías, márgenes, disposición, etc.

**Regla mnemotécnica:** **S·P·V** → **Selector · Propiedad · Valor**

---

# Estructura básica

```css
selector {
  propiedad: valor;
  propiedad2: valor2;
}
```

Ejemplo:

```css
h1 {
  color: red;
  font-size: 32px;
}
```

---

# 3 formas de usar CSS

**1. Inline (no recomendado)**

```html
<h1 style="color: red;">Hola</h1>
```

**2. Interno (dentro de `<head>`)**

```html
<head>
  <style>
    h1 { color: aqua; }
  </style>
</head>
```

**3. Externo (recomendado)**  
Crear `style.css`:

```css
p { color: aquamarine; }
h1 { color: red; }
```

En `index.html` (ponerlo en `<head>` justo después de meta tags):

```html
<link rel="stylesheet" href="style.css">
```

> Ruta relativa: `href="style.css"` (si el archivo está en la misma carpeta)

---

# Comentarios

```css
/* Esto es un comentario en CSS */
```

---

# Cascada y prioridad

- **Cascada:** gana la regla más _reciente_ si tienen misma especificidad.
    
- **Especificidad (resumen):** inline (atributo `style`) > `#id` > `.clase` > `elemento`.
    
- `!important` fuerza prioridad pero úsalo con moderación.
    

---

# Selectores comunes

```css
/* Elemento */
p {}

/* Clase */
.card {}

/* Id */
#menu {}

/* Descendiente */
nav a {}

/* Hijo directo */
ul > li {}

/* Universal */
* { box-sizing: border-box; }

/* Atributo */
input[type="text"] {}

/* Pseudo-clases / pseudo-elementos */
a:hover {}
p::first-line {}
```

---

# Propiedades útiles (cheat-sheet)

- Texto: `color`, `font-size`, `font-family`, `font-style`, `font-weight`
    
- Caja: `margin`, `padding`, `border`, `width`, `height`
    
- Fondo: `background-color`, `background-image`, `background-size`
    
- Display/Layout: `display`, `position`, `top/right/bottom/left`, `float`, `flex`, `grid`
    
- Visual: `opacity`, `box-shadow`, `border-radius`
    
- Otras: `text-align`, `line-height`, `z-index`
    

---

# Tipos de fuente

**@font-face** (local)

```css
@font-face {
  font-family: 'MiFuente';
  src: url('mi-fuente.ttf') format('truetype');
}
h1 { font-family: 'MiFuente', sans-serif; }
```

**Google Fonts** (ejemplo)

```html
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
```

```css
body { font-family: 'Roboto', system-ui, sans-serif; }
```

---

# Ejemplo completo mínimo (index.html + style.css)

`index.html`

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="style.css">
  <title>Intro CSS</title>
</head>
<body>
  <h1>Intro CSS</h1>
  <p>Parrafo de ejemplo.</p>
</body>
</html>
```

`style.css`

```css
body {
  background-color: antiquewhite;
  margin: 3cm;
}

h1 {
  color: red;
  font-family: 'MiFuente', sans-serif;
}

p {
  color: aquamarine;
  font-size: 1.25rem;
}
```

---

# Errores comunes (a memorizar)

- Olvidar `;` al final de una propiedad.
    
- No cerrar `}`.
    
- Poner `<style>` fuera de `<head>`.
    
- Ruta incorrecta en `href` (`index.hrtml` → `index.html`).
    
- Confundir `padding` con `margin`.
    

---

# Trucos para memorizar rápido

1. **Tarjetas (flashcards)**: una tarjeta = un selector / propiedad / ejemplo.
    
2. **5-min practice**: en un archivo `index.html`, cambia color, margin y font-size cada día.
    
3. **Regla S·P·V**: repítela en voz alta antes de escribir CSS.
    
4. **DevTools**: inspecciona un elemento, modifica propiedades y observa resultados.
    
5. **Pequeños retos** (10 min):
    
    - Cambia color de todos los `p`.
        
    - Crea `.card` con `padding` y `border-radius`.
        
    - Haz que `h1` use una fuente local con `@font-face`.
        

---

# Ejercicios prácticos (resuelto rápido)

**1. Poner fondo gris y centrar texto en `h1`:**

```css
body { background-color: #f0f0f0; }
h1 { text-align: center; }
```

**2. Clase `.btn` con padding y borde redondeado:**

```css
.btn {
  padding: 0.5rem 1rem;
  border-radius: 8px;
  display: inline-block;
}
```

---

# Resumen ultra-rápido (para repasar)

- CSS = **Selector { propiedad: valor; }**
    
- 3 formas: inline, interno `<style>`, externo `link` (usar externo).
    
- Comentarios: `/* ... */`
    
- Cascada: lo **último** vence; especificidad importa.
    
- Practica en el navegador con DevTools.
    

---

Si quieres, te genero 10 tarjetas flash en MD para practicar (pregunta → respuesta). ¿Lo hago?
selector universal
selector de etiqueta
propiedad 
valor



divs


![[Pasted image 20251104193322.png]]