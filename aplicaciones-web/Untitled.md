`<!DOCTYPE html>`
le indica a la pagina que todo va a estar escrito en html entonces el buscador esperara sintaxis de html


tags
`<p> contenido antes del tag de /cierre </p>`
hay otros tags que se cierran a si mismos
`<img src="imagen.png" alt="imagen de un gato">`
 de h1 a `<h6>`  son encabezados
 `<p> es para parrafos`
 `<ul> y <ol> es para listas y <div> es para agrupar contenido`
`<a> para links`
`<img> para imagenes y <span> para estilo de contenido`


comentarios
<!-- esto es un comentario-->


tag html

es el mas importante ya que define  la pagina web


**sección head**

contiene informacion usada por el buscador para dar e interactuar con la pagina web

incluye:  
`<tittle> que es el titulo de la pagina web`
`<meta>  metadatos que incluyen palabras clave como el autor ej.`
`links a archivos externos como`
``- `<link rel="stylesheet" href="styles.css"> <script src="script.js"></script>```
`codificacion de caracteres le dice al buscador que caracteres se van a usar en la pagina ej.`
`<meta charset="UTF-8">`

**seccion body**
es el contenido actual de la pagina con la que el user va a interactuar
```html
<!DOCTYPE html>
<html>
   <head>
      <title>John Smith Photography</title>
      <meta name="description" content="John Smith Photography specializes in capturing authentic and compelling images that tell the story of your business, project, or cause.">
      <link rel="stylesheet" href="styles.css">
      <script src="script.js"></script>
   </head>
   <body>
      <h1>Bringing Your Brand to Life with Striking Visuals</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="/resources/media/html-ess-1-7-1-apple-photo.jpg" alt="Apple photo">
   </body>
</html>
```



en imagenes se usa `<img>`
con alt="para el texto de la imagen"
y src si es un link externo o href si es interno

<!DOCTYPE html>
<html>
<head>
    <title>Indoor Plants</title>
    <meta name="description" content="Explore a variety of indoor plants for your home or office.">
    <meta charset="UTF-8">
</head>
<body>
    <!-- Title -->
    <h1>Indoor Plants</h1>

    <!-- Peace Lily Section -->
    <h2>Peace Lily</h2>
    <p>The Peace Lily, known for its elegant white flowers, is a popular choice for indoor spaces.</p>
    <p>Price: $15</p>
    <img src="https://edube.org/uploads/media/default/0001/04/spathiphyllum-peace-lily.jpg" alt="Peace Lily">

    <!-- Zanzibar Gem Section -->
    <h2>Zanzibar Gem</h2>
    <p>The Zanzibar Gem, with its glossy green foliage, is a low-maintenance indoor plant perfect for beginners.</p>
    <p>Price: $20</p>
    <img src="https://edube.org/uploads/media/default/0001/04/zamioculcas-zanzibar-gem.jpg" alt="Zanzibar Gem">
</body>
</html>

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


https://tickets.nerdearla.es?invited_by=Mzk3NzY0

media queries / modelo responsive mejor dicho


modelo

![[Pasted image 20251111182359.png]]tamaño de width depende de content box o borderbox
contenido padding izq  + der+  borde izq + borde derecha

borderbox buena practica

imagenes

width 100%   height auto

ejercicio

pagina conn div con texto dentro
en movil fondo rojo fuente pequeña alineacion centrado
mtablet azul mediana izquierda ordenador verde grande derecha


float: left


  

@media (max-width: 599px) {

    .caja1{

        background-color: red;

        font-size: small;      

        text-align: center;    

  }

}

  

@media (max-width: 1023px) and (min-width: 600px )  {

    .caja1{

        background-color: blue;

        font-size: medium;

        text-align: center;

    }

}

  

@media (min-width: 1024px )  {

    .caja1{

        background-color: green;

        font-size: large;

        text-align: right;

    }

}

## JavaScript en el navegador
- JavaScript se ejecuta directamente en el navegador
- No necesita compilador (se interpreta directamente)

## Cosas básicas de JavaScript

### Mostrar cosas en la consola
```javascript
console.log("Hola mundo");
```

### Comentarios
```javascript
// Esto es un comentario de una línea

/*
  Esto es un comentario
  de varias líneas (bloque)
*/
```

### Mostrar mensajes al usuario
```javascript
alert("¡Hola!"); // Muestra una ventana emergente
document.writeln("Texto en la página"); // Escribe directamente en la página
```

## Variables

### `let` (puede cambiar)
```javascript
let nombreVariable = "valor";
nombreVariable = "nuevo valor"; // ¡Sí se puede cambiar!
```

### `const` (NO puede cambiar)
```javascript
const nombreConstante = "99";
// nombreConstante = "100" ← ¡ERROR! No se puede cambiar
```

## Tipos de datos que pueden guardar
- **Texto** (strings): `"Hola"`
- **Números**: `10`, `3.14`
- **Booleanos**: `true` o `false`
- **null**: valor vacío a propósito
- **undefined**: no tiene valor asignado
- **Listas** (arrays): `[1, 2, 3]`
- **Objetos**: `{nombre: "Juan", edad: 20}`

## Operadores matemáticos
- `+` suma
- `-` resta  
- `/` división
- `*` multiplicación
- `%` resto de una división (lo que sobra)

## Comparaciones (dan `true` o `false`)
- `==` compara solo el valor
- `===` compara valor Y tipo de dato (más seguro)
- `>` mayor que
- `<` menor que
- `<=` menor o igual que
- `>=` mayor o igual que
- `!=` diferente

## Operadores lógicos
- `&&` Y (ambos deben ser true)
- `||` O (al menos uno debe ser true)

## Ejemplo práctico: Calculadora en HTML y JS

### HTML (archivo .html)
```html
<label>Número 1:</label>
<input type="number" id="num1">

<label>Número 2:</label>
<input type="number" id="num2">

<button onclick="sumar()">Sumar</button>

<p id="resultado"></p>

<script src="js/motor.js"></script>
```

### JavaScript (archivo motor.js)
```javascript
function sumar() {
  // Obtener valores de los inputs (vienen como texto)
  let n1 = document.getElementById("num1").value;
  let n2 = document.getElementById("num2").value;
  
  // Convertir a número para que sume (no concatene)
  n1 = Number(n1);  // También puedes usar: parseInt(n1) para enteros
  n2 = Number(n2);  // O parseFloat(n2) para decimales
  
  // Hacer la suma
  let suma = n1 + n2;
  
  // Mostrar el resultado
  document.getElementById("resultado").innerText = "Resultado: " + suma;
}
```

## ¡Importante sobre el signo +
El `+` hace dos cosas:
1. **Sumar** números: `5 + 3 = 8`
2. **Concatenar** (unir) textos: `"5" + "3" = "53"`

Por eso debemos convertir texto a número cuando queremos sumar:
- `Number(texto)` - convierte a número
- `parseInt(texto)` - convierte a número entero
- `parseFloat(texto)` - convierte a número con decimales

## Consejo
Siempre da un `id` a todos los inputs que quieras usar en JavaScript para poder identificarlos fácilmente.

# Apuntes corregidos - Condicionales en JavaScript

## Condicionales más usados: `if` y `else`

```javascript
let nota = 7;

if (nota >= 5) {
  console.log("Aprobado");
} else {
  console.log("Suspenso");
}
```

## `else if` (para varias condiciones)

```javascript
let nota = 7;

if (nota >= 9) {
  console.log("Sobresaliente");
} else if (nota >= 7) {
  console.log("Notable");
} else if (nota >= 5) {
  console.log("Aprobado");
} else {
  console.log("Suspenso");
}
```

## Otro tipo: `switch`
Útil cuando tienes muchas opciones para comparar

```javascript
let dia = 1;

switch(dia) {
  case 1: 
    console.log("Lunes");
    break;
    
  case 2:
    console.log("Martes");
    break;
    
  case 3:
    console.log("Miércoles");
    break;
    
  default:
    console.log("Otro día");
    break;
}
```

### ¡OJO con el `break`!
- El `break` hace que salgas del `switch`
- Si no pones `break`, sigue ejecutando los casos de abajo

## Ejemplo práctico: Verificar edad

### HTML
```html
<label>Introduce tu edad:</label>
<input type="number" id="edad">
<button onclick="comprobar()">Verificar</button>
<p id="msg"></p>
```

### JavaScript
```javascript
function comprobar() {
  // Obtener la edad y convertirla a número entero
  let e = parseInt(document.getElementById("edad").value);
  
  // Verificar si es mayor o menor de edad
  if (e >= 18) {
    document.getElementById("msg").innerHTML = "Mayor de edad";
  } else {
    document.getElementById("msg").innerHTML = "Menor de edad";
  }
}
```

## ¿Por qué usar `parseInt`?
- Los valores de los inputs vienen como texto ("18", "25")
- `parseInt()` convierte el texto a número entero
- Así podemos comparar con números: `e >= 18`

## Resumen rápido
- **if/else**: Para tomar decisiones (si esto, entonces aquello)
- **else if**: Para varias condiciones seguidas
- **switch**: Para comparar un valor con muchas opciones específicas
- **break**: En switch, para que no siga ejecutando otros casos

## Consejo
Siempre pon las llaves `{}` aunque solo tengas una línea en el if, así el código es más claro y evitas errores:

```javascript
// ✔ MEJOR (más claro)
if (edad >= 18) {
  console.log("Mayor");
}

// ✗ Puede causar confusión
if (edad >= 18)
  console.log("Mayor");
```




menu responsive y pop up de cookies


parte script al final en el index.html
programacion modular7

variable
constante

cualuqier cosa se <> ! antes del =
10 != 9
8 <= 9


&& y 
|| o

![[Pasted image 20251209184313.png]]

condiciones
if     else  y else if



menu responsive siempre a la derecha
cuando hagas click en un boton acticas clase que no existe


## XML tipo de documento similar a html
almacena y transporta datos
parte de un nodo principal
![[Pasted image 20260116162607.png]]


![[Pasted image 20260116163423.png]]

poner prologo es importante
info que indica que es un xml que indica la version y el tipo de codificacion
`<?xml version="1.0" encoding="UTF-8"?>`
siempre tener un unico nodo principal

atributos
``` xml
<ciudades>

    <ciudad>

        <persona edad="30" idioma="español">pepe </persona> no abusar de ellos

    </ciudad>
    
    element isntituto (ciclos, profesores)
    attlist instituto id cdata #required
    
    element ciclo empty
    
    element email #pcdata 
    +? son para si quieres nada uno ...
    
```



``` xml
``` 