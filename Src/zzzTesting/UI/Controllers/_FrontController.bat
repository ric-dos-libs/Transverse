@ECHO OFF


SET $$$_CURRENT_SCRIPT_PATH_$$$=%~dp0

SET TESTING_UI_PATH=%$$$_CURRENT_SCRIPT_PATH_$$$%..
SET TESTING_UI_COMMON_PATH=%TESTING_UI_PATH%/_Common

CALL "%TESTING_UI_COMMON_PATH%/_Pathes.bat"




REM ==================== FUNCTION CALL ====================================	
Rem %2: Id de l'Action
Rem %3: Lang. Id
IF %1. EQU AssertionResultDisplay. (
  CALL "%TESTING_UI_CONTROLLERS_PATH%/AssertionResultDisplayController.bat" %2 %3  %4 %5 %6 %7 %8 %9

)


GOTO :EOF