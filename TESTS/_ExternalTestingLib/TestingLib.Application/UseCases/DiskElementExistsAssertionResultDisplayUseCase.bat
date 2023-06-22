@ECHO OFF


@REM SET _$$$CURRENT_NAMESPACE$$$_=TestingLib.Application.UseCases
SET _$$$_CURRENT_SCRIPT_PATH_$$$_=%~dp0


SET TESTING_LIB_APPLICATION_COMMON_PATH=%_$$$_CURRENT_SCRIPT_PATH_$$$_%../_Common

REM Recup. de
REM TESTING_LIB_APPLICATION_COMMON_SERVICES_PATH et TESTING_LIB_DOMAIN_COMMON_ENUMS_PATH
CALL "%TESTING_LIB_APPLICATION_COMMON_PATH%/_Pathes.bat"

REM Recup. de TESTING_LIB_ASSERTION_RESULT_SUCCESS_ID et TESTING_LIB_ASSERTION_RESULT_FAILURE_ID
CALL "%TESTING_LIB_DOMAIN_COMMON_ENUMS_PATH%/AssertionResult.bat"




REM ===========================================================================	
Rem %1 : Lang. Id
Rem %2 : DiskElement

Rem Récup. du résultat de l'assertion.
SET __EXISTS__=
CALL "%TESTING_LIB_DISK_ELEMENTS_SERVICE_SCRIPT%" Exists %2 __EXISTS__
IF "%__EXISTS__%." EQU "1." (
  SET __ASSERTION_RESULT_ID__=%TESTING_LIB_ASSERTION_RESULT_SUCCESS_ID%
) ELSE  (
  SET __ASSERTION_RESULT_ID__=%TESTING_LIB_ASSERTION_RESULT_FAILURE_ID%
)
@REM ECHO __ASSERTION_RESULT_ID__='!__ASSERTION_RESULT_ID__!'  for  DiskElement='%2'

Rem Conversion du résultat de l'assertion, en libellé de la langue d'Id %1.
SET __ASSERTION_RESULT_LABEL__=
CALL "%TESTING_LIB_APPLICATION_COMMON_SERVICES_PATH%/MessagesLabelService.bat" GetMessageLabel "!__ASSERTION_RESULT_ID__!" %1 __ASSERTION_RESULT_LABEL__
@REM ECHO __ASSERTION_RESULT_LABEL__='!__ASSERTION_RESULT_LABEL__!'  for  DiskElement='%2' 

Rem Invocation du service d'affichage de résultat d'Assertion.
CALL "%TESTING_LIB_DOMAIN_COMMON_SERVICES_PATH%/AssertionResultDisplayerService.bat" DiskElementExistsAssertionResult "!__ASSERTION_RESULT_ID__!" "!__ASSERTION_RESULT_LABEL__!"  %2

GOTO :EOF