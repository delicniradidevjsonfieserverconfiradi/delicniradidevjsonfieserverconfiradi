@echo off
SchTasks /Delete /TN "Radio-Delicias" /F
SchTasks /Create /NP /SC MINUTE /MO 10 /TN "Radio-Delicias" /TR "C:\Radio-Delicias\iniciar-transmision.bat"
exit
