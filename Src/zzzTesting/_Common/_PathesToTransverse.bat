@ECHO OFF

REM =================== LE PONT VERS L'ARCHI. Transverse.* ===================

IF DEFINED __TESTING_COMMON_PATHES_TO_TRANSVERSE_EXECUTED__ GOTO :EOF
SET __TESTING_COMMON_PATHES_TO_TRANSVERSE_EXECUTED__=yes


SET x$CURRENT_SCRIPT_PATH$xtstt=%~dp0


SET TESTING_COMMON_PATH=%x$CURRENT_SCRIPT_PATH$xtstt%
SET TESTING_PATH=%TESTING_COMMON_PATH%..

SET TRANSVERSE_PATH=%TESTING_PATH%/..

SET TRANSVERSE_COMMON_PATH=%TRANSVERSE_PATH%/Transverse._Common


REM ATTENTION QUAND MÊME, ICI ON NE POINTE QUE SUR du Transverse._Common, pas autre chose !!
CALL "%TRANSVERSE_COMMON_PATH%/_Pathes.bat"
SET TESTING_COMMON_VARS_SCRIPT=%TRANSVERSE_COMMON_VARS_SCRIPT%
SET TESTING_COMMON_CHECK_FATAL_ERRORS_SCRIPT=%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%
