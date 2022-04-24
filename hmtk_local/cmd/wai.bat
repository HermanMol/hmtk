@echo off
rem WAI.BAT = Where Am I?
rem Set title and prompt to last directory of current path
rem with help from to www.dostips.com
rem HMTK-version=2022-04-24 13:39:06
if "%~1"=="/?" hlp %0
setlocal enabledelayedexpansion
set m=1
set "l="
rem find position of the last backslash in the current path
for /L %%n in (0,1,254) do (
      if "!cd:~%%n,1!" equ "\" set m=%%n
      )
set /a m=m+1
rem chop-chop, design your own
title @ !cd:~%m%!
set "l=prompt $n:...\!cd:~%m%!$g"
( endlocal 
  %l%
)
exit /b
rem +....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+....0
:StartHelp
|
| wai.bat
| =======
|
| Purpose: Where Am I - set the title and command prompt to the last node of the current path
|
| Syntax: wai
|
| Parameters:
|   - none
|
:EndHelp