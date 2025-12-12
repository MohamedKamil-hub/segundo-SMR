function calcular() {
    let largo = parseInt(document.getElementById("largo").value);
    let ancho = parseInt(document.getElementById("ancho").value);
    let medida = (document.getElementById("medida").value);
    resultado = 2*(largo+ancho)
    document.getElementById("perimetro").innerText = "perimetro: "+resultado+" "+medida;
}


function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
} 