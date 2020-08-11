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
:: Dumpcap.bat batch file with optional capture event notification/trigger.
:: By Christopher Maynard <Christopher.Maynard@igt.com>
:: Copyright 2014-2016 Christopher Maynard
::
:: $Id: dumpcap.bat,v 1.78 2017/07/07 16:00:04 cmaynard Exp $
::
:: Usage: GOTO USAGE
::
:: Developed/tested on Microsoft Windows [Version 6.1.7601] (Windows 7 64-bit)
::
:: Lightly tested on:
::     Microsoft Windows [Version 6.3.9600] (Windows 8.1 64-bit)
::     Microsoft Windows [Version 5.1.2600] (Windows XP 32-bit)
::
:: Motivation:
::  Bug reports:
::      o https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2039
::      o https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3967
::      o https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4390
::
::  Questions:
::      o https://ask.wireshark.org/questions/1019/trigger-a-script
::      o https://ask.wireshark.org/questions/1709/automatically-start-capturing-packets-when-bandwidth-is-high
::      o https://ask.wireshark.org/questions/2049/trigger-a-capture
::      o https://ask.wireshark.org/questions/6585/triggers-for-wireshark
::      o https://ask.wireshark.org/questions/9682/trigger-an-executable-file-once-wireshark-finds-a-keyword-on-live-capture
::      o https://ask.wireshark.org/questions/26434/sound-alert
::      o https://ask.wireshark.org/questions/30118/email-function
::      o https://ask.wireshark.org/questions/39456/is-there-a-way-to-stop-capture-upon-http-error-404
::      o https://ask.wireshark.org/questions/40888/custom-stop-recording-trigger
::      o https://ask.wireshark.org/questions/48212/trigger-the-capture
::      o https://ask.wireshark.org/questions/51887/tshark-auto-stop-conditions-extended-functionality
::      o https://ask.wireshark.org/questions/60412/how-do-i-trigger-an-alert-on-specific-frame-captured-during-live-scan
::
::  Discussions:
::      o https://www.wireshark.org/lists/wireshark-dev/200804/msg00078.html
::      o https://www.wireshark.org/lists/wireshark-users/201004/msg00016.html
::      o https://www.wireshark.org/lists/wireshark-users/201205/msg00018.html
::
:: Original announcement of dumpcap.bat itself:
::      o https://www.wireshark.org/lists/wireshark-dev/201405/msg00118.html
::
::  Internal company inquiry:
::      "I have been trying to see if Wireshark has a similar capability as my
::      old Network General Sniffers.
::
::      On the Sniffer I am able to set up a trigger based on many different
::      requirements. The trigger I am using is based on bit patterns in two
::      locations of the packet. Once the trigger pattern is found the Sniffer
::      will then write some portion (in my case 50KB, and this is adjustable)
::      of the contents of the trace memory prior to and up to the trigger to a
::      file and then continue to capture. It will then continue this action
::      writing new files until stopped. The number of files retained can be
::      adjusted and once that number is reached it will delete the oldest file
::      to keep the number of files constant.
::
::      Is it possible to do this in Wireshark?"
::
:: Requires:
:: 1) dumpcap 1.10.0 (or later): http://www.wireshark.org/download.html
::    It *might* work with older versions, but use at your own risk.  Of note,
::    capture filter verification will not be available for dumpcap prior to
::    version 1.6.0.
:: 2) WMIC is only available on Windows XP Professional and Windows 2003 or
::    later versions of Windows.  You must have administrator rights to run
::    WMIC.
:: 3) mailsend 1.17b14: https://code.google.com/p/mailsend/
::    After downloading it, rename it mailsend.exe and either copy it to a
::    directory that is in your %PATH% or to the same directory in which this
::    batch file resides.
::
::    Notes:
::      Mailsend.exe is only needed if the user actually wants e-mail
::      notifications of capture events.  While this feature was one of the
::      primary motivating factors for writing this batch script, it's
::      technically not required, per se.  It does help satisfy Letts' Law
::      though: http://natpryce.com/articles/000749.html#letts
::
::      mailsend 1.17b15 does NOT work with this batch file.
::
:: 4) Handle.exe: http://technet.microsoft.com/en-us/sysinternals/bb896655.aspx
::    After downloading it, either copy it to a directory that is in your
::    %PATH% or to the same directory in which this batch file resides.
::
::    Notes:
::      Handle.exe is only needed if the user wants to attach a capture file to
::      the e-mail and either no capture file was specified so that we need to
::      find the name of the temporary file, or if the user has chosen to use a
::      ringbuffer with multiple files or autostop after <N> files, in which
::      case we'll also need to use this to find the name of the capture file.
::
::      Handle.exe prior to v4.0 can only be run from a command window that was
::      "Run as administrator".
::
:: 5) ping.exe (Windows XP only).
::
:: Files created:
:: 1) Temporarily, the __tmpcfg.bat batch file for setting the environment
::    variables.
:: 2) If no configuration file is specified on the command-line, a default
::    configuration file named dcdflts.cfg will be created.
:: 3) Previously, a temporary __tmpbpf.txt file was being created for parsing
::    "dumpcap.exe -d" output, but I've overcome the limitations of the bug
::    indicated in CHECK_FILTER by removing the problematic double-quote (")
::    characters from the filter expression, so this temporary file should no
::    longer be needed.
::
:: TODO list: (See also the various "TODO's" sprinkled within the batch file.)
:: 1) Properly handle all special characters.
:: 2) WMIC:
::    a) How to set the window title?
::    b) How to avoid opening a new window if not needed?
::    c) How to get the exit code (ERRORLEVEL) of a process started by WMIC?
::    d) How to start a process minimized, hidden or in the background?
:: 3) How to avoid prompting the user to "Terminate batch job (Y/N)? " after a
::      <CTRL-BREAK>?
:: 4) How to tell if the man page is already open to avoid opening multiple
::    instances of the same page?  (Is -m even worth it at all?)
:: 5) Should we support any other mailsend.exe options?  Such as:
::    -d, -ct, -cs, -enc, -H (other than the 2 already supported: importance
::    and sensitivity), -v, -auth-cram-md5, -auth-plain, -auth-login, -ehlo.
:: 6) Should we support any other dumpcap.exe options?  Such as:
::    -y <link type>, -k, -S, -M, RPCAP options (-r, -u, -A <user:password>,
::    -m <sampling type>), -g, -N <packet_limit>, -C <byte_limit>, -t, -q.
:: 7) Add multi-interface capture support as well as multi-interface event
::    support.
:: 8) If this batch file is read-only, the COPY /Z will fail and CR won't be
::    set.  For now, I try to force it to NOT be read only, but there's
::    probably a better way to fix/avoid this.
::
:: Special thanks:
::     A special thanks to Freddy Batista (Freddy.Batista@igt.com).  He found
::     mailsend, which got me started on this whole batch file to begin with.
::     He also found the safe history solution, assisted with line continuation
::     problems I was having, offered some ideas for improvements to the batch
::     file, such as being able to attach the capture file to the e-mail
::     notification, and he helped me test the batch file throughout much of
::     its development.  This batch file might not exist without his help.
::
::     Thanks also goes out to Vinod Richard for his involvement with testing
::     this batch file and helping to uncover a number of bugs that I was able
::     to fix before releasing it to a wider audience.
::
::     Finally, thanks to the Notepad++ team.  Notepad++ was the primary editor
::     used in writing this file.  The "Function List" feature in particular
::     was quite helpful to me.  http://notepad-plus-plus.org/contributors/
::
:: Disclaimer:
::     I hope you find this batch file useful and enjoy using it as much as I
::     detested writing it.  This basically sums up my experience with batch
::     scripting: http://xkcd.com/1349/
::
:: For Roland.
:: --------------------------------------------------------------------------
:: Basic Flowchart of the 4 operating modes of this batch file, namely:
::
::  1) Dumpcap only                     3) Trigger (i.e., Event+Dumpcap)
::  2) Dumpcap+Event                    4) Event only
::
::                                   (Start)
::                                      |
::                                   / Mode \
::                                   \  ?   /
::        Dumpcap             Event     |       Dumpcap+
::         only               only      |        Event            Trigger
::          +------------------+--------+---------+------------------+
::          |                  |                  |                  |
::     +----+----+             |             +----+----+         +---+---+
::     | dumpcap |             |             | dumpcap |         | Event |
::     +----+----+             |             +----+----+         +---+---+
::          |                  |                  |                  |
::          |                  +--------+---------+              +---+
::          |                           |                        |
::          |                       +---+---+             +------+-------+
::          |                       | Event |             | Event Action |
::          |                       +---+---+             +------+-------+
::          |                           |                        |
::   +------+-------+            +------+-------+           +-----+-----+
::   | Event Action |            | Event Action |           | mailsend* |
::   +------+-------+            +------+-------+           +-----+-----+
::          |                           |                        |
::    +-----+-----+               +-----+-----+             +----+----+
::    | mailsend* |               | mailsend* |             | dumpcap |
::    +-----+-----+               +-----+-----+             +----+----+
::          |                           |                        |
::          |                           +-----------+------------+
::          |                                       |
::          |                                   / Delay \
::          |                                   \   ?   /
::          |                          Yes          |           No
::          |                           +-----------+-----------+
::          |                           |                       |
::          |                       +---+---+                   |
::          |                       | Delay |                   |
::          |                       +---+---+                   |
::          |                           |                       |
::   +------+-------+            +------+-------+        +------+-------+
::   | Final Action |            | Final Action |        | Final Action |
::   +------+-------+            +------+-------+        +------+-------+
::          |                           |                       |
::          |                     +-----+-----+                 |
::          |                     | mailsend* |                 |
::          |                     +-----+-----+                 |
::          |                           |                       |
::          |                           +-----------+-----------+
::          |                                       |
::          |                                       |
::          +---------------------------+-----------+
::                                      |
::                                   (Done)
::
:: *mailsend is only called if it is enabled and mailsend.exe actually exists.
:: The eventaction.bat and finalaction.bat files are only called if they exist.
:: --------------------------------------------------------------------------

:: First things first, let's not pollute the history with user input.
:: This has the unfortunate side-effect of requiring the user to press 'Y'
:: twice after a <CTRL-C> for the 2 "Terminate batch job (Y/N)? " questions,
:: but the alternative is the polluted history, so pick your poison or figure
:: out how to avoid this some other way then delete the TODO #4 above.
IF "%~1" == "HISTORYSAFE" GOTO HISTORYSAFE

:: Clear the read-only attribute so the COPY /Z works and CR can be assigned.
ATTRIB -R "%~F0"

:: We can't just use %* in case there are quotes, so sanitize the options.
SET BAT=%~F0
SET DC_OPTS=
:REBUILD_CMDLINE
IF "%~1" == "" GOTO CALL_OURSELF
SET DC_OPTS=%DC_OPTS% %1
SHIFT
GOTO REBUILD_CMDLINE

:CALL_OURSELF
CMD /S /C ""%BAT%" HISTORYSAFE%DC_OPTS%"
SET DC_OPTS=
GOTO :EOF

:: --------------------------------------------------------------------------
:USAGE
ECHO.
ECHO   A command-line front-end for dumpcap.exe that allows you to store dumpcap.exe
ECHO   settings, be notified of capture events or trigger dumpcap.exe capturing
ECHO   after a capture event occurs.  It also provides hooks for performing custom
ECHO   actions through user-defined batch files.
ECHO.
ECHO   Usage: %BAT% [options] ... where options are:
ECHO.
ECHO     [file.cfg] [-d] [-e ^<file.bat^>] [-f ^<file.bat^>] [-h] [-i] [-m] [-p ^<pid^>]
ECHO     [-s]
ECHO.
ECHO     file.cfg    An optional configuration file.  If no configuration file is
ECHO                 specified, the default file will be used, if found.
ECHO     -d          Delete any Wireshark-related left-over temporary files.
ECHO     -e file.bat User-defined event action batch file. (Default=eventaction.bat)
ECHO     -f file.bat User-defined final action batch file. (Default=finalaction.bat)
ECHO     -h          Display this help and exit.
ECHO     -i          Hide the list of available interfaces.
ECHO     -m          Launch the default browser to display the dumpcap manpage.
ECHO     -p pid      If running in "Event only" mode, the explicit process ID of the
ECHO                 related dumpcap.exe capturing instance, if applicable.  If the
ECHO                 process ID is not specified, then an attempt will be made to
ECHO                 determine the process ID once the event has occurred, but this
ECHO                 will fail if there is more than 1 dumpcap.exe instance
ECHO                 running, and in this case, you risk killing all dumpcap.exe
ECHO                 instances after the event has occurred.
ECHO     -s          Automatically start dumpcap using the configuration options
ECHO                 from the file specified or from the default configuration
ECHO                 options.
GOTO :EOF

:: --------------------------------------------------------------------------
:HISTORYSAFE
REM SET > SETBEGIN.TXT
SET BAT=%~NX0
SHIFT

:: Just in case, clear away any leftover breadcrumbs from prior runs.
CALL :CLEAR_ENV

SETLOCAL
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

SET DC_VER=$Id: dumpcap.bat,v 1.78 2017/07/07 16:00:04 cmaynard Exp $
SET AUTOSTART=N
SET DC_ENVFILE=""
SET DISPLAY_IFACES=Y
SET DC_PID=
VER | FIND "5.1" > NUL
IF %ERRORLEVEL% == 0 (SET WIN_XP=Y) ELSE (SET WIN_XP=N)

:LOCATE_MAILSEND
:: Look in the current directory first so we can even run mailsend.exe from a
:: USB flash drive, for example, without necessarily having to add its location
:: to the %PATH%.
SET MAILSEND="%CD%\mailsend.exe"
IF EXIST %MAILSEND% GOTO LOCATE_DUMPCAP
:: Try to use mailsend from the PATH so it doesn't matter where it's installed.
CALL :GETPATH MAILSEND,mailsend.exe
IF DEFINED MAILSEND (
    SET MAILSEND="%MAILSEND%"
    GOTO LOCATE_DUMPCAP
)
SET MAILSEND=

:LOCATE_DUMPCAP
:: Look in the current directory first so we can even run dumpcap.exe from a
:: USB flash drive, for example, without necessarily having to add its location
:: to the %PATH%.
SET DUMPCAP="%CD%\dumpcap.exe"
IF EXIST %DUMPCAP% GOTO GET_DUMPCAP_VER

:: Try to use dumpcap from the PATH so it doesn't matter where it's installed.
CALL :GETPATH DUMPCAP,dumpcap.exe
SET DUMPCAP="%DUMPCAP%"
IF %DUMPCAP% NEQ "" GOTO GET_DUMPCAP_VER

:: Dumpcap not found in the PATH.  Try the usual places:
SET DUMPCAP="%PROGRAMFILES%\Wireshark\dumpcap.exe"
IF EXIST %DUMPCAP% GOTO GET_DUMPCAP_VER
SET DUMPCAP="%PROGRAMFILES(X86)%\Wireshark\dumpcap.exe"
IF EXIST %DUMPCAP% GOTO GET_DUMPCAP_VER
ECHO ERROR^^!  Dumpcap.exe not found.  Aborting.
GOTO :EOF

:GET_DUMPCAP_VER
:: Get the dumpcap version
FOR /F "TOKENS=1,2 USEBACKQ DELIMS= " %%A IN (`%DUMPCAP% -v`) DO (
    IF "%%A" == "Dumpcap" SET DUMPCAP_EXE_VER=%%A %%B
)

:PARSE_OPTS
IF "%~1" == "" GOTO SETCFGFILE

IF "%~1" == "-?" GOTO USAGE
IF /I "%~1" == "-h" GOTO USAGE
IF /I "%~1" == "--help" GOTO USAGE

IF /I "%~1" == "-d" (
    CALL :DELETE_TEMP_FILES
    GOTO NEXT_OPT
)
IF /I "%~1" == "-e" GOTO READ_EVENT_BAT
IF /I "%~1" == "-f" GOTO READ_FINAL_BAT

IF /I "%~1" == "-i" (SET DISPLAY_IFACES=N & GOTO NEXT_OPT)
IF /I "%~1" == "-m" (
    CALL :GETDRIVEANDPATH TMPVAL,%DUMPCAP%
    IF EXIST "!TMPVAL!dumpcap.html" (
        START "" "file:///!TMPVAL!dumpcap.html"
    ) ELSE (
        START "" "http://www.wireshark.org/docs/man-pages/dumpcap.html"
    )
    GOTO NEXT_OPT
)
IF /I "%~1" == "-p" GOTO READ_PID
IF /I "%~1" == "-s" (SET AUTOSTART=Y & GOTO NEXT_OPT)

ECHO %~1|FINDSTR /R "^-" > NUL
IF %ERRORLEVEL% EQU 0 (
    ECHO ERROR^^!  Unknown option: %1
    GOTO USAGE
)

:: This should never happen, but ...
IF /I "%~1" == "HISTORYSAFE" (GOTO NEXT_OPT)

SET DC_ENVFILE=%DC_ENVFILE:"=%
SET DC_ENVFILE="%DC_ENVFILE%"
IF %DC_ENVFILE% NEQ "" (
    ECHO ERROR^^!  Only 1 configuration file can be specified.
    GOTO USAGE
)
CALL :GETFILE TMPVAL,"%~1"
IF DEFINED TMPVAL SET DC_ENVFILE=%~1
GOTO NEXT_OPT

:: --------------------------------------------------------------------------
:READ_PID
SHIFT
SET DC_PID=%~1
IF "%DC_PID%" == "" (
    ECHO ERROR^^!  No PID specified.
    GOTO USAGE
)
ECHO %DC_PID%|FINDSTR /XR "[1-9][0-9]*$" > NUL
IF %ERRORLEVEL% NEQ 0 (
    ECHO ERROR^^!  Invalid PID specified.
    GOTO USAGE
)
CALL :GETPROCESS TMPVAL,%DC_PID%
IF /I "%TMPVAL%" NEQ "DUMPCAP.EXE" (
    ECHO ERROR^^!  This PID does not correspond to a dumpcap.exe process.
    ECHO        You can find the PID by running:
    ECHO.
    ECHO            TASKLIST /FI "IMAGENAME EQ DUMPCAP.EXE"
    GOTO USAGE
)
GOTO NEXT_OPT

:: --------------------------------------------------------------------------
:READ_EVENT_BAT
SHIFT
SET EVENTBAT=%~1
IF "%EVENTBAT%" == "" (
    ECHO ERROR^^!  Missing file argument to -e.
    GOTO USAGE
)
SET EVENTBAT=%EVENTBAT:"=%
SET EVENTBAT="%EVENTBAT%"
IF NOT EXIST %EVENTBAT% (
    ECHO ERROR^^!  The event action batch file specified does not exist.
    GOTO USAGE
)
CALL :GETEXT EXT,%EVENTBAT%
IF /I "%EXT%" NEQ ".bat" (
    ECHO ERROR^^!  The file argument to -e must be a batch file.
    GOTO USAGE
)
GOTO NEXT_OPT

:: --------------------------------------------------------------------------
:READ_FINAL_BAT
SHIFT
SET FINALBAT=%~1
IF "%FINALBAT%" == "" (
    ECHO ERROR^^!  Missing file argument to -f.
    GOTO USAGE
)
SET FINALBAT=%FINALBAT:"=%
SET FINALBAT="%FINALBAT%"
IF NOT EXIST %FINALBAT% (
    ECHO ERROR^^!  The final action batch file specified does not exist.
    GOTO USAGE
)
CALL :GETEXT EXT,%FINALBAT%
IF /I "!EXT!" NEQ ".bat" (
    ECHO ERROR^^!  The file argument to -f must be a batch file.
    GOTO USAGE
)
GOTO NEXT_OPT

:: --------------------------------------------------------------------------
:NEXT_OPT
SHIFT
GOTO PARSE_OPTS

:: --------------------------------------------------------------------------
:DELETE_TEMP_FILES
DEL /F /Q "%TEMP%\follow*"
DEL /F /Q "%TEMP%\import*"
DEL /F /Q "%TEMP%\wireshark*"
DEL /F /Q "%TEMP%\wshprint*"
FOR /D %%A IN ("%TEMP%\Wireshark*") DO RMDIR /S /Q "%%~A"
GOTO :EOF

:: --------------------------------------------------------------------------
:SETCFGFILE
SET DC_ENVFILE=%DC_ENVFILE:"=%
SET DC_ENVFILE="%DC_ENVFILE%"
IF %DC_ENVFILE% == "" (
    SET DC_ENVFILE="dcdflts.cfg"
) ELSE (
    SET TMPVAL=
    CALL :GETDRIVEANDPATH TMPVAL,%DC_ENVFILE%
    IF NOT EXIST !TMPVAL! (
        SET DC_ENVFILE="dcdflts.cfg"
        ECHO Warning^^!  The specified configuration file is invalid: %DC_ENVFILE%.
        ECHO           Using default configuration file instead: "!DC_ENVFILE!".
        CALL :TIMEOUT 4,NOBREAK,NUL
    )
)

REM Keep configuration file(s) in the same directory as the batch file?
REM PUSHD "%~DP0"
IF NOT EXIST %DC_ENVFILE% GOTO SETDEFAULTOPTS
COPY /Y %DC_ENVFILE% __tmpcfg.bat > NUL
CALL __tmpcfg.bat
DEL __tmpcfg.bat

:SETDEFAULTOPTS
REM POPD
IF NOT DEFINED EVENTBAT SET EVENTBAT="eventaction.bat"
IF NOT DEFINED FINALBAT SET FINALBAT="finalaction.bat"

IF NOT DEFINED DC_PRIORITY SET DC_PRIORITY=NORMAL
IF NOT DEFINED DC_MODE SET DC_MODE=Dumpcap only

:: Dumpcap settings:
IF NOT DEFINED DC_INTERFACE SET DC_INTERFACE=1
REM IF NOT DEFINED DC_CAPFILE SET DC_CAPFILE=
REM IF NOT DEFINED DC_CAPFILTER SET DC_CAPFILTER=
REM IF NOT DEFINED DC_SNAPLEN SET DC_SNAPLEN=
IF NOT DEFINED DC_PROMISC SET DC_PROMISC=Y
REM IF NOT DEFINED DC_BUFSIZE SET DC_BUFSIZE=
IF NOT DEFINED DC_PCAPNG SET DC_PCAPNG=Y

:: Autostop conditions:
REM IF NOT DEFINED DC_MAXPACKETS SET DC_MAXPACKETS=
REM IF NOT DEFINED DC_MAXTIME SET DC_MAXTIME=
REM IF NOT DEFINED DC_MAXSIZE SET DC_MAXSIZE=
REM IF NOT DEFINED DC_MAXFILES SET DC_MAXFILES=

:: Ringbuffer settings:
REM IF NOT DEFINED DC_RINGTIME SET DC_RINGTIME=
REM IF NOT DEFINED DC_RINGSIZE SET DC_RINGSIZE=
REM IF NOT DEFINED DC_RINGFILES SET DC_RINGFILES=

:: Capture event settings:
REM IF NOT DEFINED DC_EV_INTERFACE SET DC_EV_INTERFACE=
REM IF NOT DEFINED DC_EV_CAPFILTER SET DC_EV_CAPFILTER=
IF NOT DEFINED DC_EV_COUNT SET DC_EV_COUNT=1
IF NOT DEFINED DC_EV_KILL SET DC_EV_KILL=N
IF NOT DEFINED DC_EV_DELAY SET DC_EV_DELAY=0

:: Mailsend settings:
IF NOT DEFINED MS SET MS=N
IF NOT DEFINED MS_SMTP_SERVER SET MS_SMTP_SERVER=mail.domain
IF NOT DEFINED MS_SMTP_PORT SET MS_SMTP_PORT=25
IF NOT DEFINED MS_SENDTO SET MS_SENDTO=user@domain
REM IF NOT DEFINED MS_CC SET MS_CC=
REM IF NOT DEFINED MS_BCC SET MS_BCC=
REM IF NOT DEFINED MS_RRR SET MS_RRR=
REM IF NOT DEFINED MS_FROM_NAME SET MS_FROM_NAME=
REM IF NOT DEFINED MS_FROM SET MS_FROM=
REM IF NOT DEFINED MS_REPLYTO SET MS_REPLYTO=
REM IF NOT DEFINED MS_IMPORTANCE SET MS_IMPORTANCE=
REM IF NOT DEFINED MS_SENSITIVITY SET MS_SENSITIVITY=
REM IF NOT DEFINED MS_SECURITY SET MS_SECURITY=
REM IF NOT DEFINED MS_USER SET MS_USER=
:: NOTE: This batch file is not dealing with passwords at all.  If you need to
::       specify a password in order to send e-mail, set it via the
::       SMTP_USER_PASS environment variable.
IF NOT DEFINED SMTP_USER_PASS SET MS_SECURITY=
IF NOT DEFINED MS_USER (
    IF NOT DEFINED USERNAME (
        SET MS_SECURITY=
    )
)
IF NOT DEFINED MS_ATTACH SET MS_ATTACH=N
REM IF NOT DEFINED MS_MAXATTACH SET MS_MAXATTACH=
GOTO ENUMERATE_IFACES

:: --------------------------------------------------------------------------
:CLEAR_ENV
SET DC_PRIORITY=
SET DC_MODE=

:: Dumpcap settings:
SET DC_INTERFACE=
SET DC_CAPFILE=
SET DC_CAPFILTER=
SET DC_SNAPLEN=
SET DC_PROMISC=
SET DC_BUFSIZE=
SET DC_PCAPNG=

:: Stop conditions:
SET DC_MAXPACKETS=
SET DC_MAXTIME=
SET DC_MAXSIZE=
SET DC_MAXFILES=

:: Ringbuffer settings:
SET DC_RINGTIME=
SET DC_RINGSIZE=
SET DC_RINGFILES=

:: Capture event settings:
SET DC_EV_INTERFACE=
SET DC_EV_CAPFILTER=
SET DC_EV_COUNT=
SET DC_EV_KILL=
SET DC_EV_DELAY=

:: Mailsend settings:
SET MS=
SET MS_SMTP_SERVER=
SET MS_SMTP_PORT=
SET MS_SENDTO=
SET MS_CC=
SET MS_BCC=
SET MS_RRR=
SET MS_FROM_NAME=
SET MS_FROM=
SET MS_REPLYTO=
SET MS_IMPORTANCE=
SET MS_SENSITIVITY=
SET MS_SECURITY=
SET MS_USER=
SET MS_ATTACH=
SET MS_MAXATTACH=
GOTO :EOF

:: --------------------------------------------------------------------------
:SAVEOPTS
SETLOCAL
REM Keep configuration file(s) in the same directory as the batch file?
REM PUSHD "%~DP0"
ECHO > %DC_ENVFILE% @ECHO OFF
ECHO >> %DC_ENVFILE% :: Dumpcap options created: %DATE%, %TIME%
ECHO. >> %DC_ENVFILE%
ECHO >> %DC_ENVFILE% SET DC_PRIORITY=%DC_PRIORITY%
ECHO >> %DC_ENVFILE% SET DC_MODE=%DC_MODE%
ECHO. >> %DC_ENVFILE%
ECHO >> %DC_ENVFILE% :: Capture options:
ECHO >> %DC_ENVFILE% SET DC_INTERFACE=%DC_INTERFACE%

IF NOT DEFINED DC_CAPFILE (
    ECHO >> %DC_ENVFILE% SET "DC_CAPFILE="
    GOTO SAVECAPFILTER
)
SETLOCAL DISABLEDELAYEDEXPANSION
SET "TMPVAR=%DC_CAPFILE:^=^^%"
SET "TMPVAR=%TMPVAR:!=^!%"
SETLOCAL ENABLEDELAYEDEXPANSION
SET "TMPVAR=!TMPVAR:%%=%%%%!"
ECHO >> %DC_ENVFILE% SET "DC_CAPFILE=!TMPVAR!"

:SAVECAPFILTER
SETLOCAL DISABLEDELAYEDEXPANSION
SET "TMPVAR=%DC_CAPFILTER:!=^!%"
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO >> %DC_ENVFILE% SET "DC_CAPFILTER=!TMPVAR!"

ECHO >> %DC_ENVFILE% SET DC_SNAPLEN=%DC_SNAPLEN%
ECHO >> %DC_ENVFILE% SET DC_PROMISC=%DC_PROMISC%
ECHO >> %DC_ENVFILE% SET DC_BUFSIZE=%DC_BUFSIZE%
ECHO >> %DC_ENVFILE% SET DC_PCAPNG=%DC_PCAPNG%
ECHO. >> %DC_ENVFILE%
ECHO >> %DC_ENVFILE% :: Autostop conditions:
ECHO >> %DC_ENVFILE% SET DC_MAXPACKETS=%DC_MAXPACKETS%
ECHO >> %DC_ENVFILE% SET DC_MAXTIME=%DC_MAXTIME%
ECHO >> %DC_ENVFILE% SET DC_MAXSIZE=%DC_MAXSIZE%
ECHO >> %DC_ENVFILE% SET DC_MAXFILES=%DC_MAXFILES%
ECHO. >> %DC_ENVFILE%
ECHO >> %DC_ENVFILE% :: Ringbuffer settings:
ECHO >> %DC_ENVFILE% SET DC_RINGTIME=%DC_RINGTIME%
ECHO >> %DC_ENVFILE% SET DC_RINGSIZE=%DC_RINGSIZE%
ECHO >> %DC_ENVFILE% SET DC_RINGFILES=%DC_RINGFILES%
ECHO. >> %DC_ENVFILE%
ECHO >> %DC_ENVFILE% :: Capture event settings:
ECHO >> %DC_ENVFILE% SET DC_EV_INTERFACE=%DC_EV_INTERFACE%

SETLOCAL DISABLEDELAYEDEXPANSION
SET "TMPVAR=%DC_EV_CAPFILTER:!=^!%"
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO >> %DC_ENVFILE% SET "DC_EV_CAPFILTER=!TMPVAR!"

ECHO >> %DC_ENVFILE% SET DC_EV_COUNT=%DC_EV_COUNT%
ECHO >> %DC_ENVFILE% SET DC_EV_KILL=%DC_EV_KILL%
ECHO >> %DC_ENVFILE% SET DC_EV_DELAY=%DC_EV_DELAY%
ECHO. >> %DC_ENVFILE%
ECHO >> %DC_ENVFILE% :: Mailsend-specific settings:
ECHO >> %DC_ENVFILE% SET MS=%MS%
ECHO >> %DC_ENVFILE% SET MS_SMTP_SERVER=%MS_SMTP_SERVER%
ECHO >> %DC_ENVFILE% SET MS_SMTP_PORT=%MS_SMTP_PORT%
ECHO >> %DC_ENVFILE% SET MS_SENDTO=%MS_SENDTO%
ECHO >> %DC_ENVFILE% SET MS_CC=%MS_CC%
ECHO >> %DC_ENVFILE% SET MS_BCC=%MS_BCC%
ECHO >> %DC_ENVFILE% SET MS_RRR=%MS_RRR%
ECHO >> %DC_ENVFILE% SET MS_FROM_NAME=%MS_FROM_NAME%
ECHO >> %DC_ENVFILE% SET MS_FROM=%MS_FROM%
ECHO >> %DC_ENVFILE% SET MS_REPLYTO=%MS_REPLYTO%
ECHO >> %DC_ENVFILE% SET MS_IMPORTANCE=%MS_IMPORTANCE%
ECHO >> %DC_ENVFILE% SET MS_SENSITIVITY=%MS_SENSITIVITY%
ECHO >> %DC_ENVFILE% SET MS_SECURITY=%MS_SECURITY%

IF NOT DEFINED MS_USER (
    ECHO >> %DC_ENVFILE% SET "MS_USER="
    GOTO SAVEATTACH
)
SETLOCAL DISABLEDELAYEDEXPANSION
SET "TMPVAR=%MS_USER:^=^^%"
SET "TMPVAR=%TMPVAR:!=^!%"
SETLOCAL ENABLEDELAYEDEXPANSION
SET "TMPVAR=!TMPVAR:%%=%%%%!"
ECHO >> %DC_ENVFILE% SET "MS_USER=!TMPVAR!"

:SAVEATTACH
ECHO >> %DC_ENVFILE% SET MS_ATTACH=%MS_ATTACH%
ECHO >> %DC_ENVFILE% SET MS_MAXATTACH=%MS_MAXATTACH%
REM Keep configuration file(s) in the same directory as the batch file?
REM POPD
ENDLOCAL
ECHO Configuration saved to %DC_ENVFILE%.
GOTO :EOF

:: --------------------------------------------------------------------------
:ENUMERATE_IFACES
IF %AUTOSTART% == Y SET DISPLAY_IFACES=N
IF %DISPLAY_IFACES% == Y GOTO BEGIN
SET DC_IFACES=0
FOR /F "USEBACKQ DELIMS=" %%I IN (`%DUMPCAP% -D`) DO (
    SET /A DC_IFACES=!DC_IFACES! + 1
)

:: --------------------------------------------------------------------------
:BEGIN
IF %AUTOSTART% == N CLS

IF %DISPLAY_IFACES% == N GOTO MENU
:: Display the interfaces, nicely formatted for interfaces with IPv4 address.
:: The current formatting will only retain alignment for up to 9 interfaces.
:: NOTE: Because of the possibility of IPv6 or both IPv6 and IPv4 addresses
::       being assigned to an interface, I'm grabbing the *LAST* 15 characters
::       of the IP address field, rather than the first 15 characters, as this
::       seems to be the placement location of the IPv4 address.
:: NOTE: The delimiter used below is a <TAB> character, NOT spaces.
::       Do not convert the <TAB> to spaces!
ECHO ---------------------------[ AVAILABLE INTERFACES ]----------------------------
SET DC_IFACES=0
FOR /F "TOKENS=2,3,5 USEBACKQ DELIMS=	" %%A IN (`%DUMPCAP% -DM`) DO (
    SET /A DC_IFACES=!DC_IFACES! + 1
    SET "IP=               %%C"
    SET IP=!IP:~-15!
    SET "IP=!IP: =!"
    SET "IP=!IP!               "
    SET IP=!IP:~0,15!
    SET TMPSTR=!DC_IFACES!^) !IP! ^| %%A %%B
    SET TMPSTR=!TMPSTR:~0,79!
    ECHO !TMPSTR!
)

:: The main menu
:MENU
IF %DC_INTERFACE% GTR %DC_IFACES% (
    ECHO.
    ECHO The previously selected interface, %DC_INTERFACE%, is now invalid.
    IF %AUTOSTART% == Y (
        ECHO Fatal error - aborting.
        GOTO :EOF
    )
    IF %DC_IFACES% EQU 0 (
        SET DC_INTERFACE=0
        SET DC_EV_INTERFACE=
    ) ELSE (
        SET DC_INTERFACE=1
        SET DC_EV_INTERFACE=
    )
    ECHO It has been changed to !DC_INTERFACE!.  This may not be the interface you want.
    PAUSE
)
IF %DC_IFACES% EQU 0 (
    SET DC_INTERFACE=0
    SET DC_EV_INTERFACE=
)
IF %AUTOSTART% == Y GOTO CHOICE_START
::            1         2         3         4         5         6         7         8
::   12345678901234567890123456789012345678901234567890123456789012345678901234567890
ECHO -----------------------------------[ FILES ]-----------------------------------
ECHO Configuration file            %DC_ENVFILE%
ECHO Event action batch file       %EVENTBAT%
ECHO Final action batch file       %FINALBAT%
ECHO -------------------------------------------------------------------------------
IF /I %DC_PRIORITY% == REALTIME (
    ECHO 1^) Dumpcap runtime priority   %DC_PRIORITY% (admin only; otherwise HIGH^)
) ELSE (
    ECHO 1^) Dumpcap runtime priority   %DC_PRIORITY%
)
ECHO 2) Dumpcap Mode               %DC_MODE%
IF "%DC_MODE%" == "Event only" GOTO MENU_EVENT
ECHO ------------------------------[ DUMPCAP OPTIONS ]------------------------------
ECHO 3) Interface                  %DC_INTERFACE%
IF NOT DEFINED DC_CAPFILE (
    ECHO 4^) Capture file
) ELSE (
    IF %DC_PCAPNG% == Y (
        ECHO 4^) Capture file               !DC_CAPFILE!.pcapng
    ) ELSE (
        ECHO 4^) Capture file               !DC_CAPFILE!.pcap
    )
)
ECHO 5) Capture filter             !DC_CAPFILTER!
IF NOT DEFINED DC_SNAPLEN (
    ECHO 6^) Snaplen                    Use default value
) ELSE (
    ECHO 6^) Snaplen                    %DC_SNAPLEN% bytes
)
ECHO 7) Promiscuous mode?          %DC_PROMISC%
IF NOT DEFINED DC_BUFSIZE (
    ECHO 8^) Buffer size                Use default value
) ELSE (
    ECHO 8^) Buffer size                %DC_BUFSIZE% MiB
)
ECHO 9) Use pcapng format?         %DC_PCAPNG%
ECHO.
ECHO     Autostop conditions:
IF NOT DEFINED DC_MAXPACKETS (
    ECHO 10^) Stop after                ^<infinite^> packets
) ELSE (
    ECHO 10^) Stop after                %DC_MAXPACKETS% packets
)
IF NOT DEFINED DC_MAXTIME (
    ECHO 11^) Stop after                ^<infinite^> seconds
) ELSE (
    ECHO 11^) Stop after                %DC_MAXTIME% seconds
)
IF NOT DEFINED DC_MAXSIZE (
    ECHO 12^) Stop after                ^<infinite^> kB
) ELSE (
    ECHO 12^) Stop after                %DC_MAXSIZE% kB
)
IF NOT DEFINED DC_MAXFILES (
    ECHO 13^) Stop after                ^<infinite^> files
) ELSE (
    ECHO 13^) Stop after                %DC_MAXFILES% files
)
ECHO.
ECHO     Ringbuffer settings:
IF NOT DEFINED DC_RINGTIME (
    ECHO 14^) Switch files after        ^<infinite^> seconds
) ELSE (
    ECHO 14^) Switch files after        %DC_RINGTIME% seconds
)
IF NOT DEFINED DC_RINGSIZE (
    ECHO 15^) Switch files after        ^<infinite^> kB
) ELSE (
    ECHO 15^) Switch files after        %DC_RINGSIZE% kB
)
IF NOT DEFINED DC_RINGFILES (
    ECHO 16^) Ringbuffer max files      ^<infinite^> files
) ELSE (
    ECHO 16^) Ringbuffer max files      %DC_RINGFILES% files
)
:MENU_EVENT
IF "%DC_MODE%" == "Dumpcap only" GOTO MENU_MAILSEND
ECHO ---------------------------[ CAPTURE EVENT OPTIONS ]---------------------------
IF DEFINED DC_EV_INTERFACE (
    ECHO 17^) Event Interface           %DC_EV_INTERFACE%
) ELSE (
    ECHO 17^) Event Interface           %DC_INTERFACE% (Same as capture interface^)
)
ECHO 18) Event capture filter      !DC_EV_CAPFILTER!
ECHO 19) Event count               %DC_EV_COUNT%
IF "%DC_MODE%" == "Event only"  (
    IF %DC_EV_KILL% == N (
        ECHO 20^) Event kills dumpcap?      %DC_EV_KILL%
    ) ELSE (
        IF NOT DEFINED DC_PID (
            ECHO 20^) Event kills dumpcap?      %DC_EV_KILL% ^(PID = unspecified^)
        ) ELSE (
            ECHO 20^) Event kills dumpcap?      %DC_EV_KILL% ^(PID = %DC_PID%^)
        )
    )
) ELSE (
    ECHO 20^) Event kills dumpcap?      %DC_EV_KILL%
)
IF %DC_EV_DELAY% EQU -1 (
    ECHO 21^) Delay before kill/action  Wait indefinitely for keypress
) ELSE (
    ECHO 21^) Delay before kill/action  %DC_EV_DELAY% seconds
)

:MENU_MAILSEND
ECHO -----------------------------[ MAILSEND OPTIONS ]------------------------------
IF NOT DEFINED MAILSEND (
    ECHO Mailsend.exe was not found; e-mail notifications will not be possible.  If you
    ECHO want e-mail notifications, you need to download mailsend v1.17b14 ^(or later^)
    ECHO from https://code.google.com/p/mailsend/ then rename it as mailsend.exe and
    ECHO save it somewhere in your PATH or in the same directory as this batch file.
    GOTO MENU_END
)
ECHO 22) Mailsend enabled?         %MS%
IF /I "%MS%" NEQ "Y" GOTO MENU_END
ECHO 23) SMTP server               %MS_SMTP_SERVER%
ECHO 24) SMTP port                 %MS_SMTP_PORT%
ECHO 25) Sendto address(es)        !MS_SENDTO!
ECHO 26) Cc address(es)            !MS_CC!
ECHO 27) Bcc address(es)           !MS_BCC!
ECHO 28) Read receipt address      !MS_RRR!
ECHO 29) From name                 %MS_FROM_NAME%
IF NOT DEFINED MS_FROM (
    ECHO 30^) From address              !USERNAME!@!COMPUTERNAME!.!USERDNSDOMAIN!
) ELSE (
    ECHO 30^) From address              !MS_FROM!
)
IF NOT DEFINED MS_REPLYTO (
    IF NOT DEFINED MS_FROM (
        ECHO 31^) Replyto address           !MS_SENDTO!
    ) ELSE (
        ECHO 31^) Replyto address           !MS_FROM!
    )
) ELSE (
    ECHO 31^) Replyto address           !MS_REPLYTO!
)
ECHO 32) E-mail importance         %MS_IMPORTANCE%
ECHO 33) E-mail sensitivity        %MS_SENSITIVITY%
IF NOT DEFINED MS_SECURITY (
    ECHO 34^) Security                  -- none --
) ELSE (
    ECHO 34^) Security                  %MS_SECURITY%
)
IF NOT DEFINED MS_USER (
    ECHO     35^) Username              !USERNAME!
    REM ECHO     35^) Username              !USERNAME! ^(%%USERNAME%%^)
    REM ECHO     35^) Username ^(%%USERNAME%%^) !USERNAME!
) ELSE (
    ECHO     35^) Username              !MS_USER!
)
IF NOT DEFINED SMTP_USER_PASS (
    ECHO         Password              -- SMTP_USER_PASS is not set --
) ELSE (
    ECHO         Password              **********
)
ECHO 36) Attach capture file?      %MS_ATTACH%
IF NOT DEFINED MS_MAXATTACH (
    ECHO     37^) Attach size limit     No limit
) ELSE (
    ECHO     37^) Attach size limit     %MS_MAXATTACH% kB
)
:MENU_END
ECHO -------------------------------------------------------------------------------
ECHO.
IF NOT DEFINED MAILSEND (
    IF "%DC_MODE%" == "Dumpcap only" (
        SET MAX_CHOICE=16
    ) ELSE (
        SET MAX_CHOICE=21
    )
) ELSE (
    IF /I "%MS%" NEQ "Y" (
        SET MAX_CHOICE=22
    ) ELSE (
        SET MAX_CHOICE=37
    )
)

:: Get the user input
SET TMPCHOICE=
SET /P TMPCHOICE="Enter choice (1-%MAX_CHOICE%, S: Save & Start, X: save & eXit, Q: Quit w/out saving): "
IF NOT DEFINED TMPCHOICE GOTO BEGIN
CALL :SANITIZE_INPUT TMPCHOICE

IF /I [!TMPCHOICE!] == [S] GOTO CHOICE_START
IF /I [!TMPCHOICE!] == [X] GOTO CHOICE_SAVE
IF /I [!TMPCHOICE!] == [Q] GOTO CHOICE_QUIT
SET /A TMPCHOICE=TMPCHOICE

IF "%DC_MODE%" == "Event only" (
    IF %TMPCHOICE% GEQ 3 (
        IF %TMPCHOICE% LEQ 16 (
            ECHO You entered an invalid choice^^!
            CALL :TIMEOUT 2,NOBREAK,NUL
            GOTO BEGIN
        )
    )
)
IF "%DC_MODE%" == "Dumpcap only" (
    IF %TMPCHOICE% GEQ 17 (
        IF %TMPCHOICE% LEQ 21 (
            ECHO You entered an invalid choice^^!
            CALL :TIMEOUT 2,NOBREAK,NUL
            GOTO BEGIN
        )
    )
)

IF %TMPCHOICE% GEQ 1 (
    IF %TMPCHOICE% LEQ %MAX_CHOICE% GOTO CHOICE_%TMPCHOICE%
)
ECHO You entered an invalid choice^^!
CALL :TIMEOUT 2,NOBREAK,NUL
GOTO BEGIN

:: 1) Dumpcap.exe priority:
:CHOICE_1
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"Priority (1=Low,2=Below Normal,3=Normal,4=Above Normal,5=High,6=Realtime): ",1,6
IF NOT DEFINED TMPVAL (
    ENDLOCAL
    GOTO BEGIN
)
IF !TMPVAL! EQU 6 ENDLOCAL & SET DC_PRIORITY=REALTIME
IF !TMPVAL! EQU 5 ENDLOCAL & SET DC_PRIORITY=HIGH
IF !TMPVAL! EQU 4 ENDLOCAL & SET DC_PRIORITY=ABOVENORMAL
IF !TMPVAL! EQU 3 ENDLOCAL & SET DC_PRIORITY=NORMAL
IF !TMPVAL! EQU 2 ENDLOCAL & SET DC_PRIORITY=BELOWNORMAL
IF !TMPVAL! EQU 1 ENDLOCAL & SET DC_PRIORITY=LOW
GOTO BEGIN

:: 2) Dumpcap Mode:
:CHOICE_2
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"Mode (1=Dumpcap only, 2=Dumpcap+Event, 3=Trigger, 4=Event only): ",1,4
IF NOT DEFINED TMPVAL (
    ENDLOCAL
    GOTO BEGIN
)
IF !TMPVAL! EQU 1 ENDLOCAL & SET DC_MODE=Dumpcap only
IF !TMPVAL! EQU 2 ENDLOCAL & SET DC_MODE=Dumpcap+Event
IF !TMPVAL! EQU 3 ENDLOCAL & SET DC_MODE=Trigger
IF !TMPVAL! EQU 4 ENDLOCAL & SET DC_MODE=Event only
GOTO BEGIN

:: ---------------------------------------------------------------------------
:: ----------------------------- DUMPCAP OPTIONS -----------------------------
:: ---------------------------------------------------------------------------
:: 3) Interface:
:CHOICE_3
SETLOCAL
SET TMPVAL=
IF %DC_IFACES% EQU 0 (
    ENDLOCAL & SET DC_INTERFACE=0
    GOTO BEGIN
)
IF %DC_IFACES% EQU 1 (
    ENDLOCAL & SET DC_INTERFACE=1
    GOTO BEGIN
)
CALL :GET_NUMERIC TMPVAL,"Interface Number (1-%DC_IFACES%): ",1,%DC_IFACES%
IF DEFINED TMPVAL (
    ENDLOCAL & SET DC_INTERFACE=%TMPVAL%
    GOTO BEGIN
)
ENDLOCAL
GOTO BEGIN

:: 4) Capture File:
:CHOICE_4
SET TMPCHOICE=
SET /P TMPCHOICE="Capture File (omit extension): "
IF NOT DEFINED TMPCHOICE (
    SET DC_CAPFILE=
    GOTO BEGIN
)
:: Take a preliminary step to remove problematic quotes.
:: TODO: In theory, we should reject the file name if it contain any double-
::       quote characters rather than simply stripping them away.  Maybe if we
::       compute the strlen(TMPCHOICE) before/after the step to remove the
::       double quotes and compare them we can tell if quotes were entered?
SET TMPCHOICE=!TMPCHOICE:"=!
CALL :SANITIZE_INPUT TMPCHOICE
IF NOT DEFINED TMPCHOICE (
    SET DC_CAPFILE=
    GOTO BEGIN
)

:: Greater than symbol is also problematic.
SET "TMPCHOICE=!TMPCHOICE:^>=^^>!"

:: Search for illegal characters.
:: See http://msdn.microsoft.com/en-us/library/windows/desktop/aa365247(v=vs.85).aspx
:: TODO: I'm excluding the double-quote from the ILLEGAL_CHARS, even though it
::       is, because it's already been stripped away above.  The reason is
::       because I can't figure out how to pipe the ECHO command output to
::       FINDSTR without using double-quotes around the string.
:: TODO: I'm also excluding the : and \ characters because those are acceptable
::       characters for a path, which I'm allowing.  Basically, the capture
::       file name can be either a simple file name or a fully-qualified file
::       name.  Unfortunately, this means that someone could enter something
::       like "file:foo" or "file\foo", both of which are invalid.  The
::       implication is that the call to dumpcap.exe will fail if such invalid
::       file names are entered.  How to allow e.g. C:\file but disallow fi:le?
:: TODO: The ^ character is also problematic.  You can successfully enter it,
::       convert it to ^^ so it appears in the menu and can be written/read
::       back from the configuration file, but it still gets removed from the
::       file name when dumpcap.exe is called via WMIC.
:: TODO: The comma , is also problematic when we try to run the WMIC command.
::       I don't know why it fails or how to fix it, so for now, exclude the
::       comma as well.
:: TODO: The exclamation point ! character is also problematic.  I've managed
::       to get everything to work with it (I think) except for attempting to
::       find out the size of the capture file found through handle.exe when
::       passing that filename to FILESIZE.
SET "ILLEGAL_CHARS=^!<>/|?*,^^"
ECHO "!TMPCHOICE!" | FINDSTR /R "[!ILLEGAL_CHARS!]" > NUL

:REPORT_ILLEGAL_CHAR
IF %ERRORLEVEL% EQU 0 (
    ECHO.
    ECHO You entered one or more of these illegal characters: !ILLEGAL_CHARS!"\:  See:
    ECHO http://msdn.microsoft.com/en-us/library/windows/desktop/aa365247(v=vs.85^).aspx
    ECHO (Note: The ^^!, ^^^^ and , characters are only illegal because of this batch file.^)
    ECHO.
    REM CALL :TIMEOUT 2,NOBREAK,NUL
    PAUSE
    GOTO BEGIN
)

:: Note: The open-parens ( closed-parens ) and ampersand & symbols are also
::       problematic, but we need to fix them later in CHOICE_START; otherwise
::       if we do it here, they won't be displayed properly on the menu.
REM SET "TMPCHOICE=!TMPCHOICE:(=^(!"
REM SET "TMPCHOICE=!TMPCHOICE:)=^)!"
REM SET "TMPCHOICE=!TMPCHOICE:&=^&!"

:: Remove the extension if it was entered.  We'll auto-append the correct
:: extension later depending on the file format selected, i.e., pcap or pcapng.
:: Do this recursively to avoid multiple extensions, i.e., file.pcap.pcapng
:REMOVE_EXT
SET EXT=!TMPCHOICE:~-5!
IF !EXT! == .pcap (
    SET "TMPCHOICE=!TMPCHOICE:~0,-5!"
    GOTO REMOVE_EXT
)
SET EXT=!TMPCHOICE:~-7!
IF !EXT! == .pcapng (
    SET "TMPCHOICE=!TMPCHOICE:~0,-7!"
    GOTO REMOVE_EXT
)

CALL :GETDRIVEANDPATH TMPVAL,"!TMPCHOICE!"
IF NOT EXIST !TMPVAL! (
    ECHO Error^^!  The specified capture file drive and/or path is invalid.
    REM CALL :TIMEOUT 2,NOBREAK,NUL
    PAUSE
    GOTO BEGIN
)

SET "TMPVAL=!TMPCHOICE:(=^(!"
CALL :GETFILE TMPVAL,"!TMPVAL!"
IF NOT DEFINED TMPVAL (
    ECHO Error^^!  This is not a valid capture file name.
    REM CALL :TIMEOUT 2,NOBREAK,NUL
    PAUSE
    GOTO BEGIN
)
SET DC_CAPFILE=!TMPCHOICE!
GOTO BEGIN

:: 5) Capture filter:
:CHOICE_5
SET TMPFILTER=
SET /P TMPFILTER="Capture filter: "
IF NOT DEFINED TMPFILTER (
    SET DC_CAPFILTER=
    GOTO BEGIN
)
:: Take a preliminary step to remove problematic quotes
:: TODO: In theory, we should reject the filter.  Maybe if we compute the
::       strlen(TMPCHOICE) before/after the step to remove the double quotes
::       and compare them we can tell if quotes were entered?
SET TMPFILTER=!TMPFILTER:"=!
CALL :SANITIZE_INPUT TMPFILTER
CALL :CHECK_FILTER TMPFILTER

IF NOT DEFINED TMPFILTER (
    SET DC_CAPFILTER=
) ELSE IF !TMPFILTER! NEQ ERROR (
    SET "DC_CAPFILTER=!TMPFILTER!"
)
GOTO BEGIN

:: 6) Snaplen:
:CHOICE_6
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"Snaplen (bytes) (1-65535, blank=use default): ",1,65535
ENDLOCAL & SET DC_SNAPLEN=%TMPVAL%
GOTO BEGIN

:: 7) Promiscuous mode?
:CHOICE_7
CALL :GET_YN DC_PROMISC,"Promiscuous Mode [Y,N]? "
GOTO BEGIN

:: 8) Buffer size:
:CHOICE_8
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"Buffer size (MiB) (1-1000, blank=use default): ",1,1000
ENDLOCAL & SET DC_BUFSIZE=%TMPVAL%
GOTO BEGIN

:: 9) Use pcapng format?
:CHOICE_9
CALL :GET_YN DC_PCAPNG,"Use pcapng format [Y,N]? "
GOTO BEGIN

:: -----[ Begin autostop conditions ]-----
:: 10) Stop after <N> packets
:CHOICE_10
CALL :GET_NUMERIC DC_MAXPACKETS,"Max packets (1-2147483647, or blank): ",1
GOTO BEGIN

:: 11) Stop after <N> seconds
:CHOICE_11
CALL :GET_NUMERIC DC_MAXTIME,"Max time (seconds) (1-2147483647, or blank): ",1
GOTO BEGIN

:: 12 Stop after file size exceeds <N> kB
:CHOICE_12
CALL :GET_NUMERIC DC_MAXSIZE,"Max file size (kB) (1-2147483647, or blank): ",1
GOTO BEGIN

:: 13) Stop after max number of files reaches <N>
:CHOICE_13
CALL :GET_NUMERIC DC_MAXFILES,"Max files (1-2147483647, or blank): ",1
GOTO BEGIN
:: -----[ End autostop conditions ]-----

:: -----[ Begin ringbuffer settings ]-----
:: 14) Switch after <N> seconds
:CHOICE_14
CALL :GET_NUMERIC DC_RINGTIME,"Ringbuffer switch time (seconds) (1-2147483647, or blank): ",1
GOTO BEGIN

:: 15) Switch after file size exceeds <N> kB
:CHOICE_15
CALL :GET_NUMERIC DC_RINGSIZE,"Ringbuffer file size (kB) (1-2147483647, or blank): ",1
GOTO BEGIN

:: 16) Ringbuffer max files
:CHOICE_16
CALL :GET_NUMERIC DC_RINGFILES,"Ringbuffer max files (1-2147483647, or blank): ",1
GOTO BEGIN
:: -----[ End ringbuffer settings ]-----

:: ---------------------------------------------------------------------------
:: -------------------------- CAPTURE EVENT OPTIONS --------------------------
:: ---------------------------------------------------------------------------
:: 17) Event interface:
:CHOICE_17
IF DEFINED DC_EV_INTERFACE (
    IF %DC_IFACES% EQU 0 (SET DC_EV_INTERFACE=0 & GOTO BEGIN)
    IF %DC_IFACES% EQU 1 (SET DC_EV_INTERFACE=1 & GOTO BEGIN)
)
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"Interface Number (1-%DC_IFACES%, or blank to use capture interface): ",1,%DC_IFACES%
ENDLOCAL & SET DC_EV_INTERFACE=%TMPVAL%
GOTO BEGIN

:: 18) Event capture filter:
:CHOICE_18
SET TMPFILTER=
SET /P TMPFILTER="Event capture filter: "
:: Take a preliminary step to remove problematic quotes
:: TODO: In theory, we should reject the filter.  Maybe if we compute the
::       strlen(TMPCHOICE) before/after the step to remove the double quotes
::       and compare them we can tell if quotes were entered?
IF NOT DEFINED TMPFILTER (
    SET DC_EV_CAPFILTER=
    GOTO BEGIN
)
SET TMPFILTER=!TMPFILTER:"=!
CALL :SANITIZE_INPUT TMPFILTER
CALL :CHECK_FILTER TMPFILTER

IF NOT DEFINED TMPFILTER (
    SET DC_EV_CAPFILTER=
) ELSE IF !TMPFILTER! NEQ ERROR (
    SET "DC_EV_CAPFILTER=!TMPFILTER!"
)
GOTO BEGIN

:: 19) Event count:
:CHOICE_19
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"Event count: ",1
IF DEFINED TMPVAL (
    ENDLOCAL & SET DC_EV_COUNT=%TMPVAL%
    GOTO BEGIN
)
ENDLOCAL
GOTO BEGIN

:: 20) Event kills dumpcap?
:CHOICE_20
CALL :GET_YN DC_EV_KILL,"Event kills dumpcap [Y,N]? "
GOTO BEGIN

:: 21) Delay before kill
:CHOICE_21
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"Delay before kill/action (0-99999, -1 for keypress): ",-1,99999
IF DEFINED TMPVAL (
    ENDLOCAL & SET DC_EV_DELAY=%TMPVAL%
    GOTO BEGIN
)
ENDLOCAL
GOTO BEGIN

:: --------------------------------------------------------------------------
:: ---------------------------- MAILSEND OPTIONS ----------------------------
:: --------------------------------------------------------------------------
:: 22) Mailsend enabled?
:CHOICE_22
CALL :GET_YN MS,"Mailsend enabled [Y,N]? "
GOTO BEGIN

:: 23) SMTP server
:: TODO: More robust validation of IPv4, IPv6 addresses?
:CHOICE_23
SETLOCAL
SET TMPCHOICE=
SET /P TMPCHOICE="SMTP server: "
IF NOT DEFINED TMPCHOICE GOTO BEGIN

:: A different, more robust approach to user input validation, the idea from:
:: http://stackoverflow.com/questions/9231044/windows-batch-file-validate-user-input-environmental-variable-is-hexadecimal
SET "TMPVAL=!TMPCHOICE!"
FOR %%C IN (0 1 2 3 4 5 6 7 8 9 - ^
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ^
    a b c d e f g h i j k l m n o p q r s t u v w x y z) DO (
    IF DEFINED TMPVAL SET "TMPVAL=!TMPVAL:%%C=!"
)
IF DEFINED TMPVAL (
    SET "DELIMS=!TMPVAL!"
    FOR %%C IN (. :) DO (
        IF DEFINED DELIMS SET "DELIMS=!DELIMS:%%C=!"
    )
    IF DEFINED DELIMS (
        ECHO.
        ECHO You entered one or more illegal characters.  Only -0-9A-Za-z are allowed.
        ECHO See: http://en.wikipedia.org/wiki/Hostname#Restrictions_on_valid_host_names
        ECHO.
        REM CALL :TIMEOUT 2,NOBREAK,NUL
        PAUSE
        GOTO BEGIN
    )
)
ECHO %TMPCHOICE% | FINDSTR /R "[\.:]" > NUL
IF %ERRORLEVEL% NEQ 0 (
    SET ERRMSG=You did not enter either a "." or ":".
    GOTO SMTP_SERVER_ERROR
)
ECHO %TMPCHOICE% | FINDSTR /R "^[\.-]" > NUL
IF %ERRORLEVEL% EQU 0 (
    SET ERRMSG=The SMTP server address must not begin with a "." or "-".
    GOTO SMTP_SERVER_ERROR
)
ECHO "%TMPCHOICE%" | FINDSTR /R "[\.-]\""
IF %ERRORLEVEL% EQU 0 (
    SET ERRMSG=The SMTP server address must not end with a "." or "-".
    GOTO SMTP_SERVER_ERROR
)
ECHO %TMPCHOICE% | FINDSTR /R "\.\." > NUL
IF %ERRORLEVEL% EQU 0 (
    SET ERRMSG=The SMTP server address must not contain adjacent "."s.
    GOTO SMTP_SERVER_ERROR
)
ECHO %TMPCHOICE% | FINDSTR /R ":" > NUL
IF %ERRORLEVEL% EQU 0 (
    SET "TMPVAL=!TMPCHOICE!"
    FOR %%C IN (0 1 2 3 4 5 6 7 8 9 : A B C D E F a b c d e f) DO (
        IF DEFINED TMPVAL SET "TMPVAL=!TMPVAL:%%C=!"
    )
    IF DEFINED TMPVAL (
        SET ERRMSG=Invalid IPv6 address.
        GOTO SMTP_SERVER_ERROR
    )
)

ENDLOCAL & SET "MS_SMTP_SERVER=%TMPCHOICE%"
GOTO BEGIN

:SMTP_SERVER_ERROR
ECHO.
ECHO %ERRMSG%
ECHO.
REM CALL :TIMEOUT 2,NOBREAK,NUL
ENDLOCAL
PAUSE
GOTO BEGIN

:: 24) SMTP port
:CHOICE_24
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"SMTP port (common ports: 25, 465 (ssl), 587 (starttls)): ",1,65535
IF DEFINED TMPVAL (
    ENDLOCAL & SET MS_SMTP_PORT=%TMPVAL%
    GOTO BEGIN
)
ENDLOCAL
GOTO BEGIN

:: 25) Send to address(es)
:CHOICE_25
SETLOCAL
SET TMPADDR=
CALL :GET_ADDRESSES TMPADDR,"Sendto address(es): "
IF NOT DEFINED TMPADDR (
    ECHO The Sendto address can't be empty^^!
    PAUSE
) ELSE IF "%TMPADDR%" NEQ "ERROR" (
    ENDLOCAL & SET MS_SENDTO=%TMPADDR%
    GOTO BEGIN
)
ENDLOCAL
GOTO BEGIN

:: 26) Cc address(es)
:CHOICE_26
SETLOCAL
SET TMPADDR=
CALL :GET_ADDRESSES TMPADDR,"Cc address(es): "
IF "%TMPADDR%" NEQ "ERROR" (
    ENDLOCAL & SET MS_CC=%TMPADDR%
    GOTO BEGIN
)
ENDLOCAL
GOTO BEGIN

:: 27) Bcc address(es)
:CHOICE_27
SETLOCAL
SET TMPADDR=
CALL :GET_ADDRESSES TMPADDR,"Bcc address(es): "
IF "%TMPADDR%" NEQ "ERROR" (
    ENDLOCAL & SET MS_BCC=%TMPADDR%
    GOTO BEGIN
)
ENDLOCAL
GOTO BEGIN

:: 28) Read receipt address
:CHOICE_28
SETLOCAL
SET TMPADDR=
CALL :GET_ADDRESSES TMPADDR,"Read receipt address: "

IF "%TMPADDR%" EQU "ERROR" (
    ENDLOCAL & GOTO BEGIN
)
IF NOT DEFINED TMPADDR (
    ENDLOCAL & SET MS_RRR=%TMPADDR%
    GOTO BEGIN
)
IF "%TMPADDR:,=%" NEQ "%TMPADDR%" (
    ECHO Error^^! Enter only 1 read receipt address.
    PAUSE
    ENDLOCAL & GOTO BEGIN
)
ENDLOCAL & SET MS_RRR=%TMPADDR%
GOTO BEGIN

:: 29) From name
:: TODO: I don't know which characters are definitively allowed for this field,
::       but I tested a bunch and stayed away from the known batch problematic
::       characters.  Some (all?) of the ones being disallowed at the moment
::       may be able to be supported in the future, but we'll likely have to
::       perform some various escaping tricks.
:CHOICE_29
SETLOCAL
SET TMPCHOICE=
SET /P TMPCHOICE="From name: "
IF NOT DEFINED TMPCHOICE (
    ENDLOCAL & SET MS_FROM_NAME=
    GOTO BEGIN
)

:: Take a preliminary step to remove the  problematic quote (") character.
:: TODO: Figure out how to make (") work in the ECHO | FINDSTR line below,
SET TMPCHOICE=!TMPCHOICE:"=!
CALL :SANITIZE_INPUT TMPCHOICE
IF NOT DEFINED TMPCHOICE (
    ENDLOCAL & SET MS_FROM_NAME=
    GOTO BEGIN
)
REM TODO: Retest all these.  Maybe we can escape some and allow them?
ECHO "!TMPCHOICE!" | FINDSTR /RC:"[^!%%&,:;<>@\\\^^_|]" > NUL
SET ILLEGAL_CHARS="^!%%&,:;<^>@\^^_|
IF %ERRORLEVEL% EQU 0 (
    ECHO.
    ECHO You entered one or more of these illegal characters: !ILLEGAL_CHARS!
    ECHO.
    REM CALL :TIMEOUT 2,NOBREAK,NUL
    PAUSE
    GOTO BEGIN
)
ENDLOCAL & SET "MS_FROM_NAME=%TMPCHOICE%"
GOTO BEGIN

:: 30) From address
:CHOICE_30
SETLOCAL
SET TMPCHOICE=
SET /P TMPCHOICE="From address (blank to autofill): "
SET TMPCHOICE="%TMPCHOICE%"
SET TMPCHOICE=%TMPCHOICE:"=%
IF NOT DEFINED TMPCHOICE (
    ECHO From address will use: %USERNAME%@%COMPUTERNAME%.%USERDNSDOMAIN%
    CALL :TIMEOUT 2,NOBREAK,NUL
    ENDLOCAL & SET MS_FROM=
    GOTO BEGIN
)
SET USER=
SET DOMAIN=
CALL :SPLIT_STR USER,DOMAIN,%TMPCHOICE%,"@,"
IF DEFINED USER (
    IF DEFINED DOMAIN (
        ENDLOCAL & SET MS_FROM=%TMPCHOICE%
        GOTO BEGIN
    )
)
ECHO You entered an invalid From address^^!
REM CALL :TIMEOUT 2,NOBREAK,NUL
ENDLOCAL
PAUSE
GOTO BEGIN

:: 31) Reply to address
:CHOICE_31
SETLOCAL
SET TMPCHOICE=
SET /P TMPCHOICE="Replyto address (blank to use from/to): "
SET TMPCHOICE="%TMPCHOICE%"
SET TMPCHOICE=%TMPCHOICE:"=%
IF NOT DEFINED TMPCHOICE (
    IF DEFINED MS_FROM (
        ECHO Replyto address will use: %MS_FROM%
    ) ELSE (
        ECHO Replyto address will use: %MS_SENDTO%
    )
    CALL :TIMEOUT 2,NOBREAK,NUL
    ENDLOCAL & SET MS_REPLYTO=
    GOTO BEGIN
)
SET USER=
SET DOMAIN=
CALL :SPLIT_STR USER,DOMAIN,%TMPCHOICE%,"@,"
IF DEFINED USER (
    IF DEFINED DOMAIN (
        ENDLOCAL & SET MS_REPLYTO=%TMPCHOICE%
        GOTO BEGIN
    )
)
ECHO You entered an invalid Replyto address^^!
REM CALL :TIMEOUT 2,NOBREAK,NUL
ENDLOCAL
PAUSE
GOTO BEGIN

:: 32) E-mail importance
:CHOICE_32
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"E-mail importance (1=none, 2=low, 3=normal, 4=high): ",1,4
IF DEFINED TMPVAL (
    IF !TMPVAL! EQU 1 ENDLOCAL & SET MS_IMPORTANCE=
    IF !TMPVAL! EQU 2 ENDLOCAL & SET MS_IMPORTANCE=low
    IF !TMPVAL! EQU 3 ENDLOCAL & SET MS_IMPORTANCE=normal
    IF !TMPVAL! EQU 4 ENDLOCAL & SET MS_IMPORTANCE=high
    GOTO BEGIN
)
ENDLOCAL
GOTO BEGIN

:: 33) E-mail sensitivity
:CHOICE_33
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"E-mail sensitivity (1=none, 2=Personal, 3=Private, 4=Company-Confidential): ",1,4
SET /A TMPVAL=TMPVAL
IF DEFINED TMPVAL (
    IF !TMPVAL! EQU 1 ENDLOCAL & SET MS_SENSITIVITY=
    IF !TMPVAL! EQU 2 ENDLOCAL & SET MS_SENSITIVITY=Personal
    IF !TMPVAL! EQU 3 ENDLOCAL & SET MS_SENSITIVITY=Private
    IF !TMPVAL! EQU 4 ENDLOCAL & SET MS_SENSITIVITY=Company-Confidential
    GOTO BEGIN
)
ENDLOCAL
GOTO BEGIN

:: 34) Security
:CHOICE_34
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"Security (1=none, 2=ssl, 3=starttls): ",1,3
IF NOT DEFINED TMPVAL (
    ENDLOCAL
    GOTO BEGIN
)

IF !TMPVAL! EQU 1 (
    ENDLOCAL & SET MS_SECURITY=
    GOTO BEGIN
)

IF NOT DEFINED SMTP_USER_PASS GOTO NOSECURITY
IF NOT DEFINED MS_USER (
    IF NOT DEFINED USERNAME GOTO NOSECURITY
)

IF !TMPVAL! EQU 2 ENDLOCAL & SET MS_SECURITY=ssl
IF !TMPVAL! EQU 3 ENDLOCAL & SET MS_SECURITY=starttls
GOTO BEGIN

:NOSECURITY
ECHO.
ECHO ERROR^^!  You must first set your password through the SMTP_USER_PASS environment
ECHO         variable before launching this script.  You must also set your
ECHO         username, either through the USERNAME environment variable or through
ECHO         the Username option.  Until then, the "Security" option has been
ECHO         forcibly disabled.
ECHO.
REM CALL :TIMEOUT 2,NOBREAK,NUL
PAUSE
ENDLOCAL & SET MS_SECURITY=
GOTO BEGIN

:: 35) Username
:CHOICE_35
SET TMPCHOICE=
SET /P TMPCHOICE="Username (blank to autofill): "
CALL :SANITIZE_INPUT TMPCHOICE
IF NOT DEFINED TMPCHOICE (
    IF NOT DEFINED USERNAME (
        ECHO.
        ECHO Warning^^! The USERNAME environment variable isn't set, so disabling
        ECHO          the "Use STARTTLS" option.
        ECHO.
        PAUSE
        SET MS_SECURITY=
    ) ELSE (
        ECHO Username will be set to: %USERNAME%
        CALL :TIMEOUT 2,NOBREAK,NUL
        SET MS_USER=
    )
    GOTO BEGIN
)
SET TMPCHOICE=!TMPCHOICE:"=!
SET "MS_USER=!TMPCHOICE!"
GOTO BEGIN

:: 36) Attach capture file?
:CHOICE_36
CALL :GET_YN MS_ATTACH,"Attach capture file [Y,N]? "
GOTO BEGIN

:: 37) Attach size limit
:CHOICE_37
SETLOCAL
SET TMPVAL=
CALL :GET_NUMERIC TMPVAL,"Attach size limit (in kB, blank=no limit): ",1
ENDLOCAL & SET MS_MAXATTACH=%TMPVAL%
GOTO BEGIN

:: --------------------------------------------------------------------------
:: Now starts the meat of the batch file where we actually do something.
:: --------------------------------------------------------------------------
:: Save options and begin capturing.
:CHOICE_START
IF %AUTOSTART% == N CALL :SAVEOPTS

IF /I "%DC_MODE%" NEQ "Event only" (
    IF %DC_INTERFACE% EQU 0 (
        ECHO ERROR^^!  No capture interfaces.
        GOTO :EOF
    )
)

IF NOT DEFINED DC_EV_INTERFACE SET DC_EV_INTERFACE=%DC_INTERFACE%
IF /I "%DC_MODE%" EQU "Event only" (
    SET DC_INTERFACE=Unknown
)

IF /I "%DC_MODE%" NEQ "Dumpcap only" (
    IF %DC_EV_INTERFACE% EQU 0 (
        ECHO ERROR^^!  No capture event interfaces.
        GOTO :EOF
    )
)

IF DEFINED MAILSEND (
    IF "%MS%" NEQ "Y" SET MAILSEND=
)
IF DEFINED MS_MAXATTACH SET /A MS_MAXATTACH=!MS_MAXATTACH! * 1000

IF /I "%DC_MODE%" == "Dumpcap only" (
    CALL :DUMPCAP
    REM SET > SETEND.TXT
    GOTO :EOF
)

IF /I "%DC_MODE%" EQU "Event only" SET DC_CAPFILE=

SET HANDLE="%CD%\handle.exe"
IF NOT EXIST %HANDLE% (
    CALL :GETPATH HANDLE,handle.exe
    IF DEFINED HANDLE SET HANDLE="!HANDLE!"
)

CALL :CHECK_IF_ADMIN

ECHO %DATE% %TIME%
IF /I "%DC_MODE%" == "Dumpcap+Event" (
    CALL :START_MAIN_DUMPCAP
    CALL :EVENT
)
IF /I "%DC_MODE%" == "Trigger" CALL :TRIGGER
IF /I "%DC_MODE%" == "Event only" CALL :EVENT
REM SET > SETEND.TXT
GOTO :EOF

:: --------------------------------------------------------------------------
:: Save and exit
:CHOICE_SAVE
CALL :SAVEOPTS
GOTO :EOF

:: Quit
:CHOICE_QUIT
ECHO Any configuration changes made have been discarded.
GOTO :EOF

:: --------------------------------------------------------------------------
:: Parameter getting/checking
:: --------------------------------------------------------------------------
:GET_NUMERIC ret,str,min[,max] -- Prompt the user for a number within a range.
::    -- ret [out] - the returned number, if it's valid; else unchanged
::    -- str [in] - the string to print, prompting the user for input
::    -- min [in] - the minimum number allowed
::    -- max [in] - [optional] the maximum number allowed
:: Note: If the user enters no input, the return value will be empty.
SETLOCAL
SET TMPCHOICE=
SET /P TMPCHOICE=%2
CALL :SANITIZE_INPUT TMPCHOICE
CALL :CHECK_NUMERIC TMPCHOICE,%~3,%~4
IF NOT DEFINED TMPCHOICE (
    ENDLOCAL & SET %~1=
) ELSE (
    ENDLOCAL & SET %~1=%TMPCHOICE%
)
GOTO :EOF

:: --------------------------------------------------------------------------
:CHECK_NUMERIC num,min[,max] -- Check that num is a valid number within min-max
::    -- num [in/out] - the number to check; it will be undefined if invalid
::    -- min [in] - the minimum number allowed
::    -- max [in] - [optional] the maximum number allowed
SETLOCAL
SET "TMPVAL=!%~1!"
IF NOT DEFINED TMPVAL (
    ENDLOCAL & GOTO :EOF
)
SET MIN=%2
SET MAX=%3

:: This appears to be the maximum value you can enter
IF NOT DEFINED MAX (
    IF %MIN% LSS 0 (
        SET /A MAX=2147483647 + MIN
    ) ELSE (
        SET /A MAX=2147483647
    )
)
IF !TMPVAL! GEQ %MIN% (
    IF !TMPVAL! LEQ %MAX% (
        ENDLOCAL & SET "TMPVAL=!TMPVAL!"
        GOTO :EOF
    ) ELSE (
        GOTO BAD_NUMERIC
    )
)

:BAD_NUMERIC
ECHO You entered an invalid number: !TMPVAL!^^!  Valid range: %MIN% - %MAX%
ENDLOCAL & SET %~1=
PAUSE
GOTO :EOF

:: --------------------------------------------------------------------------
:GET_YN ret -- Prompt the user for Y/N input
::    -- ret [out] - the returned Y or N, if it's valid; else unchanged
::    -- str [in] - the string to use as the user prompt
:: Note: This function was added so it can work with versions of Windows,
::       such as Windows XP, that don't have CHOICE.
:: Note: To make the user experience the same on both versions of Windows,
::       I'm forcing WIN_XP here.  This also makes user entry consistent in
::       that the YN parameters now require the user to hit <ENTER> like all
::       other parameters.  If this behavior isn't desirable, then simply
::       remove the GOTO FORCE_XP_YN.
GOTO FORCE_XP_YN
IF %WIN_XP% == Y (
:FORCE_XP_YN
    SETLOCAL
    SET TMPCHOICE=
    SET /P TMPCHOICE=%~2
    CALL :SANITIZE_INPUT TMPCHOICE
    IF NOT DEFINED TMPCHOICE (
        ENDLOCAL & GOTO :EOF
    )
    IF /I !TMPCHOICE! == Y (
        ENDLOCAL & SET %~1=Y
    ) ELSE IF /I !TMPCHOICE! == N (
        ENDLOCAL & SET %~1=N
    ) ELSE (
        ECHO You entered an invalid choice^^!  Enter Y or N.
        ENDLOCAL
        PAUSE
    )
    GOTO :EOF
) ELSE (
    CHOICE /N /M "%~2"
    IF !ERRORLEVEL! EQU 2 SET %~1=N
    IF !ERRORLEVEL! EQU 1 SET %~1=Y
)
GOTO :EOF

:: --------------------------------------------------------------------------
:CHECK_FILTER filter -- Check if the capture filter is valid
::    -- filter [in/out] - the capture filter to check
:: TODO: This function suffers from 1 known problem: It fails if an odd number
::       of double-quote (") characters are embedded in the filter.  This
::       causes stderr NOT to be redirected to stdout; therefore we don't find
::       the "Invalid" string, so it appears to be a good filter.
::
::       An earlier work-around was to use a temporary file to store both
::       stdout and stderr output and then parse that instead; however, this
::       isn't needed if the caller ensures that all quotes are removed from
::       the filter before calling this function.  This is OK because quotes
::       are not used in capture filters anyway, as far as I know.
SETLOCAL
SET TMPFILTER=!%~1!
IF NOT DEFINED TMPFILTER (
    ENDLOCAL & GOTO :EOF
)

REM We can't validate capture filters for versions prior to 1.6.0.
IF "%DUMPCAP_EXE_VER%" LSS "1.6." (
    ECHO DUMPCAP_EXE_VER=%DUMPCAP_EXE_VER%
    ENDLOCAL & GOTO :EOF
)

SET TMPVAL=

SET BUG=0
IF %BUG% EQU 1 GOTO BUG_WORKAROUND
FOR /F "USEBACKQ" %%I IN (`CALL %DUMPCAP% -f "!TMPFILTER!" -d 2^>^&1 ^|FIND "Invalid"`) DO SET TMPVAL=%%I
GOTO SKIP_WORKAROUND

:BUG_WORKAROUND
%DUMPCAP% -f "!TMPFILTER!" -d > __tmpbpf.txt 2>&1
FOR /F %%I IN (' FINDSTR Invalid __tmpbpf.txt ') DO SET TMPVAL=%%I
DEL __tmpbpf.txt

:SKIP_WORKAROUND
IF "%TMPVAL%" NEQ "dumpcap:" (ENDLOCAL & GOTO :EOF)

:BADFILTER
ECHO Bad capture filter: !TMPFILTER!
ECHO Refer to http://www.tcpdump.org/manpages/pcap-filter.7.html for help.
ENDLOCAL & SET %~1=ERROR
PAUSE
GOTO :EOF

:: --------------------------------------------------------------------------
:GET_ADDRESSES ret,str -- Prompt the user for an e-mail address(es)
::    -- ret [out] - the returned address(es) or "ERROR" if invalid
::    -- str [in] - the string to print, prompting the user for input
SET TMPCHOICE=
SET /P TMPCHOICE=%2
REM ECHO You entered !TMPCHOICE!
REM CALL :SANITIZE_INPUT TMPCHOICE
IF NOT DEFINED TMPCHOICE (
    SET %~1=
    GOTO :EOF
)

SET "TMPVAL=!TMPCHOICE!"
FOR %%C IN (# $ ' + - . / 0 1 2 3 4 5 6 7 8 9 @ _ ` { } ^
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ^
    a b c d e f g h i j k l m n o p q r s t u v w x y z) DO (
    IF DEFINED TMPVAL SET "TMPVAL=!TMPVAL:%%C=!"
)
IF DEFINED TMPVAL SET TMPVAL=!TMPVAL:,=!
IF DEFINED TMPVAL (
    ECHO.
    ECHO You entered one or more illegal/unsupported characters.
    ECHO Only the following characters are currently supported: A-Za-z0-9#$'+-./_`{},@
    ECHO.
    REM CALL :TIMEOUT 2,NOBREAK,NUL
    PAUSE
    SET %~1="ERROR"
    GOTO :EOF
)

CALL :VALIDATE_ADDRESSES %~1,"%TMPCHOICE%"
GOTO :EOF

:: --------------------------------------------------------------------------
:VALIDATE_ADDRESSES ret,addr -- Validate the e-mail address(es)
::    -- ret [out] - the returned address(es) or "ERROR" if any are invalid
::    -- addr [in] - the address(es) to validate
SET ADDRESSES=%~2
IF NOT DEFINED ADDRESSES (
    SET %~1=
    GOTO :EOF
)

:VALIDATE_ADDRESS
SET USER=
SET DOMAIN=
SET RESULT="OK"
FOR /F "TOKENS=1* DELIMS=," %%A IN ("%ADDRESSES%") DO (
    CALL :SPLIT_STR USER,DOMAIN,%%A,@
    IF NOT DEFINED USER GOTO BAD_ADDR
    IF NOT DEFINED DOMAIN GOTO BAD_ADDR

    CALL :VALIDATE_USER RESULT,!USER!
    IF !RESULT! == "ERROR" GOTO BAD_ADDR
    CALL :VALIDATE_DOMAIN RESULT,!DOMAIN!
    IF !RESULT! == "ERROR" GOTO BAD_ADDR

    SET ADDRESSES=%%B
    IF DEFINED ADDRESSES GOTO VALIDATE_ADDRESS
)
SET %~1=%~2
GOTO :EOF

:BAD_ADDR
ECHO You entered an invalid address^^!
REM CALL :TIMEOUT 2,NOBREAK,NUL
PAUSE
GOTO :EOF

:: --------------------------------------------------------------------------
:VALIDATE_USER res,user -- Validate the username (local-part) of the email addr
::    -- res [out] - the result of username validation as either "OK" or "ERROR"
::    -- user [in] - the username to validate
SET %~1="ERROR"
SET "TMPVAL=%~2"
ECHO %TMPVAL% | FINDSTR /R "^[\.]" > NUL
IF %ERRORLEVEL% EQU 0 GOTO :EOF
ECHO "%TMPVAL%" | FINDSTR /R "[\.]\""
IF %ERRORLEVEL% EQU 0 GOTO :EOF
ECHO %TMPVAL% | FINDSTR /R "\.\." > NUL
IF %ERRORLEVEL% EQU 0 GOTO :EOF
SET %~1="OK"
GOTO :EOF

:: --------------------------------------------------------------------------
:VALIDATE_DOMAIN res,domain -- Validate the domain part of the email address
::    -- res [out] - the result of domain validation as either "OK" or "ERROR"
::    -- user [in] - the domain to validate
SET %~1="ERROR"
SET "TMPVAL=%~2"
FOR %%C IN (0 1 2 3 4 5 6 7 8 9 . - ^
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ^
    a b c d e f g h i j k l m n o p q r s t u v w x y z) DO (
    IF DEFINED TMPVAL SET "TMPVAL=!TMPVAL:%%C=!"
)
IF DEFINED TMPVAL (
    ECHO.
    ECHO You entered one or more illegal characters.  Only -0-9A-Za-z are allowed.
    ECHO See: http://en.wikipedia.org/wiki/Hostname#Restrictions_on_valid_host_names
    ECHO.
    REM CALL :TIMEOUT 2,NOBREAK,NUL
    PAUSE
    GOTO :EOF
)
SET "TMPVAL=%~2"
ECHO %TMPVAL% | FINDSTR /R "[\.]" > NUL
IF %ERRORLEVEL% NEQ 0 GOTO :EOF
ECHO %TMPVAL% | FINDSTR /R "^[\.-]" > NUL
IF %ERRORLEVEL% EQU 0 GOTO :EOF
ECHO "%TMPVAL%" | FINDSTR /R "[\.-]\""
IF %ERRORLEVEL% EQU 0 GOTO :EOF
ECHO %TMPVAL% | FINDSTR /R "\.\." > NUL
IF %ERRORLEVEL% EQU 0 GOTO :EOF
SET %~1="OK"
GOTO :EOF

:: --------------------------------------------------------------------------
:: Misc. helper functions
:: --------------------------------------------------------------------------
:TIMEOUT secs,nobreak[,show] -- Wait for secs seconds or keypress if !nobreak.
::    -- secs [in] - the amount of time, in seconds, to wait
::    -- nobreak [in] - allow keypress or not via NOBREAK or BREAK
::    -- show [in] - control whether we want to show output or not via NUL
IF %~1 EQU 0 GOTO :EOF

IF %WIN_XP% == Y (
    CALL :DELAY %~1,%~3
    GOTO :EOF
)

SETLOCAL
SET TMOCMD=TIMEOUT /T %1
IF %~2 == NOBREAK SET TMOCMD=!TMOCMD! /NOBREAK
IF "%~3" == "NUL" SET TMOCMD=!TMOCMD! ^> NUL
%TMOCMD%
ENDLOCAL
GOTO :EOF

:: --------------------------------------------------------------------------
:DELAY num -- Delay by num seconds.  For WinXP, mimicking TIMEOUT on Win7
::    -- num [in] - the number of seconds to delay
::    -- show [in] - control whether we want to show output or not via NUL
:: From: http://stackoverflow.com/questions/11972249/cls-clear-a-single-line
SETLOCAL
FOR /F %%A IN ('COPY /Z "%~F0" NUL') DO SET "CR=%%A"

SET COUNT=%~1
:LOOP
IF %COUNT% LSS 0 (
    PAUSE
    ENDLOCAL & GOTO :EOF
)
IF %COUNT% EQU 0 GOTO ENDDELAY
IF "%~2" NEQ "NUL" <NUL SET /P "=Waiting for %COUNT% seconds ...         !CR!"
REM , press CTRL+C to quit ...
REM "Give me a ping, Vasili.  One ping only, please." -Captain Marko Ramius
REM Sorry, you get 2.
CALL :PING,127.0.0.1,2,NUL
REM CALL :TIMEOUT 1,NOBREAK,NUL
SET /A COUNT=COUNT-1
GOTO LOOP
:ENDDELAY
IF "%~2" NEQ "NUL" <NUL (
    SET /P "=Timer has expired.                      "
    ECHO.
    ECHO.
)
ENDLOCAL
GOTO :EOF

:: --------------------------------------------------------------------------
:PING addr,num,show -- Ping the addr num times.
::    -- addr [in] - the IP address to ping
::    -- num [in] - the number of times to ping
::    -- show [in] - control whether we want to show output or not via NUL
IF "%~3" == "NUL" (
    START /B /WAIT /I PING.EXE -n %~2 %~1 > NUL
) ELSE (
    START /B /WAIT /I PING.EXE -n %~2 %~1
)
GOTO :EOF

:: --------------------------------------------------------------------------
:SPLIT_STR part1,part2,str,delims -- Split the string into 2 parts
::    -- part1 [out] - the returned first portion of the string
::    -- part2 [out] - the returned second portion of the string
::    -- str [in] - the string to split, based on delims
::    -- delims [in] - the delimiters, which indicate where to split the string
SETLOCAL
SET STR=%~3
FOR /F "TOKENS=1,2 DELIMS=%~4" %%A IN ("%STR%") DO (
    ENDLOCAL & SET %~1=%%A & SET %~2=%%B
)
GOTO :EOF

::----------------------------------------------------------------------------
:SANITIZE_INPUT str -- Sanitize the user's input string
::    -- str [in/out] - the string to sanitize
SETLOCAL
SET "TMPVAL=!%~1!"

IF NOT DEFINED TMPVAL (
    ENDLOCAL & GOTO :EOF
)
SET "TMPVAL=!TMPVAL:^=^^!"
SET "TMPVAL=!TMPVAL:&=^&!"
SET "TMPVAL=!TMPVAL:|=^|!"
SET "TMPVAL=!TMPVAL:<=^<!"
SET "TMPVAL=!TMPVAL:>=^>!"
ENDLOCAL & SET "TMPVAL=!TMPVAL:"=^^"!"
GOTO :EOF

:: --------------------------------------------------------------------------
:CHECK_IF_ADMIN
IF NOT DEFINED MAILSEND GOTO :EOF
IF %MS_ATTACH% == N GOTO :EOF

IF NOT DEFINED DC_CAPFILE (
    IF NOT DEFINED HANDLE (
        CALL :WARN_NO_HANDLE
    ) ELSE (
        CALL :WARN_NOT_ADMIN
    )
) ELSE IF DEFINED DC_MAXFILES (
    IF NOT DEFINED HANDLE (
        CALL :WARN_NO_HANDLE
    ) ELSE (
        CALL :WARN_NOT_ADMIN
    )
) ELSE IF DEFINED DC_RINGTIME (
    IF NOT DEFINED HANDLE (
        CALL :WARN_NO_HANDLE
    ) ELSE (
        CALL :WARN_NOT_ADMIN
    )
) ELSE IF DEFINED DC_RINGSIZE (
    IF NOT DEFINED HANDLE (
        CALL :WARN_NO_HANDLE
    ) ELSE (
        CALL :WARN_NOT_ADMIN
    )
) ELSE IF DEFINED DC_RINGFILES (
    IF NOT DEFINED HANDLE (
        CALL :WARN_NO_HANDLE
    ) ELSE (
        CALL :WARN_NOT_ADMIN
    )
)
GOTO :EOF

:: --------------------------------------------------------------------------
:WARN_NO_HANDLE
SET HANDLE=
ECHO.
ECHO Warning^^! Handle.exe was not found.  You will be unable to attach capture files
ECHO          to notification e-mails.  You can download handle.exe from:
ECHO.
ECHO          http://technet.microsoft.com/en-us/sysinternals/bb896655.aspx
ECHO.
CALL :TIMEOUT 10,BREAK
GOTO :EOF

:: --------------------------------------------------------------------------
:: Idea from: http://www.robvanderwoude.com/clevertricks.php
:WARN_NOT_ADMIN
:: Get the handle.exe version and if it's less than v4.0, then don't bother
:: attempting to call handle.exe later if we're not running as an administrator
:: since it'll fail anyway, unfortunately.
SET HANDLE_VER=
FOR /F "TOKENS=2 USEBACKQ" %%I IN (`%%HANDLE%% /? ^| FINDSTR /R "^Handle v"`) DO (
    SET HANDLE_VER=%%I
    GOTO HANDLE_VER_DONE
)

:HANDLE_VER_DONE
IF "%HANDLE_VER%" GEQ "v4.0" (
    GOTO :EOF
)

AT > NUL
IF %ERRORLEVEL% NEQ 0 (
    SET HANDLE=
    ECHO.
    ECHO Warning^^! You are using an older version of handle.exe, %HANDLE_VER%, which requires
    ECHO          administrator privileges to run.  You will therefore be unable to
    ECHO          attach capture files to notification e-mails.  To avoid this problem,
    ECHO          download the latest version from:
    ECHO.
    ECHO          http://technet.microsoft.com/en-us/sysinternals/bb896655.aspx
) ELSE (
    ECHO Note: You are using an older version of handle.exe, %HANDLE_VER%.  You can download
    ECHO       the latest version from:
    ECHO.
    ECHO       http://technet.microsoft.com/en-us/sysinternals/bb896655.aspx
)
ECHO.
CALL :TIMEOUT 5,BREAK
GOTO :EOF

:: --------------------------------------------------------------------------
:: File-related helpers
:: --------------------------------------------------------------------------
:FILESIZE ret,file -- Get the file size of the file
::    - ret [out] - the returned file size
::    - file [in] - the file, whose size we're going to return, if possible
SET %~1=%~Z2
GOTO :EOF

:: --------------------------------------------------------------------------
:ADDCAPFILEEXTENSION file -- Add extension to file as either .pcap or .pcapng
::    -- file [in/out] - the file to which we'll append the correct extension
IF %DC_PCAPNG% == Y (
    SET "%~1=!%~1!.pcapng"
) ELSE (
    SET "%~1=!%~1!.pcap"
)
GOTO :EOF

:: --------------------------------------------------------------------------
:GETPATH ret,file -- Use PATH to get the full path of the file, if possible
::    -- ret [out] - the returned full path of the file as found through PATH
::    -- file [in] - the file for which we're looking for the full path
SET %~1=%~$PATH:2
GOTO :EOF

:: --------------------------------------------------------------------------
:GETEXT ret,file -- Get the extension of the file
::    -- ret [out] - the returned extension, including the '.'
::    -- file [in] - the file for which we're looking for the extension
SET %~1=%~X2
GOTO :EOF

:: --------------------------------------------------------------------------
:GETFILE ret,file -- Get only the file name, stripping off folder and extension
::    -- ret [out] - the returned file without folder or extension
::    -- file [in] - the file, possibly with folder and extension specified
SET %~1=%~N2
GOTO :EOF

:: --------------------------------------------------------------------------
:GETDRIVEANDPATH ret,file -- Get only the drive and path of the file.
::    -- ret [out] - the returned full path of the file
::    -- file [in] - the file for which we're looking for the full path
SET %~1=%~DP2
GOTO :EOF

:: --------------------------------------------------------------------------
:GETFULLCAPFILENAME file -- Get the full capture file name, including the path
::    - file [in/out] - the file, whose full path we're going to return
:: Note: I assume that if the : or \ characters are present in the file that
::       the full path has already been specified.
SET TMPFILE=!%~1!
ECHO !TMPFILE! | FINDSTR /R "[:\\]"
IF %ERRORLEVEL% NEQ 0 (
    SET "%~1=%CD%\!TMPFILE!"
)
GOTO :EOF

:: --------------------------------------------------------------------------
:: Process-related helpers
:: --------------------------------------------------------------------------
:GETPID ret,process -- Get the process ID of the running process, if possible
::    -- ret [out] - the returned PID of the process, or undefined
::    -- process [in] - the process for which we're looking for the PID
SETLOCAL
SET TASK=%2
FOR /F "TOKENS=1,2,*" %%A IN ('TASKLIST /FI "IMAGENAME eq %TASK%"') DO SET MYPID=%%B
IF "%MYPID%" == "No" SET MYPID=
ENDLOCAL & SET %~1=%MYPID%
GOTO :EOF

:: --------------------------------------------------------------------------
:TRY_TO_GET_PID ret,process -- Try to get the process ID of the running process
::    -- ret [out] - the returned PID of the process, or undefined
::    -- process [in] - the process for which we're looking for the PID
:: This function is similar to GETPID except that if there's more than 1
:: process by the same name, the PID returned will be undefined as we won't
:: know which one should be returned.
SETLOCAL
SET TASK=%2
SET COUNT=-2
FOR /F "TOKENS=1,2,*" %%A IN ('TASKLIST /FI "IMAGENAME eq %TASK%"') DO (
    SET MYPID=%%B
    SET /A COUNT=!COUNT! + 1
)
IF "%MYPID%" == "No" SET MYPID=
IF %COUNT% GEQ 2 SET MYPID=
ENDLOCAL & SET %~1=%MYPID%
GOTO :EOF

:: --------------------------------------------------------------------------
:GETPROCESS ret,pid -- Get the process name for the matching PID, if possible
::    -- ret [out] - the returned process name
::    -- pid [in] - the process ID for which we're looking for the process name
SETLOCAL
SET PID=%2
FOR /F "TOKENS=1,*" %%A IN ('TASKLIST /FI "PID eq %PID%"') DO SET MYNAME=%%A
IF "%MYNAME%" == "INFO:" SET MYNAME=
ENDLOCAL & SET %~1=%MYNAME%
GOTO :EOF

:: --------------------------------------------------------------------------
:PRIORITYLOOKUP -- Look up the value used to set the priority using WMIC
::    -- ret [out] - the returned WMIC priority
::    -- name [in] - the requested priority name
::
::          DESIRED PRIORITY            WMIC VALUE
::     Realtime              24              256 (admin)
::     High                  13         128, 256 (non-admin)
::     Above Normal          10         32768
::     Normal                8          32
::     Below Normal          6          16384
::     Low (Idle/Background) 4          64
SETLOCAL
SET PRIORITY=%~2
IF NOT DEFINED PRIORITY (
    ENDLOCAL & SET %~1=32
    GOTO :EOF
)
IF /I "%PRIORITY%" == "REALTIME" (
    ENDLOCAL & SET %~1=256
    GOTO :EOF
)
IF /I "%PRIORITY%" == "HIGH" (
    ENDLOCAL & SET %~1=128
    GOTO :EOF
)
IF /I "%PRIORITY%" == "ABOVENORMAL" (
    ENDLOCAL & SET %~1=32768
    GOTO :EOF
)
IF /I "%PRIORITY%" == "NORMAL" (
    ENDLOCAL & SET %~1=32
    GOTO :EOF
)
IF /I "%PRIORITY%" == "BELOWNORMAL" (
    ENDLOCAL & SET %~1=16384
    GOTO :EOF
)
IF /I "%PRIORITY%" == "LOW" (
    ENDLOCAL & SET %~1=64
    GOTO :EOF
)
ENDLOCAL & SET %~1=32
GOTO :EOF

:: --------------------------------------------------------------------------
:BUILD_DC_CMD
SET DC_CMD=%DUMPCAP% -i %DC_INTERFACE%
IF DEFINED DC_SNAPLEN SET DC_CMD=%DC_CMD% -s %DC_SNAPLEN%
IF %DC_PROMISC% == N SET DC_CMD=%DC_CMD% -p
IF DEFINED DC_BUFSIZE SET DC_CMD=%DC_CMD% -B %DC_BUFSIZE%
IF %DC_PCAPNG% == Y (SET DC_CMD=!DC_CMD! -n) ELSE (SET DC_CMD=!DC_CMD! -P)
:: Autostop conditions:
IF DEFINED DC_MAXPACKETS SET DC_CMD=%DC_CMD% -c %DC_MAXPACKETS%
IF DEFINED DC_MAXTIME SET DC_CMD=%DC_CMD% -a duration:%DC_MAXTIME%
IF DEFINED DC_MAXSIZE SET DC_CMD=%DC_CMD% -a filesize:%DC_MAXSIZE%
IF DEFINED DC_MAXFILES SET DC_CMD=%DC_CMD% -a files:%DC_MAXFILES%
:: Ringbuffer settings:
IF DEFINED DC_RINGTIME SET DC_CMD=!DC_CMD! -b duration:%DC_RINGTIME%
IF DEFINED DC_RINGSIZE SET DC_CMD=!DC_CMD! -b filesize:%DC_RINGSIZE%
IF DEFINED DC_RINGFILES SET DC_CMD=!DC_CMD! -b files:%DC_RINGFILES%

IF NOT DEFINED DC_CAPFILE GOTO NOCAPFILE
CALL :ADDCAPFILEEXTENSION DC_CAPFILE
REM Ampersand & is especially problematic here.  We need to escape it now so
REM GETFULLCAPFILENAME doesn't blow up, but then un-escape it as we assign it
REM to ATTACH_CAPFILE so it's in the expected format.  Holy $h!+ this sucks.
SET "DC_CAPFILE=!DC_CAPFILE:&=^&!"
CALL :GETFULLCAPFILENAME DC_CAPFILE
SET "ATTACH_CAPFILE=!DC_CAPFILE:^&=&!"

:: Escape the problematic symbols for the capture file name then update DC_CMD.
REM SET "DC_CAPFILE=!DC_CAPFILE:&=^&!"
SET "DC_CAPFILE=!DC_CAPFILE:(=^(!"
SET "DC_CAPFILE=!DC_CAPFILE:)=^)!"
REM SET "DC_CAPFILE=!DC_CAPFILE:\=^\!"
SET DC_CMD=%DC_CMD% -w "!DC_CAPFILE!"

SET "DC_CAPFILE=%DC_CAPFILE:!=^!%"
SET "DC_CAPFILE=!DC_CAPFILE:%%=%%%%!"

:NOCAPFILE
:: Capture filter:
IF NOT DEFINED DC_CAPFILTER GOTO :EOF

:: Escape the problematic ) & < and > symbols for the capture filter now.
SET "DC_CAPFILTER=!DC_CAPFILTER:)=^)!"
SET "DC_CAPFILTER=!DC_CAPFILTER:&=^&!"
SET "DC_CAPFILTER=!DC_CAPFILTER:<=^<!"
SET "DC_CAPFILTER=!DC_CAPFILTER:>=^>!"
SET DC_CMD=!DC_CMD! -f "!DC_CAPFILTER!"
GOTO :EOF

:: --------------------------------------------------------------------------
:DUMPCAP -- Build the dumpcap.exe command-line, start it up, and wait for it.
SETLOCAL
ECHO %DATE% %TIME%
CALL :START_MAIN_DUMPCAP
CALL :WAITFORDUMPCAP %DC_PID%
ECHO.
ECHO %DATE% %TIME%
IF EXIST %EVENTBAT% CALL %EVENTBAT%

SET DC_EV_INTERFACE=N/A
SET DC_EV_CAPFILTER=N/A

SET SUBJECT="Dumpcap termination notification"
SET MSG="dumpcap has terminated."
SET KILL_MSG="Dumpcap.exe(%DC_PID%) is no longer running."
IF %MS_ATTACH% == Y (
    IF DEFINED DC_CAPFILE (
        SET NEED_TO_USE_HANDLE=N
        IF DEFINED DC_MAXFILES SET NEED_TO_USE_HANDLE=Y
        IF DEFINED DC_RINGTIME SET NEED_TO_USE_HANDLE=Y
        IF DEFINED DC_RINGSIZE SET NEED_TO_USE_HANDLE=Y
        IF DEFINED DC_RINGFILES SET NEED_TO_USE_HANDLE=Y
        IF !NEED_TO_USE_HANDLE! == Y (
            CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - filename unknown.",N,N
        ) ELSE (
            REM Just use the file specified.
            CALL :FILESIZE CAPSIZE,"!DC_CAPFILE!"
            IF DEFINED CAPSIZE (
                IF DEFINED MS_MAXATTACH (
                    IF !CAPSIZE! LEQ !MS_MAXATTACH! (
                        SET SUBJECT=%SUBJECT:"=%
                        SET SUBJECT=!SUBJECT! with attachment
                        CALL :MAILSEND "!SUBJECT!",%MSG%,%KILL_MSG%,"Capture file attached.",Y,N
                    ) ELSE (
                        CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - file size of !CAPSIZE! is too big.",N,N
                    )
                ) ELSE (
                    SET SUBJECT=%SUBJECT:"=%
                    SET SUBJECT=!SUBJECT! with attachment
                    CALL :MAILSEND "!SUBJECT!",%MSG%,%KILL_MSG%,"Capture file attached.",Y,N
                )
            ) ELSE (
                CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - file size unknown.",N,N
            )
        )
    ) ELSE (
        REM A temporary capture file was being used
        CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file can't be attached - dumpcap.exe has already terminated.",N,N
    )
) ELSE (
    CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"",N,N
)

IF EXIST %FINALBAT% CALL %FINALBAT%
ENDLOCAL
GOTO :EOF

:: --------------------------------------------------------------------------
:WAITFORDUMPCAP pid -- Wait indefinitely for dumpcap to finish.
::    -- pid [in] - the PID of the dumpcap process to wait for
SETLOCAL
FOR /F %%A IN ('COPY /Z "%~F0" NUL') DO SET "CR=%%A"
SET COUNT=1
:WAITLOOP
CALL :TIMEOUT 1,NOBREAK,NUL
CALL :GETPROCESS NAME,%~1
IF NOT DEFINED NAME ENDLOCAL & GOTO :EOF
<NUL SET /P "=Dumpcap.exe(%~1) has been running for !COUNT! seconds.!CR!"
SET /A COUNT=COUNT+1
GOTO WAITLOOP
ENDLOCAL & GOTO :EOF

:: --------------------------------------------------------------------------
:WAITFORDCOREV ret -- Wait indefinitely for either the main dumpcap capturing
::                    to finish or the event dumpcap instance to finish.
::    -- ret [out] - the returned PID of the 1st process found to have ended
::
::
SETLOCAL
FOR /F %%A IN ('COPY /Z "%~F0" NUL') DO SET "CR=%%A"
SET COUNT=1
:WAITDCEVLOOP
CALL :TIMEOUT 1,NOBREAK,NUL
CALL :GETPROCESS NAME,%DC_PID%
IF NOT DEFINED NAME (
    ENDLOCAL & SET %~1=%DC_PID%
    GOTO :EOF
)
CALL :GETPROCESS NAME,%DC_EV_PID%
IF NOT DEFINED NAME (
    ENDLOCAL & SET %~1=%DC_EV_PID%
    GOTO :EOF
)
<NUL SET /P "=Dumpcap.exe(%DC_PID%) has been running for !COUNT! seconds.!CR!"
SET /A COUNT=COUNT+1
GOTO WAITDCEVLOOP
ENDLOCAL & GOTO :EOF

:: --------------------------------------------------------------------------
:START_MAIN_DUMPCAP -- Start the main dumpcap.exe capturing.
ECHO.
ECHO ==========================[ MAIN DUMPCAP CAPTURING ]==========================
ECHO Starting main dumpcap capturing.  Press ^<Ctrl-C^> in new window to quit.
ECHO.
CALL :BUILD_DC_CMD
REM Echo an un-escaped command
SET "ECHO_CMD=!DC_CMD:^(=(!"
SET "ECHO_CMD=!ECHO_CMD:^)=)!"
SET "ECHO_CMD=!ECHO_CMD:^&=&!"
SET "ECHO_CMD=!ECHO_CMD:^<=<!"
SET "ECHO_CMD=!ECHO_CMD:^>=>!"
ECHO !ECHO_CMD!

:: New solution for easier PID assignment: WMIC
:: Good news - we can use WMIC even outside of Sandusky, MI! :)
SET DC_CMD=!DC_CMD:"=\"!
FOR /F "TOKENS=2 DELIMS=;= " %%G IN ('WMIC PROCESS CALL CREATE "!DC_CMD!" ^|FIND "ProcessId"') DO SET /A DC_PID=%%G
ECHO pid(dumpcap.exe) = %DC_PID%
CALL :PRIORITYLOOKUP PRIORITY,%DC_PRIORITY%
WMIC PROCESS WHERE PROCESSID=%DC_PID% CALL SETPRIORITY %PRIORITY% > NUL
IF %ERRORLEVEL% NEQ 0 (
    ECHO.
    ECHO Could not set dumpcap's priority to %DC_PRIORITY%.
)
ECHO.
GOTO :EOF

:: --------------------------------------------------------------------------
:: Event handling/notification:
:EVENT
ECHO =============================[ EVENT MONITORING ]=============================
SET DC_CMD=%DUMPCAP% -i %DC_EV_INTERFACE% -f "!DC_EV_CAPFILTER!" -c %DC_EV_COUNT%
ECHO Starting dumpcap for event monitoring.  Press ^<Ctrl-Break^> to quit.
ECHO.
ECHO !DC_CMD!
ECHO.

REM TODO: Should we just use this for "Event only" mode?  We won't see the
REM       running time though.
REM Changed this to WMIC solution so we can monitor both DC_PID and DC_EV_PID
REM START "Capture event notification: dumpcap.exe -i %DC_EV_INTERFACE% -f !DC_EV_CAPFILTER! -c %DC_EV_COUNT%" ^
REM     /B /WAIT /I /%DC_PRIORITY% !DC_CMD!

REM TODO: Why wasn't DC_EV_CAPFILTER already sanitized?
SET "DC_CMD=!DC_CMD:^=^^!"
SET "DC_CMD=!DC_CMD:)=^)!"
SET "DC_CMD=!DC_CMD:&=^&!"
SET "DC_CMD=!DC_CMD:|=^|!"
SET "DC_CMD=!DC_CMD:<=^<!"
SET "DC_CMD=!DC_CMD:>=^>!"
SET DC_CMD=!DC_CMD:"=\"!
FOR /F "TOKENS=2 DELIMS=;= " %%G IN ('WMIC PROCESS CALL CREATE "!DC_CMD!" ^|FIND "ProcessId"') DO SET /A DC_EV_PID=%%G
ECHO pid(dumpcap.exe) = %DC_EV_PID%
CALL :PRIORITYLOOKUP PRIORITY,%DC_PRIORITY%
WMIC PROCESS WHERE PROCESSID=%DC_EV_PID% CALL SETPRIORITY %PRIORITY% > NUL
IF %ERRORLEVEL% NEQ 0 (
    ECHO.
    ECHO Could not set dumpcap's priority to %DC_PRIORITY%.
)
ECHO.

IF "%DC_MODE%" == "Event only" (
    CALL :WAITFORDUMPCAP %DC_EV_PID%
    ECHO.
    ECHO !DATE! !TIME!
    REM Even though we didn't start any dumpcap.exe instances ourselves, see
    REM if there's one instance running and if so, assume this is the one the
    REM user is interested in getting a capture file from.  This may help the
    REM user by not requiring him/her to specify the PID on the dumpcap.bat
    REM command-line and also provide some flexibility in that the dumpcap.exe
    REM instance need not necessarily be started before dumpcap.bat is.
    IF NOT DEFINED DC_PID CALL :TRY_TO_GET_PID DC_PID dumpcap.exe
    IF EXIST %EVENTBAT% CALL %EVENTBAT%
    GOTO GOTEVENT
)

CALL :WAITFORDCOREV PID
ECHO.
ECHO %DATE% %TIME%
IF %PID% EQU %DC_PID% (
    ECHO Dumpcap.exe(%DC_PID%^) capturing ended before event occurred.
)
IF EXIST %EVENTBAT% CALL %EVENTBAT%

IF %PID% EQU %DC_PID% (
    TASKKILL /F /PID %DC_EV_PID%
    SET SUBJECT="Notification of non-event"
    SET MSG="the event you were waiting for did not occur before capturing stopped."
    SET KILL_MSG="Dumpcap.exe(%DC_PID%) is not running."
    CALL :MAILSEND !SUBJECT!,!MSG!,!KILL_MSG!,"",N,N
    IF EXIST %FINALBAT% CALL %FINALBAT%
    GOTO :EOF
)

:GOTEVENT
ECHO.
SET SUBJECT="Capture event notification"
SET MSG="the event you were waiting for has occurred."
IF DEFINED DC_PID (
    SET KILL_MSG="Dumpcap.exe(%DC_PID%) may still be running."
) ELSE (
    SET KILL_MSG="Dumpcap.exe may still be running."
)

IF %DC_EV_DELAY% NEQ 0 (
    CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"",N,Y
    IF %DC_EV_DELAY% EQU -1 (
        IF %DC_EV_KILL% == Y (
            SET SUBJECT="Capture termination after key press notification"
        ) ELSE (
            SET SUBJECT="Capture delay after key press notification"
        )
        SET MSG="someone pressed a key following the event."
    ) ELSE (
        IF %DC_EV_KILL% == Y (
            SET SUBJECT="Capture termination after %DC_EV_DELAY% seconds notification"
        ) ELSE (
            SET SUBJECT="Capture delay after %DC_EV_DELAY% seconds notification"
        )
        REM If we quote this, it breaks for some reason, so quote it after.
        SET MSG=either %DC_EV_DELAY% seconds have elapsed since the event ^
            occurred or someone pressed a key to avoid waiting the entire ^
            duration.
        SET MSG="!MSG!"
    )
    CALL :TIMEOUT %DC_EV_DELAY%,BREAK
)

IF EXIST %FINALBAT% CALL %FINALBAT%
IF %DC_EV_KILL% == Y (
    IF NOT DEFINED DC_PID (
        SET KILL_MSG="All dumpcap.exe instances have been terminated."
    ) ELSE (
        SET KILL_MSG="Dumpcap.exe(%DC_PID%^) has been terminated."
    )
)

CALL :COMMON
GOTO :EOF

:: --------------------------------------------------------------------------
:: Capture triggering
:TRIGGER
ECHO =============================[ EVENT TRIGGERING ]=============================
SET DC_CMD=%DUMPCAP% -i %DC_EV_INTERFACE% -f "!DC_EV_CAPFILTER!" -c %DC_EV_COUNT%
ECHO Starting dumpcap for event triggering.  Press ^<Ctrl-Break^> to quit.
ECHO.
ECHO !DC_CMD!
ECHO.
START "Capture event trigger: dumpcap.exe -i %DC_EV_INTERFACE% -f !DC_EV_CAPFILTER! -c %DC_EV_COUNT%" ^
    /B /WAIT /I /%DC_PRIORITY% !DC_CMD!
ECHO %DATE% %TIME%
IF EXIST %EVENTBAT% CALL %EVENTBAT%

ECHO.
SET SUBJECT="Trigger event notification"
SET MSG="the event you were waiting for has occurred."
SET KILL_MSG="Dumpcap.exe has not been started."

IF %DC_EV_DELAY% EQU 0 (
    IF %DC_EV_KILL% == Y (
        IF EXIST %FINALBAT% CALL %FINALBAT%
        CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"",N,N
    ) ELSE (
        CALL :START_MAIN_DUMPCAP
        IF EXIST %FINALBAT% CALL %FINALBAT%
        IF DEFINED DC_PID (
            SET KILL_MSG="Dumpcap.exe(%DC_PID%) has been started."
        ) ELSE (
            SET KILL_MSG="Dumpcap.exe has been started."
        )
        CALL :MAILSEND %SUBJECT%,%MSG%,!KILL_MSG!,"",N,N
    )
    GOTO :EOF
)

CALL :START_MAIN_DUMPCAP
IF DEFINED DC_PID (
    SET KILL_MSG="Dumpcap.exe(%DC_PID%) has been started."
) ELSE (
    SET KILL_MSG="Dumpcap.exe has been started."
)
CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"",N,Y

CALL :TIMEOUT %DC_EV_DELAY%,BREAK
IF EXIST %FINALBAT% CALL %FINALBAT%

IF %DC_EV_KILL% == Y (
    IF %DC_EV_DELAY% EQU -1 (
        SET SUBJECT="Capture termination after key press notification"
    ) ELSE (
        SET SUBJECT="Capture termination after %DC_EV_DELAY% seconds notification"
    )
    IF NOT DEFINED DC_PID (
        SET KILL_MSG="All dumpcap.exe instances have been terminated."
    ) ELSE (
        SET KILL_MSG="Dumpcap.exe(%DC_PID%^) has been terminated."
    )
) ELSE (
    IF %DC_EV_DELAY% EQU -1 (
        SET SUBJECT="Capture delay after key press notification"
    ) ELSE (
        SET SUBJECT="Capture delay after %DC_EV_DELAY% seconds notification"
    )
    IF DEFINED DC_PID (
        SET KILL_MSG="Dumpcap.exe(%DC_PID%) may still be running."
    ) ELSE (
        SET KILL_MSG="Dumpcap.exe may still be running."
    )
)

CALL :COMMON
GOTO :EOF

:: --------------------------------------------------------------------------
:: The common part for all modes except for "Dumpcap only".
:COMMON
IF %DC_EV_DELAY% EQU -1 (
    SET MSG="someone pressed a key following the event."
) ELSE (
    REM If we quote this, it breaks for some reason, so quote it afterwards.
    SET MSG=either %DC_EV_DELAY% seconds have elapsed since the event ^
        occurred or someone pressed a key to avoid waiting the entire ^
        duration.
    SET MSG="!MSG!"
)

REM IF DEFINED HANDLE SET HANDLE=%HANDLE:"=%
IF %MS_ATTACH% == Y (
    IF DEFINED DC_CAPFILE (
        SET NEED_TO_USE_HANDLE=N
        IF DEFINED DC_MAXFILES SET NEED_TO_USE_HANDLE=Y
        IF DEFINED DC_RINGTIME SET NEED_TO_USE_HANDLE=Y
        IF DEFINED DC_RINGSIZE SET NEED_TO_USE_HANDLE=Y
        IF DEFINED DC_RINGFILES SET NEED_TO_USE_HANDLE=Y
        IF !NEED_TO_USE_HANDLE! == Y (
            IF DEFINED HANDLE (
                IF DEFINED DC_PID (
                    FOR /F "TOKENS=4* USEBACKQ" %%I IN (`%%HANDLE%% -P %DC_PID% ^| FINDSTR /R "pcap"`) DO (
                        REM TODO: If the file has an exclamation point ! in it,
                        REM       we'll never read it.  I have wasted too much
                        REM       time trying to figure out how to get it, so I
                        REM       leave this one as an exercise for the reader.
                        IF "%%J" NEQ "" (
                            SET DC_CAPFILE=%%I %%J
                        ) ELSE (
                            SET DC_CAPFILE=%%I
                        )
                    )
                    CALL :KILL_IF_NEEDED
                    IF DEFINED DC_CAPFILE (
                        SET "ATTACH_CAPFILE=!DC_CAPFILE!"
                        SET "DC_CAPFILE=!DC_CAPFILE:%%=%%%%!"
                        CALL :FILESIZE CAPSIZE,"!DC_CAPFILE!"
                        IF DEFINED CAPSIZE (
                            IF DEFINED MS_MAXATTACH (
                                IF !CAPSIZE! LEQ !MS_MAXATTACH! (
                                    SET SUBJECT=%SUBJECT:"=%
                                    SET SUBJECT=!SUBJECT! with attachment
                                    CALL :MAILSEND "!SUBJECT!",%MSG%,%KILL_MSG%,"Capture file attached.",Y,N
                                ) ELSE (
                                    CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - file size of !CAPSIZE! is too big.",N,N
                                )
                            ) ELSE (
                                SET SUBJECT=%SUBJECT:"=%
                                SET SUBJECT=!SUBJECT! with attachment
                                CALL :MAILSEND "!SUBJECT!",%MSG%,%KILL_MSG%,"Capture file attached.",Y,N
                            )
                        ) ELSE (
                            CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - file size unknown.",N,N
                        )
                    ) ELSE (
                        CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - handle.exe failure.",N,N
                    )
                ) ELSE (
                    CALL :KILL_IF_NEEDED
                    CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - dumpcap.exe PID is unknown.",N,N
                )
            ) ELSE (
                CALL :KILL_IF_NEEDED
                CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - no handle.exe found or not admin.",N,N
            )
        ) ELSE (
            REM Just use the file specified.
            CALL :KILL_IF_NEEDED
            CALL :FILESIZE CAPSIZE,"!DC_CAPFILE!"
            IF DEFINED CAPSIZE (
                IF DEFINED MS_MAXATTACH (
                    IF !CAPSIZE! LEQ !MS_MAXATTACH! (
                        SET SUBJECT=%SUBJECT:"=%
                        SET SUBJECT=!SUBJECT! with attachment
                        CALL :MAILSEND "!SUBJECT!",%MSG%,%KILL_MSG%,"Capture file attached.",Y,N
                    ) ELSE (
                        CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - file size of !CAPSIZE! is too big.",N,N
                    )
                ) ELSE (
                    SET SUBJECT=%SUBJECT:"=%
                    SET SUBJECT=!SUBJECT! with attachment
                    CALL :MAILSEND "!SUBJECT!",%MSG%,%KILL_MSG%,"Capture file attached.",Y,N
                )
            ) ELSE (
                CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - file size unknown.",N,N
            )
        )
    ) ELSE (
        REM A temporary capture file is being used
        IF DEFINED HANDLE (
            IF DEFINED DC_PID (
                FOR /F "TOKENS=4* USEBACKQ" %%I IN (`%%HANDLE%% -p %DC_PID% ^| FINDSTR /R "pcap"`) DO (
                    IF "%%J" NEQ "" (
                        SET DC_CAPFILE=%%I %%J
                    ) ELSE (
                        SET DC_CAPFILE=%%I
                    )
                )

                IF DEFINED DC_CAPFILE (
                    CALL :FILESIZE CAPSIZE,"!DC_CAPFILE!"
                    IF DEFINED CAPSIZE (
                        IF DEFINED MS_MAXATTACH (
                            IF !CAPSIZE! LEQ !MS_MAXATTACH! (
                                SET SUBJECT=%SUBJECT:"=%
                                SET SUBJECT=!SUBJECT! with attachment
                                CALL :MAILSEND "!SUBJECT!",%MSG%,%KILL_MSG%,"Capture file attached.",Y,N

                                REM NOTE: Kill *after* sending or we'll lose the temp file!
                                CALL :KILL_IF_NEEDED
                            ) ELSE (
                                CALL :KILL_IF_NEEDED
                                CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - file size of !CAPSIZE! is too big.",N,N
                            )
                        ) ELSE (
                            SET SUBJECT=%SUBJECT:"=%
                            SET SUBJECT=!SUBJECT! with attachment
                            CALL :MAILSEND "!SUBJECT!",%MSG%,%KILL_MSG%,"Capture file attached.",Y,N

                            REM NOTE: Kill *after* sending or we'll lose the temp file!
                            CALL :KILL_IF_NEEDED
                        )
                    ) ELSE (
                        CALL :KILL_IF_NEEDED
                        CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - file size unknown.",N,N
                    )
                ) ELSE (
                    CALL :KILL_IF_NEEDED
                    CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - handle.exe failure.",N,N
                )
            ) ELSE (
                CALL :KILL_IF_NEEDED
                CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - dumpcap.exe PID is unknown.",N,N
            )
        ) ELSE (
            CALL :KILL_IF_NEEDED
            CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file not attached - no handle.exe found or not admin.",N,N
        )
    )
) ELSE (
    REM Things are so much easier when we're not attaching a capture file.
    CALL :KILL_IF_NEEDED
    CALL :MAILSEND %SUBJECT%,%MSG%,%KILL_MSG%,"Capture file attachment not requested.",N,N
)
GOTO :EOF

:: --------------------------------------------------------------------------
:KILL_IF_NEEDED
IF %DC_EV_KILL% == Y (
    CALL :TIMEOUT 1,NOBREAK,NUL
    IF NOT DEFINED DC_PID (
        TASKKILL /F /IM DUMPCAP.EXE
    ) ELSE (
        TASKKILL /F /PID %DC_PID%
    )
)
GOTO :EOF

:: --------------------------------------------------------------------------
:: mailsend subject,msg,kill_msg,attach_msg,attach,parallel -- Build and send
::          an e-mail message using the mailsend.exe utility.
::     -- subject [in] - The subject line of the e-mail message
::     -- msg [in] - The message body.
::     -- kill_msg [in] - Whether dumpcap.exe has been killed or may be running
::     -- attach_msg [in] - A message about the attached capture file, if any
::     -- attach [in] - A Boolean Y/N flag for whether to attach a pcap or not
::     -- parallel [in] - A Boolean Y/N flag for whether to run mailsend.exe in
::                        parallel with this batch file or not
:MAILSEND
IF NOT DEFINED MAILSEND GOTO :EOF
SETLOCAL

:: Set FROM, REPLYTO and USER based on certain criteria
IF NOT DEFINED MS_FROM (
    SET FROM=%USERNAME%@%COMPUTERNAME%.%USERDNSDOMAIN%
) ELSE (
    SET FROM=%MS_FROM%
)
IF DEFINED MS_REPLYTO (
    SET REPLYTO=%MS_REPLYTO%
) ELSE (
    IF NOT DEFINED MS_FROM (
        SET REPLYTO=%MS_SENDTO%
    ) ELSE (
        SET REPLYTO=%MS_FROM%
    )
)

IF NOT DEFINED MS_USER (
    SET "USER=%USERNAME%"
) ELSE (
    SET "USER=!MS_USER!"
)

:: Build the mailsend command (Use -v to help with debugging.)
SET MSCMD=%MAILSEND% -smtp %MS_SMTP_SERVER% -port %MS_SMTP_PORT% ^
    -to !MS_SENDTO! ^
    -from !FROM! ^
    -rt !REPLYTO! ^
    -sub %1

IF DEFINED MS_CC SET MSCMD=!MSCMD! -cc "!MS_CC!"
IF DEFINED MS_BCC SET MSCMD=!MSCMD! -bc "!MS_BCC!"
IF DEFINED MS_RRR SET MSCMD=!MSCMD! -rrr "!MS_RRR!"
IF DEFINED MS_FROM_NAME SET MSCMD=!MSCMD! -name "%MS_FROM_NAME%"
IF DEFINED MS_IMPORTANCE SET MSCMD=!MSCMD!  -H "Importance: %MS_IMPORTANCE%"
IF DEFINED MS_SENSITIVITY SET MSCMD=!MSCMD!  -H "Sensitivity: %MS_SENSITIVITY%"

REM TODO: Try again to escape the problematic characters for USER.
IF DEFINED MS_SECURITY SET MSCMD=!MSCMD! -%MS_SECURITY% -user "!USER!" -auth

IF DEFINED DC_VER SET MSCMD=!MSCMD! -M ^"%DC_VER%^" -M ^" ^"
SET MSCMD=!MSCMD! -M ^"%DATE%, %TIME%^" ^
    -M ^"Machine: %COMPUTERNAME%.%USERDNSDOMAIN%^" ^
    -M ^"Capture interface: %DC_INTERFACE%^" ^
    -M ^"Event interface: %DC_EV_INTERFACE%^" ^
    -M ^"Event count: %DC_EV_COUNT%^" ^
    -M ^"Event: !DC_EV_CAPFILTER!^" ^
    -M ^" ^" ^
    -M ^"This is to inform you that %~2^" ^
    -M ^" ^" ^
    -M ^"%~3^" ^
    -M ^" ^" ^
    -M ^"%~4^"
SET MSCMD=!MSCMD:    =!
IF NOT DEFINED ATTACH_CAPFILE SET "ATTACH_CAPFILE=!DC_CAPFILE!"
IF %5 == Y (
    REM For now, use vnd.tcpdump.pcap for either pcap or pcapng files.
    SET MSCMD=!MSCMD! -attach "!ATTACH_CAPFILE!,application/vnd.tcpdump.pcap"
)

REM Run mailsend.exe in parallel?
IF %6 == Y (
    START "mailsend.exe" /HIGH !MSCMD!
    REM How do we get success/failure notification?
    ECHO Mailsend.exe was called.  It might have even succeeded.
    ENDLOCAL & GOTO :EOF
)

ECHO About to call mailsend.exe - this can sometimes take a little while ...
REM The above "ECHO" is to temporarily force ERRORLEVEL=0

!MSCMD!
IF %ERRORLEVEL% EQU 0 (
    ECHO Success: Notification sent to !MS_SENDTO!.
) ELSE (
    ECHO Failure: No notification sent.
)
ENDLOCAL
GOTO :EOF

:: --------------------------------------------------------------------------
:: Editor modelines  -  http://www.wireshark.org/tools/modelines.html
::
:: Surely you jest?
:: Well, we're using ::'s instead of REM's but nope, I'm not jesting.
::
:: Local variables:
:: c-basic-offset: 4
:: tab-width: 4
:: indent-tabs-mode: nil
:: End:
::
:: vi: set shiftwidth=4 tabstop=4 expandtab:
:: :indentSize=4:tabSize=4:noTabs=true:
::
