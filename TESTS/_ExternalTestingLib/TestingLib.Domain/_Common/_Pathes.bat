@ECHO OFF

SET µxµ_CURRENT_SCRIPT_PATH_µxµ=%~dp0

SET TESTING_LIB_DOMAIN_PATH=%µxµ_CURRENT_SCRIPT_PATH_µxµ%..

REM -------------------------------------------------------------------------------------
SET TESTING_LIB_COMMON_PATH=%TESTING_LIB_DOMAIN_PATH%/../TestingLib._Common
CALL "%TESTING_LIB_COMMON_PATH%/_Pathes.bat"


REM -------------------------------------------------------------------------------------
SET TESTING_LIB_DOMAIN_COMMON_PATH=%TESTING_LIB_DOMAIN_PATH%/_Common
SET TESTING_LIB_DOMAIN_COMMON_ENUMS_PATH=%TESTING_LIB_DOMAIN_COMMON_PATH%/Enums
SET TESTING_LIB_DOMAIN_COMMON_SERVICES_PATH=%TESTING_LIB_DOMAIN_COMMON_PATH%/Services