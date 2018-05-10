@echo off

REM  SHOP++ JTM
REM  http://www.shopxx.net

for /d %%d in (*) do (
 if exist %%d\bin\java.exe set jdk_dir=%%d
 if exist %%d\bin\tomcat7.exe set tomcat_dir=%%d
 if exist %%d\bin\mysqld.exe set mysql_dir=%%d
)
if "%jdk_dir%"=="" echo JDK does not exist. & pause & exit
if "%tomcat_dir%"=="" echo Tomcat does not exist. & pause & exit
if "%mysql_dir%"=="" echo MySQL does not exist & pause & exit

set jtm_path=%cd%
set class_path=.;%jtm_path%\%jdk_dir%\lib;%jtm_path%\%jdk_dir%\lib\tools.jar;%jtm_path%\jtm\jtm.jar
set java="%jtm_path%\%jdk_dir%\bin\java.exe" -classpath "%class_path%"

%java% CheckPath "%jtm_path%"
if errorlevel 1 echo. & pause & exit

%java% WriteConfig "%jtm_path%\jtm\config.cmd" "%jtm_path%\%tomcat_dir%" "%jtm_path%\%mysql_dir%"

if exist jtm\config.cmd (call jtm\config.cmd && goto :eof) else echo jtm\config.cmd 不存在. & pause & exit