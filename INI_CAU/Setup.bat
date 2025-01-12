@echo off
chcp 65001 >nul
setlocal

:: Define los archivos y las rutas de los accesos directos
set "AUTO=%~dp0INI_CAU_AUTO.bat"
set "MANUAL=%~dp0INI_CAU_MANUAL.bat"
set "destination=C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
set "shortcutauto=%destination%\INI_CAU_AUTO.lnk"
set "shortcutmanual=%destination%\INI_CAU_MANUAL.lnk"

:: Extraer solo los nombres de los archivos
set "AUTO_NAME=AUTO"
set "MANUAL_NAME=MANUAL"

:MainMenu
:: Menú principal para elegir instalación o desinstalación
echo ======================================================================================================================
echo Elige una opción:
echo 1. INSTALACIÓN
echo 2. DESINSTALACIÓN
set /p mainchoice=Ingresa 1 o 2:

if "%mainchoice%"=="1" (
    goto Instalacion
) else if "%mainchoice%"=="2" (
    goto Desinstalacion
) else (
    echo Opción no válida.
    goto MainMenu
)

:Instalacion
:: Pregunta al usuario para elegir un archivo para la instalación
echo ======================================================================================================================
echo ATENCIÓN: Esto creará el acceso directo del Ejecutable INI_CAU
echo ======================================================================================================================
echo Elige una opción:
echo 	A. %AUTO_NAME% - Ejecutar los Procesos Automáticamente si GLOBAL está Conectado.
echo 	M. %MANUAL_NAME% - Ejecutar los Procesos si GLOBAL está Conectado y Verificas Manualmente.
set /p choice=Ingresa A o M:

:: Crear el acceso directo del archivo elegido en la ruta de destino
if /I "%choice%"=="A" (
    call :CreateShortcut "%AUTO%" "%shortcutauto%"
    echo %AUTO_NAME% ha sido enviado a %destination%
) else if /I "%choice%"=="M" (
    call :CreateShortcut "%MANUAL%" "%shortcutmanual%"
    echo %MANUAL_NAME% ha sido enviado a %destination%
) else (
    echo Opción no válida.
    goto Instalacion
)

:: Espera 5 segundos antes de cerrarse
timeout /t 5 /nobreak >nul
endlocal
exit /b

:Desinstalacion
:: Pregunta al usuario para confirmar la eliminación
echo ======================================================================================================================
echo ATENCIÓN: Esto eliminará el acceso directo del Ejecutable INI_CAU
echo ======================================================================================================================
set /p confirm=¿Estás seguro de que deseas continuar? (S/N):

if /I "%confirm%"=="S" (
    if exist "%shortcutauto%" (
        del /Q "%shortcutauto%"
        echo %shortcutauto% ha sido eliminado.
    ) else if exist "%shortcutmanual%" (
        del /Q "%shortcutmanual%"
        echo %shortcutmanual% ha sido eliminado.
    ) else (
        echo No se encontró ningún acceso directo para eliminar.
    )
) else (
    echo Operación cancelada.
)

:: Espera 5 segundos antes de cerrarse
timeout /t 5 /nobreak >nul
endlocal
exit /b

:CreateShortcut
set "target=%~1"
set "shortcut=%~2"
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%shortcut%'); $s.TargetPath = '%target%'; $s.Save()"
exit /b