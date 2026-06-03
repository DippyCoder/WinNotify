@echo off
:: Runs the internet-check PowerShell script silently (no window flash)
powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "%~dp0check_internet.ps1"
