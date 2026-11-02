@echo off

:: Get the start time of the study session
set /t start_time=%time:~0,2%%time:~3,2%

:: Get the current time
for /f "tokens=2 delims=" %%a in ('wmic os get systemuptime /value') do set /a current_time=%%a

:: Calculate the time elapsed since the start of the study session
set /a elapsed_time=%current_time% - %start_time%

:: Define the study time limit in minutes
set /a study_time_limit=60

:: Check if the user needs a break
if /a %elapsed_time% geq %study_time_limit% (
    echo You've been studying for %elapsed_time% minutes. Time for a break!
) else (
    echo You've been studying for %elapsed_time% minutes. Keep going!
)