

SET _$$__$CURRENT_NAMESPACE$__$$_=TestingLib.Infra
SET _$$__$_CURRENT_SCRIPT_PATH_$__$$_=%~dp0

SET TESTING_LIB_INFRA_COMMON_PATH=%_$$__$_CURRENT_SCRIPT_PATH_$__$$_%_Common

REM Recup. de TESTING_LIB_INFRA_RESPOSITORIES_PATH
CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"




REM ------------------- "Injection" ---------------------
REM        Met en fait en global des var. d'env.

SET TESTING_LIB_DISPLAY_SCRIPTS_REPOSITORY_SCRIPT=%TESTING_LIB_INFRA_RESPOSITORIES_PATH%/DisplayScriptsRepository.bat