@ECHO OFF


SET $$$CURRENT_NAMESPACE$$$=TestingLib.Infra.API
SET $$$_CURRENT_SCRIPT_PATH_$$$=%~dp0

SET TESTING_LIB_CONTROLLERS_PATH=%$$$_CURRENT_SCRIPT_PATH_$$$%Controllers



REM ==================== FUNCTION CALL ====================================	
Rem %2: Id de l'Action
Rem %3: Lang. Id
Rem %4: Messages Displayer Script
IF %1. EQU AssertionResultDisplay. (
  CALL "%TESTING_LIB_CONTROLLERS_PATH%/AssertionResultDisplayController.bat" %2 %3 %4  %5 %6 %7 %8 %9
)


GOTO :EOF