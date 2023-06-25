@ECHO OFF

SET _ta_CURRENT_SCRIPT_PATH_ta_=%~dp0

SET TESTS_APPLICATION_COMMON_PATH=%_ta_CURRENT_SCRIPT_PATH_ta_%
SET TESTS_APPLICATION_PATH=%TESTS_APPLICATION_COMMON_PATH%..

SET TESTS_COMMON_PATH=%TESTS_APPLICATION_PATH%/../Transverse._Common

CALL "%TESTS_COMMON_PATH%/_Pathes.bat"





REM ---------------------------------------------------------------------
SET SRC_APPLICATION_PATH=%SRC_PATH%/Transverse.Application
SET SRC_APPLICATION_COMMON_PATH=%SRC_APPLICATION_PATH%/_Common

CALL "%SRC_APPLICATION_COMMON_PATH%/_Pathes.bat"



REM ----------------------------------------------------------------------

