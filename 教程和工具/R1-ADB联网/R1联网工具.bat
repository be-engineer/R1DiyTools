@echo off
echo adb-join-wifi��������
echo *
echo ��R1������ť��������������״̬����ʱR1�ᷢ��wifi�źţ��������wifi��
echo Ȼ��������²���������
echo *
set /p wifid=������wifi���ƣ�
set /p wifrd=������wifi���룺
echo *
adb kill-server
adb start-server

echo ��ʼͨ��ADB���ӽ����������á���
echo *
adb connect 192.168.43.1
echo *
adb shell settings put secure install_non_market_apps 1
echo *
adb push adb-join-wifi-1.0.1.apk /data/local/tmp/
echo *
adb shell /system/bin/pm install -t /data/local/tmp/adb-join-wifi-1.0.1.apk
echo *
adb shell am start -n com.steinwurf.adbjoinwifi/.MainActivity -e ssid %wifid% -e password_type WPA -e password %wifrd%
echo *
echo R1���������С�
echo *
echo R1����������ͼƬ���ơ������磺1��
set /p phname=�������ļ�����
echo *
adb shell screencap -p /data/local/tmp/%phname%.png
echo ͼƬ�����С���
adb pull /data/local/tmp/%phname%.png
echo *
adb shell rm /data/local/tmp/%phname%.png
echo ����ͼƬ������
echo *
echo ���м�� ���� �Ƿ�ɹ�
echo *
echo �ɹ��� ���� R1 ������ť �˳�����״̬ ���ɡ�
echo *

:end
echo ��������˳�...
pause > nul



