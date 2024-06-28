

function iniciarJuego() {
    let botonMonstruoJugador = document.getElementById('bmonstruo')
    botonMonstruoJugador.addEventListener('click', seleccionarMonstruoJugador)
    botonMonstruoJugador.addEventListener('click', seleccionarMonstruoJugador)

}

function aleatorio(min, max){
    return Math.floor(Math.random()*(max-min+1)+min)
}

function seleccionarMonstruoJugador() {
    let inputFosfyah = document.getElementById('Fosfyah').checked
    let inputRioblis = document.getElementById('Rioblis').checked
    let inputHojurot = document.getElementById('Hojurot').checked
    let inputLavasee = document.getElementById('Lavasee').checked
    let inputRocicry = document.getElementById('Rocicry').checked
    let inputClipperwood = document.getElementById('Clipperwood').checked
    let spanMonstruoJugador = document.getElementById('monstruoJugador')

    if(inputFosfyah){
        spanMonstruoJugador.innerHTML = "Fosfyah"
    } else if(inputRioblis){
        spanMonstruoJugador.innerHTML = "Rioblis"
    } else if(inputHojurot){
        spanMonstruoJugador.innerHTML = "Hojurot"
    } else if(inputLavasee){
        spanMonstruoJugador.innerHTML = "Lavasee"
    } else if(inputRocicry){
        spanMonstruoJugador.innerHTML = "Rocicry"
    } else if(inputClipperwood){
        spanMonstruoJugador.innerHTML = "Clipperwood"
    } else {
        alert("Selecciona un Monstruo")
    }
}

function seleccionarMonstruoRival() {
    rival = aleatorio(1,6)
    let spanMonstruoRival = document.getElementById('monstruoRival')

    if(monstruoRival == 1) {
        spanMonstruoRival.innerHTML = "Fosfyah"
    }else if(monstruoRival == 2) {
        spanMonstruoRival.innerHTML = "Rioblis"
    }else if(monstruoRival == 3) {
        spanMonstruoRival.innerHTML = "Hojurot"
    }else if(monstruoRival == 4) {
        spanMonstruoRival.innerHTML = "Lavasee"
    }else if(monstruoRival == 5) {
        spanMonstruoRival.innerHTML = "Rocicry"
    }else if(monstruoRival == 6) {
        spanMonstruoRival.innerHTML = "CLipperwood"
    }
    return monstruoRival
}
//while (vidasPerdidas > 3 && vidasQuitadas > 3) {

let jugador = 3

window.addEventListener('load', iniciarJuego)