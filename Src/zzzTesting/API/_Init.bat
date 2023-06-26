@ECHO OFF
Rem Le présent bat, ne doit être appelé QUE par le _Init.bat, situé à la racine de la présente lib. .
Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))


SET _$xapi$__$_CURRENT_SCRIPT_PATH_$__$x$_=%~dp0

SET TESTING_API_PATH=%_$xapi$__$_CURRENT_SCRIPT_PATH_$__$x$_%
SET TESTING_API_COMMON_PATH=%TESTING_API_PATH%/_Common

REM Recup. de TESTING_API_DI_PATH, entre autres...
CALL "%TESTING_API_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------
CALL "%TESTING_API_DI_PATH%/_DependenciesInjection.bat" %1