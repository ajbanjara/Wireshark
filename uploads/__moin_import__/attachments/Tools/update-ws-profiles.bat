@echo off
REM This script crawls through Wireshark profiles, replacing strings as specified
REM 
REM I use it when I copy my profile collection to a new workstation and want to 
REM update filters which look like this:
REM   gui.filter_expressions.label: Me
REM   gui.filter_expressions.enabled: TRUE
REM   gui.filter_expressions.expr: eth.addr==11:22:33:44:55:66
REM where '11:22:33:44:55:66' might be the MAC address of my original PC ... and 
REM thus not the MAC address of this new workstation
REM
REM 
REM V      Who       When        What
REM ---------------------------------------------------------------------------
REM 1.3.0  skendric  2015-01-14  Perform each preferences edit seperately
REM 1.2.0  skendric  2015-01-14  Replace recursion with simple directory walk
REM 1.1.0  skendric  2015-01-13  Handle missing preferences files
REM 1.0.0  skendric  2015-01-12  First Version
REM


REM Set up basic defaults
setlocal EnableExtensions EnableDelayedExpansion
if errorlevel 1 echo Warning:  Unable to enable extensions and/or expansion
set debug=0
set program=%0
set version=1.3.0


REM Locate files and directories
set profileDir=%APPDATA%\Wireshark\profiles
set prefFile=preferences
set sedCmd=sed.exe

REM Explain usage
if [%1]==[-h]     goto EXPLAIN
if [%1]==[--help] goto EXPLAIN
if [%1]==[]       goto EXPLAIN
goto CONTINUE
:EXPLAIN
echo Program = %program%
echo Version = %version%
echo.
echo This script walks through your Wireshark 'profiles' directory, changing 
echo every occurrence of the specified 'old' string into the specified 'new' string.
echo.
echo The intent is to automate changing MAC or IP addresses employed in 
echo Display Filters.
echo.
echo Usage:
echo.
echo %program%
echo               -o {old string}
echo               -n {new string}
exit /B
:CONTINUE
if %debug%==1 echo Debug:  Finished Explain usage


REM Grab arguments
:PARSE
if "%~1"=="" goto ENDPARSE
if "%~1"=="-o" set oldStr=%2
if "%~1"=="-n" set newStr=%2
if "%~1"=="-d" set debug=%2
shift
shift
goto PARSE
:ENDPARSE
if %debug%==1 echo Debug:  Finished Grab command-line parameters 


REM Debug output
if %debug%==1 (
  echo Debug:  Parameters defined as follows:
  echo      oldStr     = %oldStr%
  echo      newStr     = %newStr%
  echo      debug      = %debug%
)


REM Sanity-check
if [%oldStr%]==[] (
  echo Error:  -o {old String} is required
  echo.
  echo %usage%
  exit /B
)
if [%newStr%]==[] (
  echo Error:  -n {new String} is required
  echo.
  echo %usage%
  exit /B
)
if not exist %sedCmd% (
	echo Error:  %sedCmd% does not exist
	exit /B
)
if %debug%==1 echo Debug:  Finished Sanity-check




REM Tell the operator what we are about to do
echo.
echo.
echo I will change every occurrence of %oldStr% to %newStr% 
echo in each file named '%prefFile%' located beneath the following directory: 
echo     %profileDir%
echo I will save your old '%prefFile%' to '%prefFile%.bak'
echo.
pause
echo.

REM Change into profile directory
cd %profileDir%


REM Backup preferences file
echo Creating %prefFile%.bak
for /D %%d in (*) do (
  cd %%d  
  if exist %prefFile% (
    copy /Y %prefFile% %prefFile%.bak > NUL
  )
  cd ..
)

REM Change oldStr to newStr
echo Changing %oldStr% to %newStr%
for /D %%d in (*) do (
  cd %%d
  echo   Editing Profile %%d
  if exist %prefFile% (
    %sedCmd% "s/%oldStr%/%newStr%/ig" %prefFile% > %prefFile%.new
    move /Y %prefFile%.new %prefFile% > NUL
  )
  cd ..
)


REM Replace LF with CRLF
echo Replacing LF with CRLF
for /D %%d in (*) do (
  cd %%d
  if exist %prefFile% (
    type %prefFile% | find /v "" > %prefFile%.new
    move /Y %prefFile%.new %prefFile% > NUL
  )
  cd ..
)


REM Clean-up
echo.
echo Done replacing %oldStr% with %newStr% 
echo in %profileDir%
