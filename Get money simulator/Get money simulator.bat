@echo off
title Get money simulator

:menu
set /p money=<data\money
set /p cost=<data\cost
set /p increase=<data\increase
cls
echo Menu
echo ----
echo 1. Play
echo 2. Change text color
echo 3. Reset progress
echo 4. Quit to desktop
choice /c 1234 /n
if %errorlevel%==1 call:game
if %errorlevel%==2 call:color
if %errorlevel%==3 call:confirm_reset
if %errorlevel%==4 exit

:color
cls
echo Change text color
echo -----------------
echo 1. White (default)
echo 2. Bright white
echo 3. Red
echo 4. Green
echo 5. Blue
echo 6. Yellow
choice /c 123456 /n
if %errorlevel%==1 color 7
if %errorlevel%==2 color f
if %errorlevel%==3 color c
if %errorlevel%==4 color a
if %errorlevel%==5 color 9
if %errorlevel%==6 color e
goto menu

:confirm_reset
cls
echo Reset progress
echo --------------
echo Are you sure you want to reset your progress?
echo ---------------------------------------------
echo 1. Yes
echo 2. No
choice /c 12 /n
if %errorlevel%==1 call:reset
goto menu

:reset
echo 0 >data\money
echo 10>data\cost
echo 1 >data\increase
goto menu

:game
cls
echo Game
echo ----
echo Money: %money%
echo Money per press: %increase%
echo ---------------------------
echo 1. Get money
echo 2. Increase money per press ($%cost%)
echo 3. Quit to main menu
choice /c 123 /n
if %errorlevel%==1 set /a money=%money%+%increase%
if %errorlevel%==2 call:increase
if %errorlevel%==3 call:menu
echo %money% >data\money
goto game

:increase
if %money% geq %cost% (
set /a money=%money%-%cost%
set /a increase=%increase%*2
set /a cost=%cost%*3
echo %money% >data\money
echo %cost%>data\cost
echo %increase% >data\increase
)
goto game