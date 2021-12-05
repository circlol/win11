@echo off
    set "params=%*"
    cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
	set LOGFILE=LOG.txt
	set ERROR=ERROR.txt
	powershell.exe -WindowStyle Maximized -Command "exit"
	echo.>> %LOGFILE% && echo SCRIPT RUN INITIATED>> %LOGFILE% && echo SCRIPT RUN INITIATED>> %ERROR%
	time /t && time /t >> %LOGFILE% && time /t >> %ERROR%
	date /t && date /t >> %LOGFILE% && date /t >> %ERROR%
	echo. && echo ================================================================================&& echo. && echo New Load Utiliy for Windows 10&& echo Created by Mike Ivison&& echo. && echo It is recommend to run Windows Updates BEFORE running this script as Windows may revert some of our changes.&& echo. && echo ================================================================================&& echo. && title New Loads Utility - Mother Computers - Created by Mike Ivison
  	timeout 3 > NUL
	goto programs

:programs
	::winget
  	::title NLU - Mother Computers : Checking for Winget
  	::powershell.exe -ExecutionPolicy Unrestricted -WindowStyle Maximized -File ".\resources\Scripts\Winget.ps1"
	echo. && echo ========================================&& echo.&& echo Installing Apps&& echo. && echo Please be patient as the programs install in the background.&& echo. && echo =============================================================&& title NLU - Mother Computers - Installing Applications
	goto chrome
	:chrome
	::{ONLINE}::
 	echo.
	if not exist "%PROGRAMFILES%\Google\Chrome\Application\chrome.exe" (
			if not exist "%PROGRAMFILES(x86)%\Google\Chrome\Application\chrome.exe" (
				title NLU - Mother Computers - Installing Google Chrome
				echo Installing Google Chrome
        		winget install Google.Chrome -e -h -s Winget >> %LOGFILE% 2>> %ERROR%
				goto chrome
				) else (
				echo Google Chrome Installed
				goto vlc
			)) else (
				echo Google Chrome Installed
				goto vlc
				)
	::chrome
	::{OFFLINE}::
	echo.
	if not exist "%PROGRAMFILES%\Google\Chrome\Application\chrome.exe" (
				echo Installing Google Chrome
				".\resources\apps\googlechromestandalone64.msi" /Quiet /Passive
				goto chrome
				) else (
				echo. && echo Google Chrome is Installed
				goto vlc
			)

	:vlc
	::{ONLINE}::
	echo. && echo.
	if not exist "%PROGRAMFILES%\VideoLAN\VLC\VLC.exe" (
			if not exist "%PROGRAMFILES(x86)%\VideoLAN\VLC\VLC.exe" (
				title NLU - Mother Computers - Installing VLC Media Player
				echo Installing VLC Media Player
				winget install VideoLAN.VLC -e -h -s Winget >> %LOGFILE% 2>> %ERROR%
				goto vlc
				) else (
				echo VLC Media Player x86 is Installed
				goto acrobat
			)) else (
				echo VLC Media Player is Installed
				goto acrobat
				)

	::vlc
	::{OFFLINE}::
	echo. && echo.
	if not exist "%PROGRAMFILES%\VideoLAN\VLC\vlc.exe" (
			echo Installing VLC Media Player
			start "" ".\resources\apps\vlc-3.0.16-win64.exe" /L=1033 /S
			goto acrobat
		) else (
			echo VLC Media Player is Installed
			goto acrobat
			)

	:acrobat
	::{ONLINE}::
	echo. && echo.
	if not exist "%PROGRAMFILES%\Adobe\Acrobat DC\Acrobat\Acrobat.exe" (
			title NLU - Mother Computers - Installing Adobe Acrobat Reader
				echo Installing Adobe Acrobat Reader
				winget install Adobe.Acrobat.Reader.64-bit -e -h -s Winget >> %LOGFILE% 2>> %ERROR%
				goto acrobat
				) else (
				echo Adobe Acrobat Reader is Installed
				goto visuals
				)

	::acrobat
	::{OFFLINE}::
	echo. && echo.
	if not exist "%PROGRAMFILES%\Adobe\Acrobat DC\Acrobat\Acrobat.exe" (
			echo Installing Adobe Acrobat Reader
			start "" ".\resources\apps\Adobe.Acrobat.Reader.64-bit.21.007.20099.exe" /sAll /rs
			goto visuals
			) else (
			echo Adobe Acrobat Reader is Installed
			goto visuals
			)

	goto visuals

:visuals
    echo. && echo. && echo ========================================&& echo. && echo Applying Visual Tweaks&& echo. && echo ========================================&& echo. && title NLU - Mother Computers - Applying Visual Changes
    ".\resources\themes\win11-light.deskthemepack"
    REG ADD "HKCU\Control Panel\Desktop" /v WallpaperStyle /f /t REG_SZ /d "2" >> %LOGFILE% 2>> %ERROR%
    echo Applied Mother Computers Theme
	timeout 1 > NUL
	taskkill /F /IM systemsettings.exe >> %LOGFILE%
	echo. && echo Applying Home Screen Layout
	powershell.exe -ExecutionPolicy Unrestricted -WindowStyle Maximized -File ".\resources\scripts\HomeScreen.ps1" >> %LOGFILE% 2>> %ERROR%
    taskkill /F /IM explorer.exe >> %LOGFILE%
    goto onedrive

:onedrive
    echo. && echo. && echo ========================================&& echo. && echo. Removing OneDrive&& echo. && echo ========================================&& echo. && title NLU - Mother Computers : Removing OneDrive
	powershell.exe -executionpolicy unrestricted -WindowStyle Maximized ".\resources\Scripts\OneDrive.ps1" >> %LOGFILE% 2>> %ERROR%
	echo. && echo OneDrive Removed
	goto reg

:reg
    echo. && echo. && echo ========================================&& echo. && echo Modifying Registry&& echo. && echo ========================================&& echo. && title NLU - Mother Computers - Applying Registry Changes
	powershell -executionpolicy unrestricted -WindowStyle Maximized ".\resources\Scripts\Registry.ps1" 2>> %ERROR%
	::DISABLED FOR 10
	::goto bloatremoval
	goto bloatremoval

:bloatremoval
    echo. && echo. && echo ========================================&& echo. && echo Running Bloat Remover&& echo. && echo ========================================&& echo. && title NLU - Mother Computers - Removing Bloatware
	echo Removing Bloatware
	powershell.exe -executionpolicy unrestricted -WindowStyle Maximized ".\resources\Scripts\BloatRemover.ps1" 2>> %ERROR%
	goto titus

:titus
    echo. && echo. && echo ========================================&& echo. && echo Disabling Certain Services&& echo. && echo ========================================&& echo.	&& title NLU - Mother Computers - Disabling Unnecessary Services
	echo Disabling
	powershell.exe -executionpolicy unrestricted -WindowStyle Maximized ".\resources\Scripts\Titus.ps1" 2>> %ERROR%
	goto explorer

:explorer
	echo. && echo. && echo ========================================&& echo. && echo Explorer Restarted&& echo. && echo ========================================&& echo. 
	explorer
	goto cleanup

:cleanup
     echo. && echo. && echo ========================================&& echo. && echo Cleaning Up a Few Things&& echo. && echo ========================================&& echo. && title NLU - Mother Computers - Cleaning Up
    if exist "%temp%\*.*" ( del "%temp%\*.*" /Q /S ) >> %LOGFILE% 2>> %ERROR%
    if exist "C:\temp" ( rmdir C:\temp /Q /S ) else ( echo Temporary folder in C Root does not exist ) >> %LOGFILE% 2>> %ERROR%
    if exist "%temp%\Winget" ( del "%TEMP%\Winget\*.*" /Q /S ) else ( echo %temp%\Winget Folder not found ) >> %LOGFILE% 2>> %ERROR%
	if exist "%USERPROFILE%\Desktop\Microsoft Edge.lnk" ( del "%USERPROFILE%\Desktop\Microsoft Edge.lnk" /Q /S ) >> %LOGFILE% 2>> %ERROR%
    if exist "%PUBLIC%\Desktop\Microsoft Edge.lnk" ( del "%PUBLIC%\Desktop\Microsoft Edge.lnk" /Q /S ) >> %LOGFILE% 2>> %ERROR%
    explorer .\
	timeout 3 > NUL
	start https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
	if exist "%PUBLIC%\VLC Media Player.lnk" ( del "%PUBLIC%\Desktop\VLC Media Player.lnk" /Q /S ) >> %LOGFILE% 2>> %ERROR%
    if exist "%PUBLIC%\Desktop\Adobe Acrobat DC.lnk" ( del "%PUBLIC%\Desktop\Adobe Acrobat DC.lnk" /Q /S ) >> %LOGFILE% 2>> %ERROR%
	goto exit

:exit
	echo. >> %LOGFILE% && echo SCRIPT RUN COMPLETED>> %LOGFILE% && echo SCRIPT RUN COMPLETED>> %ERROR%
	time /t && time /t >> %LOGFILE% time /t >> %ERROR%
	date /t && date /t >> %LOGFILE% date /t >> %ERROR%
    exit

:reboot
    shutdown -r -t 0

:winupdate
	powershell -executionpolicy remotesigned -WindowStyle Maximized ".\resources\scripts\WindowsUpdates.ps1" 2>> %ERROR%
	goto winget

:Powershell command that displays whether windows is activated or not
	Get-CIMInstance -query "select Name, Description, LicenseStatus from SoftwareLicensingProduct where LicenseStatus=1" | Format-List Name, Description, LicenseStatus
