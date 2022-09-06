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
    reg DELETE HKEY_CLASSES_ROOT\Directory\Background\shell\RunCmd /f
    echo Done!
    pause >nul
