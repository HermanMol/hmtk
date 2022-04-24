@echo off
rem Verify proper working of getting hmtk configuration
rem Command: TEST_get_ictd_parm user env
rem HMTK-version=2022-04-24 14:02:39
setlocal
call get_hmtk_parm.cmd tnsnames tns tns_%2
echo TNS-names for environment %2 = %tns%
call get_hmtk_parm.cmd dbnames dbn sid_%2%
echo DB name for environment %2 = %dbn%
call get_hmtk_parm.cmd dbusers pwd %1_%2
echo DB user password for user %1 environment %2 = %pwd%
endlocal
exit /b
