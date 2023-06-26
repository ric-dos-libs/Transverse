@ECHO OFF

Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))

SET ___diui_CURRENT_SCRIPT_PATH_ditst___=%~dp0

SET TESTING_UI_PATH=%___diui_CURRENT_SCRIPT_PATH_ditst___%..
SET TESTING_UI_COMMON_PATH=%TESTING_UI_PATH%/_Common

REM Recup. de TESTING_UI_DI_PATH
CALL "%TESTING_UI_COMMON_PATH%/_Pathes.bat"


CALL "%TESTING_UI_DI_PATH%/CommonDependenciesInjection.bat" %1
CALL "%TESTING_UI_DI_PATH%/DomainDependenciesInjection.bat" %1
CALL "%TESTING_UI_DI_PATH%/ApplicationDependenciesInjection.bat" %1

CALL "%TESTING_UI_DI_PATH%/UIDependenciesInjection.bat" %1