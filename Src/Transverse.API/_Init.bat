@ECHO OFF
Rem Le présent bat, ne doit être appelé QUE par le _Init.bat, situé à la racine de la présente lib. .
Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))


SET _api_CURRENT_SCRIPT_PATH__=%~dp0

SET TRANSVERSE_API_PATH=%_api_CURRENT_SCRIPT_PATH__%
SET TRANSVERSE_API_COMMON_PATH=%TRANSVERSE_API_PATH%/_Common

REM Recup. de TRANSVERSE_API_DI_PATH, entre autres...
CALL "%TRANSVERSE_API_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------
CALL "%TRANSVERSE_API_DI_PATH%/_DependenciesInjection.bat" %1
