echo off

set maxbytesize=100000

echo Limiting file size to >= %maxsize% bytes.
echo Navigating to Assets folder

if exist "%UserProfile%\Pictures\Spotlight-Photos" (
	echo Folder exist. Begin copying... 
) else (
	echo Folder does not exist creating...
	mkdir %UserProfile%\Pictures\Spotlight-Photos
)

forfiles /p %LocalAppData%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets /c "cmd /c echo off && for %%c in (@file) do (if %%~zc GEQ %maxbytesize% ( echo Copying %%~c && copy %%~c %UserProfile%\Pictures\Spotlight-Photos\%%~c.jpg >NUL ) else ( echo %%~c is probably an icon. Skipping ) )"

echo. && echo.
echo Due to limited CMD capabillities, manually check for possible icon files in the folder. && echo.
echo Images copied to %UserProfile%\Pictures\Spotlight-Photos
echo.
pause