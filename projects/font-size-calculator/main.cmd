@echo off

:: Get the text content from the user
set /p "text=Enter the text content: "

:: Get the left and right page margins from the user
set /p "left_margin=Enter the left page margin: "
set /p "right_margin=Enter the right page margin: "

:: Calculate the font size based on the text content and page margins
for /l %%i in (10,1,100) do (
    set /a font_size=%%i
    set /a max_chars=%%i*10
    set /a min_chars=%%i*5
    set /a max_lines=%%i*2
    set /a min_lines=%%i*1
    set /a total_chars=0
    set /a total_lines=0

    set /a words=0
    set /a words_with_punctuation=0
    set /a sentences=0

    :: Calculate the number of words, words with punctuation, and sentences
    for /f "tokens=delims=." %%a in ("%%text") do (
        set /a words+=1
        if "%%a"=="." set /a words_with_punctuation+=1
        if "%%a"=="." or "%%a"=="," set /a sentences+=1
    )

    :: Check if the text is too long for the font size
    if %words%>=%max_chars% (
        echo Font size too small for the text content
        goto next_font_size
    )

    :: Check if the text is too short for the font size
    if %words%<%min_chars% (
        echo Font size too large for the text content
        goto next_font_size
    )

    :: Check if the text is too long for the font size
    if %words_with_punctuation%>=%max_chars% (
        echo Font size too small for the text content
        goto next_font_size
    )

    :: Check if the text is too short for the font size
    if %words_with_punctuation%<%min_chars% (
        echo Font size too large for the text content
        goto next_font_size
    )

    :: Check if the text is too long for the font size
    if %sentences%>=%max_lines% (
        echo Font size too small for the text content
        goto next_font_size
    )

    :: Check if the text is too short for the font size
    if %sentences%<%min_lines% (
        echo Font size too large for the text content
        goto next_font_size
    )

    :: If all checks pass, print the font size
    echo Font size: %font_size%

next_font_size:
    set /a font_size+=1
    goto next_font_size