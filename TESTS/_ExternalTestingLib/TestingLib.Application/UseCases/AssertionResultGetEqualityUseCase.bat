@ECHO OFF


SET _$$$CURRENT_NAMESPACE$$$_=TestingLib.Application.UseCases
SET _$$$_CURRENT_SCRIPT_PATH_$$$_=%~dp0


SET TESTING_LIB_APPLICATION_COMMON_PATH=%_$$$_CURRENT_SCRIPT_PATH_$$$_%../_Common

REM Recup. de TESTING_LIB_DOMAIN_COMMON_SERVICES_PATH
CALL "%TESTING_LIB_APPLICATION_COMMON_PATH%/_Pathes.bat"




REM ===========================================================================	
Rem %1 et %2: valeurs à comparer

SET __DOMAINE_SERVICE_RESPONSE__=
CALL "%TESTING_LIB_DOMAIN_COMMON_SERVICES_PATH%/AssertionsResultEvaluatorService.bat" GetEqualityAssertionResult %1 %2 __DOMAINE_SERVICE_RESPONSE__

Rem Renvoi par référence, du résultat de l'assertion.
SET %3=%__DOMAINE_SERVICE_RESPONSE__%


GOTO :EOF