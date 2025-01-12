$lines = @(
	""
    "________/\\\\\\\\\_____/\\\\\\\\\_____/\\\________/\\\_",
    " _____/\\\////////____/\\\\\\\\\\\\\__\/\\\_______\/\\\_",
    "  ___/\\\/____________/\\\/////////\\\_\/\\\_______\/\\\_",
    "   __/\\\_____________\/\\\_______\/\\\_\/\\\_______\/\\\_",
    "    _\/\\\_____________\/\\\\\\\\\\\\\\\_\/\\\_______\/\\\_",
    "     _\//\\\____________\/\\\/////////\\\_\/\\\_______\/\\\_",
    "      __\///\\\__________\/\\\_______\/\\\_\//\\\______/\\\__",
    "       ____\////\\\\\\\\\_\/\\\_______\/\\\__\///\\\\\\\\\/___",
    "        _______\/////////__\///________\///_____\/////////_____",
	""
)

$lines | ForEach-Object { Write-Output $_ }

# Genera un bucle hasta que se cumpla la condición Global ON
$spinner = @('|', '/', '-', '\')
$spinnerIndex = 0
while ($true) {
    # Localiza el adaptador de red asociado a GLOBAL
    $PANGP = Get-NetAdapter -InterfaceDescription "PANGP*"
    # Comprueba si el adaptador de red está Activo
    if ($PANGP.Status -eq "Up") {
        Write-Host "Global ON"
		Write-Host "============================="
        # Ejecuta Procesos
				# Ejecuta Caffeine
			Start-Process "C:\Users\$env:USERNAME\Desktop\caffeine64 4.exe"
				# Ejecuta LockStatus
			Start-Process "C:\Users\$env:USERNAME\Desktop\lockoutstatus.exe"
				# Ejecuta LAPS UI
			Start-Process "C:\Program Files\LAPS\AdmPwd.UI.exe"
				# Ejecuta Lotus Notes y Domino Admin
			Start-Process "C:\Program Files (x86)\IBM\Notes\admin.exe"
			Start-Process "C:\Program Files (x86)\IBM\Notes\notes.exe"
				# Ejecuta Apache
			Start-Process "\\$env:COMPUTERNAME\c$\Program Files (x86)\Apache Directory Studio\Apache Directory Studio.exe"
				# Ejecuta Ivanti
			Start-Process "C:\Program Files\LANDesk\ManagementSuite\Console.exe"
				# Ejecuta Avaya
			Start-Process "C:\Program Files (x86)\Avaya\Avaya one-X Agent\OneXAgentUI.exe"
				# Ejecuta Directorio Activo
			Start-Process dsa.msc
				# Ejecuta 2 Asistencia Rápida
			Start-Process "ms-quick-assist:"
			Start-Process "ms-quick-assist:"
				# Ejecuta Teams
			Start-Process "ms-teams"
				# Ejecuta GRTD TC4
			Start-Process "C:\Program Files\RealVNC\VNC Viewer\vncviewer.exe" "10.4.100.45"
    
				# Abre Navegadores
			Start-Process msedge "https://acceso.averroes.lda/Login/index.html"
			Start-Process msedge "https://outlook.office.com/mail/sentitems"
			Start-Process msedge "https://wiki.lda/pages/viewpage.action?spaceKey=CAU&title=MULTICLIENTE"
			Start-Process chrome "https://controldesk.lda/maximo/ui/?event=loadapp&value=startcntr&uisessionid=2513&_tt=vik7sbjgdp3d4d9rbe99ll90ou"

				# Abre archivos de .txt cambiar la ruta
			Start-Process notepad.exe "C:\Users\$env:USERNAME\Ruta\Archivo.txt"
			
			Start-Sleep -Seconds 10
			
				Write-Host -NoNewline "Ejecutando Procesos "
				# Carga
			for ($i = 0; $i -lt 10; $i++) {
				Write-Host -NoNewline $spinner[$spinnerIndex]
				Start-Sleep -Milliseconds 200
				Write-Host -NoNewline "`b"
				$spinnerIndex = ($spinnerIndex + 1) % $spinner.Length  # Actualiza el índice del spinner
			if ($spinnerIndex -eq $spinner.Length) {  # Reinicia el índice si alcanza el final del array
				$spinnerIndex = 0
				}
			}
        break
    } else {
        Write-Host "Global OFF"
        Write-Host "============================="
	}
        Start-Sleep -Seconds 5 # Espera 5 segundos antes de volver a comprobar
		    Write-Host -NoNewline "Comprobando conexión "
        for ($i = 0; $i -lt 10; $i++) {
            Write-Host -NoNewline $spinner[$spinnerIndex]
            Start-Sleep -Milliseconds 200
            Write-Host -NoNewline "`b"
            $spinnerIndex = ($spinnerIndex + 1) % $spinner.Length  # Actualiza el índice del spinner
        if ($spinnerIndex -eq $spinner.Length) {  # Reinicia el índice si alcanza el final del array
            $spinnerIndex = 0
        }
    }
}
Exit

# Añadir PS1 a "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"