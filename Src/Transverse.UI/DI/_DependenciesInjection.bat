@ECHO OFF

Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))


SET ___diui_CURRENT_SCRIPT_PATH_di___=%~dp0

SET TRANSVERSE_UI_PATH=%___diui_CURRENT_SCRIPT_PATH_di___%..
SET TRANSVERSE_UI_COMMON_PATH=%TRANSVERSE_UI_PATH%/_Common

REM Recup. de TRANSVERSE_UI_DI_PATH
CALL "%TRANSVERSE_UI_COMMON_PATH%/_Pathes.bat"


CALL "%TRANSVERSE_UI_DI_PATH%/CommonDependenciesInjection.bat" %1
CALL "%TRANSVERSE_UI_DI_PATH%/DomainDependenciesInjection.bat" %1
CALL "%TRANSVERSE_UI_DI_PATH%/ApplicationDependenciesInjection.bat" %1

CALL "%TRANSVERSE_UI_DI_PATH%/UIDependenciesInjection.bat" %1