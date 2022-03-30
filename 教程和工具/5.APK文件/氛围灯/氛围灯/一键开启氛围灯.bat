@echo off
echo 一键安装氛围灯
echo ---------------------
set /p ip=请输入音箱IP：

adb kill-server
adb start-server

echo 开始通过ADB连接

adb connect %ip%

echo 允许安装第三方应用
adb shell settings put secure install_non_market_apps 1

echo 上传程序包
adb push EchoService.apk /mnt/internal_sd/

echo 安装程序包
adb shell /system/bin/pm install -r /mnt/internal_sd/EchoService.apk

echo 删除程序包
adb shell rm /mnt/internal_sd/EchoService.apk

echo 重启设备
echo 等待设备重启后请通过语音“小讯小讯，氛围灯”来开启氛围灯
adb reboot

:end
echo 按任意键退出...
pause > nul
