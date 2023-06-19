@ECHO OFF

SET __$xy$$_CURRENT_SCRIPT_PATH_$$xy$__=%~dp0

SET TESTING_LIB_INFRA_COMMON_PATH=%__$xy$$_CURRENT_SCRIPT_PATH_$$xy$__%../../_Common


REM ----------------------------------------------------------------------

REM Recup. de TESTING_LIB_DOMAIN_SCRIPTS_ENUMS_PATH
CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"

REM Recup. des divers Scripts Id.
CALL "%TESTING_LIB_DOMAIN_SCRIPTS_ENUMS_PATH%/Scripts.bat"


REM ---------------------------- "Table" des SCRIPTS ---------------------------------------------------
SET TESTING_LIB_SCRIPTS_%TESTING_LIB_ASSERTION_RESULT_DISPLAYER_SCRIPT_ID%=%TESTING_LIB_INFRA_ASSETS_SCRIPTS_PATH%/AssertionResultDisplayer.bat