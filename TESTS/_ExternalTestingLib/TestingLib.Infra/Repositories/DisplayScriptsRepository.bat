@ECHO OFF


@REM SET _$xx$$CURRENT_NAMESPACE$$xx$_=TestingLib.Infra.Repositories
SET _$xx$$_CURRENT_SCRIPT_PATH_$$xx$_=%~dp0


SET TESTING_LIB_INFRA_COMMON_PATH=%_$xx$$_CURRENT_SCRIPT_PATH_$$xx$_%../_Common

REM Recup. de 
REM TESTING_LIB_INFRA_DATASETS_IN_MEMORY_PATH, TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT et TESTING_LIB_COMMON_PATH
CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"

REM Chargement de la "table" des DisplayScripts
CALL "%TESTING_LIB_INFRA_DATASETS_IN_MEMORY_PATH%/DisplayScripts.bat"




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetURL. (
  Rem %2: Id du DisplayScript dont retourner l'URL.
  
  Rem Recup. de l'URL du DisplayScript
  SET __DISPLAY_SCRIPT_URL__=
  CALL "%TESTING_LIB_COMMON_PATH%/Vars.bat" GetVarValue "TESTING_LIB_DISPLAY_SCRIPT_" %2 __DISPLAY_SCRIPT_URL__
  CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__DISPLAY_SCRIPT_URL__"  

  Rem Renvoi par référence, de l'URL du DisplayScript
	SET %3=!__DISPLAY_SCRIPT_URL__!
) 

GOTO :EOF