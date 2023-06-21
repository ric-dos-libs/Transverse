@ECHO OFF

SET _td_CURRENT_SCRIPT_PATH_td_=%~dp0

SET TESTS_DOMAIN_COMMON_PATH=%_td_CURRENT_SCRIPT_PATH_td_%
SET TESTS_DOMAIN_PATH=%TESTS_DOMAIN_COMMON_PATH%..

SET TESTS_COMMON_PATH=%TESTS_DOMAIN_PATH%/../Transverse._Common

CALL "%TESTS_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------------
SET SRC_DOMAIN_PATH=%SRC_PATH%/Transverse.Domain
SET SRC_DOMAIN_COMMON_PATH=%SRC_DOMAIN_PATH%/_Common

CALL "%SRC_DOMAIN_COMMON_PATH%/_Pathes.bat"



REM ----------------------------------------------------------------------

SET FLAG_TESTS_DOMAIN_COMMON_PATHES_EXECUTED=yes
