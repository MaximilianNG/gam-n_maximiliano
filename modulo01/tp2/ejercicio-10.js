// Ejercicio 10

/* Escribir un programa que reciba el número del mes y devuelva si tiene 31, 30 o menos días.
Por ejemplo:12 = tiene 31 días */

function ej10(num) {
    const meses = {
        1: 31,
        2: 28,
        3: 31,
        4: 30,
        5: 31,
        6: 30,
        7: 31,
        8: 31,
        9: 30,
        10: 31,
        11: 30,
        12: 31
    }
    console.log("Ese mes tiene: " + meses[num] + " días.");
}