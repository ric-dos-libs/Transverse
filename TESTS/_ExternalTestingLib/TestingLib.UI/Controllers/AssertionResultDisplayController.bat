@ECHO OFF


SET $$$_CURRENT_SCRIPT_PATH_$$$=%~dp0

SET TESTING_LIB_UI_PATH=%$$$_CURRENT_SCRIPT_PATH_$$$%..
SET TESTING_LIB_UI_COMMON_PATH=%TESTING_LIB_UI_PATH%/_Common

CALL "%TESTING_LIB_UI_COMMON_PATH%/_Pathes.bat"





REM =========================================================================================================

REM %2 : lang. Id

IF %1. EQU Equality. (
  Rem %3 et %4 : valeurs à comparer (%3: obtenu ; %4: attendu)

  Rem --- Appel du UseCase ---
  SET __APPLICATION_ASSERTION_RESULT_ID__=
  CALL "%TESTING_LIB_APPLICATION_USE_CASES_PATH%/EqualityAssertionResultDisplayUseCase.bat" __APPLICATION_ASSERTION_RESULT_ID__ %3 %4


) ELSE IF %1. EQU NoEquality. (
  Rem %3 et %4 : valeurs à comparer (%3: obtenu ; %4: non attendu)

  Rem --- Appel du UseCase ---
  SET __APPLICATION_ASSERTION_RESULT_ID__=
  CALL "%TESTING_LIB_APPLICATION_USE_CASES_PATH%/NoEqualityAssertionResultDisplayUseCase.bat" __APPLICATION_ASSERTION_RESULT_ID__ %3 %4


) ELSE IF %1. EQU IsBetween. (
  Rem %3 et [%4, %5[ : valeurs à comparer (%3: obtenu ; [%4, %5[: plage des valeurs autorisées)
  
  Rem --- Appel du UseCase ---
  SET __APPLICATION_ASSERTION_RESULT_ID__=
  CALL "%TESTING_LIB_APPLICATION_USE_CASES_PATH%/IsBetweenAssertionResultDisplayUseCase.bat" __APPLICATION_ASSERTION_RESULT_ID__ %3 %4 %5


) ELSE IF %1. EQU DiskElementExists. (
  Rem %3 : DiskElement

  Rem --- Appel du UseCase ---
  SET __APPLICATION_ASSERTION_RESULT_ID__=
  CALL "%TESTING_LIB_APPLICATION_USE_CASES_PATH%/DiskElementExistsAssertionResultDisplayUseCase.bat" __APPLICATION_ASSERTION_RESULT_ID__ %3


) ELSE IF %1. EQU DiskElementDoesntExist. (
  Rem %3 : DiskElement
  
  Rem --- Appel du UseCase ---
  SET __APPLICATION_ASSERTION_RESULT_ID__=
  CALL "%TESTING_LIB_APPLICATION_USE_CASES_PATH%/DiskElementDoesntExistAssertionResultDisplayUseCase.bat" __APPLICATION_ASSERTION_RESULT_ID__ %3

)


REM Conversion de l'id du résultat d'assertion, en label, ceci suivant la langue %2.
SET __APPLICATION_ASSERTION_RESULT_MESSAGE_LABEL__=
CALL "%TESTING_LIB_UI_COMMON_MESSAGES_PATH%/_MessagesLabelProvider.bat" GetAssertionResultMessageLabel %2 "!__APPLICATION_ASSERTION_RESULT_ID__!" __APPLICATION_ASSERTION_RESULT_MESSAGE_LABEL__


REM "Rapport"-Affichage du résultat de l'assertion.
CALL "%TESTING_LIB_UI_VIEWS_PATH%/AssertionResultView.bat" %1AssertionResult "!__APPLICATION_ASSERTION_RESULT_ID__!" "!__APPLICATION_ASSERTION_RESULT_MESSAGE_LABEL__!" %3 %4 %5


GOTO :EOF