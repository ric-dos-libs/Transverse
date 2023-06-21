@ECHO OFF

SET $_$CURRENT_SCRIPT_PATH$_$=%~dp0

SET TESTS_DOMAIN_PATH=%$_$CURRENT_SCRIPT_PATH$_$%
SET TESTS_DOMAIN_COMMON_PATH=%TESTS_DOMAIN_PATH%_Common




REM ------------------------------------------------------------------------------------
IF NOT DEFINED FLAG_TESTS_DOMAIN_COMMON_PATHES_EXECUTED (
  REM Recup. de TESTS_UNIT_TESTS_SUBPATH
  CALL "%TESTS_DOMAIN_COMMON_PATH%/_Pathes.bat"
)  


REM ----------------------------- CHEMINS où Tester -------------------------------------
SET TESTS_DISK_ELEMENTS_UNIT_TESTS_PATH=%TESTS_DOMAIN_PATH%/DiskElements/%TESTS_UNIT_TESTS_SUBPATH%



REM ============ RUN TESTS ==========================

CALL "%TESTS_DISK_ELEMENTS_UNIT_TESTS_PATH%/DiskElementsTests.bat"



REM ==================================================