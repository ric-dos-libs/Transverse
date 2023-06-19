@ECHO OFF

SET $_$CURRENT_SCRIPT_PATH$_$=%~dp0
SET TESTS_COMMON_PATH=%$_$CURRENT_SCRIPT_PATH$_$%




REM ------------------------------------------------------------------------------------
REM Recup. de UNIT_TESTS_SUBPATH
CALL "%TESTS_COMMON_PATH%/_Pathes.bat"



REM ----------------------------- CHEMINS où Tester --------------------------------------
SET STRING_UNIT_TESTS_PATH=%$_$CURRENT_SCRIPT_PATH$_$%/%UNIT_TESTS_SUBPATH%




REM ============ RUN TESTS ==========================

CALL "%STRING_UNIT_TESTS_PATH%/StringTests.bat"



REM ==================================================