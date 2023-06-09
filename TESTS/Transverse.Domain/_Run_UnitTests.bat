@ECHO OFF

SET CURRENT_SCRIPT_PATH=%~dp0

REM ***** ATTENTION %MESSAGES_DISPLAYER% et %TESTS_RESULT_DISPLAYER% doivent avoir ete precises en amont ! *****
CALL "%CURRENT_SCRIPT_PATH%../Transverse._Common/CheckFatalErrors.bat" CheckVarExists MESSAGES_DISPLAYER
CALL "%CURRENT_SCRIPT_PATH%../Transverse._Common/CheckFatalErrors.bat" CheckVarExists TESTS_RESULT_DISPLAYER



REM ============ RUN TESTS ==========================
SET UNIT_TESTS_SUBPATH=UnitTests


SET DISK_ELEMENTS_PATH=%CURRENT_SCRIPT_PATH%DiskElements/%UNIT_TESTS_SUBPATH%

CALL "%DISK_ELEMENTS_PATH%/DiskElementsTests.bat"



REM ----------------------------------------------------------------------