@echo off
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

rem See https://github.com/packetfoo/GeoIPDBUpdate/blob/master/UpdateGeoIPDB.cmd
setlocal
setlocal enableextensions
setlocal enabledelayedexpansion

set bat=%~n0%~x0

rem Note that tar and curl should both be available, but let's check.
rem https://blogs.technet.microsoft.com/virtualization/2017/12/19/tar-and-curl-come-to-windows/
:LOCATE_TAR
:: Try to use tar from the PATH so it doesn't matter where it's installed.
call :GETPATH tar,tar.exe
set tar="%tar%"
if %tar% neq "" goto HAVE_UNZIPCMD
rem tar not found in the PATH.  Try the expected place:
set tar="%SystemRoot%\system32\tar.exe"
if exist %tar% goto HAVE_UNZIPCMD
set tar=""

:LOCATE_7ZIP
rem Try to use 7-zip from the PATH so it doesn't matter where it's installed.
call :GETPATH sevenzip,7z.exe
set sevenzip="%sevenzip%"
if %sevenzip% neq "" goto HAVE_UNZIPCMD
rem 7-zip not found in the PATH.  Try the typical places:
set sevenzip="%PROGRAMFILES%\7-zip\7z.exe"
if exist %sevenzip% goto HAVE_UNZIPCMD
set sevenzip="%PROGRAMFILES(X86)%\7-zip\7z.exe"
if exist %sevenzip% goto HAVE_UNZIPCMD

echo.
echo This batch file relies on tar or 7-zip to extract the GeoIP archives, but
echo neither one was found on this machine.  Either update Windows so tar is
echo installed or download and install 7-zip from https://www.7-zip.org/.
rem  12345678901234567890123456789012345678901234567890123456789012345678901234567890
endlocal
goto :EOF

:HAVE_UNZIPCMD
:LOCATE_CURL
rem Try to use curl from the PATH so it doesn't matter where it's installed.
call :GETPATH curl,curl.exe
set curl="%curl%"
if %curl% neq "" goto HAVE_CURL
:: curl not found in the PATH.  Try the expected place:
set curl="%SystemRoot%\system32\curl.exe"
if exist %curl% goto HAVE_CURL
echo.
echo This batch file relies on curl to download the GeoIP archives, but curl wasn't
echo found on this machine.  Either update Windows so curl is installed or download
echo and install it from https://curl.haxx.se/download.html.
rem  12345678901234567890123456789012345678901234567890123456789012345678901234567890
endlocal
goto :EOF

:HAVE_CURL
set dflt_geoip_dir=%USERPROFILE%\AppData\Roaming\Wireshark\GeoIP
set geoip_dir=%dflt_geoip_dir%
set check_hashes=N
set cleanup=N
set wipeout=N

:PARSE_OPTS
if "%~1" == "" GOTO DONE_WITH_OPTS
if "%~1" == "-c" (set check_hashes=Y & GOTO NEXT_OPT)
if "%~1" == "-C" (set cleanup=Y & GOTO NEXT_OPT)
if "%~1" == "-W" (set wipeout=Y & GOTO NEXT_OPT)
if "%~1" == "-d" goto READ_DIR
if /i "%~1" == "-h" goto USAGE
if /i "%~1" == "/h" GOTO USAGE
if /i "%~1" == "--help" GOTO USAGE
if /i "%~1" == "/help" GOTO USAGE

:READ_DIR
shift
set geoip_dir=%~1
if "%geoip_dir%" == "" (
    echo ERROR^^!  No directory specified.
    goto USAGE
)
rem TODO: Validate the directory further?

:NEXT_OPT
shift
goto PARSE_OPTS

:DONE_WITH_OPTS
if exist setmaxmindkey.bat (
        @call setmaxmindkey.bat
)
if not defined maxmindkey (
        echo.
        echo %bat%:
        echo.
        echo MaxMind changed how the GeoIP databases are downloaded, so you may want to
        echo create a MaxMind account and sign up for their GeoIP Update Program.
        echo.
        echo    See: https://dev.maxmind.com/geoip/geoipupdate/#For_Free_GeoLite2_Databases
        echo.
        echo If you would rather use use this batch file instead, then you will need to set
        echo an environment variable called MAXMINDKEY, whose value is set to your MaxMind
        echo License Key.  If you create a batch file called setmaxmind.bat that sets this
        echo environment variable, then this batch file will automatically call it for you.
        rem  12345678901234567890123456789012345678901234567890123456789012345678901234567890
        echo.
        goto :EOF
)

:LETS_BEGIN
if not exist "%geoip_dir%\Temp" (mkdir "%geoip_dir%\Temp")
cd /d "%geoip_dir%\Temp"

set url_prefix=https://download.maxmind.com/app/geoip_download?edition_id=
set fetch_cmd=%curl% --tr-encoding --retry-connrefused --retry 3 --output

for %%f in (GeoLite2-ASN, GeoLite2-City, GeoLite2-Country) do (
    echo.
    echo Fetching %%f.tar.gz.sha256 ...
    %fetch_cmd% %%f.tar.gz.sha256.txt "%url_prefix%%%f&license_key=%maxmindkey%&suffix=tar.gz.sha256"
    echo.
    if %check_hashes% == Y (
        if exist %%f.tar.gz (
            for /f %%i in ('powershell -Command "& {(Get-FileHash %%f.tar.gz -Algorithm SHA256).Hash.ToLower()}"') do set hash_computed=%%i
            rem echo hash_computed=!hash_computed!

            for /f %%i in ('type %%f.tar.gz.sha256.txt') do set hash_read=%%i
            rem echo hash_read    =!hash_read!

            if "!hash_computed!" == "!hash_read!" (
                echo Hash match - Not fetching %%f.tar.gz.
            ) else (
                echo Hash mismatch - Fetching %%f.tar.gz ...
                %fetch_cmd% %%f.tar.gz "%url_prefix%%%f&license_key=%maxmindkey%&suffix=tar.gz"
            )
        ) else (
            echo Fetching %%f.tar.gz ...
            %fetch_cmd% %%f.tar.gz "%url_prefix%%%f&license_key=%maxmindkey%&suffix=tar.gz"
        )
    ) else (
        echo Fetching %%f.tar.gz ...
        %fetch_cmd% %%f.tar.gz "%url_prefix%%%f&license_key=%maxmindkey%&suffix=tar.gz"
    )

    echo.
    echo Unpacking %%f.tar.gz ...
    if %tar% neq "" (
        %tar% -xf %%f.tar.gz
    ) else (
        %sevenzip% e -y %%f.tar.gz && %sevenzip% x -y %%f.tar
        del /q %%f.tar
    )
)

rem Use copy instead of move, in case no cleanup is desired.  That way, if you're
rem not going to bother removing the directory, it might be nice to retain a copy of
rem the database file since every time we run this batch file we overwrite the
rem *.tar.gz files, thus wiping out any previous version(s).
echo.
echo Copying database files ...
for /f "delims=" %%a in ('dir /a:d /b') do copy /y "%%a\*.mmdb" ..\

:WIPEOUT
if %wipeout% == N goto CLEANUP
cd ..
rmdir /s /q Temp
echo Done.
endlocal
goto :EOF

:CLEANUP
echo.
if %cleanup% == Y (
    echo Cleaning up ...
    for /f "delims=" %%a in ('dir /a:d /b') do (
        del /f %%a.tar.gz 2> nul
        rmdir /s /q "%%a" 2> nul
    )
) else (
    rem We need to at least tar-zip the directories; otherwise we'll end up
    rem with obsolete .mmdb files since we're copying them instead of moving
    rem them for the purpose of being able to save older copies, just in case.
    for /f "delims=" %%a in ('dir /a:d /b') do (
        del /f %%a.tar.gz 2> nul
        if %tar% neq "" (
            %tar% -czf %%a.tar.gz %%a
        ) else (
            rem %sevenzip% a -y %%a.zip %%a
            %sevenzip% a -ttar -so %%a.tar %%a | %sevenzip% a -si %%a.tar.gz
        )
        rmdir /s /q "%%a" 2> nul
    )
)

echo Done.
endlocal
goto :EOF

:: --------------------------------------------------------------------------
:GETPATH ret,file -- Get the full path of the file, if possible
::    -- ret [out] - the returned full path of the file
::    -- file [in] - the file for which we're looking for the full path
set %~1=%~$PATH:2
goto :EOF

:: --------------------------------------------------------------------------
:USAGE
echo.
echo %bat% [-h] [-c] [-C] [-W] [-d ^<directory^>]
echo.
rem  12345678901234567890123456789012345678901234567890123456789012345678901234567890
echo    -h           Display this help and exit.
echo    -c           Check SHA256 hashes and only download and extract the GeoIP
echo                 archives if there's a hash mismatch.
echo                 (Requires PowerShell's Get-FileHash.)
echo    -C           Cleanup temporary sub-folders; otherwise re-archive them.
echo    -W           Wipeout all downloaded content except for the database files.
echo    -d directory An optional installation directory.  If no directory is
echo                 specified, then the GeoIP archives will be downloaded and
echo                 extracted to:
echo.
echo                     %dflt_geoip_dir%
endlocal
goto :EOF
:: --------------------------------------------------------------------------
