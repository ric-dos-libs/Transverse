@ECHO OFF
Rem Must be called by _DependenciesInjection.bat

Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))


SET __applidi_CURRENT_SCRIPT_PATH__=%~dp0


REM Pour Recup. TESTING_INFRA_ADAPTERS_DISK_ELEMENTS_DISK_ELEMENTS_ADAPTER_SCRIPT
SET TESTING_UI_PATH=%__applidi_CURRENT_SCRIPT_PATH__%..
SET TESTING_INFRA_PATH=%TESTING_UI_PATH%/../Infra
SET TESTING_INFRA_COMMON_PATH=%TESTING_INFRA_PATH%/_Common
CALL "%TESTING_INFRA_COMMON_PATH%/_Pathes.bat"





REM ------------------- "Injection" ---------------------
REM        Met en fait en global des var. d'env.

SET TESTING_APPLICATION_ERRORS_HANDLER=%~1
SET TESTING_APPLICATION_DISK_ELEMENTS_SERVICE=%TESTING_INFRA_ADAPTERS_DISK_ELEMENTS_DISK_ELEMENTS_ADAPTER_SCRIPT%