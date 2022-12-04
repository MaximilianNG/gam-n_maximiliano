const fs = require('fs');
const rawdata = fs.readFileSync('./personas.json', 'utf8');
var persona = JSON.parse(rawdata);
/*for (var i=0; i<persona['personas'].length; i++){
    console.log(persona['personas'][i]['nombre']);
}*/

function getNombre(arregloDePersonas) {
    //Creo un array que va a guardar las personas encontradas.
    let personasEncontradas = [];

    //Recorro las personas una por una, fijándome si el valor en su localidad es "Posadas".
    //Si lo es, guardo su nombre y apellido como un solo elemento en el array personasEncontradas.
    for (let counter = 0; counter<arregloDePersonas["personas"].length; counter++) {
            let personaActual = arregloDePersonas["personas"][counter];
            if (personaActual["localidad"] == "Posadas") {
                personasEncontradas.push(`${personaActual["nombre"]} ${personaActual["apellido"]}`);
            }
        }

    //Imprimo los resultados. Si personasEncontradas está vacío, lo comunico; sino, listo
    //los elementos de personasEncontradas.
    if (personasEncontradas.length == 0) {
        console.log("No se encontró ninguna persona de Posadas");
    } else {
        console.log(`Las personas de Posadas encontradas son ${personasEncontradas.length}:`);
        personasEncontradas.forEach(persona => {
            console.log(persona);
        });
    }
}
//Personalmente llamaría a la función con un nombre más descriptivo de lo que hace, pero lo dejé así
//porque la consigna lo pedía.
getNombre(persona)