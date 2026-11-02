@echo off

:: Get the list of inspection checklist items from a file
set "items=checklist.txt"

:: Display the list of items
echo Inspection Checklist Items:
echo -------------------------
for /f "tokens=2 delims=" %%i in (%items%) do (
    echo %%i
)

:: Display the categories and tags
echo Categories and Tags:
echo -------------------
set /a catCount=0
set /a tagCount=0
for /f "tokens=2 delims=" %%i in (%items%) do (
    set /a catCount+=1
    set /a tagCount+=1
    echo Category: %%i
    echo Tag: %%i
)

:: Filter items by category
set /p "category=Enter category to filter by: "
setlocal enabledelayedexpansion
for /f "tokens=2 delims=" %%i in (%items%) do (
    if "%%i"=="%category%" (
        echo Inspection Checklist Item: %%i
    )
)

:: Filter items by tag
set /p "tag=Enter tag to filter by: "
setlocal enabledelayedexpansion
for /f "tokens=2 delims=" %%i in (%items%) do (
    if "%%i"=="%tag%" (
        echo Inspection Checklist Item: %%i
    )
)

:: Ask the user if they want to filter by category or tag again
set /p "choice=Do you want to filter again? (y/n): "
if /i "%choice%"=="y" (
    goto filter
)