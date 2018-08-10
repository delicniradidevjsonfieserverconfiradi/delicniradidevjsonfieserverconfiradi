@echo off
:check_audio
call C:\Radio-Delicias\server\ngrok\check\curl.exe -o radio-oddcast http://localhost:8000
if exist radio-oddcast (
	del radio-oddcast
	echo "si icecast"
	@start "" /D"C:\Radio-Delicias\server\OddcastV3\check" "check.vbs"
	exit
) else (
echo "no icecast "
	@start "" /D"C:\Radio-Delicias\server\Icecast" "iniciar.vbs"
	@timeout 10 >nul
	GOTO check_audio
)