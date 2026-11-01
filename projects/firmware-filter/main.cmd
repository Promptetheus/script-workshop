@echo off

set /p searchQuery=Enter search query: 

for /f "tokens=*" %%a in ('findstr /l /c:"%searchQuery%" firmware_catalog.txt') do (
    for /f "tokens=*" %%b in ('findstr /l /c:"%%a" compatible_devices.txt') do (
        echo %%b
    )
)