@echo off
powershell -ExecutionPolicy ByPass -NoProfile -command "& """%~dp0Build\Build.ps1""" -bl %*"
exit /b %ErrorLevel%
