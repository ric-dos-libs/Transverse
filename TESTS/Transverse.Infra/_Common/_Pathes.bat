@ECHO OFF

SET _ti_CURRENT_SCRIPT_PATH_ti_=%~dp0

SET TESTS_INFRA_COMMON_PATH=%_ti_CURRENT_SCRIPT_PATH_ti_%
SET TESTS_INFRA_PATH=%TESTS_INFRA_COMMON_PATH%..

SET TESTS_COMMON_PATH=%TESTS_INFRA_PATH%/../Transverse._Common

CALL "%TESTS_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------------
SET SRC_INFRA_PATH=%SRC_PATH%/Transverse.Infra
SET SRC_INFRA_COMMON_PATH=%SRC_INFRA_PATH%/_Common

CALL "%SRC_INFRA_COMMON_PATH%/_Pathes.bat"



REM ----------------------------------------------------------------------

SET FLAG_TESTS_INFRA_COMMON_PATHES_EXECUTED=yes
