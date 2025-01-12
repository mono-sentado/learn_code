@echo off
powershell -ExecutionPolicy Bypass -File %~dp0INI_CAU_AUTO.ps1
timeout t 5 nobreak nul
exit