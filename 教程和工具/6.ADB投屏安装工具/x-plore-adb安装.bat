@echo off
echo ��װx-plore     BY���ž�����
adb shell settings put secure install_non_market_apps 1
echo �ȴ��Զ��رա�
adb push X-plore-v4.00.10.apk /data/local/tmp/
adb shell /system/bin/pm install -t /data/local/tmp/X-plore-v4.00.10.apk
echo ��ɺ���Ͷ������x-plore��
