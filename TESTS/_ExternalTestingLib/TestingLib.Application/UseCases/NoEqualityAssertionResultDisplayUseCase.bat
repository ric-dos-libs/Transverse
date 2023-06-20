@ECHO OFF


@REM SET _$$$CURRENT_NAMESPACE$$$_=TestingLib.Application.UseCases
SET _$$$_CURRENT_SCRIPT_PATH_$$$_=%~dp0


SET TESTING_LIB_APPLICATION_COMMON_PATH=%_$$$_CURRENT_SCRIPT_PATH_$$$_%../_Common

REM Recup. de
REM TESTING_LIB_APPLICATION_COMMON_SERVICES_PATH
CALL "%TESTING_LIB_APPLICATION_COMMON_PATH%/_Pathes.bat"




REM ===========================================================================	
Rem %1 : Lang. Id
Rem %2 et %3 : valeurs à comparer (%2: obtenu ; %3: non attendu)

Rem Récup. du résultat de l'assertion.
SET __ASSERTION_RESULT_ID__=
CALL "%TESTING_LIB_DOMAIN_COMMON_SERVICES_PATH%/AssertionsResultEvaluatorService.bat" GetNoEqualityAssertionResult %2 %3 __ASSERTION_RESULT_ID__
@REM ECHO __ASSERTION_RESULT_ID__='!__ASSERTION_RESULT_ID__!'  for  %2 != %3

Rem Conversion du résultat de l'assertion, en libellé de la langue d'Id %1.
SET __ASSERTION_RESULT_LABEL__=
CALL "%TESTING_LIB_APPLICATION_COMMON_SERVICES_PATH%/MessagesLabelService.bat" GetMessageLabel "!__ASSERTION_RESULT_ID__!" %1 __ASSERTION_RESULT_LABEL__
@REM ECHO __ASSERTION_RESULT_LABEL__='!__ASSERTION_RESULT_LABEL__!'  for  %2 != %3

Rem Invocation du service d'affichage de résultat d'Assertion.
CALL "%TESTING_LIB_DOMAIN_COMMON_SERVICES_PATH%/AssertionResultDisplayerService.bat" NoEqualityAssertionResult "!__ASSERTION_RESULT_ID__!" "!__ASSERTION_RESULT_LABEL__!"  %2 %3

GOTO :EOF