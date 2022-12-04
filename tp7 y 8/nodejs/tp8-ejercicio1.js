const fs = require("fs");
let rawdata = fs.readFileSync("./personas.json");
console.log(typeof JSON.stringify(rawdata));

//let persona = JSON.parse(rawdata);
//console.log(typeof persona);

/* JSON.parse() analiza gramaticalmente un JSON y devuelve el objeto o valor
   javascript descrito en el JSON. En otras palabras: evalúa una string en JSON como si 
   fuera una expresión en javascript, y realiza una conversión. 

   Cuando lo utilizamos se convirtió la información en el archivo JSON a javascript, y 
   realizamos un console log del objeto resultanto.

   JSON.stringify() hace lo opuesto, convierte un valor de javascript a una string JSON.
   En el caso de este ejercicio stringify se aplica sobre el Buffer que readFileSync
   devuelve, por eso el resultado es el Buffer pasado a string. */