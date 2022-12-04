const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', 'utf8');
var departamentos = JSON.parse(rawdata);

//Hice una función que reciba el nombre del departamento cuyos
//nombres y puestos hay que imprimir, para practicar más.

function getNombresYPuestos(arregloDeDepartamentos, nombreDepartamento) {
    //Verifico si existe el nombre del departamento solicitado dentro del array que es pasado.
    let existe = false
    for (nombre in arregloDeDepartamentos.departamentos) {
        if (nombre == nombreDepartamento) {
            existe = true;
        }
    }

    //Aislo solo la parte que me interesa recorrer.
    let departamentoObjetivo = arregloDeDepartamentos.departamentos[nombreDepartamento];

    //Si el departamento seleccionado no existe, no continúa la función; sino imprime nombres y puestos.
    if(existe) {
        for (let index = 0; index < departamentoObjetivo.length; index++) {
            console.log(departamentoObjetivo[index]["nombre"] + " - " + departamentoObjetivo[index]["puesto"]);
        }
    } else {
        console.log("El departamento solicitado no está registrado.");
    }
}

getNombresYPuestos(departamentos, "tecnologia");