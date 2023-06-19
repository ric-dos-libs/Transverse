@ECHO OFF

SET $_$CURRENT_SCRIPT_PATH$_$=%~dp0
SET TESTS_INFRA_COMMON_PATH=%$_$CURRENT_SCRIPT_PATH$_$%_Common




REM ------------------------------------------------------------------------------------
REM Recup. de UNIT_TESTS_SUBPATH
CALL "%TESTS_INFRA_COMMON_PATH%/_Pathes.bat"



REM ----------------------------- CHEMINS où Tester -------------------------------------
SET DATE_TIME_UNIT_TESTS_PATH=%$_$CURRENT_SCRIPT_PATH$_$%/%UNIT_TESTS_SUBPATH%




REM ============ RUN TESTS ==========================

CALL "%DATE_TIME_UNIT_TESTS_PATH%/DateTimeTests.bat"



REM ==================================================