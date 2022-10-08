//Ejercicio 5

/*Crear una función que muestre información sobre una cadena de texto que se le pasa como
argumento. A partir de la cadena que se le pasa, la función determina si esa cadena está
formada sólo por mayúsculas, sólo por minúsculas o por una mezcla de ambas.*/

function ej5(string) {
    if (string === string.toUpperCase()) {
        console.log("Esta cadena está formada solo por mayúsculas.");
    } else if (string === string.toLowerCase()) {
        console.log("Esta cadena está formada solo por minúsculas.");
    } else {
        console.log("Esta cadena está formada por una mezcla de mayúsculas y minúsculas.");
    }
}