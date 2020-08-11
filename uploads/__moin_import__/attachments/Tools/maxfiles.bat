@ECHO OFF
:: --------------------------------------------------------------------------
:: This program is free software; you can redistribute it and/or modify
:: it under the terms of the GNU General Public License as published by
:: the Free Software Foundation; either version 2 of the License, or
:: (at your option) any later version.
::
:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:: GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License along
:: with this program; if not, write to the Free Software Foundation, Inc.,
:: 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
::
:: --------------------------------------------------------------------------
:: Batch file to limit either the number of files in a directory to a specified
:: limit, or the total disk space consumed by those files or both.  Optionally,
:: you can specify the maximum number of files for a specific file type instead
:: of all files.
::
:: By Christopher Maynard <Christopher.Maynard@igt.com>
:: Copyright 2015 Christopher Maynard
::
:: Usage: GOTO USAGE
::
:: Developed/tested on Microsoft Windows [Version 6.1.7601] (Windows 7 64-bit)
::
:: Motivation:
::   https://ask.wireshark.org/questions/43936/tshark-revolving-file-collection
:: --------------------------------------------------------------------------

SETLOCAL
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

SET DIR=
SET PATTERN=
SET MAXFILES=
SET MAXSIZE=
SET DELAY=
SET QUIET=N
SET BAT=%~NX0

:PARSE_OPTS
IF "%~1" == "" (
    IF NOT DEFINED DIR (
        REM Require the user specify the directory to avoid accidentally
        REM deleting files from the wrong directory, such as the current
        REM working directory, which was my initial implementation, but I
        REM thought this would be the safer approach.
        GOTO USAGE
    )
    IF NOT DEFINED MAXFILES (
        IF NOT DEFINED MAXSIZE (
            IF %QUIET% == N (
                ECHO Nothing to do.
                GOTO :EOF
            )
        )
    )
    SET DIR_PATTERN="%DIR:"=%\%PATTERN%"
    IF DEFINED DELAY (
        IF %QUIET% == N (
            ECHO Monitoring !DIR_PATTERN! ...
            ECHO.
        )
    )
    GOTO LIMIT_FILES
)
IF "%~1" == "-?" GOTO USAGE
IF /I "%~1" == "-h" GOTO USAGE
IF /I "%~1" == "--help" GOTO USAGE
IF /I "%~1" == "-d" GOTO SET_DIR
IF /I "%~1" == "-c" GOTO SET_COUNT
IF /I "%~1" == "-s" GOTO SET_SIZE
IF /I "%~1" == "-p" GOTO SET_PATTERN
IF /I "%~1" == "-r" GOTO SET_DELAY
IF /I "%~1" == "-q" SET QUIET=Y
:NEXT_OPT
SHIFT
GOTO PARSE_OPTS

:: --------------------------------------------------------------------------
:SET_DIR
SHIFT
SET DIR="%~1"
IF %DIR% == "" (
    ECHO ^<^<^< ERROR ^>^>^>  No directory specified.
    GOTO :EOF
)
IF NOT EXIST %DIR% (
    ECHO ^<^<^< ERROR ^>^>^>  %DIR% doesn't exist.
    GOTO :EOF
)

ECHO %~A1|FINDSTR /R "File attributes: d" > NUL
IF %ERRORLEVEL% NEQ 0 (
    ECHO ^<^<^< ERROR ^>^>^>  %DIR% is not a directory.
    GOTO :EOF
)
GOTO :NEXT_OPT

:: --------------------------------------------------------------------------
:SET_COUNT
SHIFT
SET MAXFILES=%~1
IF "%MAXFILES%" == "" (
    ECHO ^<^<^< ERROR ^>^>^>  No count limit specified.
    GOTO :EOF
)
ECHO %MAXFILES%|FINDSTR /XR "[1-9][0-9]*$" > NUL
IF %ERRORLEVEL% NEQ 0 (
    ECHO ^<^<^< ERROR ^>^>^>  Invalid count limit specified.
    GOTO :EOF
)
IF %MAXFILES% LEQ 0 (
    ECHO ^<^<^< ERROR ^>^>^>  Invalid count limit specified.
    GOTO :EOF
)
GOTO :NEXT_OPT

:: --------------------------------------------------------------------------
:SET_SIZE
SHIFT
SET MAXSIZE=%~1
IF "%MAXSIZE%" == "" (
    ECHO ^<^<^< ERROR ^>^>^>  No size limit specified.
    GOTO :EOF
)
ECHO %MAXSIZE%|FINDSTR /XR "[1-9][0-9]*$" > NUL
IF %ERRORLEVEL% NEQ 0 (
    ECHO ^<^<^< ERROR ^>^>^>  Invalid size limit specified.
    GOTO :EOF
)
IF %MAXSIZE% LEQ 0 (
    ECHO ^<^<^< ERROR ^>^>^>  Invalid size limit specified.
    GOTO :EOF
)
GOTO :NEXT_OPT

:: --------------------------------------------------------------------------
:SET_PATTERN
SHIFT
SET PATTERN=%~1
GOTO :NEXT_OPT

:: --------------------------------------------------------------------------
:SET_DELAY
SHIFT
SET DELAY=%~1
IF "%DELAY%" == "" (
    ECHO ^<^<^< ERROR ^>^>^>  No delay specified.
    GOTO :EOF
)
ECHO %DELAY%|FINDSTR /XR "[1-9][0-9]*$" > NUL
IF %ERRORLEVEL% NEQ 0 (
    ECHO ^<^<^< ERROR ^>^>^>  Invalid delay specified.
    GOTO :EOF
)
IF %DELAY% LEQ 0 (
    ECHO ^<^<^< ERROR ^>^>^>  Invalid delay specified.
    GOTO :EOF
)
GOTO :NEXT_OPT

:: --------------------------------------------------------------------------
:: This isn't particularly efficient, but hopefully it's "Good Enough (TM)"!
:LIMIT_FILES
SET CURFILES=
SET CURSIZE=

REM Count files matching pattern and get total size:
REM Other methods of counting: http://www.robvanderwoude.com/shorts.php
FOR /F "TOKENS=1,3 USEBACKQ" %%A IN (`DIR %DIR_PATTERN% /A-D /-C 2^> NUL ^| FIND "File(s)"`) DO (
   SET CURFILES=%%A
   SET CURSIZE=%%B
)
IF NOT DEFINED CURFILES GOTO :DO_DELAY
IF NOT DEFINED CURSIZE GOTO :DO_DELAY

IF DEFINED MAXFILES (
    IF %CURFILES% GTR !MAXFILES! (
        CALL :DEL_OLDEST_FILE %DIR%,%PATTERN%
        GOTO :LIMIT_FILES
    )
)
IF DEFINED MAXSIZE (
    IF %CURSIZE% GTR !MAXSIZE! (
        CALL :DEL_OLDEST_FILE %DIR%,%PATTERN%
        GOTO :LIMIT_FILES
    )
)

:DO_DELAY
IF DEFINED DELAY (
    IF %QUIET% == Y (
        CALL :TIMEOUT !DELAY!,NOBREAK,NUL
    ) ELSE (
        CALL :TIMEOUT !DELAY!,BREAK
    )
    GOTO LIMIT_FILES
)
GOTO :EOF

:: --------------------------------------------------------------------------
:DEL_OLDEST_FILE dir,pattern
::    -- dir [in] - the directory in which the oldest file matching the given
::                  pattern will be deleted
::    -- pattern [in] - the file pattern
SETLOCAL
SET DELFILE=
SET MY_DIR=%1
SET MY_PATTERN=%2
SET MY_DIR_PATTERN="%MY_DIR:"=%\%MY_PATTERN%"
FOR /F "TOKENS=1* USEBACKQ" %%A IN (`DIR %MY_DIR_PATTERN% /A-D /O-D /B`) DO (
    SET DELFILE=%%A
    IF "%%B" NEQ "" (
        SET DELFILE=!DELFILE! %%B
    )
)
IF NOT DEFINED DELFILE ENDLOCAL & GOTO :EOF

SET DELFILE="%MY_DIR:"=%\%DELFILE%"
DEL /F /Q %DELFILE%
IF %ERRORLEVEL% EQU 0 (
    IF %QUIET% == N (
        ECHO Deleted %DELFILE%
    )
)

ENDLOCAL
GOTO :EOF

:: --------------------------------------------------------------------------
:TIMEOUT secs,nobreak[,show] -- Wait for secs seconds or keypress if !nobreak.
::    -- secs [in] - the amount of time, in seconds, to wait
::    -- nobreak [in] - allow keypress or not via NOBREAK or BREAK
::    -- show [in] - control whether we want to show output or not via NUL
IF %~1 EQU 0 GOTO :EOF

SETLOCAL
SET TMOCMD=TIMEOUT /T %1
IF %~2 == NOBREAK SET TMOCMD=!TMOCMD! /NOBREAK
IF "%~3" == "NUL" SET TMOCMD=!TMOCMD! ^> NUL
%TMOCMD%
ENDLOCAL
GOTO :EOF

:: --------------------------------------------------------------------------
:USAGE
ECHO.
ECHO   A batch file that allows you to limit the number of files in a directory or
ECHO   the total disk space consumed by those files, or both.  Optionally, you can
ECHO   specify a particular file pattern to match rather than the default, which is
ECHO   for all files.
ECHO.
ECHO   ^<^<^< WARNING ^>^>^> All files in excess of the maximum allowed WILL BE DELETED^^!
ECHO.
ECHO   Usage: %BAT% ^<-d directory^> [options] ... where options are:
ECHO.
ECHO     [-c ^<countlimit^>] [-s ^<sizelimit^>] [-p ^<pattern^>] [-r ^<secs^>] [-q] [-h]
ECHO.
ECHO     -d directory  The directory location of the files. (Required^^!)
ECHO     -c countlimit The maximum number of files allowed in the directory.
ECHO     -s sizelimit  The maximum size limit of the files in the directory.
ECHO     -p pattern    The file matching pattern. (Default is all files)
ECHO     -r secs       Run continuously with a specified delay between loops.
ECHO     -q            Run quietly.
ECHO     -h            Display this help and exit.
GOTO :EOF
