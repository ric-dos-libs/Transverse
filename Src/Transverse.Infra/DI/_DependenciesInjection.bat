@ECHO OFF

Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))
Rem %2 : messages displayer (script devant posséder une function : WriteMessage(msg, nbFoisAffiche=1))


SET ___diinf_CURRENT_SCRIPT_PATH_di___=%~dp0

SET TRANSVERSE_INFRA_PATH=%___diinf_CURRENT_SCRIPT_PATH_di___%..
SET TRANSVERSE_INFRA_COMMON_PATH=%TRANSVERSE_INFRA_PATH%/_Common

REM Recup. de TRANSVERSE_INFRA_DI_PATH
CALL "%TRANSVERSE_INFRA_COMMON_PATH%/_Pathes.bat"


CALL "%TRANSVERSE_INFRA_DI_PATH%/InfraDependenciesInjection.bat" %1 %2