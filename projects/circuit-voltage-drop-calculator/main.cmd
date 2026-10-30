@echo off

:: Get user input for resistance, length, and current
set /p "resistance=Enter resistance (Ω): "
set /p "length=Enter length (m): "
set /p "current=Enter current (A): "

:: Validate user input
if "%resistance%"=="" (
    echo Resistance cannot be empty.
    goto error
)

if "%length%"=="" (
    echo Length cannot be empty.
    goto error
)

if "%current%"=="" (
    echo Current cannot be empty.
    goto error
)

:: Calculate voltage drop
set /a voltage_drop=(%current% * %length%) / %resistance%

:: Display result
echo Voltage drop: %voltage_drop% V

:: Error handling
error:
echo Error: Invalid input.
pause