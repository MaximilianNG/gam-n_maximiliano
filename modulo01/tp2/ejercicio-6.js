//Ejercicio 6

/*Escribir un script que muestre la posición de la primera vocal de un texto introducido por
teclado.Por ejemplo: perro = “e” es la letra Nº2 ; árbol = “a” es la letra Nº1.*/

function ej6(string) {
    let vocales = ["a", "e", "i", "o", "u"];
    for (let i = 0; i <= string.length; i++) {
        if (vocales.includes(string[i])) {
            console.log("La primera vocal es una '" + string[i] + "'. Está en la posición: " + (i + 1) + ".");
            i = (string.length + 1);
        }
    }
}