@ECHO OFF

:: CONFIGURATION
set config_download_unhollower=true
:: Installer

CLS

echo:
echo [36m
echo ///
echo ///
echo /// POWERSHELL PROGRESS OUTPUT
echo ///
echo ///
echo [0m
echo ^    --------------------------------------------------
echo ^    ^|  ChilloutVR Modified OpenVR DLL with AMD FidelityFX SuperResolution Upscaler Installer by UCC  ^|
echo:

:: Is ChilloutVR Folder?
:CVR?
echo [33m---------------------- Pre-Setup -----------------------[0m

IF NOT exist "ChilloutVR_Data" (
	echo [31m
	echo It seems that this folder isn't the ChilloutVR Game Folder.

SET choice=
SET /p choice=Should we Search for the ChilloutVR Folder? That Could Take a Long Time you should move this installer into the ChilloutVR Folder if you dont want to wait. [N][Y]
)
IF NOT exist "ChilloutVR_Data" (
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
)
:: Create Directory for storage

:skip
if not exist "UCC\FSR" md "UCC" "UCC\FSR"
cd "UCC\FSR"
)
:: Download openvr_fsr powershell extention.
echo ^    --------------------------------------------------
echo ^    ^|			Now installing Files...			 ^|
echo ^    --------------------------------------------------
)
powershell -Command "Invoke-WebRequest "https://raw.githubusercontent.com/MilchZocker/ChilloutVR-addons/OpenVR-DLL-with-AMD-FidelityFX-for-CVR-Installer/dl_latest_release.ps1" -OutFile "dl_latest_release.ps1"
if %errorlevel% neq 0 (
	echo [31m
	echo CRITICAL ERROR: Failed to download the openvr_fsr powershell extention zip file.
	echo Please report this error to the UCC^).
	echo [0m
	pause
	exit /b %errorlevel%
   )
echo ^ openvr_fsr powershell extention Succesfull Installed!
:: Download openvr_fsr release from Github.
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""E:\Program Files\Steam\steamapps\common\ChilloutVR\dl_latest_release.ps1""' }"
)
TIMEOUT /T 5
CLS
:: Cleanup Unused Files.
)
echo [33m-------------------- Final Cleanup ---------------------[0m
del /Q /F /S dl_latest_release.ps1
cd ..\..
echo %cd%
pause
move /Y "UCC\FSR"\*.* "ChilloutVR_Data\Plugins\x86_64"
)
:: Installation Finished.
)
echo:
echo:
echo [32m
echo ^    --------------------------------------------------
echo ^    ^|         Modified OpenVR now Installed!          ^|
echo ^    --------------------------------------------------
echo [0m
echo:
echo:
TIMEOUT /T 10
exit
   )
:: no variable.
)
:no
pause
Exit
   )
:: yes variable.
)
:yes

SET filename=ChilloutVR.exe

ECHO Looking for ChilloutVR please wait..

FOR /R \ %%a IN (\) DO (
   IF EXIST "%%a\%filename%" (

      SET fullpath=%%a
      SET fullpathexe=%%a%filename%	  
      GOTO FoundIt
   )
)
:: FoundIt variable.
)
:FoundIt
ECHO thats your ChilloutVR Path: %fullpathexe%
ECHO We will now Continue the Installation...
pause
cd /d "%fullpath%"
GOTO skip
)