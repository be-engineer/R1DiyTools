@echo off
title һ����װ���

:connect
set type=-e
set /p ip=����������ip����������������usb��:
echo %ip%|findstr /v usb >nul||set type=-d
echo %ip%|findstr /v x >nul||goto connect_success
echo %ip%|findstr /v usb >nul||goto connect_usb
goto connect_ip

:connect_usb
echo ��������adb���̣��˴���ɺ��ԣ�������
taskkill /f /t /im adb.exe>nul
echo ��ʼ�����豸������
adb %type% usb
goto connect_success

:connect_ip
echo ��������adb���̣��˴���ɺ��ԣ�������
taskkill /f /t /im adb.exe>nul
echo ��ʼ�����豸������
adb %type% connect %ip%
goto connect_success

:connect_success
adb %type% devices|findstr /i "\<device\>" >nul||goto connect_fail
echo ���ӳɹ���
adb %type% shell settings put secure install_non_market_apps 1>nul
goto install
pause >nul
exit
:connect_fail
echo �����豸ʧ�ܣ��밴��������ԣ�
pause >nul
goto connect


:install
set /p apk=������Ҫ��װ�����(����reboot�������豸):
echo %apk%|findstr /v reboot >nul||goto reboot
echo %apk%|findstr /i "\<*.apk\>" >nul||goto file_error
echo %apk%|findstr /v \ >nul||goto is_path
echo %apk%|findstr /v \/ >nul||goto is_path
if not exist %apk% goto file_not
echo ��ʼ�ϴ�%apk%������
adb %type% push %apk% /data/local/tmp/ > tmp
type tmp|findstr /i "\<file.pushed\>"||goto upload_fail
echo �ϴ��ɹ�����ʼ��װ������
adb %type% shell /system/bin/pm install -r /data/local/tmp/%apk% > tmp
type tmp|findstr /i "\<Success\>"||goto install_fail
del tmp
echo ��װ�ɹ���
echo ɾ�����ϴ��İ�װ��������
adb %type% shell rm /data/local/tmp/%apk%

echo %apk%|findstr /v new_EchoService||goto start_EchoService
echo %apk%|findstr /v new_Unisound||goto start_Unisound
echo �밴��������أ�
pause >nul
goto install

:file_error
echo ��apk�ļ���
goto install

:is_path
echo ���ܴ���·����ֻ�����ļ������ɣ�
goto install

:file_not
echo ��ǰĿ¼��δ�ҵ�%apk%��
goto install

:upload_fail
echo �ϴ�%apk%ʧ�ܣ�
echo ������룺
type tmp
del tmp
goto install

:install_fail

echo ��װʧ�ܣ�
echo ������룺
type tmp
del tmp
echo ɾ�����ϴ��İ�װ��������
adb %type% shell rm /data/local/tmp/%apk%
goto install

:reboot
echo �����豸������
adb %type% reboot
echo �밴������˳�������
pause >nul
exit

:start_EchoService
echo ����new_EchoService���񡣡���
adb %type% shell am startservice com.phicomm.speaker.player/.EchoService
echo �밴��������أ�
pause >nul
goto install

:start_Unisound
echo ����new_Unisound������
adb %type% shell am start com.phicomm.speaker.device/.ui.MainActivity
echo �밴��������أ�
pause >nul
goto install

