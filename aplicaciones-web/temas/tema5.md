# Unidad 5: Introducción a JavaScript en la web

Mientras HTML define la estructura y CSS se encarga de lo visual, **JavaScript añade la**
**capa de interactividad**, permitiendo que las páginas respondan a las acciones del usuario sin
necesidad de recargarse por completo. 

Cada vez que pulsas un botón, completas un formulario o ves cómo un menú se despliega automáticamente, estás viendo a JavaScript en acción. 


**El DOM (Document Object Model)**
El DOM es la representación en memoria de un documento HTML. Imagina tu página como un árbol genealógico: cada etiqueta (como `<h1>, <p> o <div>`) es un nodo con "hijos" y "padres". JavaScript puede acceder y modificar cualquier parte de ese árbol con una API en el navegador.
``` javascript
`document.getElementById("titulo").textContent = "Bienvenido a mi pagina";
```
puedes cambiar el texto de un encabezado en tiempo real. El DOM es el puente entre el código JavaScript y la  interfaz visible del usuario.

**La gestión de eventos**
Un evento es una acción que ocurre en la página: un clic, teclear, el envío de un formulario, o el scroll . JavaScript escucha esos eventos y responder con funciones personalizadas. 
``` javascript
button.addEventListener("click", function() { alert("Has hecho clic en el botón");});
``` 
el navegador "vigila" el botón y ejecuta una acción (mostrar un mensaje) cuando detecta el clic. Este modelo de eventos es la base de toda la interacción en la web moderna.

**La validación de formularios**
JavaScript puede validar que un campo de correo tenga un formato válido, una contraseña tenga  longitud mínima o que un número esté dentro de un rango.

``` javascript
if (!email.includes("@")) {
alert("Por favor, introduce un correo válido.");
}
``` 
la validación del lado del cliente nunca sustituye la validación del lado del servidor: el navegador del usuario no es un entorno seguro y los datos pueden manipularse fácilmente.


Esquema Visual
![[Pasted image 20251204110053.png]]



**Herramientas y Consejos para tu Futuro Profesional**

Empieza desde el navegador
Abre las DevTools (clic derecho "Inspeccionar") y ve la pestaña Consola. Es un entorno para probar comandos de JavaScript sin crear archivos externos.
Puedes manipular directamente el DOM de cualquier página, ver los resultados al instante.

Usa un editor profesional
Visual Studio Code (VS Code) Combínalo con extensiones como:
Prettier: formatea automáticamente tu código para mantenerlo limpio y coherente.
Live Server: te permite ejecutar tu HTML con un servidor local y ver los cambios en tiempo real.
ESLint: detecta errores comunes en tu código JavaScript antes de ejecutarlo.

Aprende las herramientas del ecosistema
MDN Web Docs (developer.mozilla.org) es la referencia más completa sobre JavaScript, DOM y APIs del navegador. CodePen y JSFiddle


Mitos y Realidades 
Mito: "JavaScript y Java son lo mismo."
no comparten ni sintaxis ni propósito. Java es un lenguaje compilado y orientado a objetos, usado para aplicaciones empresariales y móviles. JavaScript, es un lenguaje de scripting interpretado en el navegador. 

Mito: "La validación del lado del cliente es suficiente."
Validar datos con JavaScript es útil (por ejemplo, avisarle de que el correo está mal escrito), pero no
garantiza la seguridad. siempre debe haber una validación adicional en el servidor antes de procesar la información.


Resumen Final para el Examen
JavaScript = interactividad en la web.
Manipula el DOM para cambiar contenido dinámicamente.
Eventos permiten responder a acciones del usuario (clic, tecla, scroll).
Validación: verifica datos antes del envío, pero siempre debe complementarse en el servidor.
Herramientas clave: DevTools, VS Code, Prettier, Google Search Console (para depuración).