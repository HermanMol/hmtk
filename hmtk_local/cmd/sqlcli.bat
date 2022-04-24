echo off
rem Run Oracle SQLcl 
rem Arguments:
rem #1 environment
rem #2 database/user/schema
rem HMTK-version=2022-04-24 17:36:48
setlocal
color 0a
echo *I: Running %~f0 ...
set "env=%~1"
if "%env%" equ "" echo *E: sqlcli env userid & exit /b 1
set "uid=%~2"
if "%uid%" equ "" echo *E: sqlcli env userid & exit /b 2
title %0 %env% %uid%
set srv=
set pwd=
call get_hmtk_parm.cmd servers srv %env%
if %ERRORLEVEL% GTR 0 echo *E: Failed - get_hm21_parm.cmd servers. &exit /b %ERRORLEVEL%
call get_hmtk_parm.cmd databases pwd %uid%
if %ERRORLEVEL% GTR 0 echo *E: Failed - get_hm21_parm.cmd databases. &exit /b %ERRORLEVEL%
(	set pwd=
	set srv=
	"C:\aaa_hmo\80_programs\oracle\sqlcli\sqlcl\bin\sql.exe" %uid%/%pwd%@%srv%
)
endlocal
echo *I: Finished running %~f0.