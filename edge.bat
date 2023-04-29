@echo off

set "input=%*"

if not defined input (
    echo No input provided!
    exit /b 1
)

curl --head --silent --fail "%input%" > nul

if %errorlevel% neq 0 (
    echo Searching... %input%!
    timeout /t 1 > nul
    start msedge.exe "https://www.google.com/search?q=%input%"
) else (
    echo Opening... "%input%"!
    timeout /t 1 > nul
    start msedge.exe "%input%"
)
