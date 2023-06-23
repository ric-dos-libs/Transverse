@ECHO OFF

SET __ii__CURRENT_SCRIPT_PATH__ii__=%~dp0


SET TESTING_LIB_API_COMMON_PATH=%__ii__CURRENT_SCRIPT_PATH__ii__%
SET TESTING_LIB_API_PATH=%TESTING_LIB_API_COMMON_PATH%..



REM ------ Dépendance vis-à-vis de la couche APPLICATION ----------
SET TESTING_LIB_APPLICATION_PATH=%TESTING_LIB_API_PATH%/../TestingLib.Application
SET TESTING_LIB_APPLICATION_COMMON_PATH=%TESTING_LIB_APPLICATION_PATH%/_Common

CALL "%TESTING_LIB_APPLICATION_COMMON_PATH%/_Pathes.bat"



REM ------ Dépendance vis-à-vis de la couche INFRA. ----------
SET TESTING_LIB_INFRA_PATH=%TESTING_LIB_API_PATH%/../TestingLib.Infra
SET TESTING_LIB_INFRA_COMMON_PATH=%TESTING_LIB_INFRA_PATH%/_Common

CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"







REM -------------------- Chemins (et scripts) dans TestingLib.API --------------------------------------

SET TESTING_LIB_API_FRONT_CONTROLLER_SCRIPT=%TESTING_LIB_API_PATH%/_FrontController.bat
SET TESTING_LIB_API_ENUMS_PATH=%TESTING_LIB_API_PATH%/Enums



REM -------------------------------------------------------------------------------------------------------

SET FLAG_TESTING_LIB_API_COMMON_PATHES_EXECUTED=yes