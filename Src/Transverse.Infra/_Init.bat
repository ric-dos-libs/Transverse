@ECHO OFF
REM Le présent bat, ne doit être appelé QUE par le _Init.bat, situé à la racine de la présente lib. .

Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))
Rem %2 : messages displayer (script devant posséder une function : WriteMessage(msg, nbFoisAffiche=1))



SET _inf_CURRENT_SCRIPT_PATH__=%~dp0

SET TRANSVERSE_INFRA_PATH=%_inf_CURRENT_SCRIPT_PATH__%
SET TRANSVERSE_INFRA_COMMON_PATH=%TRANSVERSE_INFRA_PATH%/_Common

REM Recup. de TRANSVERSE_INFRA_DI_PATH, entre autres...
CALL "%TRANSVERSE_INFRA_COMMON_PATH%/_Pathes.bat"



REM ---------------------------------------------------------------
CALL "%TRANSVERSE_INFRA_DI_PATH%/_DependenciesInjection.bat" %1 %2
