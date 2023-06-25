@ECHO OFF

Rem %1 : errors handler


SET ___diapi_CURRENT_SCRIPT_PATH_di___=%~dp0

SET TRANSVERSE_API_PATH=%___diapi_CURRENT_SCRIPT_PATH_di___%..
SET TRANSVERSE_API_COMMON_PATH=%TRANSVERSE_API_PATH%/_Common

REM Recup. de TRANSVERSE_API_DI_PATH
CALL "%TRANSVERSE_API_COMMON_PATH%/_Pathes.bat"


CALL "%TRANSVERSE_API_DI_PATH%/CommonDependenciesInjection.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
CALL "%TRANSVERSE_API_DI_PATH%/DomainDependenciesInjection.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
CALL "%TRANSVERSE_API_DI_PATH%/ApplicationDependenciesInjection.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9

CALL "%TRANSVERSE_API_DI_PATH%/APIDependenciesInjection.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9