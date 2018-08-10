@echo off
:check_audio
call C:\Radio-Delicias\server\ngrok\check\curl.exe -o radio-ngrok.json http://localhost:4040/api/tunnels/radio
rem call C:\Radio-Delicias\server\ngrok\check\curl.exe -o tplink.json http://localhost:4040/api/tunnels/tplink
if exist radio-ngrok.json (
echo "si ngrok corriendo"
  GOTO continuar
) else (
echo "no ngrok corriendo"
	@start "" /D"C:\Radio-Delicias\server\ngrok" "iniciar.vbs"
	@timeout 15 >nul
	GOTO check_audio
)

:continuar
find /i "dial" < radio-ngrok.json > onlineRadio
call C:\Radio-Delicias\Scripts\notEmpty.cmd onlineRadio
If %errorlevel% EQU 0 (
echo "reiniciar ngrok"
    del onlineRadio
	del radio-ngrok.json
	rem del tplink.json
    taskkill /F /IM ngrok.exe
   	@start "" /D"C:\Radio-Delicias\server\ngrok" "iniciar.vbs"
	@timeout 15 >nul
	GOTO check_audio
) Else (
echo "subir archivos"
    del onlineRadio
	move radio-ngrok.json C:\Radio-Delicias\jsonTransmission\
	rem move tplink.json C:\Radio-Delicias\server\config\
	del radio-ngrok.json
	rem del tplink.json
    @start "" /D"C:\Radio-Delicias\jsonTransmission\" "iniciar.vbs"
	exit
)