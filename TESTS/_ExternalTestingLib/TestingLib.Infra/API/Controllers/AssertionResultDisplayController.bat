@ECHO OFF


@REM SET _$$$CURRENT_NAMESPACE$$$_=TestingLib.Infra.API.Controllers
SET _$$$_CURRENT_SCRIPT_PATH_$$$_=%~dp0

SET TESTING_LIB_INFRA_PATH=%_$$$_CURRENT_SCRIPT_PATH_$$$_%../..
SET TESTING_LIB_INFRA_COMMON_PATH=%TESTING_LIB_INFRA_PATH%/_Common

REM Recup. de TESTING_LIB_APPLICATION_USE_CASES_PATH et TESTING_LIB_INFRA_API_ENUMS_PATH, TESTING_LIB_DOMAIN_COMMON_ENUMS_PATH
CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"


Rem Recup. de TESTING_LIB_INFRA_API_ENUMS__LANG_US_ID, etc...
CALL "%TESTING_LIB_INFRA_API_ENUMS_PATH%/Lang.bat"

Rem Recup. de TESTING_LIB_LANG_US_ID, etc...
CALL "%TESTING_LIB_DOMAIN_COMMON_ENUMS_PATH%/Lang.bat"





@REM REM ==================== FUNCTION CALL ====================================	
CALL :LoadInputEnumsConversionTable

IF %1. EQU Equality. (
  Rem %2 :  Lang. Id
  Rem %3 : Messages Displayer
  Rem %4 et %5 : valeurs à comparer
  
  Rem --- Lang. Id : conversion de Enums exposés vers Enums internes au Domaine --- 
  SET __TESTING_LIB_DOMAIN_LANG_ID__=
  CALL "%TESTING_LIB_COMMON_PATH%/Vars.bat" GetVarValue "ENUM_CONVERSION_" %2 __TESTING_LIB_DOMAIN_LANG_ID__
  CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__TESTING_LIB_DOMAIN_LANG_ID__"

  Rem --- Appel du UseCase ---
  CALL "%TESTING_LIB_APPLICATION_USE_CASES_PATH%/EqualityAssertionResultDisplayUseCase.bat" "!__TESTING_LIB_DOMAIN_LANG_ID__!" %3  %4 %5

)

GOTO :EOF



REM ============================================== LOCAL FUNCTIONS ======================================================

:LoadInputEnumsConversionTable
  SET "ENUM_CONVERSION_%TESTING_LIB_INFRA_API_ENUMS__LANG_US_ID%=%TESTING_LIB_LANG_US_ID%"
GOTO :EOF