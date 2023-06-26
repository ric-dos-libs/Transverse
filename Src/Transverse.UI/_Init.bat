@ECHO OFF
Rem Le présent bat, ne doit être appelé QUE par le _Init.bat, situé à la racine de la présente lib. .
Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))


SET _ui_CURRENT_SCRIPT_PATH__=%~dp0

SET TRANSVERSE_UI_PATH=%_ui_CURRENT_SCRIPT_PATH__%
SET TRANSVERSE_UI_COMMON_PATH=%TRANSVERSE_UI_PATH%/_Common

REM Recup. de TRANSVERSE_UI_DI_PATH, entre autres...
CALL "%TRANSVERSE_UI_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------
CALL "%TRANSVERSE_UI_DI_PATH%/_DependenciesInjection.bat" %1
