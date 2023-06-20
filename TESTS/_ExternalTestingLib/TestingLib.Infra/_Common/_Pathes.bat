@ECHO OFF

SET µµ_CURRENT_SCRIPT_PATH_µµ=%~dp0


REM -------------------------------------------------------------------------------------
SET TESTING_LIB_INFRA_PATH=%µµ_CURRENT_SCRIPT_PATH_µµ%..

REM -------------------------------------------------------------------------------------
SET TESTING_LIB_COMMON_PATH=%TESTING_LIB_INFRA_PATH%/../TestingLib._Common
CALL "%TESTING_LIB_COMMON_PATH%/_Pathes.bat"

REM -------------------------------------------------------------------------------------
SET TESTING_LIB_DOMAIN_PATH=%TESTING_LIB_INFRA_PATH%/../TestingLib.Domain
SET TESTING_LIB_DOMAIN_DISPLAY_SCRIPTS_PATH=%TESTING_LIB_DOMAIN_PATH%/DisplayScripts
SET TESTING_LIB_DOMAIN_DISPLAY_SCRIPTS_ENUMS_PATH=%TESTING_LIB_DOMAIN_DISPLAY_SCRIPTS_PATH%/Enums
SET TESTING_LIB_DOMAIN_COMMON_PATH=%TESTING_LIB_DOMAIN_PATH%/_Common
SET TESTING_LIB_DOMAIN_COMMON_ENUMS_PATH=%TESTING_LIB_DOMAIN_COMMON_PATH%/Enums


REM -------------------------------------------------------------------------------------
SET TESTING_LIB_APPLICATION_PATH=%TESTING_LIB_INFRA_PATH%/../TestingLib.Application
SET TESTING_LIB_APPLICATION_USE_CASES_PATH=%TESTING_LIB_APPLICATION_PATH%/UseCases


REM -------------------------------------------------------------------------------------
SET TESTING_LIB_INFRA_RESPOSITORIES_PATH=%TESTING_LIB_INFRA_PATH%/Repositories


REM -------------------------------------------------------------------------------------
SET TESTING_LIB_INFRA_DATASETS_PATH=%TESTING_LIB_INFRA_PATH%/DataSets
SET TESTING_LIB_INFRA_DATASETS_IN_MEMORY_PATH=%TESTING_LIB_INFRA_DATASETS_PATH%/InMemory


REM -------------------------------------------------------------------------------------
SET TESTING_LIB_INFRA_ASSETS_PATH=%TESTING_LIB_INFRA_PATH%/Assets
SET TESTING_LIB_INFRA_ASSETS_DISPLAY_SCRIPTS_PATH=%TESTING_LIB_INFRA_ASSETS_PATH%/DisplayScripts

REM -------------------------------------------------------------------------------------
SET TESTING_LIB_INFRA_API_PATH=%TESTING_LIB_INFRA_PATH%/API
SET TESTING_LIB_INFRA_API_ENUMS_PATH=%TESTING_LIB_INFRA_API_PATH%/Enums

