@ECHO OFF

REM =================== LE PONT VERS Transverse.Domain ===================

IF DEFINED __TESTING_DOMAIN_COMMON_PATHES_TO_TRANSVERSE_EXECUTED__ GOTO :EOF
SET __TESTING_DOMAIN_COMMON_PATHES_TO_TRANSVERSE_EXECUTED__=yes


SET x_CURRENT_SCRIPT_PATH_xtsttDom=%~dp0


SET TESTING_DOMAIN_COMMON_PATH=%x_CURRENT_SCRIPT_PATH_xtsttDom%
SET TESTING_DOMAIN_PATH=%TESTING_DOMAIN_COMMON_PATH%..

SET TESTING_PATH=%TESTING_DOMAIN_PATH%/..
SET TRANSVERSE_PATH=%TESTING_PATH%/..

SET TRANSVERSE_DOMAIN_PATH=%TRANSVERSE_PATH%/Transverse.Domain
SET TRANSVERSE_DOMAIN_COMMON_PATH=%TRANSVERSE_DOMAIN_PATH%/_Common


REM ATTENTION QUAND MÊME, ICI ON NE POINTE QUE SUR du Transverse.Domain, pas autre chose !!
CALL "%TRANSVERSE_DOMAIN_COMMON_PATH%/_Pathes.bat"