@ECHO OFF
Rem %1 : Messages Displayer

@REM SET _$x$__$CURRENT_NAMESPACE$__$x$_=TestingLib.Infra
SET _$x$__$_CURRENT_SCRIPT_PATH_$__$x$_=%~dp0

SET TESTING_LIB_INFRA_PATH=%_$x$__$_CURRENT_SCRIPT_PATH_$__$x$_%

SET TESTING_LIB_INFRA_COMMON_PATH=%TESTING_LIB_INFRA_PATH%/_Common

REM Recup. de TESTING_LIB_INFRA_DI_PATH
CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"




REM ---------------------------------------------------------------
CALL "%TESTING_LIB_INFRA_DI_PATH%/DomainDependenciesInjection.bat" %1
CALL "%TESTING_LIB_INFRA_DI_PATH%/ApplicationDependenciesInjection.bat"
