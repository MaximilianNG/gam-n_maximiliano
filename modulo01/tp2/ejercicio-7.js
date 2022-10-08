//Ejercicio 7

/*Escribir una función que reciba un texto y lo devuelva al revés.*/

function ej7(string) {
    let split = string.split("");
    let reverse = split.reverse();
    let joint = reverse.join("");
    console.log(joint);
}