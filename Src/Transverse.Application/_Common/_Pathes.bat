@ECHO OFF

SET __a__CURRENT_SCRIPT_PATH__a__=%~dp0


SET SRC_APPLICATION_COMMON_PATH=%__a__CURRENT_SCRIPT_PATH__a__%
SET SRC_APPLICATION_PATH=%SRC_APPLICATION_COMMON_PATH%..


REM ------------- Dépendance vis-à-vis de la couche DOMAIN --------------------
SET SRC_DOMAIN_PATH=%SRC_APPLICATION_PATH%/../Transverse.Domain
SET SRC_DOMAIN_COMMON_PATH=%SRC_DOMAIN_PATH%/_Common

CALL "%SRC_DOMAIN_COMMON_PATH%/_Pathes.bat"





REM -------------------- Chemins (et scripts) dans Transverse.Application --------------------------------------

@REM SET SRC_APPLICATION_..._PATH=%SRC_APPLICATION_PATH%/....



