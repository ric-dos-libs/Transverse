@ECHO OFF

SET x$CURRENT_SCRIPT_PATH$x=%~dp0


SET TESTING_LIB_COMMON_PATH=%x$CURRENT_SCRIPT_PATH$x%






REM -------------------- Chemins (et scripts) dans TestingLib._Common --------------------------------------

SET TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT=%TESTING_LIB_COMMON_PATH%CheckFatalErrors.bat
SET TESTING_LIB_COMMON_VARS_SCRIPT=%TESTING_LIB_COMMON_PATH%Vars.bat

