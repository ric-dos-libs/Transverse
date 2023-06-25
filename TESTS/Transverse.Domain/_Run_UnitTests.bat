@ECHO OFF

SET $_$CURRENT_SCRIPT_PATH$_$=%~dp0

SET TRANSVERSE_TESTS_DOMAIN_PATH=%$_$CURRENT_SCRIPT_PATH$_$%
SET TRANSVERSE_TESTS_DOMAIN_COMMON_PATH=%TRANSVERSE_TESTS_DOMAIN_PATH%_Common




REM ------------------------------------------------------------------------------------
REM Recup. de TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH
CALL "%TRANSVERSE_TESTS_DOMAIN_COMMON_PATH%/_Pathes.bat"


REM ----------------------------- CHEMINS où Tester -------------------------------------
SET TRANSVERSE_TESTS_DISK_ELEMENTS_UNIT_TRANSVERSE_TESTS_PATH=%TRANSVERSE_TESTS_DOMAIN_PATH%/DiskElements/%TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH%



REM ============ RUN TESTS ==========================

CALL "%TRANSVERSE_TESTS_DISK_ELEMENTS_UNIT_TRANSVERSE_TESTS_PATH%/DiskElementsTests.bat"



REM ==================================================