@ECHO OFF
Rem Le présent bat, ne doit être appelé QUE par le _Init.bat, situé à la racine de la présente lib. .
Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))


SET __CURRENT_SCRIPT_PATH_uitsting__=%~dp0

SET TESTING_UI_PATH=%__CURRENT_SCRIPT_PATH_uitsting__%
SET TESTING_UI_COMMON_PATH=%TESTING_UI_PATH%/_Common

REM Recup. de TESTING_UI_DI_PATH, entre autres...
CALL "%TESTING_UI_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------
CALL "%TESTING_UI_DI_PATH%/_DependenciesInjection.bat" %1
