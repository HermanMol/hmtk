rem HMTK Sub Command
rem Example call get_yyyymmddhhmmss now
rem HMTK-version=2022-04-24 13:39:06
setlocal
for /f "tokens=2,3 delims==.+" %%I in ('wmic os get localdatetime /format:list') do set "_isodate=%%I"
rem echo *D: _isodate = %_isodate%
rem pause
(endlocal & set "%1=%_isodate%")
exit /b
