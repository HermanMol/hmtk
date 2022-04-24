@echo off
rem Execute Oracle SQLcl
rem Make shure the proper path is specified
rem HMTK-version=2022-04-24 13:39:06
echo *I: Running %~f0
rem TODO: is the path dependent??? see C:\Users\herman.mol\AppData\Roaming\hmtk\hmtk_general.cfg
rem if /i "%COMPUTERNAME%" equ "computer01" set "sqlexe=C:\aaa_hmol\80_programs\oracle\sqldev\sqldeveloper\sqldeveloper\bin\sql.exe"
rem if /i "%COMPUTERNAME%" equ "computer02" set "sqlexe=C:\Program Files\sqldeveloper\sqldeveloper\bin\sql.exe"
call get_hmtk_parm.cmd general sqlexe sqlexe
if "%sqlexe%" equ "" echo *E: No SQLcl binary specified on this computer %COMPUTERNAME% & exit /b 3
echo *I: SQLcl is %sqlexe%
if defined hmtkdebug echo *D: %0 %*
rem If no script to execute, just login
if "%~2" equ "" (
	"%sqlexe%" -L "%~1"
	exit /b
	)
"%sqlexe%" -L %*
exit /b
