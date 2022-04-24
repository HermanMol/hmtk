rem HMTK Sub Command
rem Command: get_hmtk_parm.cmd scope var parm
rem scope = which hmtk-scope.cfg to search for parm
rem var = name of the environment variable to receive the requested value
rem parm= the parameter to retrieve from the hmtk-scope.cfg file
rem See the examples in file %APPDATA%\hmtk\hmtk_parameter_help.cfg and 
rem try testing with the file TST_get_hmtk_parm.bat
rem HMTK-version=2022-04-24 13:36:25
setlocal
if defined hmtkdebug echo *D: %0 %*
set val=
set "scope=%~1"
set "prm=%~3"
set "cmpy=%HMTK_COMPANY%_"
if /i "%scope%" equ "general" set cmpy=
if "%~1" equ "" echo *E: Required argument #1 missing.&exit /b 1
if "%~2" equ "" echo *E: Required argument #2 missing.&exit /b 2
if "%~3" equ "" echo *E: Required argument #3 missing.&exit /b 3
if not exist "%APPDATA%\hmtk\hmtk_%cmpy%%scope%.cfg" echo *E: File "%APPDATA%\hmtk\hmtk_%cmpy%%scope%.cfg" not found.&exit /b 4
for /F "usebackq eol=# tokens=1* delims== " %%i in (`findstr /B /I /C:"%prm% " "%APPDATA%\hmtk\hmtk_%cmpy%%scope%.cfg"`) do (
	set "val=%%j"
		)
(endlocal & set "%2=%val%")
exit /b
