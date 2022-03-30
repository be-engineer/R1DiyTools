@echo off
echo R1-DLNA软件安装自启工具
echo *
echo 将安装N1提取DLNA软件到R1并打开自启动
echo *
adb kill-server
adb start-server
echo 需要查看R1的IP地址
set /p ip=请输入IP地址：
if "%ip%" == "" echo 提示：请输入正确的IP地址
echo 开始通过网络进行ADB连接……
echo *
adb connect %ip%
echo *
adb shell settings put secure install_non_market_apps 1
echo *
echo 安装包上传中……
adb push R1-Dlna.apk /data/local/tmp/
echo *
echo 应用程序安装中……
adb shell /system/bin/pm install -t /data/local/tmp/R1-Dlna.apk

echo DLNA软件打开自启
adb shell am start -n com.droidlogic.mediacenter/.MediaCenterActivity
echo *
adb shell input tap 150 150 && echo *
adb shell input tap 673 85 && echo *
adb shell input tap 673 158 && echo OK
echo 截屏中 11.png 查看是否已开启选项
echo *
adb shell screencap -p /data/local/tmp/11.png
echo 图片下载中……
adb pull /data/local/tmp/11.png
echo *
adb shell rm /data/local/tmp/11.png
echo 缓存图片已清理
echo 自行检查是否成功开启
echo *

echo AirPlayer软件打开自启
adb shell input tap 150 215 && echo *
adb shell input tap 673 85 && echo *
adb shell input tap 673 158 && echo OK
echo 截屏中 22.png 查看是否已开启选项
echo *
adb shell screencap -p /data/local/tmp/22.png
echo 图片下载中……
adb pull /data/local/tmp/22.png
echo *
adb shell rm /data/local/tmp/22.png
echo 缓存图片已清理
echo 自行检查是否成功开启
echo *

echo 修改DLNA名称
adb shell input tap 150 290 && echo *
adb shell input tap 500 80 && echo *
adb shell input keyevent 112 && echo *
set /p dlnaname=请输入DLNA名称：
adb shell input text "%dlnaname%"
adb shell input tap 410 158 && echo OK
echo 截屏中 33.png 查看是否已开启选项
echo *
adb shell screencap -p /data/local/tmp/33.png
echo 图片下载中……
adb pull /data/local/tmp/33.png
echo *
adb shell rm /data/local/tmp/33.png
echo 缓存图片已清理
echo 自行检查是否成功修改
echo *

:end
echo 按任意键退出...
pause > nul
