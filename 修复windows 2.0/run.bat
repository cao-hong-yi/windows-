@echo off&color 0A&setlocal EnableDelayedExpansion&set "bd=bcdedit"&set "bs=bcdedit /set"&set "WS=!Windir!\System32"
PUSHD "%~DP0"&CD /D "%~DP0"&mode con COLS=80 LINES=24&title CMDPE安装器
if exist "!WS!\find.exe" (set "Find=find") else set "Find=findstr"
"!WS!\FLTMC.exe">nul 2>nul||cls&&echo.&&echo.请右击鼠标以管理员身份运行本工具，请按任意键退出...&&pause>nul&&exit
echo 使用此工具可修复大部分系统问题
echo Window磁盘修复工具
echo 磁盘修复工具
chkdsk C: /f /r
cls
pause
echo Window系统修复工具
echo 系统修复工具 
sfc /SCANNOW
pause
cls
echo Window映像修复工具
echo 映像修复工具
DISM /Online /Cleanup-Image /RestoreHealth
pause
cls
exit
