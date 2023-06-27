@ECHO OFF

Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))


SET ___diinf_CURRENT_SCRIPT_PATH_di___=%~dp0

SET TESTING_INFRA_PATH=%___diinf_CURRENT_SCRIPT_PATH_di___%..
SET TESTING_INFRA_COMMON_PATH=%TESTING_INFRA_PATH%/_Common

REM Recup. de TESTING_INFRA_DI_PATH
CALL "%TESTING_INFRA_COMMON_PATH%/_Pathes.bat"


CALL "%TESTING_INFRA_DI_PATH%/InfraDependenciesInjection.bat" %1