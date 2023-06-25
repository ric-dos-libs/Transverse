@ECHO OFF

REM %1 : Le Messages Displayer (script)
REM       (Ce Displayer devra posséder une function WriteMessage(message, nbFoisAffiche))


SET _$x$_ui$_CURRENT_SCRIPT_PATH_$_$x$_=%~dp0

SET TESTING_LIB_UI_PATH=%_$x$_ui$_CURRENT_SCRIPT_PATH_$_$x$_%
SET TESTING_LIB_UI_COMMON_PATH=%TESTING_LIB_UI_PATH%/_Common

REM Recup. de TESTING_LIB_UI_DI_PATH
CALL "%TESTING_LIB_UI_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------
CALL "%TESTING_LIB_UI_DI_PATH%/_DependenciesInjection.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
