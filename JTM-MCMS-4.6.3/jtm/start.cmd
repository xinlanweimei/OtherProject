@echo off

REM  SHOP++ JTM
REM  http://www.shopxx.net

setlocal enableextensions
cd /d %~dp0
if exist jtm\init.cmd pushd . && goto init
if exist ..\jtm\init.cmd pushd .. & goto init
goto :eof

:init
call jtm\init.cmd
title 启动 Tomcat 和 MySQL 服务
call :execute jtm\tomcat_start.cmd
call :execute jtm\mysql_start.cmd

:execute
if exist %1 (call %1 && goto :eof) else echo %1 不存在. & pause & exit