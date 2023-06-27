@ECHO OFF

REM ----- DOIT être appelé par zzRun_Tests.bat -----

SET $_$CURRENT_SCRIPT_PATH$_$=%~dp0


SET TRANSVERSE_TESTS_COMMON_PATH=%$_$CURRENT_SCRIPT_PATH$_$%




REM ------------------------------------------------------------------------------------
REM Recup. de TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH
CALL "%TRANSVERSE_TESTS_COMMON_PATH%_Pathes.bat"



REM ----------------------------- CHEMINS où Tester --------------------------------------
SET TRANSVERSE_TESTS_STRING_UNIT_TRANSVERSE_TESTS_PATH=%TRANSVERSE_TESTS_COMMON_PATH%%TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH%
SET TRANSVERSE_TESTS_VARS_UNIT_TRANSVERSE_TESTS_PATH=%TRANSVERSE_TESTS_COMMON_PATH%%TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH%




REM ============ RUN TESTS ==========================

CALL "%TRANSVERSE_TESTS_STRING_UNIT_TRANSVERSE_TESTS_PATH%/StringTests.bat"
CALL "%TRANSVERSE_TESTS_VARS_UNIT_TRANSVERSE_TESTS_PATH%/VarsTests.bat"



REM ==================================================