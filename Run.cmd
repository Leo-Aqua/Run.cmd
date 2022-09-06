@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        goto PROGRAMM
    ) else (
        echo ERROR: Run as Admin!
        pause >nul
        exit
    )

:PROGRAMM
    reg ADD HKEY_CLASSES_ROOT\Directory\Background\shell\RunCmd /d "Run Cmd in current folder" 
    reg ADD HKEY_CLASSES_ROOT\Directory\Background\shell\RunCmd /v "Extended" 
    reg ADD HKEY_CLASSES_ROOT\Directory\Background\shell\RunCmd /v "Icon" /d "C:\Windows\System32\cmd.exe"
    reg ADD HKEY_CLASSES_ROOT\Directory\Background\shell\RunCmd\command /d "cmd.exe /K"
    echo Done!
    pause >nul
