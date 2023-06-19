@ECHO OFF


SET _$$$CURRENT_NAMESPACE$$$_=TestingLib.Application.UseCases
SET _$$$_CURRENT_SCRIPT_PATH_$$$_=%~dp0


SET TESTING_LIB_APPLICATION_COMMON_PATH=%_$$$_CURRENT_SCRIPT_PATH_$$$_%../_Common

REM Recup. de TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT
CALL "%TESTING_LIB_APPLICATION_COMMON_PATH%/_Pathes.bat"

REM Vérif. que TESTING_LIB_SCRIPTS_REPOSITORY_SCRIPT a bien été "injecté" en global.
CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists TESTING_LIB_SCRIPTS_REPOSITORY_SCRIPT




REM ===========================================================================	
Rem %1: Id de l'URL du script à se faire retourner par le ScriptsRepository

SET __REPOSITORY_RESPONSE__=
CALL "%TESTING_LIB_SCRIPTS_REPOSITORY_SCRIPT%" GetURL %1 __REPOSITORY_RESPONSE__
Rem Renvoi par référence
SET %2=%__REPOSITORY_RESPONSE__%


GOTO :EOF