@ECHO OFF

REM =================== LE PONT VERS Transverse.Infra ===================

IF DEFINED __TESTING_INFRA_COMMON_PATHES_TO_TRANSVERSE_EXECUTED__ GOTO :EOF
SET __TESTING_INFRA_COMMON_PATHES_TO_TRANSVERSE_EXECUTED__=yes


SET x_CURRENT_SCRIPT_PATH_xtsttinf=%~dp0


SET TESTING_INFRA_COMMON_PATH=%x_CURRENT_SCRIPT_PATH_xtsttinf%
SET TESTING_INFRA_PATH=%TESTING_INFRA_COMMON_PATH%..

SET TESTING_PATH=%TESTING_INFRA_PATH%/..
SET TRANSVERSE_PATH=%TESTING_PATH%/..

SET TRANSVERSE_INFRA_PATH=%TRANSVERSE_PATH%/Transverse.Infra
SET TRANSVERSE_INFRA_COMMON_PATH=%TRANSVERSE_INFRA_PATH%/_Common


REM ATTENTION QUAND MÊME, ICI ON NE POINTE QUE SUR du Transverse.Infra, pas autre chose !!
CALL "%TRANSVERSE_INFRA_COMMON_PATH%/_Pathes.bat"
SET TESTING_INFRA_SERVICES_DISK_ELEMENTS_SERVICE_SCRIPT=%TRANSVERSE_INFRA_SERVICES_DISK_ELEMENTS_SERVICE_SCRIPT%
SET TESTING_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT=%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%