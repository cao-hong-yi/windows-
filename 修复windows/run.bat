@echo off
echo 使用此工具可修复大部分系统问题
cls
pause
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
