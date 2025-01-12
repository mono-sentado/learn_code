let ataqueJugador
let ataqueRival
let vidasJugador = 3
let vidasRival = 3

// funcion de inicio de juego
function iniciarJuego() {
    let sectionSeleccionarGolpe = document.getElementById('seleccion_golpe')
    sectionSeleccionarGolpe.style.display = 'none'
    
    let sectionReinicio = document.getElementById('reinicio')
    sectionReinicio.style.display = 'none'

    let botonMonstruoJugador = document.getElementById('bmonstruo')
    botonMonstruoJugador.addEventListener('click', seleccionarMonstruoJugador)

    //boton ataque Jugador
    let botonFuego = document.getElementById("bfuego")
    botonFuego.addEventListener('click', ataqueFuego)
    let botonAgua = document.getElementById("bagua")
    botonAgua.addEventListener('click', ataqueAgua)
    let botonPlanta = document.getElementById("bplanta")
    botonPlanta.addEventListener('click', ataquePlanta)

    let botonReinicio = document.getElementById('breset')
    botonReinicio.addEventListener('click', reiniciarJuego)
}

// funcion de seleccion de monstruo del jugador
function seleccionarMonstruoJugador() {

    let sectionSeleccionarMonstruo = document.getElementById('seleccion_monstruo')
    sectionSeleccionarMonstruo.style.display = 'none'
    
    let sectionSeleccionarGolpe = document.getElementById('seleccion_golpe')
    sectionSeleccionarGolpe.style.display = 'flex'
   
    let inputFyahfox = document.getElementById('Fyahfox')
    let inputHipobloo = document.getElementById('Hipobloo')
    let inputFrosheet = document.getElementById('Frosheet')
    /*let inputLavasee = document.getElementById('Lavasee')
    let inputRocicry = document.getElementById('Rocicry')
    let inputClipperwood = document.getElementById('Clipperwood')*/
    let spanMonstruoJugador = document.getElementById('monstruoJugador')

    if(inputFyahfox.checked){
        spanMonstruoJugador.innerHTML = "FYAHFOX"
    } else if(inputHipobloo.checked){
        spanMonstruoJugador.innerHTML = "HIPOBLOO"
    } else if(inputFrosheet.checked){
        spanMonstruoJugador.innerHTML = "FROSHEET"
    } /*else if(inputLavasee.checked){
        spanMonstruoJugador.innerHTML = "LAVASEE"
    } else if(inputRocicry.checked){
        spanMonstruoJugador.innerHTML = "ROCICRY"
    } else if(inputClipperwood.checked){
        spanMonstruoJugador.innerHTML = "CLIPEERWOOD"
    } */else {
        alert("Selecciona un Monstruo")
        reiniciarJuego()
    }

    seleccionarMonstruoRival()
}

// funcion seleccion aleatorio del monstruo rival
function seleccionarMonstruoRival(){
    let monstruoAleatorio = aleatorio (1,3)
    let spanMonstruoRival = document.getElementById('monstruoRival')

    if(monstruoAleatorio == 1) {
        spanMonstruoRival.innerHTML = 'FYAHFOX'
    }else if(monstruoAleatorio == 2) {
        spanMonstruoRival.innerHTML = 'HIPOBLOO'
    }else if(monstruoAleatorio == 3) {
        spanMonstruoRival.innerHTML = 'FROSHEET'
    }/*else if(monstruoAleatorio == 4) {
        spanMonstruoRival.innerHTML = "LAVASEE"
    }else if(monstruoAleatorio == 5) {
        spanMonstruoRival.innerHTML = "ROCICRY"
    }else if(monstruoAleatorio == 6) {
        spanMonstruoRival.innerHTML = "CLIPEERWOOD"
    }*/
}

// ataques de tipo del Jugador
function ataqueFuego(){
    ataqueJugador = '🔥FUEGO🔥'
    ataqueAleatorioRival()
}

function ataqueAgua(){
    ataqueJugador = '💧AGUA💧'
    ataqueAleatorioRival()
}

function ataquePlanta(){
    ataqueJugador = '🌱PLANTA🌱'
    ataqueAleatorioRival()
}

// ataque aleatorio del Rival
function ataqueAleatorioRival() {
    let ataqueAleatorio = aleatorio(1,3)

     if(ataqueAleatorio == 1) {
        ataqueRival = '🔥FUEGO🔥'
    }else if(ataqueAleatorio == 2) {
        ataqueRival = '💧AGUA💧'
    }else {
        ataqueRival = '🌱PLANTA🌱'
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

// control de vidas
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
    let parrafoJugador = document.createElement('p')
    let parrafoRival = document.createElement('p')
    let parrafoResultado = document.createElement('p')
    parrafoJugador.innerHTML = 'JUGADOR golpea con '+ ataqueJugador + '.' 
    parrafoRival.innerHTML = 'RIVAL golpea con ' + ataqueRival + "."
    parrafoResultado.innerHTML = resultadoCombate

    sectionInfo.appendChild(parrafoJugador)
    sectionInfo.appendChild(parrafoRival)
    sectionInfo.appendChild(parrafoResultado)

}

function crearMensajeFinal(resultadoFinal) {
    let sectionReinicio = document.getElementById('reinicio')
    sectionReinicio.style.display = 'block'

    let sectionInfo = document.getElementById('info')
    let parrafo = document.createElement('p')
    parrafo.innerHTML = resultadoFinal

    sectionInfo.appendChild(parrafo)

    let botonFuego = document.getElementById("bfuego")
    botonFuego.disabled = true
    let botonAgua = document.getElementById("bagua")
    botonAgua.disabled = true
    let botonPlanta = document.getElementById("bplanta")
    botonPlanta.disabled = true
}

// boton de reinicio de juego
function reiniciarJuego (){
    location.reload()
}

// funcion de numero aleatorio
function aleatorio(min, max){
    return Math.floor(Math.random()*(max-min+1)+min)
}

// Iniciar juego cuando la ventana cargue por completo
window.addEventListener('load', iniciarJuego)