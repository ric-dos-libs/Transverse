@ECHO OFF

SET _$xapi$__$_CURRENT_SCRIPT_PATH_$__$x$_=%~dp0

SET TESTING_LIB_API_PATH=%_$xapi$__$_CURRENT_SCRIPT_PATH_$__$x$_%
SET TESTING_LIB_API_COMMON_PATH=%TESTING_LIB_API_PATH%/_Common

REM Recup. de TESTING_LIB_API_DI_PATH
CALL "%TESTING_LIB_API_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------
CALL "%TESTING_LIB_API_DI_PATH%/_DependenciesInjection.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
