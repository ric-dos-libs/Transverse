@ECHO OFF

IF DEFINED __TESTING_DOMAIN_COMMON_PATHES_EXECUTED__ GOTO :EOF
SET __TESTING_DOMAIN_COMMON_PATHES_EXECUTED__=yes


SET __dd__CURRENT_SCRIPT_PATH__dd__=%~dp0


SET TESTING_DOMAIN_COMMON_PATH=%__dd__CURRENT_SCRIPT_PATH__dd__%
SET TESTING_DOMAIN_PATH=%TESTING_DOMAIN_COMMON_PATH%..


REM PONT VERS Transverse.Domain
CALL "%TESTING_DOMAIN_COMMON_PATH%_PathesToTransverse.bat"




REM ------ Dépendance vis-à-vis de la couche _COMMON ----------
SET TESTING_COMMON_PATH=%TESTING_DOMAIN_PATH%/../_Common

CALL "%TESTING_COMMON_PATH%/_Pathes.bat"





REM -------------------- Chemins (et scripts) dans zzzTesting/Domain --------------------------------------

SET TESTING_DOMAIN_COMMON_ENUMS_PATH=%TESTING_DOMAIN_COMMON_PATH%Enums
SET TESTING_DOMAIN_COMMON_SERVICES_PATH=%TESTING_DOMAIN_COMMON_PATH%Services