@echo off

:: Display usage message
echo Usage: tool.cmd [input_file]
echo.
echo Input file must be a valid text file.
echo.

:: Check if input file is provided
if "%~1"=="" (
    echo Error: Input file is required.
    exit /b 1
)

:: Validate input file
if not exist "%~1" (
    echo Error: Input file not found.
    exit /b 1
)

:: Read input file
for /f "delims=" %%a in (%~1) do (
    :: Display each line of the input file
    echo %%a
)

:: Exit successfully
exit /b 0