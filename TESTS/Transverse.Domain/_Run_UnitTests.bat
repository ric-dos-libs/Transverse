@ECHO OFF

SET CURRENT_SCRIPT_PATH=%~dp0
SET TESTS_DOMAIN_COMMON_PATH=%CURRENT_SCRIPT_PATH%_Common

SET UNIT_TESTS_SUBPATH=UnitTests
SET DISK_ELEMENTS_UNIT_TESTS_PATH=%CURRENT_SCRIPT_PATH%DiskElements/%UNIT_TESTS_SUBPATH%



REM ------------------- VERIFS ----------------------------------------

REM Recup. de SRC_COMMON_PATH
CALL "%TESTS_DOMAIN_COMMON_PATH%/_Pathes.bat"

REM ***** ATTENTION %MESSAGES_DISPLAYER% et %TESTS_RESULT_DISPLAYER% doivent avoir ete precises en amont ! *****
CALL "%SRC_COMMON_PATH%/CheckFatalErrors.bat" CheckVarExists MESSAGES_DISPLAYER
CALL "%SRC_COMMON_PATH%/CheckFatalErrors.bat" CheckVarExists TESTS_RESULT_DISPLAYER




REM ============ RUN TESTS ==========================

CALL "%DISK_ELEMENTS_UNIT_TESTS_PATH%/DiskElementsTests.bat"



REM ==================================================