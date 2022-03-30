@echo off
title 一键安装软件

:connect
set type=-e
set /p ip=请输入音箱ip（有线连接请输入usb）:
echo %ip%|findstr /v usb >nul||set type=-d
echo %ip%|findstr /v x >nul||goto connect_success
echo %ip%|findstr /v usb >nul||goto connect_usb
goto connect_ip

:connect_usb
echo 结束所有adb进程（此错误可忽略）。。。
taskkill /f /t /im adb.exe>nul
echo 开始连接设备。。。
adb %type% usb
goto connect_success

:connect_ip
echo 结束所有adb进程（此错误可忽略）。。。
taskkill /f /t /im adb.exe>nul
echo 开始连接设备。。。
adb %type% connect %ip%
goto connect_success

:connect_success
adb %type% devices|findstr /i "\<device\>" >nul||goto connect_fail
echo 连接成功！
adb %type% shell settings put secure install_non_market_apps 1>nul
goto install
pause >nul
exit
:connect_fail
echo 连接设备失败，请按任意键重试！
pause >nul
goto connect


:install
set /p apk=请输入要安装的软件(输入reboot可重启设备):
echo %apk%|findstr /v reboot >nul||goto reboot
echo %apk%|findstr /i "\<*.apk\>" >nul||goto file_error
echo %apk%|findstr /v \ >nul||goto is_path
echo %apk%|findstr /v \/ >nul||goto is_path
if not exist %apk% goto file_not
echo 开始上传%apk%。。。
adb %type% push %apk% /data/local/tmp/ > tmp
type tmp|findstr /i "\<file.pushed\>"||goto upload_fail
echo 上传成功，开始安装。。。
adb %type% shell /system/bin/pm install -r /data/local/tmp/%apk% > tmp
type tmp|findstr /i "\<Success\>"||goto install_fail
del tmp
echo 安装成功！
echo 删除已上传的安装包。。。
adb %type% shell rm /data/local/tmp/%apk%

echo %apk%|findstr /v new_EchoService||goto start_EchoService
echo %apk%|findstr /v new_Unisound||goto start_Unisound
echo 请按任意键返回！
pause >nul
goto install

:file_error
echo 非apk文件！
goto install

:is_path
echo 不能带有路径，只输入文件名即可！
goto install

:file_not
echo 当前目录下未找到%apk%！
goto install

:upload_fail
echo 上传%apk%失败！
echo 错误代码：
type tmp
del tmp
goto install

:install_fail

echo 安装失败！
echo 错误代码：
type tmp
del tmp
echo 删除已上传的安装包。。。
adb %type% shell rm /data/local/tmp/%apk%
goto install

:reboot
echo 重启设备。。。
adb %type% reboot
echo 请按任意键退出。。。
pause >nul
exit

:start_EchoService
echo 启动new_EchoService服务。。。
adb %type% shell am startservice com.phicomm.speaker.player/.EchoService
echo 请按任意键返回！
pause >nul
goto install

:start_Unisound
echo 启动new_Unisound。。。
adb %type% shell am start com.phicomm.speaker.device/.ui.MainActivity
echo 请按任意键返回！
pause >nul
goto install

