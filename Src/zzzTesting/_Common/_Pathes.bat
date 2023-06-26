@ECHO OFF

IF DEFINED __TESTING_COMMON_PATHES_EXECUTED__ GOTO :EOF
SET __TESTING_COMMON_PATHES_EXECUTED__=yes


SET x$CURRENT_SCRIPT_PATH$x=%~dp0


SET TESTING_COMMON_PATH=%x$CURRENT_SCRIPT_PATH$x%


REM PONT VERS Transverse._Common
CALL "%TESTING_COMMON_PATH%_PathesToTransverse.bat"





REM -------------------- Chemins (et scripts) dans zzzTesting/_Common --------------------------------------


