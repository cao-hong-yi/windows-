@echo off
echo ʹ�ô˹��߿��޸��󲿷�ϵͳ����
cls
pause
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
