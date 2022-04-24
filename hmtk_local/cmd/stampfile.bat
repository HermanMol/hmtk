@echo off
rem Stampfile
rem Add the files last modification date-time to it's name as yyyymmddhhmiss
rem HMTK-version=2022-04-24 12:37:02
if "%~1"=="/?" hlp %0
setlocal 
if not exist "%~1" echo *W: File %1 does not exist (rc=1).&exit /b 1
call getFileDate.cmd mydate "%~1" lastmodified
set "new=%~dpn1_%mydate%%~x1"
if exist "%new%" echo *W: File "%new%" already exists (rc=2).&exit /b 2
if /i "%2"=="c" (
  copy "%~1" "%new%" >nul
  if /i "%3"=="v" echo File copied to %new%
  ) else (
  move "%~1" "%new%" >nul
  if /i "%3"=="v" echo File renamed to %new%
  )
exit /b 0
rem +....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+....0
:StartHelp
|
| stampfile
| =========
|
| Purpose: Add the file modification date and time to the name
|
| Syntax: stampfile filename [c [v]]
|
| Parameters:
|   - filename
|     The name of an existing file. You must enclose the filename in double 
|     quotes, if the filename contains spaces.
|   - copy or rename
|     Enter a 'c' to make a timestamped copy the file. In all other cases the file will be renamed.
|   - verbose
|     Enter a 'v' to get a confirmation message after successful completion
|
| If a parameter is not entered on the commandline, it will not work.
|
` !! this line will not be shown in the help !!
| Actions that will be performed:
|  a) If the file does not exist you are notified and the program stops
|  b) The files last modified date and time are retrieved (using getFileDate.cmd and WMIC)
|  c) The new name will be: oldname_yyyymmddhhmiss.ext
|  d) If already a file with that name exists you are notified and the program stops
|  e) If it does not yet exist the file is renamed or copied depending on the value
|     you specified for the second argument.
|
:EndHelp