# Conexión con WPLDMS04\SOFTWARE
Write-Host "Conexión con WPLDMS04\SOFTWARE"
Write-Host "Poner lineadirecta\coaXXX y luego contraseña"
if (Test-Path Z:) { net use Z: /delete }
net use Z: \\wpldms04\software

#Copiado de Directorios en Z: 
cd C:\
New-Item -ItemType "Directory" -Path "Instalacion_Supervision" -Force
Write-Host "Carpeta Instalacion_Supervision creada"

cd C:\Instalacion_Supervision
New-Item -ItemType "Directory" -Path "1_CCPulse", "1_CCPulse\ip", "1_CCPulse\templates", "2_CME", "3_OCM", "4_Personal Communication" -Force
Write-Host "Carpetas en C:\Instalacion_Supervision\ creadas"
Write-Host "Copiando..."
Copy-Item "Z:\CTI\CCPulse\ip" "C:\Instalacion_Supervision\1_CCPulse\ip" -Recurse -Force
Copy-Item "Z:\CTI\CCPulse\Templates" "C:\Instalacion_Supervision\1_CCPulse\Templates" -Recurse -Force
Write-Host "-Carpetas ip y Templates de CCPulse"
Copy-Item "Z:\CTI\CME" "C:\Instalacion_Supervision\2_CME" -Recurse -Force
Write-Host "-Carpeta CME"
Copy-Item "Z:\CTI\OCM" "C:\Instalacion_Supervision\3_OCM" -Recurse -Force
Write-Host "-Carpeta OCM"

#Copiado de Instaladores
Write-Host "Copiando instaladores..."
Copy-Item "Z:\Nice Player Codec's\Nice Player Codec Pack.msi" "C:\Instalacion_Supervision" -Force
Write-Host "-Nice"
Copy-Item "Z:\VNC\tightvnc-2.8.85.msi" "C:\Instalacion_Supervision" -Force
Write-Host "-VNC"
Copy-Item "Z:\PDF24\Instalador de PDF24 11.17.0 64bit.msi" "C:\Instalacion_Supervision" -Force
Write-Host "-PDF24"
Copy-Item "Z:\Personal Communications\Versión 13\mls.rar" "C:\Instalacion_Supervision\4_Personal Communication" -Force
Copy-Item "Z:\Personal Communications\PKI.zip" "C:\Instalacion_Supervision\4_Personal Communication" -Force
Write-Host "-Personal Communication (TSO)"

#Descompresion de Archivos
Write-Host "Descomprimiendo..."
cd "C:\Instalacion_Supervision\4_Personal Communication"
& "C:\Program Files\7-Zip\7z.exe" x "C:\Instalacion_Supervision\4_Personal Communication\mls.rar" -Force
Write-Host "-archivo mls.rar"
& "C:\Program Files\7-Zip\7z.exe" x "C:\Instalacion_Supervision\4_Personal Communication\PKI.zip" -Force
Write-Host "-archivo PKI.zip"

#Creacion de Directorios en C:
Write-Host "Creando carpetas en (C:)..."
cd C:\
New-Item -ItemType Directory -Path "ODXT64FULL" -Force
Write-Host "-ODXT64FULL para O365" 
New-Item -ItemType Directory -Path "CMS" -Force
Write-Host "-CMS para CMS Supervisor"
New-Item -ItemType Directory -Path "AgentMap" -Force
Write-Host "-Agent Map" 
New-Item -ItemType Directory -Path "Versions" -Force
Write-Host "-Versions de Agent Map"
New-Item -ItemType Directory -Path "C:\Program Files (x86)\GCTI\Templates" -Force
New-Item -ItemType Directory -Path "C:\Program Files\GCTI\Templates" -Force
New-Item -ItemType Directory -Path "C:\Program Files\GCTI\CCPulse+" -Force
New-Item -ItemType Directory -Path "C:\Program Files\GCTI\Configuration Manager" -Force
New-Item -ItemType Directory -Path "C:\Program Files\GCTI\Outbound Contact Manager" -Force
Write-Host "-Templates para GCTI en x64 y x86"

#Copiado de Directorios de Z:
Write-Host "Copiando..."
Copy-Item "Z:\CTI\CCPulse\Templates" "C:\Program Files (x86)\GCTI\" -Recurse -Force
Copy-Item "Z:\CTI\OCM\templates" "C:\Program Files (x86)\GCTI\" -Recurse -Force
Write-Host "-Carpeta de Templates de CCPulse y OCM en GCTI en x86"
Copy-Item "Z:\CTI\CCPulse\Templates" "C:\Program Files\GCTI\" -Recurse -Force
Copy-Item "Z:\CTI\OCM\templates" "C:\Program Files\GCTI\" -Recurse -Force
Write-Host "-Carpeta de Templates de CCPulse y OCM en GCTI en x64"
Copy-Item "Z:\O365\ODXT64FULL" "C:\" -Recurse -Force
Write-Host "-Carpeta ODXT64FULL de O365 en C:"
Copy-Item "Z:\CMS Supervisor\CMS" "C:\" -Recurse -Force
Write-Host "-Instalador de CMS Supervisor"
cd C:\
Copy-Item "Z:\Agent Map\Client" "C:\AgentMap\" -Recurse -Force
Write-Host "-Instalador de Agent Map"
Copy-Item "Z:\Agent Map\Versions" "C:\Versions" -Recurse -Force
Write-Host "-Carpeta Versión de Agent Map en C:"

#Politicas de Seguridad Script
Set-ExecutionPolicy Unrestricted -Scope Process -Force

# Lista de progamas compatibilidad WIN7
$exeArchivo = @(
 "C:\Instalacion_Supervision\1_CCPulse\ip\ip\setup.exe",
 "C:\Instalacion_Supervision\2_CME\CME\ip\setup.exe",
 "C:\Instalacion_Supervision\3_OCM\OCM\ip\setup.exe"
)
foreach ($rutaArchivo in $exeArchivo) {
 $Archivo = Get-Item $rutaArchivo
 $rutaArchivo = $Archivo.FullName
 # Crear la ruta del registro para la configuración de compatibilidad
 $regRuta = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"
 
 # Verificar si la configuración de compatibilidad ya está establecida
 $currentValue = Get-ItemProperty -Path $regRuta -Name $rutaArchivo -ErrorAction SilentlyContinue
 if ($null -eq $currentValue) {
 # Si no está establecida, agregar la configuración de compatibilidad para Windows 7
 Set-ItemProperty -Path $regRuta -Name $rutaArchivo -Value "WIN7RTM"
 }
}
Write-Host "Configuración de compatibilidad CCPulse, CME, y OCM aplicada correctamente."

<# Creacion de Archivo de txt para instalacion de IBM Personal Commnuications
$destino = "C:\Instalacion_Supervision\4_Personal Communication\response.txt"
$contenido = @"
[InstallShield Silent]
Version=v7.00
File=Response File

[File Transfer]
OverwrittenReadOnly=NoToAll

[DlgOrder]
Dlg0=SdWelcome-0
Count=4
Dlg1=SdLicense-0
Dlg2=SdAskDestPath-0
Dlg3=SdFinish-0

[SdWelcome-0]
Result=1

[SdLicense-0]
Result=1

[SdAskDestPath-0]
szDir=C:\Program Files\IBM\Personal Communications

[SdFinish-0]
Result=1
bOpt1=0
bOpt2=0
"@
Set-Content -Path $destino -Value $contenido#>

Write-Host "INSTALACIONES"
    Write-Host "Instalado "

 # Instalacion CCPulse

    Start-Process -FilePath "C:\Instalacion_Supervision\1_CCPulse\ip\ip\setup.exe" -ArgumentList "/norestart" -Verb RunAs
    Start-Sleep -Seconds 30
    $wcaja = New-Object -ComObject WScript.Shell
        Start-Sleep -Seconds 5
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("C:\Program Files\GCTI\CCPulse")
    Start-Sleep -Seconds 1
    $wcaja.SendKeys("{+}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1 
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 20
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 10
        Write-Host "
		CCPulse"


# Instalacion CME
    
    Start-Process -FilePath "C:\Instalacion_Supervision\2_CME\CME\ip\setup.exe" -ArgumentList "/norestart" -Verb RunAs
    Start-Sleep -Seconds 30
    $wcaja = New-Object -ComObject WScript.Shell
        Start-Sleep -Seconds 5
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("C:\Program Files\GCTI\Configuration Manager")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 20
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 10
        Write-Host "
		CME"


        # Instalación OCM
    
    Start-Process -FilePath "C:\Instalacion_Supervision\3_OCM\OCM\ip\setup.exe" -ArgumentList "/norestart" -Verb RunAs
    Start-Sleep -Seconds 30
    $wcaja = New-Object -ComObject WScript.Shell
        Start-Sleep -Seconds 5
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("C:\Program Files\GCTI\Outbound Contact Manager")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 20
    $wcaja.SendKeys(" ")
        Start-Sleep -Seconds 10
        Write-Host "
		OCM"


        # Instalación CMS

    Unblock-File -Path "C:\CMS\SetupSup_PA28.exe"
    Start-Process -FilePath "C:\CMS\SetupSup_PA28.exe" -ArgumentList "\S" -Verb RunAs
    Start-Sleep -Seconds 20
    $wcaja = New-Object -ComObject WScript.Shell
        Start-Sleep -Seconds 20 
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 5 
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1 
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 5
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 120
    $wcaja.SendKeys("{TAB}")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 5
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 10
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 10
        Write-Host "
		CMS"


    # Intalación Agent MAP
    
    Start-Process -FilePath "C:\AgentMap\Client\setup.exe" -ArgumentList "\S"
    Start-Sleep -Seconds 30
    $wcaja = New-Object -ComObject WScript.Shell
        Start-Sleep -Seconds 5
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 1
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 5
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 60
        Write-Host "
		Agent MAP"

        # Instalación Personal Communication
    
    Start-Process -FilePath "C:\Instalacion_Supervision\4_Personal Communication\mls\setup.exe" -ArgumentList "/S /f1response.txt" -Verb RunAs
    Write-Host "
	Personal Communication" 

        # Instalación O365
     
    Start-Process -FilePath "C:\ODXT64FULL\setup.exe" -ArgumentList "/configure C:\ODXT64FULL\Office365.xml" -Verb RunAs
    Write-Host "
	O365"

        # PDF24
	
	Find-Package -Name 'C:\Instalacion_Supervision\Instalador de PDF24 11.17.0 64bit.msi' -force | Install-Package
    Write-Host "
	PDF24"

        # NicePlayerPluging
	
	Find-Package -Name 'C:\Instalacion_Supervision\Nice Player Codec Pack.msi' -force | Install-Package
    Write-Host "
	Nice Player Codec"


Write-Host "
Creación de Accesos Directos"

# Define ruta del AccesoDirecto CCPulse
$RutaDirectaCCPulse = "C:\Users\Default\Desktop\Start CCPulse+.lnk"
$RutaCCPulse = "C:\Program Files\GCTI\CCPulse+\CallCenter.exe"
$WScriptShell = New-Object -ComObject WScript.Shell
$AccesoDirectoCCPulse = $WScriptShell.CreateShortcut($RutaDirectaCCPulse)
$AccesoDirectoCCPulse.TargetPath = $RutaCCPulse
$AccesoDirectoCCPulse.Save()
Write-Host " -CCPulse"

# Define ruta del AccesoDirecto CME
$RutaDirectaCME = "C:\Users\Default\Desktop\Start Configuration Manager.lnk"
$RutaCME = "C:\Program Files\GCTI\Configuration Manager\sce.exe"
$WScriptShell = New-Object -ComObject WScript.Shell
$AccesoDirectoCME = $WScriptShell.CreateShortcut($RutaDirectaCME)
$AccesoDirectoCME.TargetPath = $RutaCME
$AccesoDirectoCME.Save()
Write-Host " -CME"

# Define ruta del AccesoDirecto OCM
$RutaDirectaOCM = "C:\Users\Default\Desktop\Start Outbound Contact Manager.lnk"
$RutaOCM = "C:\Program Files\GCTI\Outbound Contact Manager\ContactManager.exe"
$WScriptShell = New-Object -ComObject WScript.Shell
$AccesoDirectoOCM = $WScriptShell.CreateShortcut($RutaDirectaOCM)
$AccesoDirectoOCM.TargetPath = $RutaOCM
$AccesoDirectoOCM.Save()
Write-Host " -OCM"

# Agregar valores de CMSpro a Regedit
regedit.exe C:\CMS\cmspro20.reg
Write-Host "Las claves y valores de CMSpro20 se agregaron al Registro"
    Start-Sleep -Seconds 5
    $wcaja = New-Object -ComObject WScript.Shell
        Start-Sleep -Seconds 1 
    $wcaja.SendKeys("{ }")
        Start-Sleep -Seconds 5


Update-Progress -Activity "Instalación de programas" -Status "Completado" -PercentComplete 100
Write-Host "Instalación completada."

# Remove-Item -Path "C:\\Instalacion_Supervision" -Recurse -Force


# Importar Certificado a Autoridades de certificación raíz de confianza
Import-Certificate -FilePath "C:\Instalacion_Supervision\4_Personal Communication\PKI\CA.cer" -CertStoreLocation Cert:\LocalMachine\Root
Import-Certificate -FilePath "C:\Instalacion_Supervision\4_Personal Communication\PKI\Sub_CA.cer" -CertStoreLocation Cert:\LocalMachine\Root

# Verificar que el certificado se instaló correctamente
Get-ChildItem -Path Cert:\LocalMachine\Root

# Dar Control Total a TODOS en carpetas GCTI.
Write-Host "Dando Control Total a TODOS en carpetas GCTI."
$folderPath = "C:\GCTI"
$acl = Get-Acl $folderPath
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Todos", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.SetAccessRule($accessRule)
Set-Acl $folderPath $acl

# Dar Control Total a TODOS en carpetas ProgramFiles_GCTI.
Write-Host "Dando Control Total a TODOS en carpetas GCTI."
$folderPath = "C:\Program Files\GCTI"
$acl = Get-Acl $folderPath
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Todos", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.SetAccessRule($accessRule)
Set-Acl $folderPath $acl

# Dar Control Total a TODOS en carpetas ProgramFiles(x86)_GCTI.
Write-Host "Dando Control Total a TODOS en carpetas GCTI."
$folderPath = "C:\Program Files (x86)\GCTI"
$acl = Get-Acl $folderPath
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Todos", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.SetAccessRule($accessRule)
Set-Acl $folderPath $acl

Write-Host "--- RECORDATORIO ---"
Write-Host "Compatibilidad W7: CCPulse, CME y OCM."
Write-Host "Borrar (x86): CCPulse, CME, y OCM."
Pause
