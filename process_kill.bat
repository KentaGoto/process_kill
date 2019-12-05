@echo off

setlocal

rem ****************************************************
rem �w��̃v���Z�X���w��̏�����ɒB���Ă�����S��kill
rem ****************************************************

rem �v���Z�X�����w��
set process_excel=EXCEL.EXE
set process_firefox=firefox.exe

rem �v���Z�X���̏���l���w��
set excel_process_upper_limit=1
set firefox_process_upper_limit=1

rem �^�X�N���X�g����v���Z�X����grep���ăv���Z�X�����擾
for /F "usebackq" %%s in (`tasklist ^| grep -c ^"%process_excel%^"`) do set process_count_excel=%%s
for /F "usebackq" %%s in (`tasklist ^| grep -c ^"%process_firefox%^"`) do set process_count_firefox=%%s
echo EXCEL.EXE %process_count_excel%
echo firefox.exe %process_count_firefox%

rem �v���Z�X����������ɒB���Ă�����kill
if %excel_process_upper_limit% leq %process_count_excel% (
    echo EXCEL.exe��kill����
    echo %date% %time% >> Log.txt
    taskkill /im %process_excel% /f >> Log.txt
    echo. >> Log.txt
)else (
	echo OK
)
if %firefox_process_upper_limit% leq %process_count_firefox% (
	echo firefox.exe��kill����
	echo %date% %time% >> Log.txt
    taskkill /im %process_firefox% /f >> Log.txt
    echo. >> Log.txt
)else (
    echo OK
)

endlocal

rem pause > nul

exit