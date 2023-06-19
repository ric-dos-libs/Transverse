@ECHO OFF


SET $$_$CURRENT_NAMESPACE$$_$=TestingLib.Domain._Common.Services
SET $$$_CURRENT_SCRIPT_NAME_EXT_$$$=%~nx0
SET $$_$CURRENT_SCRIPT_PATH$_$$=%~dp0

SET TESTING_LIB_UI_COMMON_PATH=%$$_$CURRENT_SCRIPT_PATH$_$$%../_Common










REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetMessageLabel. (
  Rem %2 : Id du message
  Rem %3: Id de la langue
	CALL :GetEqualityAssertionResult %2 %3
	
) ELSE IF %1. EQU GetIsBetweenAssertionResult. (
	CALL :GetIsBetweenAssertionResult %2 %3 %4
	
) 

GOTO :EOF	
