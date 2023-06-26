@ECHO OFF

Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))


SET ___diapi_CURRENT_SCRIPT_PATH_di___=%~dp0

SET TESTING_API_PATH=%___diapi_CURRENT_SCRIPT_PATH_di___%..
SET TESTING_API_COMMON_PATH=%TESTING_API_PATH%/_Common

REM Recup. de TESTING_API_DI_PATH
CALL "%TESTING_API_COMMON_PATH%/_Pathes.bat"


CALL "%TESTING_API_DI_PATH%/CommonDependenciesInjection.bat" %1
CALL "%TESTING_API_DI_PATH%/DomainDependenciesInjection.bat" %1
CALL "%TESTING_API_DI_PATH%/ApplicationDependenciesInjection.bat" %1

CALL "%TESTING_API_DI_PATH%/APIDependenciesInjection.bat" %1