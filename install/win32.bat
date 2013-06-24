@echo off
rem LaTeX package install script
rem Author: Xu Cheng

cd /d "%~dp0"
cd ..

if not defined TEXMFLOCAL (
    for /f "delims=" %%I in ('kpsewhich --var-value=TEXMFLOCAL') do @set TEXMFLOCAL=%%I
)

if /i "%1" == "install"      goto :install
if /i "%1" == "uninstall"    goto :uninstall
goto :help

:install
echo. Install itecreport-zh.cls and itecreport-en.cls template into local.
mkdir "%TEXMFLOCAL%\tex\latex\itecreport\"
xcopy /q /y .\itecreport\itecreport-zh.cls "%TEXMFLOCAL%\tex\latex\itecreport\" > nul
xcopy /q /y .\itecreport\itecreport-en.cls "%TEXMFLOCAL%\tex\latex\itecreport\" > nul
mkdir "%TEXMFLOCAL%\doc\latex\itecreport\"
xcopy /q /y .\itecreport\itecreport.pdf "%TEXMFLOCAL%\doc\latex\itecreport\" > nul
xcopy /q /y .\itecreport\README.md "%TEXMFLOCAL%\doc\latex\itecreport\" > nul
mkdir "%TEXMFLOCAL%\doc\latex\itecreport\example\"
xcopy /q /y .\itecreport\itecreport-zh-example.pdf "%TEXMFLOCAL%\doc\latex\itecreport\example\" > nul
xcopy /q /y .\itecreport\itecreport-zh-example.tex "%TEXMFLOCAL%\doc\latex\itecreport\example\" > nul
xcopy /q /y .\itecreport\itecreport-en-example.pdf "%TEXMFLOCAL%\doc\latex\itecreport\example\" > nul
xcopy /q /y .\itecreport\itecreport-en-example.tex "%TEXMFLOCAL%\doc\latex\itecreport\example\" > nul
xcopy /q /y .\itecreport\fig-example.pdf "%TEXMFLOCAL%\doc\latex\itecreport\example\" > nul
xcopy /q /y .\itecreport\ref-example.bib "%TEXMFLOCAL%\doc\latex\itecreport\example\" > nul
goto :hash

:uninstall
echo. Uninstall itecreport-zh.cls and itecreport-en.cls template.
rd /q /s "%TEXMFLOCAL%\tex\latex\itecreport\"
rd /q /s "%TEXMFLOCAL%\doc\latex\itecreport\"
goto :hash

:hash
echo. Refresh TeX hash database.
texhash
goto :exit

:help
echo Usage:
echo. %~nx0 install          - install itecreport-zh.cls and itecreport-en.cls template into local.
echo. %~nx0 uninstall        - uninstall itecreport-zh.cls and itecreport-en.cls template.
echo.
goto :exit

:exit