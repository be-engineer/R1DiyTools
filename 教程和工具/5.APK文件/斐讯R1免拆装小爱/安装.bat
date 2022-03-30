@echo OFF
adb shell settings put secure install_non_market_apps 1
echo 免拆装小爱2020-01-17     BY：Leon
echo 等待自动关闭。

adb push qqyinyue.apk /data/local/tmp/
adb shell /system/bin/pm install -t /data/local/tmp/qqyinyue.apk
echo 完成后请投屏设置小爱开机运行。
adb reboot
