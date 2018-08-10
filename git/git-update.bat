@pushd "%~dp0"
cd C:\Radio-Delicias\jsonTransmission
git pull origin jsonTransmission

cd C:\Radio-Delicias\server
git pull origin server

@start "" /D"C:\Radio-Delicias\server\Icecast\check" "check.vbs"
exit