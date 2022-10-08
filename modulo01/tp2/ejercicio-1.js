//Ejercicio 1

/*A partir del siguiente array que se proporciona: var valores = [verdadero, false, 2, "hola",
"mundo", 3, char];
1. Determinar cuál de los elementos de texto es mayor, es decir el que contenga más
letras.
2. Imprimir los elementos de menor a mayor cantidad de letras.
3. Determinar el resultado de las cuatro operaciones matemáticas realizadas con los dos
elementos numéricos*/

function ej1() {
    let verdadero, char; //Declaro estas variables para que no tire error.
    var valores = [verdadero, false, 2, "hola", "mundo", 3, char];

    let stringMayor = "";
    let soloStrings = [];
    for (let i = 0; i <= valores.length; i++) {
        let aux = 0;
            if (typeof valores[i] == "string") {
                soloStrings.push(valores[i])
                if (valores[i].length > aux) {
                    stringMayor = valores[i];
            }
        }
    }

    console.log("El mayor elemento de texto (el que contiene más letras) es: " + stringMayor);
    console.log("Los elementos de menor a mayor cantidad de letras son:");
    console.log(soloStrings.sort());
    console.log("Resultado de la suma de los dos elementos numéricos: " + (valores[2] + valores[5]));
    console.log("Resultado de la resta de los dos elementos numéricos: " + (valores[2] - valores[5]));
    console.log("Resultado de la multiplicación de los dos elementos numéricos: " + (valores[2] * valores[5]));
    console.log("Resultado de la división de los dos elementos numéricos: " + (valores[2] / valores[5]));
}