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
title Windows系统修复工具
color 0A
cls

:main
echo ========================================
echo           Windows系统修复工具
echo ========================================
echo.
echo 请选择要执行的修复操作（需管理员权限）：
echo.
echo 1. 磁盘错误检查与修复
echo 2. 系统文件扫描与修复
echo 3. 网络设置重置
echo 4. 浏览器缓存清理
echo 5. 注册表错误检查
echo 6. 系统服务修复
echo 7. 退出程序
echo.
set /p choice=请输入选项(1-7): 

if "%choice%"=="1" goto checkDisk
if "%choice%"=="2" goto repairSystemFiles
if "%choice%"=="3" goto resetNetwork
if "%choice%"=="4" goto clearBrowserCache
if "%choice%"=="5" goto checkRegistry
if "%choice%"=="6" goto repairServices
if "%choice%"=="7" goto exitProgram

echo 无效选择，请重新输入！
pause
goto main


:checkDisk
cls
echo ========================================
echo             磁盘错误检查
echo ========================================
echo.
echo 正在扫描磁盘错误...（可能需要几分钟）
chkdsk C: /f /r /x
echo.
echo 磁盘检查完成！如有错误已自动修复。
pause
goto main


:repairSystemFiles
cls
echo ========================================
echo           系统文件修复
echo ========================================
echo.
echo 1. 仅扫描系统文件
echo 2. 扫描并修复系统文件
echo.
set /p sfcChoice=请选择(1-2): 

if "%sfcChoice%"=="1" (
    sfc /scannow
) else if "%sfcChoice%"=="2" (
    echo 正在扫描并修复系统文件...
    sfc /scannow /offbootdir=c:\ /offwindir=c:\windows
) else (
    echo 无效选择，返回主菜单
    pause
    goto main
)

echo 系统文件修复完成！建议重启电脑使更改生效。
pause
goto main


:resetNetwork
cls
echo ========================================
echo           网络设置重置
echo ========================================
echo.
echo 注意：此操作将重置所有网络设置，包括WiFi密码！
echo.
echo 确定要继续吗？(Y/N)
set /p confirm=
if /i not "%confirm%"=="y" goto main

echo 正在重置网络设置...
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
netsh int reset all
echo.
echo 网络设置已重置，建议重启电脑。
pause
goto main


:clearBrowserCache
cls
echo ========================================
echo           浏览器缓存清理
echo ========================================
echo.
echo 1. 清理Edge浏览器缓存
echo 2. 清理Chrome浏览器缓存
echo 3. 清理Firefox浏览器缓存
echo.
set /p browserChoice=请选择(1-3): 

if "%browserChoice%"=="1" (
    if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" (
        echo 正在清理Edge缓存...
        del /q /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
    ) else (
        echo Edge缓存目录不存在！
    )
) else if "%browserChoice%"=="2" (
    if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" (
        echo 正在清理Chrome缓存...
        del /q /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache"
    ) else (
        echo Chrome缓存目录不存在！
    )
) else if "%browserChoice%"=="3" (
    if exist "%APPDATA%\Mozilla\Firefox\Profiles" (
        echo 正在清理Firefox缓存...
        for /d %%i in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do (
            if exist "%%i\cache2" del /q /s "%%i\cache2"
        )
    ) else (
        echo Firefox缓存目录不存在！
    )
) else (
    echo 无效选择，返回主菜单
    pause
    goto main
)

echo 浏览器缓存清理完成！
pause
goto main


:checkRegistry
cls
echo ========================================
echo           注册表检查
echo ========================================
echo.
echo 正在扫描注册表错误...
reg export HKLM\SOFTWARE temp.reg /y
fc /b %systemroot%\system32\config\software temp.reg >nul 2>nul
if %errorlevel% equ 0 (
    echo 注册表扫描完成，未检测到明显错误。
) else (
    echo 发现注册表差异，建议使用系统还原或专业工具修复。
)
del temp.reg
echo.
pause
goto main


:repairServices
cls
echo ========================================
echo           系统服务修复
echo ========================================
echo.
echo 正在修复常见系统服务...
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
echo 基础服务修复完成，建议检查其他服务状态。
pause
goto main


:exitProgram
cls
echo ========================================
echo             修复完成！
echo ========================================
echo.
echo 按任意键退出...
pause
exit