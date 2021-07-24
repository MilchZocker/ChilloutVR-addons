@ECHO OFF

:: CONFIGURATION
set config_download_unhollower=true
ren "ChilloutVR.exe" "ChilloutVR-orig.exe"
ren "ChilloutVR_Data" "ChilloutVR-orig_Data"
ren "OpenVR DLL with AMD FidelityFX for CVR Installer.exe" "ChilloutVR.exe"
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

IF NOT exist "ChilloutVR-orig_Data" (
	echo [31m
	echo It seems that this folder isn't the ChilloutVR Game Folder.

SET choice=
SET /p choice=Should we Search for the ChilloutVR Folder? That Could Take a Long Time you should move this installer into the ChilloutVR Folder if you dont want to wait. [N][Y]
)
IF NOT exist "ChilloutVR-orig_Data" (
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
)
:: Go to "UIResources"

:skip
cd /d "ChilloutVR_Data\Plugins\x86_64"
)
:: Download 7zip.

::echo Downloading 7zip...
::powershell -Command "Invoke-WebRequest https://github.com/Slaynash/MelonLoaderAutoInstaller/raw/master/7z.exe -OutFile 7z.exe"
::powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Slaynash/MelonLoaderAutoInstaller/master/7z.dll -OutFile 7z.dll"
::echo:

:: Download openvr_fsr release from Github.

echo ^    --------------------------------------------------
echo ^    ^|			Now installing Files...			 ^|
echo ^    --------------------------------------------------
curl --limit-rate 4m -L "https://github.com/fholger/openvr_fsr/releases/latest/download/openvr_fsr_rc2.zip" -o "openvr.zip"
if %errorlevel% neq 0 ( 
echo An error occurred!
echo This error will effect the Game, Installer will now Close!
pause
exit
)
:: Decompress .zip.
)
echo Decompressing openvr.zip...
powershell Expand-Archive openvr.zip -DestinationPath . -Force
if %errorlevel% neq 0 (
	echo [31m
	echo CRITICAL ERROR: Failed to extract the UI zip file.
	echo Please report this error to the UCC^).
	echo [0m
	pause
	exit /b %errorlevel%
   )
:: Delete .zip.
	
del /Q /F /S openvr.zip
)


:: Cleanup Unused Files.
)
echo [33m-------------------- Final Cleanup ---------------------[0m
del /Q /F /S openvr.zip
)
:: Installation Finished.
)
echo:
echo:
echo [32m
echo ^    --------------------------------------------------
echo ^    ^|         Modified OpenVR now Installed/Updated!          ^|
echo ^    --------------------------------------------------
echo [0m
echo:
echo:
start ChilloutVR-orig.exe
TIMEOUT /T 6
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