@ECHO OFF

REM =================== LE PONT VERS Transverse.API ===================

IF DEFINED __TESTING_API_COMMON_PATHES_TO_TRANSVERSE_EXECUTED__ GOTO :EOF
SET __TESTING_API_COMMON_PATHES_TO_TRANSVERSE_EXECUTED__=yes


SET x_CURRENT_SCRIPT_PATH_xtsttapi=%~dp0


SET TESTING_API_COMMON_PATH=%x_CURRENT_SCRIPT_PATH_xtsttapi%
SET TESTING_API_PATH=%TESTING_API_COMMON_PATH%..

SET TESTING_PATH=%TESTING_API_PATH%/..
SET TRANSVERSE_PATH=%TESTING_PATH%/..

SET TRANSVERSE_API_PATH=%TRANSVERSE_PATH%/Transverse.API
SET TRANSVERSE_API_COMMON_PATH=%TRANSVERSE_API_PATH%/_Common


REM ATTENTION QUAND MÊME, ICI ON NE POINTE QUE SUR du Transverse.API, pas autre chose !!
CALL "%TRANSVERSE_API_COMMON_PATH%/_Pathes.bat"