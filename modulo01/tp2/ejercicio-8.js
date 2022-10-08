//Ejercicio 8

/*Crea una función que genere 100 números aleatorios entre 1 y 100 que no se repitan y luego
imprima por pantalla usando document.write(text).*/

function ej8() {
    document.open();
    let numeros = [];
    for (let i = 0; i < 100; i++) {
        let nuevoNum = Math.floor(Math.random() * 100);
        if (numeros.includes(nuevoNum)) {
            i = i - 1;
        } else {
            numeros.push(nuevoNum);
            document.write((i+1) + " - " + numeros[i]);
            document.write("<br>");
        }
    }
    console.log(numeros.length);
    document.close();
}