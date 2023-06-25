@ECHO OFF

SET $_$CURRENT_SCRIPT_PATH$_$=%~dp0

SET TESTS_INFRA_PATH=%$_$CURRENT_SCRIPT_PATH$_$%
SET TESTS_INFRA_COMMON_PATH=%TESTS_INFRA_PATH%_Common




REM ------------------------------------------------------------------------------------
IF NOT DEFINED FLAG_TESTS_INFRA_COMMON_PATHES_EXECUTED (
  REM Recup. de TESTS_UNIT_TESTS_SUBPATH
  CALL "%TESTS_INFRA_COMMON_PATH%/_Pathes.bat"
)  



REM ----------------------------- CHEMINS où Tester -------------------------------------
SET TESTS_DATE_TIME_UNIT_TESTS_PATH=%TESTS_INFRA_PATH%/%TESTS_UNIT_TESTS_SUBPATH%
SET TESTS_7_ZIP_UNIT_TESTS_PATH=%TESTS_INFRA_PATH%/%TESTS_UNIT_TESTS_SUBPATH%



REM ============ RUN TESTS ==========================

CALL "%TESTS_DATE_TIME_UNIT_TESTS_PATH%/DateTimeTests.bat"
@REM CALL "%TESTS_7_ZIP_UNIT_TESTS_PATH%/7ZipTests.bat"



REM ==================================================