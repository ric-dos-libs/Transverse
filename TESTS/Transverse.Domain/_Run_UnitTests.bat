@ECHO OFF

SET $_$CURRENT_SCRIPT_PATH$_$=%~dp0
SET TESTS_DOMAIN_COMMON_PATH=%$_$CURRENT_SCRIPT_PATH$_$%_Common




REM ------------------------------------------------------------------------------------
REM Recup. de UNIT_TESTS_SUBPATH
CALL "%TESTS_DOMAIN_COMMON_PATH%/_Pathes.bat"



REM ----------------------------- CHEMINS où Tester -------------------------------------
SET DISK_ELEMENTS_UNIT_TESTS_PATH=%$_$CURRENT_SCRIPT_PATH$_$%DiskElements/%UNIT_TESTS_SUBPATH%




REM ============ RUN TESTS ==========================

CALL "%DISK_ELEMENTS_UNIT_TESTS_PATH%/DiskElementsTests.bat"



REM ==================================================