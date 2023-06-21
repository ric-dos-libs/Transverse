@ECHO OFF

SET _tc_CURRENT_SCRIPT_PATH_tc_=%~dp0

SET TESTS_COMMON_PATH=%_tc_CURRENT_SCRIPT_PATH_tc_%

SET SRC_PATH=%TESTS_COMMON_PATH%../../Src
SET SRC_COMMON_PATH=%SRC_PATH%/Transverse._Common

CALL "%SRC_COMMON_PATH%/_Pathes.bat"




REM ----------------------------------------------------------------------

SET TESTS_UNIT_TESTS_SUBPATH=UnitTests


REM ----------------------------------------------------------------------

SEt FLAG_TESTS_COMMON_PATHES_EXECUTED=yes