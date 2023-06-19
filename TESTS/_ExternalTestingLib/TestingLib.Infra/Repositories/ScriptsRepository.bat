@ECHO OFF


SET _$xx$$CURRENT_NAMESPACE$$xx$_=TestingLib.Infra.Repositories
SET _$xx$$_CURRENT_SCRIPT_PATH_$$xx$_=%~dp0


SET TESTING_LIB_INFRA_COMMON_PATH=%_$xx$$_CURRENT_SCRIPT_PATH_$$xx$_%../_Common

REM Recup. de TESTING_LIB_INFRA_DATASETS_IN_MEMORY_PATH et TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT
CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"

REM Chargement de la "table" des Scripts
CALL "%TESTING_LIB_INFRA_DATASETS_IN_MEMORY_PATH%/Scripts.bat"




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetURL. (
  Rem %2: Id de l'URL du script à retourner
  
  SET __SCRIPT_URL__=!TESTING_LIB_SCRIPTS_%~2!
  CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__SCRIPT_URL__"

  Rem Renvoi par référence
	SET %3=!__SCRIPT_URL__!
) 

GOTO :EOF