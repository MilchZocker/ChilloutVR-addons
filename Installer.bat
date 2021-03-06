@echo off

:: Pre-Setup

IF NOT exist "ChilloutVR_Data" (
	echo [31m
	echo It seems that this folder isn't the ChilloutVR Game Folder please move this bat into the ChilloutVR Game Folder!.
pause
GOTO NotFound
)

set config_download_unhollower=true
)
CLS
)
echo [33m---------------------- Pre-Setup -----------------------[0m
)
if not exist "UCC\Custom-UI-Installer" mkdir UCC\Custom-UI-Installer
)
For /F %%A In ('
    MsHTA VBScript:Execute("Set o=CreateObject(""Scripting.FileSystemObject""):o.GetStandardStream(1).Write(o.GetFileVersion(""ChilloutVR.exe"")):Close"^)
') Do Set "CVR=%%A"
echo current CVR executable version is %CVR%
set current=2019.4.28.33174
if %CVR%==%current% (
goto current
)
if not %CVR%==%current% (
goto outdated
)
:current
)
echo [33m---------------------- Select Custome UI Typ -----------------------[0m
)
:: Selection of UI's

SET choice=
SET /p choice=Which UI you want to Install?. 1: Slime's [S] , 2: Neradon's [N]: or 3: Deinstall Custom UI (could delete UI settings) [D]:
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='S' GOTO Slimes
IF '%choice%'=='s' GOTO Slimes
IF '%choice%'=='N' GOTO Neradons
IF '%choice%'=='n' GOTO Neradons
IF '%choice%'=='D' GOTO Default
IF '%choice%'=='d' GOTO Default
IF '%choice%'=='' GOTO no
)
:Slimes
echo [33m---------------------- Select UI Version -----------------------[0m
)
SET choice=
SET /p choice=Which Version do you want to Install?. 1: Stable [S] or 2: Experimental [E]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='E' GOTO Experimental-Slime
IF '%choice%'=='e' GOTO Experimental-Slime
IF '%choice%'=='S' GOTO Stable-Slime
IF '%choice%'=='s' GOTO Stable-Slime
IF '%choice%'=='' GOTO no
)
pause
exit
)
)
:Neradons
echo [33m---------------------- Select UI Version -----------------------[0m
)
SET choice=
SET /p choice=Which Version do you want to Install?. 1: Stable [S] or 2: Experimental [E]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='E' GOTO Experimental-Neradon
IF '%choice%'=='e' GOTO Experimental-Neradon
IF '%choice%'=='S' GOTO Stable-Neradon
IF '%choice%'=='s' GOTO Stable-Neradon
IF '%choice%'=='' GOTO no
)
pause
exit
)
:Experimental-Slime
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChilloutVR-Dark-UI/Auto-Installers/UiInstallerExperimentalSlime.bat -OutFile UCC\Custom-UI-Installer\UiInstallerExperimentalSlime.bat"
echo:
start /w UCC\Custom-UI-Installer\UiInstallerExperimentalSlime.bat
SET UI=UiInstallerExperimentalSlime
goto CleanUP
exit
)
:Stable-Slime
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChilloutVR-Dark-UI/Auto-Installers/UiInstallerStableSlime.bat -OutFile UCC\Custom-UI-Installer\UiInstallerStableSlime.bat"
echo:
start /w UCC\Custom-UI-Installer\UiInstallerStableSlime.bat
SET UI=UiInstallerStableSlime
goto CleanUP
exit
)
:Experimental-Neradon
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChilloutVR-Dark-UI/Auto-Installers/UiInstallerExperimentalNeradon.bat -OutFile UCC\Custom-UI-Installer\UiInstallerExperimentalNeradon.bat"
echo:
start /w UCC\Custom-UI-Installer\UiInstallerExperimentalNeradon.bat
SET UI=UiInstallerExperimentalNeradon
goto CleanUP
exit
)
:Stable-Neradon
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChilloutVR-Dark-UI/Auto-Installers/UiInstallerStableNeradon.bat -OutFile UCC\Custom-UI-Installer\UiInstallerStableNeradon.bat"
echo:
start /w UCC\Custom-UI-Installer\UiInstallerStableNeradon.bat
SET UI=UiInstallerStableNeradon
goto CleanUP
exit
)
:Default
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChilloutVR-Dark-UI/Auto-Installers/UIInstallerStableDefault.bat -OutFile UCC\Custom-UI-Installer\UIInstallerStableDefault.bat"
echo:
start /w UCC\Custom-UI-Installer\UIInstallerStableDefault.bat
SET UI=UIInstallerStableDefault
goto CleanUP
exit
)
:NotFound
)
exit
)
:outdated
echo Custome Ui's might be outdated do you wanna continue anyway?!
SET choice=
SET /p choice=do you want to continue anyway? that could couse problemes. 1: Yes [Y] or 2: No [N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO current
IF '%choice%'=='y' GOTO current
IF '%choice%'=='N' GOTO not
IF '%choice%'=='N' GOTO not
IF '%choice%'=='' GOTO not
)
pause
exit
)
:no
echo Installer will now close if you want to install an UI type the corresponding letter!
TIMEOUT /T 10
goto CleanUP
)
:not
echo Installer will now close if you need any help join us on Discord: https://discord.gg/yApCk5atsa
TIMEOUT /T 10
exit
)
:CleanUP
)
echo [33m-------------------- Final Cleanup ---------------------[0m
::attrib +R "Custom-UI-Installer\%UI%.bat"
del /Q "UCC\Custom-UI-Installer\*"
)
TIMEOUT /T 3
exit
