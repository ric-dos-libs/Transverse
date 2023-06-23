@ECHO OFF

SET __iui__CURRENT_SCRIPT_PATH__iui__=%~dp0


SET TESTING_LIB_UI_COMMON_PATH=%__iui__CURRENT_SCRIPT_PATH__iui__%
SET TESTING_LIB_UI_PATH=%TESTING_LIB_UI_COMMON_PATH%..



REM ------ Dépendance vis-à-vis de la couche API ----------
SET TESTING_LIB_API_PATH=%TESTING_LIB_UI_PATH%/../TestingLib.API
SET TESTING_LIB_API_COMMON_PATH=%TESTING_LIB_API_PATH%/_Common

CALL "%TESTING_LIB_API_COMMON_PATH%/_Pathes.bat"








REM -------------------- Chemins (et scripts) dans TestingLib.UI --------------------------------------






REM -------------------------------------------------------------------------------------------------------

SET FLAG_TESTING_LIB_UI_COMMON_PATHES_EXECUTED=yes