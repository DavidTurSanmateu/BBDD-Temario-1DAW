@echo off
setlocal

set "ENTORNO=C:\Users\X571\venvs\BBDD\mkdocsenv"
set "BASE=D:\_PC\OneDrive"

echo Buscando la carpeta del proyecto...

for /d %%D in ("%BASE%\OneDrive - Conselleria d*") do (
    if exist "%%~fD\--2026-27\BBDD\UD_BBDD\mkdocs.yml" (
        set "PROYECTO=%%~fD\--2026-27\BBDD\UD_RRLL"
        goto encontrado
    )
)

echo ERROR: No se encuentra el proyecto.
echo Comprueba la carpeta OneDrive y el archivo mkdocs.yml.
pause
exit /b 1

:encontrado
echo Proyecto encontrado:
echo "%PROYECTO%"

if not exist "%ENTORNO%\Scripts\python.exe" (
    echo ERROR: No se encuentra Python en el entorno virtual.
    pause
    exit /b 1
)

cd /d "%PROYECTO%"
"%ENTORNO%\Scripts\python.exe" -m mkdocs build

pause