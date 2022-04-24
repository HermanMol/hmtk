rem HMTK Sub Command
rem Syntax = call getFileDate #1 #2 #3
rem #1 = receiving parameter
rem #2 = the file
rem #3 = which date, must be CreationDate / InstallDate / LastAccessed / LastModified
rem HMTK-version: 2022-04-18 10:46:59
setlocal
set "filename=%~f2"
set "filename=%filename:\=\\%"
for /F "usebackq skip=1 tokens=1,2* delims==." %%A in (`wmic datafile where name^="%filename%" get %3 /value`) do (
  if "%%B" NEQ "" set "filedate=%%B"
)
(endlocal & set "%1=%filedate%")
exit /b
