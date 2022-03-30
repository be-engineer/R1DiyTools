@echo off
echo adb-join-wifi配网工具
echo *
echo 将R1顶部按钮长按，进入配网状态，此时R1会发射wifi信号，连接这个wifi。
echo 然后进行如下操作配网。
echo *
set /p wifid=请输入wifi名称：
set /p wifrd=请输入wifi密码：
echo *
adb kill-server
adb start-server

echo 开始通过ADB连接进行网络配置……
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
echo R1配网连接中。
echo *
echo R1截屏中输入图片名称。（例如：1）
set /p phname=请输入文件名：
echo *
adb shell screencap -p /data/local/tmp/%phname%.png
echo 图片下载中……
adb pull /data/local/tmp/%phname%.png
echo *
adb shell rm /data/local/tmp/%phname%.png
echo 缓存图片已清理
echo *
echo 自行检查 配网 是否成功
echo *
echo 成功后 单击 R1 顶部按钮 退出配网状态 即可。
echo *

:end
echo 按任意键退出...
pause > nul



