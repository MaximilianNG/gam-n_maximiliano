// Ejercicio 9

/* Crear un programa que recibe las notas de un alumno, todos los números deben ser naturales
<11. Debe calcular el promedio. Por último imprimir en pantalla si el valor de media es < 5
“Reprobado”, entre 6 y 8 “Aprobado” y si es mayor a 8 “Sobresaliente”. */

function ej9() {
    let notas = [];
    let acum = 0;
    for (let i = 0; i <= 8; i++) {
        //Generar notas aleatorias.
        let nuevaNota = Math.floor(Math.random() * 11);
        if (nuevaNota == 0) {
            nuevaNota = 1;
        }
        notas.push(nuevaNota);
    }

    for (let i = 0; i < notas.length; i++) {
        acum = acum + notas[i];
    }

    let promedio = (acum / notas.length);
    if (promedio < 5) {
        console.log("El promedio es de " + promedio.toFixed(2) + ". Reprobado.");
    } else if (promedio <= 8) {
        console.log("El promedio es de " + promedio.toFixed(2) + ". Aprobado.");
    } else if (promedio > 8) {
        console.log("El promedio es de " + promedio.toFixed(2) + ". Sobresaliente.");
    }
}