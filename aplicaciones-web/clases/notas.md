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

``` html
<h1> iniciando en html </h1>
css interno poco usado
css innterno
   atributo style nunca se suele usar
   <h1 style="color: red;">intro css</h1>
   etiqueta styles
   <style>

    h1{color: aqua;}
</style>

usar css externo

crear un archivo .css
como style.css
ponerle esto por ejemplo
p{color: aquamarine;}

h1{color: red;}


y en tu archivo index.hrtml debajo de la metaetiqueta poner
<link rel="stylesheet" href="style.css">
con la ruta relativa
css es en cascada prevalece lo ultimo
/*

para hacer comentarios en css

*/

y la estructura siempre es igual slector{

propiedad:

valor;


propiedades usadas
color 
font-size
font-family para tipografia
con defercto o google fonts con apis o local

con api
h1{color: red; font-family:

.bitcount-grid-single-<uniquifier> {

  font-family: "Bitcount Grid Single", system-ui;

  font-optical-sizing: auto;

  font-weight: <weight>;

  font-style: normal;

  font-variation-settings:

    "slnt" 0,

    "CRSV" 0.5,

    "ELSH" 0,

    "ELXP" 0;

;}

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="style.css">

  

    <title>introduccion css</title>

</head>


@font-face {

  font-family: 'bit';

  src: url('bitcount.ttf') format('truetype');

}

  

p {

  color: aquamarine;

  font-size: xx-large;

  font-family: 'Courier New', Courier, monospace;

}

  

h1 {

  color: red;

  font-family: 'bit';

}

  

<body>

   <h1 >intro css</h1>

   <!--css innterno

   atributo style

   etiqueta styles-->

   <p >Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi, repellat. Consectetur molestiae accusamus nulla et tenetur beatae. Id excepturi odit, ipsam quisquam vitae, commodi nulla dignissimos debitis deleniti enim laboriosam.</p>

  
  

   <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis, animi dolor! Unde illo alias quaerat tenetur. Eius reprehenderit corrupti ex. Voluptatibus doloribus repudiandae non modi perferendis aliquam vel eligendi eveniet.</p>

   <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, magnam architecto natus cupiditate sit vero minima necessitatibus perferendis magni sint velit unde dolorum ipsam molestias id voluptatibus quam nihil? Nisi.</p>

   <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit delectus fugiat mollitia ad exercitationem deleniti veniam laudantium. Recusandae porro repellat laboriosam numquam dolore odio sit placeat ipsum corporis? Cumque, minima?</p>

</body>

</html>



otro delector es body y con background color 

body{background-color: antiquewhite; margin: 3cm;}

*{

    margin:

    ;

     padding: auto

}



font-style italic


<span> </span>
