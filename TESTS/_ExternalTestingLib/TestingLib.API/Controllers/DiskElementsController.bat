@ECHO OFF


SET _$$$_CURRENT_SCRIPT_PATH_$$$_=%~dp0

SET TESTING_LIB_API_PATH=%_$$$_CURRENT_SCRIPT_PATH_$$$_%..
SET TESTING_LIB_API_COMMON_PATH=%TESTING_LIB_API_PATH%/_Common

REM Recup. de 
REM  TESTING_LIB_APPLICATION_USE_CASES_PATH et TESTING_LIB_API_ENUMS_PATH, TESTING_LIB_DOMAIN_COMMON_ENUMS_PATH
REM  et TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT, TESTING_LIB_COMMON_VARS_SCRIPT
CALL "%TESTING_LIB_API_COMMON_PATH%/_Pathes.bat"


Rem Recup. de TESTING_LIB_API_ENUMS__LANG_US_ID, etc...
CALL "%TESTING_LIB_API_ENUMS_PATH%/Lang.bat"

Rem Recup. de TESTING_LIB_LANG_US_ID, etc...
CALL "%TESTING_LIB_DOMAIN_COMMON_ENUMS_PATH%/Lang.bat"




CALL :LoadInputEnumsConversionTable
Rem --- Lang. Id : conversion de Enums exposés vers Enums internes au Domaine --- 
SET __TESTING_LIB_DOMAIN_LANG_ID__=
CALL "%TESTING_LIB_COMMON_VARS_SCRIPT%" GetVarValue "ENUM_CONVERSION_" %2 __TESTING_LIB_DOMAIN_LANG_ID__
CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__TESTING_LIB_DOMAIN_LANG_ID__"



REM ==================== FUNCTION CALL ====================================	
IF %1. EQU Exists. (
  Rem %2 :  Lang. Id
  Rem %3 : DiskElement

  Rem --- Appel du UseCase ---
  CALL "%TESTING_LIB_APPLICATION_USE_CASES_PATH%/DiskElementExistsAssertionResultDisplayUseCase.bat" "!__TESTING_LIB_DOMAIN_LANG_ID__!" %3


) ELSE IF %1. EQU DoesntExist. (
  Rem %2 :  Lang. Id
  Rem %3 : DiskElement
  
  Rem --- Appel du UseCase ---
  CALL "%TESTING_LIB_APPLICATION_USE_CASES_PATH%/DiskElementDoesntExistAssertionResultDisplayUseCase.bat" "!__TESTING_LIB_DOMAIN_LANG_ID__!" %3

)

GOTO :EOF



REM ============================================== LOCAL FUNCTIONS ======================================================

:LoadInputEnumsConversionTable
  SET "ENUM_CONVERSION_%TESTING_LIB_API_ENUMS__LANG_US_ID%=%TESTING_LIB_LANG_US_ID%"
GOTO :EOF