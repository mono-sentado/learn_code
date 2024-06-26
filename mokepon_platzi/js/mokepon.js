

function iniciarJuego() {
    let botonMonstruoJugador = document.getElementById('bmonstruo')
    botonMonstruoJugador.addEventListener('click', seleccionarMonstruoJugador)
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

window.addEventListener('load', iniciarJuego)