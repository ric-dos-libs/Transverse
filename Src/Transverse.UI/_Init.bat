@ECHO OFF

Rem %1 : errors handler


SET _ui_CURRENT_SCRIPT_PATH__=%~dp0

SET TRANSVERSE_UI_PATH=%_ui_CURRENT_SCRIPT_PATH__%
SET TRANSVERSE_UI_COMMON_PATH=%TRANSVERSE_UI_PATH%/_Common

REM Recup. de TRANSVERSE_UI_DI_PATH
CALL "%TRANSVERSE_UI_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------
CALL "%TRANSVERSE_UI_DI_PATH%/_DependenciesInjection.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
