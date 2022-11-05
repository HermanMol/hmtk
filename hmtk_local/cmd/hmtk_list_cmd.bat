@echo off
if "%~1"=="/?" hlp %0
echo.
echo **************************** HMTK List Cmd ****************************
echo.
call colortext bW "Primary commands:"
dir /on /b %~dp0*.bat
echo.
call colortext bW "Sub commands:"
dir /on /b %~dp0*.cmd
echo.
echo ***********************************************************************
exit /b
....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8
:StartHelp
|
| hmtk_list_cmd
| =============
| 
| Purpose: List HMTK primary and sub-commands
| 
| Syntax: hmtk_list_cmd
| 
| Parameters:
|   - None
| 
:EndHelp
