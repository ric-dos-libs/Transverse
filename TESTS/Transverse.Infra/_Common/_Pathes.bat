@ECHO OFF

IF DEFINED __TRANSVERSE_TESTS_INFRA_COMMON_PATHES_EXECUTED__ GOTO :EOF
SET __TRANSVERSE_TESTS_INFRA_COMMON_PATHES_EXECUTED__=yes


SET _ti_CURRENT_SCRIPT_PATH_ti_=%~dp0

SET TRANSVERSE_TESTS_INFRA_COMMON_PATH=%_ti_CURRENT_SCRIPT_PATH_ti_%
SET TRANSVERSE_TESTS_INFRA_PATH=%TRANSVERSE_TESTS_INFRA_COMMON_PATH%..

SET TRANSVERSE_TESTS_COMMON_PATH=%TRANSVERSE_TESTS_INFRA_PATH%/../Transverse._Common

CALL "%TRANSVERSE_TESTS_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------------
SET TRANSVERSE_INFRA_PATH=%TRANSVERSE_PATH%/Transverse.Infra
SET TRANSVERSE_INFRA_COMMON_PATH=%TRANSVERSE_INFRA_PATH%/_Common

CALL "%TRANSVERSE_INFRA_COMMON_PATH%/_Pathes.bat"