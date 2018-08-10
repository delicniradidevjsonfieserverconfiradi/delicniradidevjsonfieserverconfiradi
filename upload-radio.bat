@echo off

:comparar
C:\Windows\System32\fc /w C:\Radio-Delicias\json_transmission\radio-ngrok.json C:\Radio-Delicias\config\radio-ngrokAnt.json > nul
IF %errorlevel% EQU 0 GOTO END

:DIFERENTES
echo "diferentes"
del radio-ngrokAnt.json
copy radio-ngrok.json radio-ngrokAnt.json

cd C:\Radio-Delicias\json_transmission\
git add .
SET foo=%DATE%
git commit -m "%foo%"
git push -u origin jsonTransmission

:END
echo "iguales"
taskkill /F /IM timeout.exe
exit
exit