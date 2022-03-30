@echo off
echo 安装x-plore     BY：寂静宣言
adb shell settings put secure install_non_market_apps 1
echo 等待自动关闭。
adb push X-plore-v4.00.10.apk /data/local/tmp/
adb shell /system/bin/pm install -t /data/local/tmp/X-plore-v4.00.10.apk
echo 完成后请投屏运行x-plore。
