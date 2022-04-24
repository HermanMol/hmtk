@echo off
rem Set the environment variable
rem HMTK-version=2022-04-24 13:39:06
rem TODO: make a %APPDATA% company file to define these and select from there.
if "%1" equ "/?" hlp "%~nx0"
setlocal
set choice=
set cmp=
rem set the company:
rem
echo.
call colortext bW "********** Set HMTK Company **********"
echo.
echo.      1. Company One
echo.      2. Second Company
echo.      3. Third Business
echo.      4. Blablbla
echo.
echo. 
echo.  Current setting HMTK_COMPANY=%HMTK_COMPANY%
echo.
set /p "choice=Choose (1-4, enter=quit): "
if "%choice%" equ "1" set "cmp=C01" & goto :setvar
if "%choice%" equ "2" set "cmp=C02" & goto :setvar
if "%choice%" equ "3" set "cmp=C03" & goto :setvar
if "%choice%" equ "4" set "cmp=bla" & goto :setvar
echo.
echo Setting not changed...
ping -n 5 localhost >nul
exit
:setvar
setx HMTK_COMPANY %cmp%
echo.
echo *A: New setting for HMTK_COMPANY=%cmp% is available in the next (new!) cmd session(s).
echo.
ping -n 5 localhost >nul
exit
....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8
:StartHelp
|
| set_hmtk_company.bat
| ====================
|
| Purpose: Set the company to work with in the HMTK commands.
|
| Syntax: set_hmtk_company
|
| Parameters:
|   - none
|
` !! this line will not be shown in the help !!
|
| Current company = !HMTK_COMPANY!
| 
:EndHelp
