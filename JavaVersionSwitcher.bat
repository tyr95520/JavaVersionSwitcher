@echo off
::Get System root
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

::Set view mode
mode con cols=85 lines=25 & color 3f
title SWJDK bat script

:menu
echo JDK version:
java -version
echo.
echo =============================================
echo ################ JDK version ################
echo.
echo         [8]  To JDK8
echo         [11] To JDK11
echo         [19] To JDK19
echo         [0]  Cancel
echo.
echo =============================================
echo.

set /P vb=Choose JDK version to change:
IF "%vb%" EQU "8" (
    setx "JAVA_HOME" "C:\Program Files\Java\jdk1.8.0_341" /m
    echo result: JDK version change success, "JAVA_HOME" change to C:\Program Files\Java\jdk1.8.0_341
    echo.
) ELSE IF "%vb%" EQU "11" (
    setx "JAVA_HOME" "C:\Program Files\Java\jdk-11.0.16.1" /m
    echo result: JDK version change success, "JAVA_HOME" change to C:\Program Files\Java\jdk-11.0.16.1
    echo.
) ELSE IF "%vb%" EQU "19" (
    setx "JAVA_HOME" "C:\Program Files\Java\jdk-19" /m
    echo result: JDK version change success, "JAVA_HOME" change to C:\Program Files\Java\jdk-19
    echo.
) ELSE IF "%vb%" EQU "0" (
       goto exit
) ELSE (
    echo.
    echo version choose fault，rechoose. . .
    echo.
    goto menu
)

echo press any key to exit... & pause > nul

:exit