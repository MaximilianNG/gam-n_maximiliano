"use strict";
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
console.log(JSON.stringify(data));
console.log(data);
});
/* En el caso de utilizar stringify estamos intentando darle formato de string de JSON
a un Buffer que nos devolvió la función readFile, por eso vemos el Buffer completo ser expresado.

Al agregar el log de data, podemos ver la expresión normal de un objeto Buffer, que no va hasta el final
y la información está en hexadecimal.*/
