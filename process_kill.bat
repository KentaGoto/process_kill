@echo off

setlocal

rem ****************************************************
rem 指定のプロセスが指定の上限数に達していたら全部kill
rem ****************************************************

rem プロセス名を指定
set process_excel=EXCEL.EXE
set process_firefox=firefox.exe

rem プロセス数の上限値を指定
set excel_process_upper_limit=1
set firefox_process_upper_limit=1

rem タスクリストからプロセス名をgrepしてプロセス数を取得
for /F "usebackq" %%s in (`tasklist ^| grep -c ^"%process_excel%^"`) do set process_count_excel=%%s
for /F "usebackq" %%s in (`tasklist ^| grep -c ^"%process_firefox%^"`) do set process_count_firefox=%%s
echo EXCEL.EXE %process_count_excel%
echo firefox.exe %process_count_firefox%

rem プロセス数が上限数に達していたらkill
if %excel_process_upper_limit% leq %process_count_excel% (
    echo EXCEL.exeをkillする
    echo %date% %time% >> Log.txt
    taskkill /im %process_excel% /f >> Log.txt
    echo. >> Log.txt
)else (
	echo OK
)
if %firefox_process_upper_limit% leq %process_count_firefox% (
	echo firefox.exeをkillする
	echo %date% %time% >> Log.txt
    taskkill /im %process_firefox% /f >> Log.txt
    echo. >> Log.txt
)else (
    echo OK
)

endlocal

rem pause > nul

exit