::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFEIAGlXbAE+/Fb4I5/jHazVJJ4nwQ+sxfIDMyfTdbrAv+FDqO5M10xo=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Windowsϵͳ�޸�����
color 0A
cls

:main
echo ========================================
echo           Windowsϵͳ�޸�����
echo ========================================
echo.
echo ��ѡ��Ҫִ�е��޸������������ԱȨ�ޣ���
echo.
echo 1. ���̴��������޸�
echo 2. ϵͳ�ļ�ɨ�����޸�
echo 3. ������������
echo 4. �������������
echo 5. ע��������
echo 6. ϵͳ�����޸�
echo 7. �˳�����
echo.
set /p choice=������ѡ��(1-7): 

if "%choice%"=="1" goto checkDisk
if "%choice%"=="2" goto repairSystemFiles
if "%choice%"=="3" goto resetNetwork
if "%choice%"=="4" goto clearBrowserCache
if "%choice%"=="5" goto checkRegistry
if "%choice%"=="6" goto repairServices
if "%choice%"=="7" goto exitProgram

echo ��Чѡ�����������룡
pause
goto main


:checkDisk
cls
echo ========================================
echo             ���̴�����
echo ========================================
echo.
echo ����ɨ����̴���...��������Ҫ�����ӣ�
chkdsk C: /f /r /x
echo.
echo ���̼����ɣ����д������Զ��޸���
pause
goto main


:repairSystemFiles
cls
echo ========================================
echo           ϵͳ�ļ��޸�
echo ========================================
echo.
echo 1. ��ɨ��ϵͳ�ļ�
echo 2. ɨ�貢�޸�ϵͳ�ļ�
echo.
set /p sfcChoice=��ѡ��(1-2): 

if "%sfcChoice%"=="1" (
    sfc /scannow
) else if "%sfcChoice%"=="2" (
    echo ����ɨ�貢�޸�ϵͳ�ļ�...
    sfc /scannow /offbootdir=c:\ /offwindir=c:\windows
) else (
    echo ��Чѡ�񣬷������˵�
    pause
    goto main
)

echo ϵͳ�ļ��޸���ɣ�������������ʹ������Ч��
pause
goto main


:resetNetwork
cls
echo ========================================
echo           ������������
echo ========================================
echo.
echo ע�⣺�˲��������������������ã�����WiFi���룡
echo.
echo ȷ��Ҫ������(Y/N)
set /p confirm=
if /i not "%confirm%"=="y" goto main

echo ����������������...
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
netsh int reset all
echo.
echo �������������ã������������ԡ�
pause
goto main


:clearBrowserCache
cls
echo ========================================
echo           �������������
echo ========================================
echo.
echo 1. ����Edge���������
echo 2. ����Chrome���������
echo 3. ����Firefox���������
echo.
set /p browserChoice=��ѡ��(1-3): 

if "%browserChoice%"=="1" (
    if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" (
        echo ��������Edge����...
        del /q /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
    ) else (
        echo Edge����Ŀ¼�����ڣ�
    )
) else if "%browserChoice%"=="2" (
    if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" (
        echo ��������Chrome����...
        del /q /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache"
    ) else (
        echo Chrome����Ŀ¼�����ڣ�
    )
) else if "%browserChoice%"=="3" (
    if exist "%APPDATA%\Mozilla\Firefox\Profiles" (
        echo ��������Firefox����...
        for /d %%i in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do (
            if exist "%%i\cache2" del /q /s "%%i\cache2"
        )
    ) else (
        echo Firefox����Ŀ¼�����ڣ�
    )
) else (
    echo ��Чѡ�񣬷������˵�
    pause
    goto main
)

echo ���������������ɣ�
pause
goto main


:checkRegistry
cls
echo ========================================
echo           ע�����
echo ========================================
echo.
echo ����ɨ��ע������...
reg export HKLM\SOFTWARE temp.reg /y
fc /b %systemroot%\system32\config\software temp.reg >nul 2>nul
if %errorlevel% equ 0 (
    echo ע���ɨ����ɣ�δ��⵽���Դ���
) else (
    echo ����ע�����죬����ʹ��ϵͳ��ԭ��רҵ�����޸���
)
del temp.reg
echo.
pause
goto main


:repairServices
cls
echo ========================================
echo           ϵͳ�����޸�
echo ========================================
echo.
echo �����޸�����ϵͳ����...
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
ren %systemroot%\SoftwareDistribution SoftwareDistribution.old
ren %systemroot%\system32\catroot2 catroot2.old
net start wuauserv
net start cryptSvc
net start bits
net start msiserver
echo.
echo ���������޸���ɣ���������������״̬��
pause
goto main


:exitProgram
cls
echo ========================================
echo             �޸���ɣ�
echo ========================================
echo.
echo ��������˳�...
pause
exit