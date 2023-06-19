@ECHO OFF


SET $$$CURRENT_NAMESPACE$$$=TestingLib.Infra.API
SET $$$_CURRENT_SCRIPT_PATH_$$$=%~dp0

SET TESTING_LIB_CONTROLLERS_PATH=%$$$_CURRENT_SCRIPT_PATH_$$$%Controllers



REM ==================== FUNCTION CALL ====================================	
Rem %2: Id de l'Action
IF %1. EQU Scripts. (
  SET __SCRIPTS_CONTROLLER_RESPONSE__=
  CALL "%TESTING_LIB_CONTROLLERS_PATH%/ScriptsController.bat" %2 __SCRIPTS_CONTROLLER_RESPONSE__ %4  %5 %6 %7 %8 %9
  Rem Renvoi par référence
	SET %3=!__SCRIPTS_CONTROLLER_RESPONSE__!

) ELSE IF %1. EQU AssertionResult. (
  SET __ASSERTION_RESULT_CONTROLLER_RESPONSE__=
  CALL "%TESTING_LIB_CONTROLLERS_PATH%/AssertionResultController.bat" %2 __ASSERTION_RESULT_CONTROLLER_RESPONSE__ %4 %5  %6 %7 %8 %9
  Rem Renvoi par référence
	SET %3=!__ASSERTION_RESULT_CONTROLLER_RESPONSE__!  
)



GOTO :EOF