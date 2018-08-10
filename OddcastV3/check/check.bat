@echo off

:check_audio
call C:\Radio-Delicias\server\ngrok\check\curl.exe -o radio-oddcast http://localhost:8000
find /i "delicias" < radio-oddcast > onlineRadio
del radio-oddcast

call C:\Radio-Delicias\server\Scripts\notEmpty.cmd onlineRadio

If %errorlevel% EQU 0 (
    del onlineRadio
	echo "Corriendo oddcast"
    @start "" /D"C:\Radio-Delicias\server\ngrok\check" "check.vbs"
    exit
) Else (
    del onlineRadio
	echo "reiniciando oddcast"
    taskkill /F /IM OddcastV3Standalone.exe
   	@start "" /D"C:\Radio-Delicias\server\OddcastV3" "iniciar.vbs"
	@timeout 10 >nul
	GOTO check_audio
)