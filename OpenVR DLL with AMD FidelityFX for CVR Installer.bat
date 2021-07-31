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
:: Go to "Plugins\x86_64"

:skip
cd /d "ChilloutVR_Data\Plugins\x86_64"
)

:: Checking OS Version
echo ^    --------------------------------------------------
echo ^    ^|				Checking for OS!			 ^|
echo ^    --------------------------------------------------
if OS == Win10 then
 TIMEOUT /T 2
 CLS
 GOTO win10
else
 TIMEOUT /T 2
 CLS
 GOTO COS
)
:: Download openvr_fsr release from Github.

:win10
echo ^    --------------------------------------------------
echo ^    ^|			Now installing Files...			 ^|
echo ^    --------------------------------------------------
)
curl --limit-rate 4m -L "https://github.com/fholger/openvr_fsr/releases/latest/download/openvr_fsr_v1.0.zip" -o "openvr.zip"
if %errorlevel% neq 0 (
	echo [31m
	echo CRITICAL ERROR: Failed to download the openvr.zip zip file.
	echo Please report this error to the UCC^).
	echo [0m
	pause
	exit /b %errorlevel%
   )
echo ^ openvr.zip Succesfull Installed!
)
TIMEOUT /T 3
CLS
goto unzip
)
:COS
echo ^    --------------------------------------------------
echo ^    ^|			Now installing Files...			 ^|
echo ^    --------------------------------------------------
)
powershell -Command "Invoke-WebRequest "https://github.com/fholger/openvr_fsr/releases/latest/download/openvr_fsr_v1.0.zip" -OutFile "openvr.zip"
if %errorlevel% neq 0 (
	echo [31m
	echo CRITICAL ERROR: Failed to download the openvr.zip zip file.
	echo Please report this error to the UCC^).
	echo [0m
	pause
	exit /b %errorlevel%
   )
echo ^ openvr.zip Succesfull Installed!
)
TIMEOUT /T 3
CLS
goto unzip
)
:unzip
:: Decompress .zip.
)
echo Decompressing openvr.zip...
powershell Expand-Archive openvr.zip -DestinationPath . -Force
if %errorlevel% neq 0 (
	echo [31m
	echo CRITICAL ERROR: Failed to extract the openvr.zip zip file.
	echo Please report this error to the UCC^).
	echo [0m
	pause
	exit /b %errorlevel%
   )
echo ^ openvr.zip Succesfull Extracted!
)
TIMEOUT /T 3
CLS
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