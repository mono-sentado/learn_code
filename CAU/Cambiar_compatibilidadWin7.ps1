$exeArchivo = @(
    "C:\Instalacion_Supervision\1_CCPulse\ip\ip\setup.exe"
)

foreach ($rutaArchivo in $exeArchivo) {
    $caja = New-Object -ComObject Shell.Application
    $archivo = $caja.Namespace((Get-Item $rutaArchivo).DirectoryName).ParseName((Get-Item $rutaArchivo).Name)

    # Abrir las propiedades del archivo
    $archivo.InvokeVerb("Properties")

    # Esperar un momento para que la ventana de propiedades se abra
    Start-Sleep -Seconds 1

    # Enviar teclas para navegar y seleccionar el modo de compatibilidad
    $wcaja = New-Object -ComObject WScript.Shell
    $wcaja.SendKeys("{TAB 5}")  # Navegar a la pestaña de compatibilidad
    Start-Sleep -Seconds 1
    $wcaja.SendKeys("{RIGHT}")  # Marcar la casilla de compatibilidad
    Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB 3}")  # Navegar a la pestaña de compatibilidad
    Start-Sleep -Seconds 1
    $wcaja.SendKeys(" ") 
    Start-Sleep -Seconds 1 # Aplicar y cerrar
    $wcaja.SendKeys("{TAB}") 
	Start-Sleep -Seconds 1
    $estadoCasilla = $wcaja.SendKeys("{SPACE}")  # Cambiar el estado de la casilla
    Start-Sleep -Seconds 1
    if ($estadoCasilla -eq $true) {
        $wcaja.SendKeys("{SPACE}")  # Marcar la casilla si no está marcada
        Start-Sleep -Seconds 1
    }

	$wcaja.SendKeys("{SPACE}")  # Aplicar y cerrar
	Start-Sleep -Seconds 1
    $wcaja.SendKeys("{DOWN 3}")  # Navegar a la pestaña de compatibilidad
    Start-Sleep -Seconds 1
	$wcaja.SendKeys("{ENTER}")  # Aplicar y cerrar
	Start-Sleep -Seconds 1
}
