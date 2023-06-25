@ECHO OFF


@REM SET _$$$CURRENT_NAMESPACE$$$_=TestingLib.Application.UseCases
SET _$$$_CURRENT_SCRIPT_PATH_$$$_=%~dp0


SET TESTING_LIB_APPLICATION_COMMON_PATH=%_$$$_CURRENT_SCRIPT_PATH_$$$_%../_Common

REM Recup. de
REM TESTING_LIB_DOMAIN_COMMON_SERVICES_PATH
CALL "%TESTING_LIB_APPLICATION_COMMON_PATH%/_Pathes.bat"




REM ===========================================================================	
Rem %1 : retour par référence de __ASSERTION_RESULT_ID__
Rem %2 et %3 : valeurs à comparer (%2: obtenu ; %3: non attendu)

Rem Récup. du résultat de l'assertion.
SET __ASSERTION_RESULT_ID__=
CALL "%TESTING_LIB_DOMAIN_COMMON_SERVICES_PATH%/AssertionsResultEvaluatorService.bat" GetNoEqualityAssertionResult %2 %3 __ASSERTION_RESULT_ID__
@REM ECHO __ASSERTION_RESULT_ID__='!__ASSERTION_RESULT_ID__!'  for  %2 != %3

SET __CONVERTED_ASSERTION_RESULT_ID__=
CALL "%TESTING_LIB_APPLICATION_USE_CASES_MAPPERS_DOMAIN_TO_EXTERNAL_WORLD_SCRIPT%" ConvertAssertionResultEnum "!__ASSERTION_RESULT_ID__!" __CONVERTED_ASSERTION_RESULT_ID__
@REM ECHO __CONVERTED_ASSERTION_RESULT_ID__='!__CONVERTED_ASSERTION_RESULT_ID__!'  for  %2 != %3


SET %1=!__CONVERTED_ASSERTION_RESULT_ID__!

GOTO :EOF