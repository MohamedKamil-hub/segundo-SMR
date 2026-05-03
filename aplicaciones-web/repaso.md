# 📚 Guía Definitiva: Aplicaciones Web — 2º SMR

> [!NOTE] ¿Cómo usar estos apuntes? Este documento está optimizado para **Obsidian**. Cada sección cubre un bloque temático del módulo. Los callouts `[!TIP]` son **trucos de examen**, los `[!WARNING]` son **errores frecuentes** y los `[!IMPORTANT]` son definiciones clave que memorizar.

---

## Índice de Contenidos

1. [[#Bloque 1 — La Web y sus Tipos]]
2. [[#Bloque 2 — Arquitectura Cliente-Servidor]]
3. [[#Bloque 3 — HTML: Estructura y Etiquetas]]
4. [[#Bloque 4 — CSS: Estilos y Diseño]]
5. [[#Bloque 5 — JavaScript y el DOM]]
6. [[#Bloque 6 — Aplicaciones Web Dinámicas y CMS]]
7. [[#Bloque 7 — WordPress a Fondo]]
8. [[#Bloque 8 — Seguridad Web]]
9. [[#Bloque 9 — Optimización: SEO, Rendimiento y Accesibilidad]]
10. [[#Bloque 10 — Despliegue y Entornos de Desarrollo]]

---

## Bloque 1 — La Web y sus Tipos

### ¿Qué es la Web 2.0?

La **Web 1.0** era estática: páginas sin interacción, el usuario solo leía. La **Web 2.0** introduce la **participación activa del usuario**: puede crear, compartir y colaborar.

> [!IMPORTANT] Definición clave — Web 2.0 Web donde el usuario **genera y comparte contenido**. Ejemplos: Wikipedia, blogs, foros, redes sociales.

|Característica|Web 1.0|Web 2.0|
|---|---|---|
|Contenido|Estático|Dinámico y participativo|
|Usuario|Lector pasivo|Creador activo|
|Ejemplo|Página HTML sin interacción|Wikipedia, Facebook, YouTube|

> [!TIP] Truco de examen Si una opción dice "contenido estático" o "sin interacción" → **NO es Web 2.0**. Si dice "participación del usuario" → **SÍ es Web 2.0**.

---

### Tipos de Aplicaciones Web

| Tipo                              | Descripción                                   | Ejemplo                   |
| --------------------------------- | --------------------------------------------- | ------------------------- |
| **Estática**                      | HTML fijo, sin BD, se edita el código a mano  | Landing page simple       |
| **Dinámica**                      | Genera contenido desde BD                     | WordPress, tiendas online |
| **SPA** (Single Page Application) | Carga una sola página, actualiza sin recargar | Gmail, Google Maps        |

> [!IMPORTANT] Ventaja de seguridad de webs estáticas No tienen base de datos → **menor superficie de ataque**. Si no hay BD, no hay SQL injection.

> [!WARNING] Error frecuente "SPA" no significa que la web tenga una sola sección de contenido. Significa que técnicamente **solo hay una petición inicial al servidor** y el resto se actualiza dinámicamente con JavaScript.

---

### Tipos de Aplicaciones Web por Función

- **Blog**: Web con entradas ordenadas por fecha. CMS principal → **WordPress**.
- **Foro**: Para debatir y publicar mensajes. Tiene roles (moderador, usuario, invitado).
- **Wiki**: Contenido colaborativo (ej. Wikipedia). Predomina el contenido creado por varios.
- **Gestor de imágenes**: Organiza y comparte imágenes en álbumes (ej. Flickr).
- **Correo web (Webmail)**: Acceso al correo desde el navegador, sin instalar cliente local.
- **Ofiimática web**: Google Docs, Office 365. Permite trabajo colaborativo online.
- **Sistema operativo online**: Simula un escritorio desde el navegador web.

> [!TIP] Diferencia Blog vs Wiki
> 
> - **Blog** = entradas ordenadas por fecha, autor principal.
> - **Wiki** = contenido colaborativo entre muchos usuarios.

---

### RSS y Feeds

> [!IMPORTANT] ¿Qué es un Feed RSS? Un **archivo XML** que contiene las novedades/actualizaciones de una web. Los lectores de RSS (como **Feedly**) se suscriben a estos feeds para recibir actualizaciones sin visitar cada web.

**Función principal:** recibir actualizaciones de contenido de webs (noticias, blogs...).

---

## Bloque 2 — Arquitectura Cliente-Servidor

### El Modelo Cliente-Servidor

> [!IMPORTANT] Arquitectura base de la web La web funciona bajo el modelo **cliente-servidor**:
> 
> - **Cliente** = navegador (Chrome, Firefox...) → envía peticiones HTTP/HTTPS.
> - **Servidor** = máquina que escucha peticiones y responde con recursos.

### Flujo de una Petición Web

```
[Usuario escribe URL]
       ↓
[Navegador (cliente) envía petición HTTP/HTTPS]
       ↓
[Servidor web (Apache/NGINX) recibe la petición]
       ↓
[Servidor busca el recurso / consulta la BD]
       ↓
[Servidor envía respuesta (HTML, JSON...)]
       ↓
[Navegador renderiza (interpreta y muestra) el resultado]
```

> [!NOTE] Pasos del proceso — memorizarlos en orden
> 
> 1. **Petición** del cliente
> 2. **Procesamiento** en el servidor
> 3. **Respuesta** del servidor
> 4. **Renderizado** en el navegador

---

### Servidores Web: Apache vs NGINX

| |Apache HTTP Server|NGINX|
|---|---|---|
|Antigüedad|El más veterano del mercado|Más moderno|
|Característica|Flexible, usa módulos `.htaccess`|Alto rendimiento, muchas conexiones|
|Uso|Web clásica, PHP|Proxy inverso, webs de alto tráfico|

> [!NOTE] Archivos .htaccess Son **archivos de configuración** de Apache que definen reglas para carpetas específicas (redirecciones, permisos, etc.).

---

### localhost

> [!TIP] ¿Qué es localhost? `http://localhost/` accede al servidor web que **corre en tu propio ordenador**. Es la dirección de loopback local. Se usa en desarrollo con XAMPP.

---

### Almacenamiento de Datos

- **Datos de la aplicación** → se guardan en la **base de datos** (MariaDB/MySQL).
- **Sesiones de usuario** → se guardan en el **servidor** (para seguridad).
- **Cookies** → pequeños archivos guardados en el **navegador del cliente**.

> [!IMPORTANT] Cookies vs Sesiones
> 
> ||Cookies|Sesiones|
> |---|---|---|
> |Dónde se guardan|Navegador del cliente|Servidor|
> |Ejemplo de uso|Recordar carrito de compra|Mantener login activo|
> |Seguridad|Menor (accesible en el cliente)|Mayor|

---

## Bloque 3 — HTML: Estructura y Etiquetas

### ¿Qué es HTML?

> [!IMPORTANT] Definición **HyperText Markup Language** = Lenguaje de **marcado** (no de programación) para definir la **estructura** del contenido web. El navegador lo interpreta para mostrar la página.

---

### Estructura Básica de un Documento HTML

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Mi página</title>
  </head>
  <body>
    <!-- Contenido visible aquí -->
  </body>
</html>
```

|Etiqueta|Función|
|---|---|
|`<!DOCTYPE html>`|Declara que es un documento HTML5|
|`<html>`|Raíz del documento|
|`<head>`|Metadatos (no visible)|
|`<body>`|**Todo el contenido visible**|
|`<title>`|Título en la pestaña del navegador|
|`<meta>`|Metadatos (charset, descripción SEO...)|

---

### Etiquetas de Contenido Esenciales

#### Texto y Formato

|Etiqueta|Función|
|---|---|
|`<h1>` a `<h6>`|Encabezados (h1 = principal)|
|`<p>`|Párrafo|
|`<br>`|Salto de línea (sin cierre)|
|`<hr>`|Línea horizontal (sin cierre)|
|`<b>`|**Negrita**|
|`<em>`|_Cursiva/énfasis_|
|`<pre>`|Texto preformateado (respeta espacios)|

> [!WARNING] Error frecuente — `<h1>` vs `<header>`
> 
> - `<h1>` = etiqueta de **encabezado principal del texto** (nivel de contenido).
> - `<header>` = etiqueta **semántica** que define la cabecera de la página o sección. Son distintas. En el examen pueden confundirte.

---

#### Listas

```html
<!-- Lista ordenada (con números) -->
<ol>
  <li>Primer elemento</li>
  <li>Segundo elemento</li>
</ol>

<!-- Lista desordenada (con viñetas) -->
<ul>
  <li>Elemento A</li>
  <li>Elemento B</li>
</ul>
```

> [!TIP] Truco de examen
> 
> - `<ol>` = **O**rdenada = números
> - `<ul>` = **U**nordenada = viñetas
> - `<li>` = elemento de lista (se usa en ambas)

---

#### Imágenes y Multimedia

```html
<!-- Imagen -->
<img src="foto.jpg" alt="Descripción de la imagen">

<!-- Vídeo HTML5 con múltiples fuentes -->
<video controls>
  <source src="video.mp4" type="video/mp4">
  <source src="video.webm" type="video/webm">
  Texto alternativo si no se soporta video.
</video>

<!-- Contenido externo (vídeos, mapas) -->
<iframe src="https://..."></iframe>
```

> [!IMPORTANT] Atributo `alt` en imágenes El atributo `alt` es fundamental para:
> 
> 1. **Accesibilidad** (lectores de pantalla para personas con discapacidad visual)
> 2. **SEO** (los buscadores no "ven" imágenes, leen el alt)
> 3. Mostrar texto si la imagen no carga

> [!NOTE] ¿Por qué múltiples `<source>` en vídeos? Cada navegador soporta distintos formatos/códecs de vídeo (mp4, webm, ogg...). Al poner varias fuentes, el navegador elige la que puede reproducir.

---

#### Tablas

```html
<table>
  <tr>                        <!-- Fila (table row) -->
    <th>Encabezado 1</th>     <!-- Celda de cabecera -->
    <th>Encabezado 2</th>
  </tr>
  <tr>
    <td>Dato 1</td>           <!-- Celda normal -->
    <td>Dato 2</td>
  </tr>
</table>
```

| Etiqueta  | Función                                    |
| --------- | ------------------------------------------ |
| `<table>` | Define la tabla                            |
| `<tr>`    | Fila de la tabla                           |
| `<th>`    | Celda de **cabecera** (negrita y centrada) |
| `<td>`    | **Celda** normal de datos                  |

**Atributos especiales:**

- `colspan="2"` → fusiona **columnas**
- `rowspan="2"` → fusiona **filas**

---

#### Formularios y Botones

```html
<form action="/enviar" method="POST">
  <input type="text" required>
  <input type="email" placeholder="tu@email.com">
  <input type="range" min="0" max="100">
  <button type="submit">Enviar</button>
</form>
```

|Atributo/Etiqueta|Función|
|---|---|
|`<form>`|Agrupa los elementos del formulario|
|`<button>`|Botón interactivo|
|`required`|**Obliga** a rellenar el campo|
|`type="email"`|Valida formato de correo electrónico|
|`type="range"`|Control deslizante para valor numérico|
|`onclick`|Ejecuta JavaScript al hacer clic|

---

#### Atributos Clave

|Atributo|Función|
|---|---|
|`id`|Identificador **único** del elemento|
|`class`|Clase para aplicar estilos CSS (puede repetirse)|
|`style`|Estilos en línea directamente en el elemento|
|`href`|URL del hipervínculo `<a>`|
|`src`|Fuente de imagen o script|
|`alt`|Texto alternativo de imagen|

---

### Etiquetas Semánticas de HTML5

> [!IMPORTANT] ¿Qué significa "semántico"? Una etiqueta semántica describe el **significado** de su contenido, no solo su apariencia. Ayuda a buscadores (SEO) y a lectores de pantalla (accesibilidad).

```
┌─────────────────────────────┐
│         <header>            │  ← Cabecera de la página
├─────────────────────────────┤
│           <nav>             │  ← Menú de navegación
├───────────────┬─────────────┤
│               │             │
│    <main>     │   <aside>   │  ← Contenido principal | Barra lateral
│  <section>    │             │  ← Sección temática
│  <article>    │             │  ← Contenido independiente (noticia, post)
│               │             │
├───────────────┴─────────────┤
│         <footer>            │  ← Pie de página (info legal, contacto)
└─────────────────────────────┘
```

|Etiqueta|Cuándo usarla|
|---|---|
|`<header>`|Cabecera de página o sección|
|`<nav>`|**Menú de navegación** del sitio|
|`<main>`|Contenido **principal y único** de la página|
|`<section>`|Agrupación temática de contenido (ej: sección de noticias)|
|`<article>`|Contenido **independiente** y distribuible (ej: post de blog)|
|`<aside>`|Contenido **secundario** / barra lateral relacionada|
|`<footer>`|Pie de página con info legal o de contacto|

> [!TIP] ¿`<div>` o etiqueta semántica? `<div>` y `<span>` son **genéricos**, sin significado. Usa etiquetas semánticas siempre que sea posible. `<footer>` **sí es semántica**; `<div>` y `<span>` **no lo son**.

---

#### Scripts y Estilos en HTML

```html
<!-- Incluir JavaScript -->
<script src="app.js"></script>

<!-- Incluir CSS externo -->
<link rel="stylesheet" href="estilos.css">
```

---

## Bloque 4 — CSS: Estilos y Diseño

### ¿Qué es CSS?

> [!IMPORTANT] Definición **Cascading Style Sheets** = Hojas de Estilo en Cascada. Transforma el HTML plano en una **interfaz clara, legible y consistente**. Define colores, fuentes, tamaños, posicionamiento...

---

### Selectores CSS

|Selector|Sintaxis|Descripción|
|---|---|---|
|Etiqueta|`p { }`|Todos los `<p>`|
|Clase|`.miclase { }`|Todos con `class="miclase"`|
|ID|`#miid { }`|El elemento con `id="miid"`|
|Descendiente|`div p { }`|**Todos** los `<p>` dentro de cualquier `<div>`|
|Hijo directo|`div > p { }`|Solo los `<p>` **hijos directos** de `<div>`|
|Hermano adyacente|`p + span { }`|El `<span>` **inmediatamente después** de `<p>`|
|Hermano general|`p ~ span { }`|Todos los `<span>` hermanos después de `<p>`|

> [!WARNING] Error frecuente — Descendiente vs Hijo Directo
> 
> - `div p` = **todos** los `<p>` dentro del div (a cualquier nivel de profundidad) ✅
> - `div > p` = solo los `<p>` que son **hijos directos** del div

---

### Pseudo-clases y Pseudo-elementos

```css
a:hover { color: red; }      /* Cuando el ratón pasa por encima */
input:focus { border: 2px; } /* Cuando el elemento tiene el foco */
```

> [!IMPORTANT] :hover Se aplica cuando el **ratón pasa sobre un elemento**. Muy usada para efectos en botones y enlaces.

---

### Propiedades CSS Fundamentales

#### Texto y Tipografía

|Propiedad|Función|Ejemplo|
|---|---|---|
|`color`|Color del **texto**|`color: red;`|
|`font-size`|**Tamaño** del texto|`font-size: 16px;`|
|`font-weight`|**Grosor** (negrita)|`font-weight: bold;`|
|`font-style`|**Cursiva**|`font-style: italic;`|
|`font-family`|**Tipo de letra**|`font-family: Arial;`|
|`text-align`|**Alineación** del texto|`text-align: center;`|
|`text-decoration`|Decoración (subrayado)|`text-decoration: none;`|
|`letter-spacing`|Espacio entre letras|`letter-spacing: 2px;`|
|`line-height`|Espacio entre líneas|`line-height: 1.5;`|

---

#### Fondo, Bordes y Visibilidad

|Propiedad|Función|Ejemplo|
|---|---|---|
|`background-color`|Color de **fondo**|`background-color: #fff;`|
|`border`|Borde del elemento|`border: 1px solid black;`|
|`border-radius`|Bordes **redondeados**|`border-radius: 10px;`|
|`opacity`|**Opacidad** (0=invisible, 1=visible)|`opacity: 0.5;`|

---

#### El Modelo de Caja (Box Model)

> [!IMPORTANT] Las 4 capas del modelo de caja De dentro hacia fuera:
> 
> 1. **Contenido** — el texto/imagen en sí
> 2. **Padding** — espacio **interior** (entre contenido y borde)
> 3. **Border** — el borde
> 4. **Margin** — espacio **exterior** (entre el elemento y los demás)

```
┌─────────────────────────────────┐
│           MARGIN                │
│  ┌───────────────────────────┐  │
│  │         BORDER            │  │
│  │  ┌─────────────────────┐  │  │
│  │  │      PADDING        │  │  │
│  │  │  ┌───────────────┐  │  │  │
│  │  │  │   CONTENIDO   │  │  │  │
│  │  │  └───────────────┘  │  │  │
│  │  └─────────────────────┘  │  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

| Propiedad   | Qué hace                                             |
| ----------- | ---------------------------------------------------- |
| `padding`   | Espacio **interior** (entre contenido y borde)       |
| `margin`    | Espacio **exterior** (separa del resto de elementos) |
| `border`    | La línea que rodea el contenido                      |
| `width`     | Ancho del contenedor                                 |
| `height`    | Alto del contenedor                                  |
| ancho total | width (incluye padding y border)                     |

> [!TIP] box-sizing: border-box
> 
> ```css
> box-sizing: border-box;
> ```
> 
> Con esta propiedad, el `width` y `height` declarados **incluyen** el padding y el borde. Sin ella, el padding se suma al ancho total y puede romper el diseño. **Muy recomendada como reset global. el tamaño total de un elemento incluye padding y borde**

---

#### Display y Visibilidad

|Propiedad|Efecto|
|---|---|
|`display: none`|El elemento **desaparece completamente** (no ocupa espacio)|
|`visibility: hidden`|El elemento se **oculta pero mantiene su espacio**|
|`opacity: 0`|El elemento es invisible pero **sigue ocupando espacio y siendo interactivo**|

> [!WARNING] Diferencia clave para el examen
> 
> - `display: none` → desaparece, **NO ocupa espacio**
> - `visibility: hidden` → invisible, **SÍ ocupa espacio**

---

#### Flexbox

```css
.contenedor {
  display: flex;            /* Activa flexbox */
  justify-content: center;  /* Alineación HORIZONTAL */
  align-items: center;      /* Alineación VERTICAL */
}
```

> [!TIP] Truco de examen — Flexbox
> 
> - `justify-content` → eje **principal** (normalmente horizontal)
> - `align-items` → eje **secundario** (normalmente vertical)

---

#### Unidades CSS

|Unidad|Tipo|Descripción|
|---|---|---|
|`px`|Absoluta|Píxeles fijos|
|`em`|**Relativa**|Relativa al tamaño de fuente del elemento padre|
|`rem`|Relativa|Relativa al tamaño de fuente raíz|
|`%`|Relativa|Porcentaje del elemento contenedor|
|`cm`, `mm`|Absolutas|Centímetros/milímetros (raramente en web)|

> [!NOTE] `em` es la **unidad relativa** por excelencia en los exámenes. `px` es absoluta.

---

### Variables CSS (Custom Properties)

```css
:root {
  --color-principal: #3498db;
  --fuente-base: Arial, sans-serif;
}

h1 {
  color: var(--color-principal);
  font-family: var(--fuente-base);
}
```

> [!IMPORTANT] ¿Para qué sirven las variables CSS? Para **reutilizar valores** (colores, fuentes) en todo el sitio. Si cambias la variable en un sitio, cambia en todo el CSS. Facilita el mantenimiento enormemente.

---

### Frameworks CSS

> [!IMPORTANT] ¿Qué es un Framework CSS? Una **colección de estilos y componentes predefinidos** que agilizan el desarrollo web. En lugar de escribir todo el CSS desde cero, usas clases ya hechas.

#### Bootstrap

- Framework **component-first**: ofrece componentes predefinidos como botones (`.btn`), tarjetas, navbars, rejillas...
- Se importa y usas sus clases directamente en el HTML.

```html
<button class="btn btn-primary">Haz clic</button>
```

#### Tailwind CSS

- Framework **utility-first**: en lugar de componentes, ofrece **clases atómicas** que aplican una sola propiedad.
- El HTML se vuelve **declarativo** (las clases describen las decisiones de diseño directamente).
- Usa **purgado**: elimina el CSS no utilizado para optimizar el peso final del archivo.

```html
<button class="bg-blue-500 text-white px-4 py-2 rounded">Botón</button>
```

||Bootstrap|Tailwind CSS|
|---|---|---|
|Filosofía|Componentes|Utilidades atómicas|
|HTML|Limpio con clases semánticas|Clases descriptivas en el HTML|
|Personalización|Media (temas)|Alta (total control)|

---

### Comentarios en CSS

```css
/* Esto es un comentario en CSS */
```

> [!WARNING] Sintaxis correcta de comentarios CSS Solo existe una forma: `/* comentario */`. No son válidos `//` ni `#` en CSS.

---

## Bloque 5 — JavaScript y el DOM

### ¿Qué es JavaScript?

> [!IMPORTANT] Definición Lenguaje de **scripting interpretado** que el navegador lee y ejecuta **línea a línea** directamente. Su función principal: aportar **dinamismo e interactividad** a las páginas web.

**Permite:**

- Responder a acciones del usuario (clics, teclas, scroll...)
- Modificar el contenido y el diseño en tiempo real (sin recargar la página)
- Validar formularios en el lado del cliente
- Comunicarse con el servidor (AJAX/Fetch)

---

### El DOM (Document Object Model)

> [!IMPORTANT] ¿Qué es el DOM? La **representación en memoria** de un documento HTML como un **árbol jerárquico** de nodos. Cada etiqueta HTML es un **nodo** del árbol.

```
document
└── <html>
    ├── <head>
    │   └── <title>
    └── <body>
        ├── <h1>
        ├── <p>
        └── <div>
            └── <a>
```

> [!NOTE] Metáfora del árbol genealógico El DOM se explica como un **árbol genealógico**: los elementos tienen relaciones de **padres e hijos** (parent/child). Un `<div>` que contiene un `<p>` es el "padre" del párrafo.

---

### Selección de Elementos

```javascript
// Por ID (devuelve un solo elemento)
document.getElementById("boton");

// Por selector CSS (devuelve el primero que coincide)
document.querySelector(".clase");
document.querySelector("#id");

// Por clase (devuelve todos)
document.querySelectorAll(".clase");
```

> [!TIP] Truco de examen
> 
> - `getElementById("nombre")` → **sin # ni punto**, solo el nombre
> - `querySelector("#nombre")` → **con #** para IDs
> - `querySelector(".nombre")` → **con punto** para clases

---

### Modificar el DOM

```javascript
// Cambiar el texto de un elemento
elemento.textContent = "Nuevo texto";

// Cambiar estilos en tiempo real
elemento.style.color = "red";
elemento.style.display = "none";
```

---

### Eventos

> [!IMPORTANT] ¿Qué es un evento? Una **respuesta del sistema ante una acción del usuario** (o del navegador). Ejemplos: clic, pulsación de tecla, desplazamiento (scroll), carga de página...

```javascript
// Método recomendado
elemento.addEventListener("click", function() {
    alert("¡Hiciste clic!");
});

// En HTML (atributo)
<button onclick="miFuncion()">Clic</button>
```

|Evento|Cuándo ocurre|
|---|---|
|`click`|Al hacer clic en el elemento|
|`scroll`|Al desplazarse por la página verticalmente|
|`keydown`|Al pulsar una tecla|
|`submit`|Al enviar un formulario|
|`load`|Cuando la página termina de cargarse|

---

### Validación de Formularios

> [!IMPORTANT] Cliente vs Servidor
> 
> - **Validación en el cliente (JS)**: Mejora la **experiencia de usuario**, avisa de errores rápidamente sin ir al servidor.
> - **Validación en el servidor**: **SIEMPRE es necesaria** por seguridad. La validación de cliente puede saltarse (desactivando JS o manipulando el HTML).

> [!WARNING] La validación del cliente NO es suficiente para la seguridad Cualquier usuario puede desactivar JavaScript en el navegador. **Siempre debe haber validación en el servidor**.

---

### Consecuencias de Desactivar JavaScript

Si desactivamos JS en el navegador:

- La **interactividad deja de funcionar** (menús, animaciones, formularios dinámicos)
- Las **validaciones de cliente** no se ejecutan
- Las **SPAs** quedan inutilizables

---

## Bloque 6 — Aplicaciones Web Dinámicas y CMS

### Aplicaciones Web Dinámicas

> [!IMPORTANT] ¿Qué las define? Generan contenido mediante **consultas a bases de datos**. El contenido cambia según el usuario, la fecha, los datos almacenados...

**Stack típico en SMR:**

- **Front-end**: HTML + CSS + JavaScript
- **Back-end**: **PHP** (lenguaje que se ejecuta en el servidor)
- **Base de datos**: MariaDB / MySQL

---

### CMS (Content Management System)

> [!IMPORTANT] Definición **Sistema de Gestión de Contenidos**. Aplicación web que permite **crear y publicar contenido sin necesidad de saber programar**.

**Ventaja principal:** Actualizar contenido fácilmente sin tocar código.

|CMS|Uso Principal|
|---|---|
|**WordPress**|Blogs, webs corporativas (>40% de la web mundial)|
|**Moodle**|Plataformas educativas (e-learning)|
|**MediaWiki**|Wikis colaborativas (como Wikipedia)|
|**phpBB**|Foros de discusión|

> [!TIP] Truco de examen — CMS por función
> 
> - Blogs → **WordPress**
> - Foros → **phpBB**
> - E-learning → **Moodle**
> - Wikis → **MediaWiki**

---

### Formato de Intercambio de Datos

Las aplicaciones web modernas usan **JSON** (JavaScript Object Notation) como formato estándar para intercambiar datos entre servidor y cliente.

```json
{
  "nombre": "Juan",
  "edad": 25,
  "ciudad": "Madrid"
}
```

---

## Bloque 7 — WordPress a Fondo

### WordPress.com vs WordPress.org

|             | WordPress.com                        | WordPress.org                         |
| ----------- | ------------------------------------ | ------------------------------------- |
| Alojamiento | **Incluido** (externo, de WordPress) | **Debes contratar** tu propio hosting |
| Control     | Limitado                             | Total                                 |
| Coste       | Gratuito (con limitaciones)          | Software gratuito, hosting de pago    |
|             |                                      |                                       |

> [!WARNING] Error frecuente La diferencia clave NO es que uno sea de pago y otro gratuito. Es que en **.org debes gestionar tu propio alojamiento (hosting)**.

---

### Estructura de WordPress

#### Back-end vs Front-end

- **Front-end**: La parte **visual** que ven los usuarios cuando visitan la web.
- **Back-end**: El **panel de administración** (`/wp-admin`) donde se gestiona todo el contenido y los ajustes.

#### Dónde se guarda el contenido

> [!IMPORTANT] Almacenamiento en WordPress El contenido (textos, entradas, páginas) se guarda en una **base de datos** gestionada por el servidor (**MariaDB/MySQL**). Las imágenes y archivos se guardan en la carpeta `wp-content/uploads/`.

---

### Elementos Clave de WordPress

#### Temas (Themes)

- Controlan el **diseño visual**: colores, tipografías, layout, apariencia.
- Si cambias el tema, **el contenido se mantiene**, solo cambia el diseño.
- **Child Theme (Tema Hijo)**: Permite personalizar el diseño sin perder los cambios al actualizar el tema padre.

#### Plugins (Complementos)

> [!IMPORTANT] ¿Qué es un Plugin? Software que **añade funcionalidades extra** a WordPress (formularios de contacto, SEO, tiendas online, seguridad...).

#### Widgets

> [!IMPORTANT] ¿Qué es un Widget? Un **bloque con una función específica** para barras laterales o pies de página (últimas entradas, buscador, redes sociales...).

---

### Páginas vs Entradas

||Páginas (Pages)|Entradas (Posts)|
|---|---|---|
|Orden|Sin orden temporal|**Ordenadas por fecha**|
|Uso|Contenido fijo (Sobre mí, Contacto)|Blog, noticias|
|Categorías|No|Sí|

---

### Roles de Usuario en WordPress

|Rol|Permisos|
|---|---|
|**Administrador**|**Control total** del sistema y ajustes|
|Editor|Revisa y publica entradas de otros|
|Autor|Solo publica sus propias entradas|
|Colaborador|Escribe pero no publica|
|Suscriptor|Solo puede leer y comentar|

> [!TIP] Para el examen: el rol con **control total** es siempre el **Administrador**.

---

### Categorías, Etiquetas (Tags) y el Personalizador

- **Categorías**: Agrupación jerárquica amplia (ej: "Tecnología").
- **Etiquetas (Tags)**: Palabras clave para **organizar y relacionar contenidos** por temas específicos.
- **Personalizador**: Panel visual para modificar **colores, fuentes y cabeceras viendo los cambios en vivo**.

---

## Bloque 8 — Seguridad Web

### Los 4 Pilares de la Seguridad Web

1. **HTTPS** — cifrado de la comunicación
2. **Contraseñas robustas y bien almacenadas** (hash)
3. **Copias de seguridad (backups)** regulares
4. **Validación de datos** en servidor

> [!WARNING] ¿Qué NO es un pilar de seguridad? El diseño de un logotipo o los colores corporativos **no tienen nada que ver con la seguridad**. En el examen puede aparecer esta trampa.

---

### HTTPS y SSL/TLS

> [!IMPORTANT] ¿Qué hace HTTPS? **Cifra la comunicación** entre el navegador y el servidor mediante certificados **SSL/TLS**. Evita que terceros intercepten los datos (contraseñas, datos bancarios...).

- El icono del **candado** en el navegador indica que la conexión **viaja cifrada**.
- **HTTP simple** → la contraseña viaja en **texto plano** y puede ser interceptada.
- **Let's Encrypt** → iniciativa que ofrece **certificados SSL/TLS gratuitos**.

> [!TIP] HTTPS y SEO Google **premia las webs con HTTPS** en el posicionamiento. Es un factor de SEO positivo.

---

### Almacenamiento Seguro de Contraseñas

> [!IMPORTANT] ¿Cómo se almacenan las contraseñas? **NUNCA en texto plano**. Siempre aplicando un **hash** (función matemática irreversible). Si alguien roba la BD, no puede leer las contraseñas.
> 
> ❌ Mal: `contraseña: "miPassword123"` ✅ Bien: `contraseña: "5f4dcc3b5aa765d61d8327deb882cf99"` (hash MD5, ejemplo)

---

### Cookies y Privacidad

> [!IMPORTANT] RGPD — Reglamento General de Protección de Datos Normativa de la **Unión Europea** que garantiza a los usuarios:
> 
> - Derecho de **acceso** a sus datos
> - Derecho de **rectificación**
> - Derecho de **borrado** ("derecho al olvido")

**Requisito legal del banner de cookies:** El banner debe permitir **rechazar las cookies no esenciales** de forma clara y sencilla. No es válido obligar a aceptar todo.

**Política de Privacidad:** Explica qué se hace con los datos de los usuarios. Es obligatoria por ley.

---

### Validación y Seguridad en Formularios

- La validación en el **cliente (JS)** mejora la UX, pero **no es suficiente para la seguridad**.
- La validación en el **servidor** es **obligatoria** y la única que garantiza seguridad real.
- Herramienta para probar APIs: **Postman**.

---

## Bloque 9 — Optimización: SEO, Rendimiento y Accesibilidad

### Los 3 Pilares de la Optimización Web

> [!IMPORTANT] Tres pilares
> 
> 1. **SEO** — posicionamiento en buscadores
> 2. **Rendimiento** — velocidad de carga
> 3. **Accesibilidad** — usable por todos

---

### SEO (Search Engine Optimization)

> [!IMPORTANT] Definición Técnicas que ayudan a que una web **aparezca en los primeros resultados** de los buscadores de forma orgánica (sin pagar).

**Elementos clave del SEO:**

|Elemento|Descripción|
|---|---|
|**Metadatos**|Títulos y descripciones para Google (en `<head>`)|
|**HTML semántico**|Ayuda a los buscadores a entender la estructura|
|**Velocidad**|Google penaliza webs lentas (mala experiencia)|
|**HTTPS**|Factor positivo de posicionamiento|
|**Contenido único**|El contenido duplicado en varias URLs es penalizado|
|**Sitemap**|Archivo que indica a Google las páginas del sitio|
|**Texto alt en imágenes**|Los buscadores no "ven" imágenes|

> [!TIP] Sobre la optimización El trabajo de optimización **nunca termina**. Cuando la web se publica, empieza una fase de mejora continua.

---

### Rendimiento Web

- La **velocidad de carga** es un **factor de SEO**: Google penaliza webs lentas.
- Herramienta de análisis: **pestaña Network de las DevTools** del navegador (para observar patrones de carga y descarga de recursos).
- Las **aplicaciones en la nube** permiten mejoras constantes sin acción del usuario.
- Tecnología que permite el rendimiento de apps complejas (como Figma) en el navegador: **WebAssembly**.

---

### Accesibilidad Web (WCAG)

> [!IMPORTANT] WCAG **Web Content Accessibility Guidelines** = Pautas de accesibilidad del contenido web. Estándar internacional para hacer webs usables por personas con discapacidad.

**Reglas básicas de accesibilidad:**

- El texto debe tener **contraste suficiente** con el fondo (no mismo color que el fondo).
- La web debe poder navegarse **solo con el teclado** (sin ratón).
- Las imágenes deben tener atributo `alt`.
- Usar atributos **ARIA** para mejorar accesibilidad en elementos dinámicos.

---

### Sitemap

> [!IMPORTANT] ¿Qué es un Sitemap? Un **archivo** (normalmente XML) que indica a Google y otros buscadores la **estructura y las páginas del sitio** para facilitar su indexación.

---

## Bloque 10 — Despliegue y Entornos de Desarrollo

### Entornos de Desarrollo Local

#### XAMPP

> [!IMPORTANT] ¿Qué incluye XAMPP? Paquete de software que instala en un solo clic todo lo necesario para desarrollo web local:
> 
> - **Apache** (servidor web)
> - **MariaDB** (base de datos)
> - **PHP** (lenguaje de servidor)
> - **Perl**
> 
> Ventaja principal: facilita la instalación de todo el software necesario en un solo paso.

---

### Despliegue de Aplicaciones Web

> [!IMPORTANT] ¿Qué significa desplegar? **Publicar la aplicación web** para que sea accesible desde internet (desde cualquier lugar).

#### Opciones de Despliegue

|Servicio|Tipo|Características|
|---|---|---|
|**GitHub Pages**|Gratuito|**Ideal para webs estáticas** (solo HTML, CSS, JS)|
|**Netlify**|Freemium|Despliegue sencillo, CI/CD integrado|
|Servidor propio|De pago|Control total|

#### CI/CD con Netlify (Despliegue Continuo)

> [!IMPORTANT] CI/CD en Netlify Cada cambio que haces en **Git** (GitHub, GitLab...) se **publica automáticamente en la web**. No hay que subir archivos manualmente por FTP.

#### Repositorios Privados para Despliegue

- **Ventaja**: El código fuente permanece **oculto**, pero el sitio final es **públicamente accesible**.

---

### DevTools del Navegador

> [!IMPORTANT] Herramientas de Desarrollo (DevTools) Panel integrado en todos los navegadores (F12) para **analizar el funcionamiento interno y la carga de la web**.

|Pestaña|Uso|
|---|---|
|**Network**|Observar patrones de carga y descarga de recursos|
|**Console**|Depurar errores de **JavaScript**|
|**Elements**|Inspeccionar y editar HTML/CSS en tiempo real|
|**Sources**|Ver los archivos del sitio|

---

### Google Fonts

> [!NOTE] Google Fonts Servicio gratuito que permite **integrar tipografías web profesionales** de forma sencilla, importándolas con una sola línea en el CSS o HTML.

---

## 🎯 Resumen de Conceptos "Trampa" para el Examen

> [!WARNING] Los más frecuentes en exámenes

|Concepto|Lo que parece|Lo que es en realidad|
|---|---|---|
|`display: none` vs `visibility: hidden`|Ambos ocultan|`none` elimina el espacio; `hidden` lo mantiene|
|`padding` vs `margin`|Ambos añaden espacio|`padding` es interior; `margin` es exterior|
|`<h1>` vs `<header>`|Ambos son "encabezado"|`<h1>` es texto; `<header>` es sección semántica|
|WordPress.com vs .org|Diferencia de precio|Diferencia de **alojamiento**|
|Validación cliente vs servidor|La del cliente es suficiente|**Siempre** necesitas validación en el servidor|
|`div p` vs `div > p`|Ambos seleccionan párrafos en div|`div p` = todos los niveles; `div > p` = solo hijos directos|
|HTTP vs HTTPS|Solo diferencia de seguridad|HTTPS también afecta al **SEO**|
|`<ol>` vs `<ul>`|Ambas son listas|`<ol>` = ordenada (números); `<ul>` = desordenada (viñetas)|
|Cookie vs Sesión|Ambas "recuerdan" al usuario|Cookie en **navegador**; Sesión en **servidor**|

---

## 📝 Tabla de Etiquetas HTML más Preguntadas

|Etiqueta|Función|Tipo|
|---|---|---|
|`<h1>`-`<h6>`|Encabezados de nivel 1 a 6|Contenido|
|`<p>`|Párrafo|Contenido|
|`<a href="">`|Enlace / hipervínculo|Contenido|
|`<img src="" alt="">`|Imagen|Multimedia|
|`<br>`|Salto de línea|Formato|
|`<hr>`|Línea horizontal|Formato|
|`<b>`|Negrita|Formato|
|`<ul>` / `<ol>` / `<li>`|Listas|Contenido|
|`<table>`, `<tr>`, `<td>`, `<th>`|Tabla|Estructura|
|`<form>`, `<input>`, `<button>`|Formulario|Interactivo|
|`<div>`|Contenedor genérico en bloque|Estructura|
|`<span>`|Contenedor genérico en línea|Estructura|
|`<iframe>`|Contenido externo embebido|Multimedia|
|`<script>`|JavaScript|Script|
|`<pre>`|Texto preformateado|Formato|
|`<header>`|Cabecera semántica|Semántica|
|`<nav>`|Navegación|Semántica|
|`<main>`|Contenido principal|Semántica|
|`<section>`|Sección temática|Semántica|
|`<article>`|Contenido independiente|Semántica|
|`<aside>`|Contenido secundario/lateral|Semántica|
|`<footer>`|Pie de página|Semántica|

---

## 🔑 Acrónimos y Siglas que Debes Dominar

|Sigla|Significado|
|---|---|
|**HTML**|HyperText Markup Language|
|**CSS**|Cascading Style Sheets|
|**CMS**|Content Management System|
|**SEO**|Search Engine Optimization|
|**RGPD**|Reglamento General de Protección de Datos|
|**WCAG**|Web Content Accessibility Guidelines|
|**RSS**|Really Simple Syndication|
|**DOM**|Document Object Model|
|**SPA**|Single Page Application|
|**CI/CD**|Continuous Integration / Continuous Deployment|
|**SSL/TLS**|Secure Sockets Layer / Transport Layer Security|

---

_Apuntes generados para 2º SMR — Módulo: Aplicaciones Web_ _Basados en el test de repaso del módulo — Optimizados para Obsidian_


javascript constantes y tipos de variables
web assembly
 ¿Qué es una PWA (Progressive Web App) según el contexto de aplicaciones modernas?