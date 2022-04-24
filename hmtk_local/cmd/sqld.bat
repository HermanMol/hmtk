@echo off
rem Start a command line interface with the Oracle Ontwikkel database
rem Arguments
rem 1=owner, when empty or "." then ... TODO
rem HMTK-version=2022-04-24 13:39:06
if "%1" equ "/?" hlp "%~nx0"
echo.
echo *I: Start Oracle SQLcl for %*
setlocal
set "dbu=%~1"
if "%dbu%" equ "" set "dbu=???"
if "%dbu%" equ "." set "dbu=???"
set "env=d"
call get_hmtk_parm.cmd tnsnames tns tns_%env%
call get_hmtk_parm.cmd dbusers pwd %dbu%_%env%
(set "pwd=" & call xql %dbu%/\"%pwd%\"@%tns% %2)
endlocal
exit /b
rem +....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+....0
:StartHelp
|
| sqld
| ====
|
| Purpose: Open a SQL command line session in the Development database for a user
|
| Syntax: sqld owner ["@script"]
|
| Parameters:
|   owner - The owner to log in with. The default is ???, but if you want to run
|           a script, you must specify the owner.
|   script - An optional script to be executed. If specified and the script 
|            path contains spaces, then the path must be between double quotes.
|            If you specify a script, you must specify the database. You may then use a
|            periode to indicate the default vos.
|
| Parameters are case insensitive.
|
` !! this line will not be shown in the help !!
|
| Examples:
|   $> sqld
|   $> sqld user1
|   $> sqld . @whoami
|   $> sqld user2 @whoami
|
| Note: If the password is wrong you must check the file 
|       !APPDATA!\hmtk\hmtk_[company]_dbusers.cfg
|
:EndHelp
