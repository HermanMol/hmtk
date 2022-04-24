@echo off
rem Print a line with colors
rem Inspiration from:
rem - https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
rem - https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
rem - Osborne Medium Sherry :-)
rem
rem Example: call colortext nB "nB = Text color black on bright blue"
rem More examples in test_colortext.bat
rem
rem ATTENTION: this bat file contains a data table with the color numbers AND the logic!
rem Works on Command Prompt in Microsoft Windows [Version 10.0.19043.1165]
rem HMTK-version=2022-04-24 13:29:27
rem
rem # *** DATA SECTION ********** DO NOT CHANGE NEXT DATA **********
rem #= #Color   BG FG B Color
rem n= black    40 30 0 black = none (to not conflict with blue)
rem r= red      41 31 4 red
rem g= green    42 32 2 green
rem y= yellow   43 33 6 yellow
rem b= blue     44 34 1 blue
rem m= magenta  45 35 5 magenta
rem p= purple   45 35 5 purple
rem c= cyan     46 36 3 cyan
rem a= aqua     46 36 3 aqua
rem w= white    47 37 7 white
rem N= Black   100 90 8 Bright Black = Grey = None (to not conflict with Blue or Green)
rem R= Red     101 91 C Bright Red
rem G= Green   102 92 A Bright Green
rem Y= Yellow  103 93 E Bright Yellow
rem B= Blue    104 94 9 Bright Blue
rem M= Magenta 105 95 D Bright Magenta
rem P= Purple  105 95 D Bright Purple
rem C= Cyan    106 96 B Bright Cyan
rem A= Aqua    106 96 B Bright Aqua
rem W= White   107 97 F Bright White
rem # *** DATA SECTION ********** DO NOT CHANGE PRIOR DATA **********
rem Styles: Normal=0, Bold=4, Underline=1, Inverse=7 ... does not work yet
if "%1" equ "/?" hlp "%~0"
setlocal
if defined ictddebug echo *D: Looking for %*
set "txt=%~2"
set "rq=%1..."
rem foreground is first character
set "fg=%rq:~0,1%"
rem background is second character, default black = none
set "bg=%rq:~1,1%"
if "%bg%" equ "." set "bg=n"
rem style is third character, default = normal
set "st=%rq:~2,1%"
if /I "%st%" equ "B" set "st=4" & goto :nextstep
if /I "%st%" equ "U" set "st=1" & goto :nextstep
if /I "%st%" equ "I" set "st=7" & goto :nextstep
set "st=0"
:nextstep
if defined ictddebug echo *D: Foreground=%fg%
if defined ictddebug echo *D: Background=%bg%
if defined ictddebug echo *D: Style     =%st%
set "fgnr=."
set "bgnr=."
for /F "usebackq tokens=3-6* delims= " %%H in (`findstr /B /C:"rem %fg%=" "%~f0" `) do set "fgnr=%%J"
for /F "usebackq tokens=3-6* delims= " %%H in (`findstr /B /C:"rem %bg%=" "%~f0" `) do set "bgnr=%%I"
rem if any of the colors is not found, a message is displayed and a default foreground and background color are assigned
if "%fgnr%" equ "." (
	echo *W: No color for foreground color "%fg%"; use: n,r,g,y,b,m/p,c/a,w uppercase for bright.
	set "fgnr=101"
	set "bgnr=93"
	rem exit /b 1
	)
if "%bgnr%" equ "." (
	echo *W: No color for background color "%bg%"; use: n,r,g,y,b,m/p,c/a,w uppercase for bright.
	set "fgnr=101"
	set "bgnr=93"
	rem exit /b 1
	)
rem Now print the text
echo [%fgnr%;%bgnr%m%txt%[0m
endlocal
exit /b
....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8
:StartHelp
|
| colortext
| ==========
|
| Purpose: Print a line with a foreground and background color
|
| Syntax: colortext {fb} {"text"}
|
| Parameters:
|   - fb = The foreground and background color. 
|          The first character is the foreground color, the second character
|          is the background color. Case sensitive! If the character is a
|          lower case then the lower intensity is applied. If the character is
|          an upper case then the high intensity is applied.
|          Possible color values:
|          n - black ("None", to avoid conflict with blue")
|          r - red
|          g - green
|          y - yellow
|          b - blue
|          m - magenta
|          p - purple
|          c - cyan
|          a - aqua
|          w - white
|   - "text" = the text to be printed. Must be enclosed in double quotes.
|
` !! this line will not be shown in the help !!
|
| Example:
|    call colortext nB "nB = Text color black on bright blue"
| 
| Optionally you have to enable ANSI colors by adding this to the registry:
| in HKEY_CURRENT_USER\Console
| the item "VirtualTerminalLevel"=dword:00000001
| 
:EndHelp
