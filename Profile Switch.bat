@echo off

IF NOT exist "ChilloutVR.exe" (
echo ChilloutVR could not be found make sure this bat is located at "ChilloutVR" with the .exe in the same directory.
GOTO no
)

IF NOT exist "Profiles" (
echo Profiles Directory not found, we will now create one...
md "Profiles"
)

SET choice=
SET /p choice=Which Profile do you wanna use?. [1],[2],[3],[4],[5],[6],: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='1' GOTO 1
IF '%choice%'=='2' GOTO 2
IF '%choice%'=='3' GOTO 3
IF '%choice%'=='4' GOTO 4
IF '%choice%'=='5' GOTO 5
IF '%choice%'=='6' GOTO 6
IF '%choice%'=='' GOTO no

:1
IF NOT exist "Profiles\1.profile" (
echo Profile not found make sure it exists and it's named "Profiles\1.profile"
GOTO error
)

del "ChilloutVR_Data\autologin.profile"

copy /Y "Profiles\1.profile" "ChilloutVR_Data"

rename "ChilloutVR_Data\1.profile" "autologin.profile"

start ChilloutVR.exe

GOTO no

:2
IF NOT exist "Profiles\2.profile" (
echo Profile not found make sure it exists and it's named "Profiles\2.profile"
GOTO error
)

del "ChilloutVR_Data\autologin.profile"

copy /Y "Profiles\2.profile" "ChilloutVR_Data"

rename "ChilloutVR_Data\2.profile" "autologin.profile"

start ChilloutVR.exe

GOTO no

:3
IF NOT exist "Profiles\3.profile" (
echo Profile not found make sure it exists and it's named "Profiles\3.profile"
GOTO error
)

del "ChilloutVR_Data\autologin.profile"

copy /Y "Profiles\3.profile" "ChilloutVR_Data"

rename "ChilloutVR_Data\3.profile" "autologin.profile"

start ChilloutVR.exe

GOTO no

:4
IF NOT exist "Profiles\4.profile" (
echo Profile not found make sure it exists and it's named "Profiles\4.profile"
GOTO error
)

del "ChilloutVR_Data\autologin.profile"

copy /Y "Profiles\4.profile" "ChilloutVR_Data"

rename "ChilloutVR_Data\4.profile" "autologin.profile"

start ChilloutVR.exe

GOTO no

:5
IF NOT exist "Profiles\5.profile" (
echo Profile not found make sure it exists and it's named "Profiles\5.profile"
GOTO error
)

del "ChilloutVR_Data\autologin.profile"

copy /Y "Profiles\5.profile" "ChilloutVR_Data"

rename "ChilloutVR_Data\5.profile" "autologin.profile"

start ChilloutVR.exe

GOTO no

:6
IF NOT exist "Profiles\6.profile" (
echo Profile not found make sure it exists and it's named "Profiles\6.profile"
GOTO error
)

del "ChilloutVR_Data\autologin.profile"

copy /Y "Profiles\6.profile" "ChilloutVR_Data"

rename "ChilloutVR_Data\6.profile" "autologin.profile"

start ChilloutVR.exe

GOTO no

:error
echo an error accured make sure you did everything right.
pause

:no
exit 0

pause