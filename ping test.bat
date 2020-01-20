:: SOME VARIABLES REPLACED BY DUMMY1, DUMMY2, FOO1~FOO6 for security reasons

:: this batch file pings all the stores in stores1.txt and stores2.txt once
:: if you want to ping more than once
:: change ping !ip! -n 1 | find "Average">>ping-%logdate%-%logtime%.log
:: to ping !ip! -n THENUMBERYOUWANT | find "Average">>ping-%logdate%-%logtime%.log
:: FOR BOTH for loops (ping !ip! -t does not work in this script)

@echo off
set logdate=%date:/=-%
set temp=%time::=%
set temp2=%temp:.=%
set logtime=%temp2: =0%
echo ############ %logdate% %time% ############>>ping-%logdate%-%logtime%.log
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "tokens=1" %%n IN (stores1.txt) DO (
    echo * Store # %%n>>ping-%logdate%-%logtime%.log
    set /a var=%%n-DUMMY1
    set ip=FOO1.FOO2.!var!.FOO3
    ping !ip! -n 1 | findstr "Average timed unreachable TTL">>ping-%logdate%-%logtime%.log
    echo === Store # %%n [!ip!] pinged ===
)
:: Using two loops because the company uses two set of ip ranges
FOR /F "tokens=1" %%n IN (stores2.txt) DO (
    echo * Store # %%n>>ping-%logdate%-%logtime%.log
    set /a var=%%n-DUMMY2
    set ip=FOO4.FOO5.!var!.FOO6
    ping !ip! -n 1 | findstr "Average timed unreachable TTL">>ping-%logdate%-%logtime%.log
    echo === Store # %%n [!ip!] pinged ===
)
echo.

echo Output file has be generated with name [ping-%logdate%-%logtime%.log]
echo.

ping-%logdate%-%logtime%.log

PAUSE
