let ataqueJugador
let ataqueRival


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
        spanMonstruoJugador.innerHTML = "Fosfyah"
    } else if(inputRioblis.checked){
        spanMonstruoJugador.innerHTML = "Rioblis"
    } else if(inputHojurot.checked){
        spanMonstruoJugador.innerHTML = "Hojurot"
    } else if(inputLavasee.checked){
        spanMonstruoJugador.innerHTML = "Lavasee"
    } else if(inputRocicry.checked){
        spanMonstruoJugador.innerHTML = "Rocicry"
    } else if(inputClipperwood.checked){
        spanMonstruoJugador.innerHTML = "Clipperwood"
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
        spanMonstruoRival.innerHTML = 'Fosfyah'
    }else if(monstruoAleatorio == 2) {
        spanMonstruoRival.innerHTML = 'Rioblis'
    }else if(monstruoAleatorio == 3) {
        spanMonstruoRival.innerHTML = 'Hojurot'
    }else if(monstruoAleatorio == 4) {
        spanMonstruoRival.innerHTML = "Lavasee"
    }else if(monstruoAleatorio == 5) {
        spanMonstruoRival.innerHTML = "Rocicry"
    }else if(monstruoAleatorio == 6) {
        spanMonstruoRival.innerHTML = "CLipperwood"
    }
}

function ataqueFuego(){
    ataqueJugador = 'fuego'
    ataqueAleatorioRival()
}

function ataqueAgua(){
    ataqueJugador = 'agua'
    ataqueAleatorioRival()
}

function ataquePlanta(){
    ataqueJugador = 'planta'
    ataqueAleatorioRival()
}

function ataqueAleatorioRival() {
    let ataqueAleatorio = aleatorio(1,3)

     if(ataqueAleatorio == 1) {
        ataqueRival = 'fuego'
    }else if(ataqueAleatorio == 2) {
        ataqueRival = 'agua'
    }else {
        ataqueRival = 'planta'
    }
}

// funcion de combate
function combate(){

    let resultado = ""

    if(rival == jugador){
        resultado = "Tablas"
    } else if((jugador == fuego && rival == planta) || (jugador == agua && rival == fuego) || (jugador == planta && rival == agua)){
        resultado = "Victoria"
    } else {
        resultado = "Derrota"
    }
    return resultado

}

// funcion de numero aleatorio
function aleatorio(min, max){
    return Math.floor(Math.random()*(max-min+1)+min)
}

let jugador = 3
let rival = 3
let vidasJugador = 3
let vidasRival = 3

//while (vidasJugador == 0 && vidasRival == 0)

// Iniciar juego cuando la ventana cargue por completo
window.addEventListener('load', iniciarJuego)