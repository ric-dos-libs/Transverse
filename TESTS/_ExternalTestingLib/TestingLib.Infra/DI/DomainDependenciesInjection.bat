@ECHO OFF

@REM SET _$$__$CURRENT_NAMESPACE$__$$_=TestingLib.Infra
SET _$$__$_CURRENT_SCRIPT_PATH_$__$$_=%~dp0

@REM SET TESTING_LIB_INFRA_PATH=%_$$__$_CURRENT_SCRIPT_PATH_$__$$_%..
@REM SET TESTING_LIB_INFRA_COMMON_PATH=%TESTING_LIB_INFRA_PATH%/_Common

REM Recup. de ...
@REM CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"




REM ------------------- "Injection" ---------------------
REM        Met en fait en global des var. d'env.
REM %1: MESSAGES DISPLAYER
SET TESTING_LIB_MESSAGES_DISPLAYER_SCRIPT=%~1