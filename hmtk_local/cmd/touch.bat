@echo off
rem See the help, below
rem Based on https://support.microsoft.com/en-us/kb/69581
rem HMTK-version=2022-04-24 12:34:46
if "%~1"=="/?" hlp %0
setlocal
:again
if not exist "%~1" echo ***&echo *E: File "%~1" not found.&echo ***&exit /b 1
pushd "%~dp1"
copy /b "%~nx1" +,, >nul
set "errlvl=%ERRORLEVEL%"
popd
shift /1
if "%1" neq "" goto :again
(endlocal & exit /b %errlvl%)
rem +....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+....0
:StartHelp
|
| touch
| =====
|
| Purpose: Change LastModified date and time of one or more files to current 
|          date and time
|
| Syntax: touch filename
|
| Parameters:
|   - filename(s)
|     The name(s) or full path(s) of the file(s) to alter the date and time for.
|
| Tip:
|   Create a shortcut on your desktop then you can easily drag and drop one or
|   more files from Windows Explorer on that shortcut.
|
| If the action fails (e.g. the file is readonly) the exit code is set to non-zero.
|
:EndHelp
