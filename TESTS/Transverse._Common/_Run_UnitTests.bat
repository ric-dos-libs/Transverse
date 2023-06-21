@ECHO OFF

SET $_$CURRENT_SCRIPT_PATH$_$=%~dp0


SET TESTS_COMMON_PATH=%$_$CURRENT_SCRIPT_PATH$_$%




REM ------------------------------------------------------------------------------------
IF NOT DEFINED FLAG_TESTS_COMMON_PATHES_EXECUTED (
  REM Recup. de TESTS_UNIT_TESTS_SUBPATH
  CALL "%TESTS_COMMON_PATH%_Pathes.bat"
)  



REM ----------------------------- CHEMINS où Tester --------------------------------------
SET TESTS_STRING_UNIT_TESTS_PATH=%TESTS_COMMON_PATH%%TESTS_UNIT_TESTS_SUBPATH%




REM ============ RUN TESTS ==========================

CALL "%TESTS_STRING_UNIT_TESTS_PATH%/StringTests.bat"



REM ==================================================