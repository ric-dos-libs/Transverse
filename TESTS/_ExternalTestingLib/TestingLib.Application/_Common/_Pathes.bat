@ECHO OFF

SET µµµ_CURRENT_SCRIPT_PATH_µµµ=%~dp0

SET TESTING_LIB_APPLICATION_PATH=%µµµ_CURRENT_SCRIPT_PATH_µµµ%..


REM -------------------------------------------------------------------------------------
SET TESTING_LIB_COMMON_PATH=%TESTING_LIB_APPLICATION_PATH%/../TestingLib._Common

CALL "%TESTING_LIB_COMMON_PATH%/_Pathes.bat"



REM ------------------------------------------------------------------------------------
SET TESTING_LIB_APPLICATION_COMMON_PATH=%TESTING_LIB_APPLICATION_PATH%/_Common
SET TESTING_LIB_APPLICATION_COMMON_SERVICES_PATH=%TESTING_LIB_APPLICATION_COMMON_PATH%/Services


REM -------------------------------------------------------------------------------------
SET TESTING_LIB_DOMAIN_PATH=%TESTING_LIB_APPLICATION_PATH%/../TestingLib.Domain

SET TESTING_LIB_DOMAIN_COMMON_PATH=%TESTING_LIB_DOMAIN_PATH%/_Common
SET TESTING_LIB_DOMAIN_COMMON_SERVICES_PATH=%TESTING_LIB_DOMAIN_COMMON_PATH%/Services
