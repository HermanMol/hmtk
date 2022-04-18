@echo off
rem hlp.bat
rem Show the Syntax/Help of a hmtk commandline tool
rem HMTK-version: 2022-04-18 10:44:28
setlocal enableextensions enabledelayedexpansion
set "show=false"
rem If no parameter was entered, then show the syntax.
if "%1"=="" %~n0 %~nx0
echo.
set "subject=%~1"
if "%~x1"=="" set "subject=%~1.bat"
call :ShowHelp "%subject%"
exit /b
:ShowHelp
echo Help for %~dp$PATH:1%1
echo.&echo.&echo.
for /F "usebackq tokens=* eol=` " %%L in (%~dp$PATH:1%~1) do (
      if /I "%%L"==":EndHelp" (
            echo.  ^|_________________________________________________________________________________________________
            set "show=false"
            )
      if "!show!"=="true" echo.  %%L
      if /I "%%L"==":StartHelp" (
            echo.  __________________________________________________________________________________________________
            set "show=true"
            )
      )
exit /b
....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8
:StartHelp
|
| Help!
| ==========
| 
| Purpose: Show the help / syntax for a commandline tool
| 
| Syntax: hlp {filename}
| 
| Parameters:
|   - filename = the name of the tool, including the extension.
| 
` !! this line will not be shown in the help !!
| 
| HLP locates the command in argument #1 in your PATH and then reads each line. It will
| show every line between the markers :StartHelp and :EndHelp, excluding these markes.
| 
| Lines starting with a backtick "`" are ignored and not shown.
| 
| To have an empty line shown, it must at least contain one space.
:EndHelp
