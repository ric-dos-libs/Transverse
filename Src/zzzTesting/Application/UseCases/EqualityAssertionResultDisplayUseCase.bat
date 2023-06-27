@ECHO OFF


SET _$$$_CURRENT_SCRIPT_PATH_$$$_=%~dp0


SET TESTING_APPLICATION_COMMON_PATH=%_$$$_CURRENT_SCRIPT_PATH_$$$_%../_Common


REM Recup. de
REM TESTING_DOMAIN_COMMON_SERVICES_PATH
REM TESTING_APPLICATION_USE_CASES_MAPPERS_DOMAIN_TO_NOT_DOMAIN_SCRIPT
CALL "%TESTING_APPLICATION_COMMON_PATH%/_Pathes.bat"




REM ===========================================================================	
Rem %1 : retour par référence de l'assertion result ID (du Domain) mais converti pour 
Rem      le monde extérieur à la couche Application.
Rem %2 et %3 : valeurs à comparer (%2: obtenu ; %3: attendu)

Rem Récup. du résultat de l'assertion.
SET __ASSERTION_RESULT_ID__=
CALL "%TESTING_DOMAIN_COMMON_SERVICES_PATH%/AssertionsResultEvaluatorService.bat" GetEqualityAssertionResult %2 %3 __ASSERTION_RESULT_ID__
@REM ECHO __ASSERTION_RESULT_ID__='!__ASSERTION_RESULT_ID__!'  for  %2 == %3

SET __CONVERTED_ASSERTION_RESULT_ID__=
CALL "%TESTING_APPLICATION_USE_CASES_MAPPERS_DOMAIN_TO_NOT_DOMAIN_SCRIPT%" ConvertAssertionResultEnum "!__ASSERTION_RESULT_ID__!" __CONVERTED_ASSERTION_RESULT_ID__
@REM ECHO __CONVERTED_ASSERTION_RESULT_ID__='!__CONVERTED_ASSERTION_RESULT_ID__!'  for  %2 == %3


SET %1=!__CONVERTED_ASSERTION_RESULT_ID__!

GOTO :EOF