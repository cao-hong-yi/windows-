@echo off&color 0A&setlocal EnableDelayedExpansion&set "bd=bcdedit"&set "bs=bcdedit /set"&set "WS=!Windir!\System32"
PUSHD "%~DP0"&CD /D "%~DP0"&mode con COLS=80 LINES=24&title CMDPE��װ��
if exist "!WS!\find.exe" (set "Find=find") else set "Find=findstr"
"!WS!\FLTMC.exe">nul 2>nul||cls&&echo.&&echo.���һ�����Թ���Ա������б����ߣ��밴������˳�...&&pause>nul&&exit
echo ʹ�ô˹��߿��޸��󲿷�ϵͳ����
echo Window�����޸�����
echo �����޸�����
chkdsk C: /f /r
cls
pause
echo Windowϵͳ�޸�����
echo ϵͳ�޸����� 
sfc /SCANNOW
pause
cls
echo Windowӳ���޸�����
echo ӳ���޸�����
DISM /Online /Cleanup-Image /RestoreHealth
pause
cls
exit
