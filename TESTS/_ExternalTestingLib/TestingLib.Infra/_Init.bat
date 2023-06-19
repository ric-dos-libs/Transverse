SET _$x$__$CURRENT_NAMESPACE$__$x$_=TestingLib.Infra
SET _$x$__$_CURRENT_SCRIPT_PATH_$__$x$_=%~dp0

SET TESTING_LIB_INFRA_PATH=%_$x$__$_CURRENT_SCRIPT_PATH_$__$x$_%


REM ---------------------------------------------------------------


REM ---------------------------------------------------------------
@REM SET TESTING_LIB_LANG_ID=%~1

REM ---------------------------------------------------------------
CALL "%TESTING_LIB_INFRA_PATH%/DependenciesInjection.bat" 
