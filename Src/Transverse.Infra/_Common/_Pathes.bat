@ECHO OFF

SET __i__CURRENT_SCRIPT_PATH__i__=%~dp0


SET SRC_INFRA_COMMON_PATH=%__i__CURRENT_SCRIPT_PATH__i__%
SET SRC_INFRA_PATH=%SRC_INFRA_COMMON_PATH%..

SET SRC_APPLICATION_PATH=%SRC_INFRA_PATH%/../Transverse.Application
SET SRC_APPLICATION_COMMON_PATH=%SRC_APPLICATION_PATH%/_Common

CALL "%SRC_APPLICATION_COMMON_PATH%/_Pathes.bat"





REM -------------------- Chemins (et scripts) dans Transverse.Infra --------------------------------------


SET SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT=%SRC_INFRA_COMMON_PATH%CheckFatalErrors.bat

SET SRC_INFRA_DISK_ELEMENTS_PATH=%SRC_INFRA_PATH%/DiskElements



