@echo off
Rem Example for Gather command-line arguments.
rem HMTK-version=2022-04-24 13:39:06
if "%~1"=="/?" hlp %0
setlocal enableextensions
rem --- get cmddir and basedir
pushd %~dp0
set "cmddir=%cd%"
popd
set "xecdir=%cd%"
echo *I: Command Dir   = %cmddir%
echo *I: Execution Dir = %xecdir%
echo.
echo *I: Examples of commandline arguments 
echo.
echo *I: System variables:
echo - %%cd%%                    = %cd%
echo - %%date%%                  = %date%
echo - %%time%%                  = %time%
echo - %%random%%                = %random%
echo - %%errorlevel%%            = %errorlevel%
echo - %%cmdextversion%%         = %cmdextversion%
echo - %%cmdcmdline%%            = %cmdcmdline%
echo - %%highestnumanodenumber%% = %highestnumanodenumber%
echo.
echo *I: This file is %~0
echo - f - full path   = %~f0
echo - s - short names = %~s0 
echo - d - drive       = %~d0
echo - p - directory   = %~p0
echo - n - filename    = %~n0
echo - x - extension   = %~x0
echo - a - attributes  = %~a0 
echo - t - Date/time   = %~t0 
echo - z - size        = %~z0 
echo.
echo *I: WMIC info:
call :get_yyyymmddhhmmss mydate
echo - ISO date     = %mydate%
call :getFileModDate y1 "%~f0" creationdate
echo - creationdate = %y1%
call :getFileModDate y1 "%~f0" installdate
echo - installdate  = %y1%
call :getFileModDate y1 "%~f0" lastaccessed
echo - lastaccessed = %y1%
call :getFileModDate y1 "%~f0" lastmodified
echo - lastmodified = %y1%
echo.
echo *I: All arguments on the next line:
echo.  ^>%*^<
echo *I: Each argument on a line ^(using SHIFT):
:arg
  setlocal enabledelayedexpansion
  set idx=0
  set USER_ARGS=
  :loop
  if (%1)==() goto :parsed
    set USER_ARGS=%USER_ARGS% %1
    set /a idx=idx + 1
    echo - argument !idx! = %~1
    shift
  goto loop
:parsed
set idx2=!idx!
echo *I: The command-line arguments concattenated: ^>%USER_ARGS%^<
setlocal disabledelayedexpansion
echo.
echo *W: Be aware that %%~0 is now ^>%~0^< due to the SHIFT that was executed %idx2% times!!
echo.
echo Change string to UPPER- or lowercase:
set "teststring=alluppercase"
echo.  Input string: %teststring%
call toupper teststring
echo.  Result should be all UPPERCASE: %teststring%
set "teststring=ALLLOWERCASE"
echo.  Input string: %teststring%
call tolower teststring
echo.  Result should be all lowercase: %teststring%
echo.
echo *I: The End
endlocal
exit /b 0
rem NOTE: use the getFileDate.cmd
:getFileModDate
  rem Syntax = call :getFileModDate #1 #2 #3
  rem #1 = receiving parameter
  rem #2 = the file
  rem #3 = which date, must be CreationDate / InstallDate / LastAccessed / LastModified
  rem Prepare: get the file full path and change the backslashes to double backslashes
  set "filename=%~f2"
  set "filename=%filename:\=\\%"
  for /F "usebackq skip=1 tokens=1,2* delims==." %%A in (`wmic datafile where name^="%filename%" get %3 /value`) do (
    if "%%B" NEQ "" set "filedate=%%B"
  )
  (endlocal & set "%1=%filedate%")
  exit /b
rem NOTE: use the get_yyyymmddhhmmss.cmd
:get_yyyymmddhhmmss
  rem Example: call :get_yyyymmddhhmmss mydate
  for /f "tokens=2,3 delims==.+" %%I in ('wmic os get localdatetime /format:list') do set "_isodate=%%I%%J"
  (endlocal & set "%1=%_isodate%")
  exit /b
exit /b
rem +....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+....0
:StartHelp
|
| my_examples
| ===========
|
| Purpose: Example of several command line stuff
|
| Syntax: my_examples.bat [put your "command line arguments" here.]
|
| Parameters:
|   Any sequence of parameter values separated by blanks. If you enclose words in double
|   quotes, these are regarded one argument value.
|
` !! this line will not be shown in the help !!
| Examples of:
|  a) cmddir = the variable holding the command's path
|  b) xecdir = the variable holding the current execution path
|  c) Show the command file's information: full path, size, date, etc.
|  d) Show the command file's creation, last access, last modification date in ISO format
|  e) Show the current datetime in ISO format
|  f) Show all command line arguments, enumerated
|
| The created file should be ready
:EndHelp
