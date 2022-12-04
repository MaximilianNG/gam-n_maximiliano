"use strict";
let jsonData = require('./personas.json');
//console.log(jsonData);
console.log(JSON.stringify(jsonData));

/* Al utilizar stringify estamos convirtiendo el objeto que recibimos a una string
con formato de JSON. */

console.log(JSON.parse(jsonData));

/* En este caso estamos intentando convertir el mismo objeto que recibimos en un
objeto, por eso tira error, ya que parse se utiliza para convertir JSON a objetos
Javascript. */

