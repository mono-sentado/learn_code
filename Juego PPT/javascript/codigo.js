function aleatorio(min, max){
    return Math.floor(Math.random()*(max-min+1)+min)
}
    // funcion de eleccion (1 = piedra, 2 = papel, 3 = tijeras)
function eleccion(jugada) {
    let resultado = ""
    if(jugada == 1) {
        resultado = "PIEDRA"
    } else if(jugada == 2) {
        resultado = "PAPEL"
    } else if(jugada == 3) {
        resultado = "TIJERAS"
    } else {
        resultado = "Error"
    }
    return resultado
}
    // funcion de combate
function combate() {
    let solucion = ""

    if(pc == jugador) {
        solucion = "EMPATE"
    } else if((jugador == 1 && pc == 3) || (jugador == 2 && pc == 1) || (jugador == 3 && pc == 2)) {
        solucion = "GANAS"
        ganadas++
    } else {
        solucion = "PIERDES"
        perdidas++
    }
    return solucion
}

    // declaraciones

let min = 1
let max = 3
let jugador = 0
let pc = 0
let ganadas = 0
let perdidas = 0

    // loop

while (ganadas < 3 && perdidas < 3) {
    pc = aleatorio (1,3)
    jugador = prompt("Elige: 1 para piedra, 2 para papel, 3 para tijeras")

    // alerta de eleccion

        alert("Tu eliges: " + eleccion(jugador))
        alert("PC elige: " + eleccion(pc))

    // combate
    alert(combate())
}

    // alerta de Victorias y derrotas

alert("Ganastes " + ganadas + " veces. Perdistes " + perdidas + " veces.")

