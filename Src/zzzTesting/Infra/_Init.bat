@ECHO OFF
Rem Le présent bat, ne doit être appelé QUE par le _Init.bat, situé à la racine de la présente lib. .
Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))


SET _$xinf$__$_CURRENT_SCRIPT_PATH_$__$x$_=%~dp0

SET TESTING_INFRA_PATH=%_$xinf$__$_CURRENT_SCRIPT_PATH_$__$x$_%
SET TESTING_INFRA_COMMON_PATH=%TESTING_INFRA_PATH%/_Common

REM Recup. de TESTING_INFRA_DI_PATH, entre autres...
CALL "%TESTING_INFRA_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------
CALL "%TESTING_INFRA_DI_PATH%/_DependenciesInjection.bat" %1
