let ataqueJugador
let ataqueRival
let vidasJugador = 3
let vidasRival = 3

// funcion de inicio de juego
function iniciarJuego() {
    let botonMonstruoJugador = document.getElementById('bmonstruo')
    botonMonstruoJugador.addEventListener('click', seleccionarMonstruoJugador)

    //boton ataque Jugador
    let botonFuego = document.getElementById("bfuego")
    botonFuego.addEventListener('click', ataqueFuego)
    let botonAgua = document.getElementById("bagua")
    botonAgua.addEventListener('click', ataqueAgua)
    let botonPlanta = document.getElementById("bplanta")
    botonPlanta.addEventListener('click', ataquePlanta)
}

// funcion de seleccion de monstruo del jugador
function seleccionarMonstruoJugador() {
    let inputFosfyah = document.getElementById('Fosfyah')
    let inputRioblis = document.getElementById('Rioblis')
    let inputHojurot = document.getElementById('Hojurot')
    let inputLavasee = document.getElementById('Lavasee')
    let inputRocicry = document.getElementById('Rocicry')
    let inputClipperwood = document.getElementById('Clipperwood')
    let spanMonstruoJugador = document.getElementById('monstruoJugador')

    if(inputFosfyah.checked){
        spanMonstruoJugador.innerHTML = "FOSFYAH"
    } else if(inputRioblis.checked){
        spanMonstruoJugador.innerHTML = "RIOBLIS"
    } else if(inputHojurot.checked){
        spanMonstruoJugador.innerHTML = "HOJUROT"
    } else if(inputLavasee.checked){
        spanMonstruoJugador.innerHTML = "LAVASEE"
    } else if(inputRocicry.checked){
        spanMonstruoJugador.innerHTML = "ROCICRY"
    } else if(inputClipperwood.checked){
        spanMonstruoJugador.innerHTML = "CLIPEERWOOD"
    } else {
        alert("Selecciona un Monstruo")
    }

    seleccionarMonstruoRival()
}

// funcion seleccion aleatorio del monstruo rival
function seleccionarMonstruoRival(){
    let monstruoAleatorio = aleatorio (1,6)
    let spanMonstruoRival = document.getElementById('monstruoRival')

    if(monstruoAleatorio == 1) {
        spanMonstruoRival.innerHTML = 'FOSFYAH'
    }else if(monstruoAleatorio == 2) {
        spanMonstruoRival.innerHTML = 'RIOBLIS'
    }else if(monstruoAleatorio == 3) {
        spanMonstruoRival.innerHTML = 'HOJUROT'
    }else if(monstruoAleatorio == 4) {
        spanMonstruoRival.innerHTML = "LAVASEE"
    }else if(monstruoAleatorio == 5) {
        spanMonstruoRival.innerHTML = "ROCICRY"
    }else if(monstruoAleatorio == 6) {
        spanMonstruoRival.innerHTML = "CLIPEERWOOD"
    }
}

// ataques de tipo del Jugador
function ataqueFuego(){
    ataqueJugador = 'FUEGO'
    ataqueAleatorioRival()
}

function ataqueAgua(){
    ataqueJugador = 'AGUA'
    ataqueAleatorioRival()
}

function ataquePlanta(){
    ataqueJugador = 'PLANTA'
    ataqueAleatorioRival()
}

// ataque aleatorio del Rival
function ataqueAleatorioRival() {
    let ataqueAleatorio = aleatorio(1,3)

     if(ataqueAleatorio == 1) {
        ataqueRival = 'FUEGO'
    }else if(ataqueAleatorio == 2) {
        ataqueRival = 'AGUA'
    }else {
        ataqueRival = 'PLANTA'
    }
    combate()
}

// funcion de combate
function combate(){
    let spanVidasJugador = document.getElementById('vidasJugador')
    let spanVidasRival = document.getElementById('vidasRival')

    if(ataqueRival == ataqueJugador){
        crearMensaje('TABLAS')
    } else if((ataqueJugador == 'FUEGO' && ataqueRival == 'PLANTA') || (ataqueJugador == 'AGUA' && ataqueRival == 'FUEGO') || (ataqueJugador == 'PLANTA' && ataqueRival == 'AGUA')){
        crearMensaje('VICTORIA')
        vidasRival--
        spanVidasRival.innerHTML = vidasRival
    } else{
        crearMensaje('DERROTA')
        vidasJugador--
        spanVidasJugador.innerHTML = vidasJugador
    }

    revisarVidas()
}

function revisarVidas(){
    if(vidasJugador == 0){
        crearMensajeFinal("😩BATALLA PERDIDA😩")
    }else if(vidasRival == 0){
        crearMensajeFinal("🎉🎊BATALLA GANADA🎊🎉")
    }
}
// mandar mensaje
function crearMensaje(resultadoCombate) {
    let sectionInfo = document.getElementById('info')
    let parrafo = document.createElement('p')
    parrafo.innerHTML = 'Tu Mostruo golpea con '+ ataqueJugador + '. Rival golpea con ' + ataqueRival + ". Resultado " + resultadoCombate

    sectionInfo.appendChild(parrafo)

}

function crearMensajeFinal(resultadoFinal) {
    let sectionInfo = document.getElementById('info')
    let parrafo = document.createElement('p')
    parrafo.innerHTML = resultadoFinal

    sectionInfo.appendChild(parrafo)

}

//while (vidasRival < 1 && vidasJugador < 1) {
//alert("FIN DE LA BATALLA")
//}


// funcion de numero aleatorio
function aleatorio(min, max){
    return Math.floor(Math.random()*(max-min+1)+min)
}

// Iniciar juego cuando la ventana cargue por completo
window.addEventListener('load', iniciarJuego)