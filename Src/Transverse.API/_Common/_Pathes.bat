@ECHO OFF

SET __xxapi__CURRENT_SCRIPT_PATH__xxapi__=%~dp0

SET SRC_API_COMMON_PATH=%__xxapi__CURRENT_SCRIPT_PATH__xxapi__%
SET SRC_API_PATH=%SRC_API_COMMON_PATH%..



REM ----- Dépendance vis-à-vis de la couche APPLICATION -------
SET SRC_APPLICATION_PATH=%SRC_API_PATH%/../Transverse.Application
SET SRC_APPLICATION_COMMON_PATH=%SRC_APPLICATION_PATH%/_Common

CALL "%SRC_APPLICATION_COMMON_PATH%/_Pathes.bat"







REM -------------------- Chemins (et scripts) dans Transverse.API --------------------------------------



