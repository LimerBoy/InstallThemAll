@echo off
chcp 65001 

:: Restart with admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Elevating...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: Some shit
set tmpDir=%temp%\Installer
set "download=bitsadmin /transfer DownloadFile /download /priority foreground"

:: Create temp dir
if not exist "%tmpDir%" (
    mkdir "%tmpDir%" >nul 2>&1
)

:: Install WinRar
title Installing WinRar ...
set "winRarUrl=https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-711.exe"
set "winRarTmp=%tmpDir%\winrar.exe"
%download% "%winRarUrl%" "%winRarTmp%"
"%winRarTmp%" /S

:: Activate WinRar
set "licensePath=%AppData%\WinRAR"
mkdir "%licensePath%" >nul 2>&1
>%licensePath%\rarreg.key (
	echo RAR registration data
	echo Hardik
	echo www.Hardik.live
	echo UID=448c4a899c6cdc1039c5
	echo 641221225039c585fc5ef8da12ccf689780883109587752a828ff0
	echo 59ae0579fe68942c97d160f361d16f96c8fe03f1f89c66abc25a37
	echo 7777a27ec82f103b3d8e05dcefeaa45c71675ca822242858a1c897
	echo c57d0b0a3fe7ac36c517b1d2be385dcc726039e5f536439a806c35
	echo 1e180e47e6bf51febac6eaae111343d85015dbd59ba45c71675ca8
	echo 2224285927550547c74c826eade52bbdb578741acc1565af60e326
	echo 6b5e5eaa169647277b533e8c4ac01535547d1dee14411061928023
)

