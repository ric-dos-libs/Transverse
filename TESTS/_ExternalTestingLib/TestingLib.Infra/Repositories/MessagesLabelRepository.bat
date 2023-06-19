@ECHO OFF


SET _$xx$$CURRENT_NAMESPACE$$xx$_=TestingLib.Infra.Repositories
SET _$xx$$_CURRENT_SCRIPT_PATH_$$xx$_=%~dp0


SET TESTING_LIB_INFRA_COMMON_PATH=%_$xx$$_CURRENT_SCRIPT_PATH_$$xx$_%../_Common

REM Recup. de TESTING_LIB_INFRA_DATASETS_IN_MEMORY_PATH et TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT
CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"


REM 
CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "TESTING_LIB_LANG_ID"


REM Chargement de la "table" des LIBELLES DE MESSAGES
CALL "%TESTING_LIB_INFRA_DATASETS_IN_MEMORY_PATH%/MessagesLabel/MessagesLabel_%TESTING_LIB_LANG_ID%.bat"




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetMessageLabel. (
  Rem %2: Id du message dont retourner le label
  SET __MESSAGE_LABEL__=!TESTING_LIB_MESSAGES_LABEL_%~2!
  IF !__MESSAGE_LABEL__!. EQU . (
    CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__MESSAGE_LABEL__"
  )
  Rem Renvoi par référence
	SET %3=!__MESSAGE_LABEL__!
) 

GOTO :EOF