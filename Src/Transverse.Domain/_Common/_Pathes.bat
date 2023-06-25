@ECHO OFF

SET __d__CURRENT_SCRIPT_PATH__d__=%~dp0


SET SRC_DOMAIN_COMMON_PATH=%__d__CURRENT_SCRIPT_PATH__d__%
SET SRC_DOMAIN_PATH=%SRC_DOMAIN_COMMON_PATH%..



REM ------ Dépendance vis-à-vis de la couche _COMMON ----------
SET SRC_COMMON_PATH=%SRC_DOMAIN_PATH%/../Transverse._Common

CALL "%SRC_COMMON_PATH%/_Pathes.bat"





REM -------------------- Chemins (et scripts) dans Transverse.Domain --------------------------------------

SET SRC_DOMAIN_DISK_ELEMENTS_PATH=%SRC_DOMAIN_PATH%/DiskElements

