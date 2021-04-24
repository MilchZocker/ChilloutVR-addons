echo off

:: check for config file

   IF EXIST "max_age.cvr" (
 
      GOTO exists
   )

)

:: ask for time var

echo select time in days:
set /P time=
)
Echo %time% > max_age.cvr
)
:exists
)

:: read from file

set /P time= < max_age.cvr

forfiles /p "ChilloutVR_Data\Avatars" /s /m *.* /D -%time% /C "cmd /c del @path"
forfiles /p "ChilloutVR_Data\Worlds" /s /m *.* /D -%time% /C "cmd /c del @path"
forfiles /p "ChilloutVR_Data\Spawnables" /s /m *.* /D -%time% /C "cmd /c del @path"

exit