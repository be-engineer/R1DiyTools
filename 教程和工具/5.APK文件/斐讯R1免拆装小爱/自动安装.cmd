@echo OFF
ECHO Ҫɾ��һЩ����
echo ���װС��2020-01-17     BY���ž�����
adb shell settings put secure install_non_market_apps 1
adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.airskill
adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.player
adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.exceptionreporter
adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.ijetty
adb shell /system/bin/pm  uninstall --user 0 com.android.keychain
adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.launcher
adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.netctl
adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.otaservice
adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.systemtool
adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.device
REM adb shell /system/bin/pm  uninstall --user 0 com.android.providers.downloads
REM adb shell /system/bin/pm  uninstall --user 0 com.android.location.fused
REM adb shell /system/bin/pm  uninstall --user 0 com.android.inputdevices
REM adb shell /system/bin/pm  uninstall --user 0 com.android.server.telecom
REM adb shell /system/bin/pm  uninstall --user 0 com.android.providers.telephony
REM adb shell /system/bin/pm  uninstall --user 0 com.android.vpndialogs
REM adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.productiontest
REM adb shell /system/bin/pm  uninstall --user 0 com.phicomm.speaker.bugreport
REM adb shell /system/bin/pm  uninstall --user 0 com.android.bluetooth
REM adb shell /system/bin/pm  uninstall com.xiaomi.xiaoailite
echo �ȴ��Զ��رա�
rem adb push kaiji.apk /data/local/tmp/
REM adb push xiaoai.apk /data/local/tmp/
REM adb push QQyinyuecar-1.9.5.18.apk /data/local/tmp/
rem adb shell /system/bin/pm install -t /data/local/tmp/kaiji.apk
REM adb shell /system/bin/pm install -t /data/local/tmp/xiaoai.apk
REM adb shell /system/bin/pm install -t /data/local/tmp/QQyinyuecar-1.9.5.18.apk
echo reboot...
adb reboot
echo ��ɺ���Ͷ������С���������С�
