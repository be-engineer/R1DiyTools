@echo off
echo һ����װ��Χ��
echo ---------------------
set /p ip=����������IP��

adb kill-server
adb start-server

echo ��ʼͨ��ADB����

adb connect %ip%

echo ����װ������Ӧ��
adb shell settings put secure install_non_market_apps 1

echo �ϴ������
adb push EchoService.apk /mnt/internal_sd/

echo ��װ�����
adb shell /system/bin/pm install -r /mnt/internal_sd/EchoService.apk

echo ɾ�������
adb shell rm /mnt/internal_sd/EchoService.apk

echo �����豸
echo �ȴ��豸��������ͨ��������СѶСѶ����Χ�ơ���������Χ��
adb reboot

:end
echo ��������˳�...
pause > nul
