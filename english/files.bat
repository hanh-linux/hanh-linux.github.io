@echo off
setlocal

:: Set the name of the output HTML file
set "outputFile=index.html"

:: 1. Start the HTML file (Header)
echo Generating %outputFile%...
echo ^<!DOCTYPE html^> > "%outputFile%"
echo ^<html^> >> "%outputFile%"
echo ^<head^> >> "%outputFile%"
echo    ^<title^>File Directory^</title^> >> "%outputFile%"
echo    ^<style^>body{font-family:sans-serif; padding:20px;} a{text-decoration:none; color:#0366d6;} a:hover{text-decoration:underline;} li{margin-bottom:5px;}^</style^> >> "%outputFile%"
echo ^</head^> >> "%outputFile%"
echo ^<body^> >> "%outputFile%"
echo ^<h1^>Files in this Directory^</h1^> >> "%outputFile%"
echo ^<hr^> >> "%outputFile%"
echo ^<ul^> >> "%outputFile%"

:: 2. Loop through files and add links
:: %~nx0 is the name of this batch file
for %%f in (*.*) do (
    REM Check if the file is NOT the output HTML and NOT this batch script
    if /I not "%%f"=="%outputFile%" (
        if /I not "%%f"=="%~nx0" (
            echo    ^<li^>^<a href="%%f"^>%%f^</a^>^</li^> >> "%outputFile%"
        )
    )
)

:: 3. Close the HTML file (Footer)
echo ^</ul^> >> "%outputFile%"
echo ^</body^> >> "%outputFile%"
echo ^</html^> >> "%outputFile%"

echo.
echo Success! Open %outputFile% to see your links.
pause