

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

    if(inputFosfyah){
        alert("Seleccionaste Fosfyah")
    } else if(inputRioblis){
        alert("Seleccionaste Rioblis")
    } else if(inputHojurot){
        alert("Seleccionaste Hojurot")
    } else if(inputLavasee){
        alert("Seleccionaste Lavasee")
    } else if(inputRocicry){
        alert("Seleccionaste Rocicry")
    } else if(inputClipperwood){
        alert("Seleccionaste Clipperwood")
    } else {
        alert("Selecciona algun Mostruo")
    }
}

window.addEventListener('load', iniciarJuego)