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
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZks0
::ZQ05rAF9IBncCkqN+0xwdVsFAlTi
::ZQ05rAF9IAHYFVzEqQIiPRU0
::eg0/rx1wNQPfEVWB+kM9LVsJDBaXMgs=
::fBEirQZwNQPfEVWB+kM9LVsJDAePOAs=
::cRolqwZ3JBvQF1fEqQIHIRVQQxORuLR0g3HxbT8+ag9Qwg==
::dhA7uBVwLU+EWFqF+yI=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFEIAGlXbAE+/Fb4I5/jH/f+J7EgFUYI=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

:: �˴�������Ҫ����ԱȨ�޵�����
echo �ѻ�ȡ����ԱȨ�ޣ�����ִ������...
cls
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
