@echo off
echo R1-DLNA�����װ��������
echo *
echo ����װN1��ȡDLNA�����R1����������
echo *
adb kill-server
adb start-server
echo ��Ҫ�鿴R1��IP��ַ
set /p ip=������IP��ַ��
if "%ip%" == "" echo ��ʾ����������ȷ��IP��ַ
echo ��ʼͨ���������ADB���ӡ���
echo *
adb connect %ip%
echo *
adb shell settings put secure install_non_market_apps 1
echo *
echo ��װ���ϴ��С���
adb push R1-Dlna.apk /data/local/tmp/
echo *
echo Ӧ�ó���װ�С���
adb shell /system/bin/pm install -t /data/local/tmp/R1-Dlna.apk

echo DLNA���������
adb shell am start -n com.droidlogic.mediacenter/.MediaCenterActivity
echo *
adb shell input tap 150 150 && echo *
adb shell input tap 673 85 && echo *
adb shell input tap 673 158 && echo OK
echo ������ 11.png �鿴�Ƿ��ѿ���ѡ��
echo *
adb shell screencap -p /data/local/tmp/11.png
echo ͼƬ�����С���
adb pull /data/local/tmp/11.png
echo *
adb shell rm /data/local/tmp/11.png
echo ����ͼƬ������
echo ���м���Ƿ�ɹ�����
echo *

echo AirPlayer���������
adb shell input tap 150 215 && echo *
adb shell input tap 673 85 && echo *
adb shell input tap 673 158 && echo OK
echo ������ 22.png �鿴�Ƿ��ѿ���ѡ��
echo *
adb shell screencap -p /data/local/tmp/22.png
echo ͼƬ�����С���
adb pull /data/local/tmp/22.png
echo *
adb shell rm /data/local/tmp/22.png
echo ����ͼƬ������
echo ���м���Ƿ�ɹ�����
echo *

echo �޸�DLNA����
adb shell input tap 150 290 && echo *
adb shell input tap 500 80 && echo *
adb shell input keyevent 112 && echo *
set /p dlnaname=������DLNA���ƣ�
adb shell input text "%dlnaname%"
adb shell input tap 410 158 && echo OK
echo ������ 33.png �鿴�Ƿ��ѿ���ѡ��
echo *
adb shell screencap -p /data/local/tmp/33.png
echo ͼƬ�����С���
adb pull /data/local/tmp/33.png
echo *
adb shell rm /data/local/tmp/33.png
echo ����ͼƬ������
echo ���м���Ƿ�ɹ��޸�
echo *

:end
echo ��������˳�...
pause > nul
