@echo OFF
adb shell settings put secure install_non_market_apps 1
echo ���װС��2020-01-17     BY��Leon
echo �ȴ��Զ��رա�

adb push qqyinyue.apk /data/local/tmp/
adb shell /system/bin/pm install -t /data/local/tmp/qqyinyue.apk
echo ��ɺ���Ͷ������С���������С�
adb reboot
