@echo off

setlocal

rem ****************************************************
rem If the specified process reaches the maximum number of processes, all the processes are killed.
rem ****************************************************

rem Specify a process name
set process_excel=EXCEL.EXE
set process_firefox=firefox.exe

rem Specify the maximum number of processes.
set excel_process_upper_limit=1
set firefox_process_upper_limit=1

rem Grep the process name from the task list and get the number of processes.
for /F "usebackq" %%s in (`tasklist ^| grep -c ^"%process_excel%^"`) do set process_count_excel=%%s
for /F "usebackq" %%s in (`tasklist ^| grep -c ^"%process_firefox%^"`) do set process_count_firefox=%%s
echo EXCEL.EXE %process_count_excel%
echo firefox.exe %process_count_firefox%

rem If the maximum number of processes has been reached, kill
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
