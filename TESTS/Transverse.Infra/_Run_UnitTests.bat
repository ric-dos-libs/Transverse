@ECHO OFF

SET $_$CURRENT_SCRIPT_PATH$_$ru=%~dp0

SET TRANSVERSE_TESTS_INFRA_PATH=%$_$CURRENT_SCRIPT_PATH$_$ru%
SET TRANSVERSE_TESTS_INFRA_COMMON_PATH=%TRANSVERSE_TESTS_INFRA_PATH%_Common




REM ------------------------------------------------------------------------------------
REM Recup. de TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH
CALL "%TRANSVERSE_TESTS_INFRA_COMMON_PATH%/_Pathes.bat"



REM ----------------------------- CHEMINS où Tester -------------------------------------
SET TRANSVERSE_TESTS_DATE_TIME_UNIT_TRANSVERSE_TESTS_PATH=%TRANSVERSE_TESTS_INFRA_PATH%/%TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH%
SET TRANSVERSE_TESTS_7_ZIP_UNIT_TRANSVERSE_TESTS_PATH=%TRANSVERSE_TESTS_INFRA_PATH%/%TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH%



REM ============ RUN TESTS ==========================

CALL "%TRANSVERSE_TESTS_DATE_TIME_UNIT_TRANSVERSE_TESTS_PATH%/DateTimeTests.bat"
@REM CALL "%TRANSVERSE_TESTS_7_ZIP_UNIT_TRANSVERSE_TESTS_PATH%/7ZipTests.bat"



REM ==================================================