@ECHO OFF
REM ---------------- SCRIPT DE DECOUPLAGE/ADAPTATION POUR LIER LES 2 MONDES : ------------------
REM   à savoir : ma présente Architecture Transverse partie TESTS/,
REM              ET   une librairie d'outils pour Testing.
REM
REM  >>> Rem.:La var d'env. MESSAGES_DISPLAYER, doit avoir été précisée en amont.
REM       (Ce Displayer devra posséder une function WriteMessage(message, nbFoisAffiche))
REM


SET __tla__CURRENT_SCRIPT_PATH__tla__=%~dp0

SET TRANSVERSE_TESTS_PATH=%__tla__CURRENT_SCRIPT_PATH__tla__%
SET TRANSVERSE_PATH=%TRANSVERSE_TESTS_PATH%../Src





REM --------- Choix de la Lib. de Testing et récup. de vars d'env. la concernant ----------
SET TESTING_LIB_PATH=%TRANSVERSE_TESTS_PATH%../Src/zzzTesting


@REM SET TESTING_LIB_API_PATH=%TESTING_LIB_PATH%/API
@REM SET TESTING_LIB_API_COMMON_PATH=%TESTING_LIB_API_PATH%/_Common
@REM CALL "%TESTING_LIB_API_COMMON_PATH%/_Pathes.bat"

@REM SET TESTING_LIB_INFRA_PATH=%TESTING_LIB_PATH%/Infra
@REM SET TESTING_LIB_INFRA_COMMON_PATH=%TESTING_LIB_INFRA_PATH%/_Common
@REM CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"

SET TESTING_LIB_UI_PATH=%TESTING_LIB_PATH%/UI
SET TESTING_LIB_UI_COMMON_PATH=%TESTING_LIB_UI_PATH%/_Common
CALL "%TESTING_LIB_UI_COMMON_PATH%/_Pathes.bat"

SET TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT=%TESTING_UI_CONTROLLERS_FRONT_CONTROLLER_SCRIPT%
SET TESTING_LIB_UI_CONTROLLERS_ENUMS_LANG_SCRIPT=%TESTING_UI_CONTROLLERS_ENUMS_LANG_SCRIPT%




REM --------- Lib. Transverse partie TESTS : récup. de vars d'env. la concernant ----------
SET TRANSVERSE_TESTS_INFRA_PATH=%TRANSVERSE_TESTS_PATH%/Transverse.Infra
SET TRANSVERSE_TESTS_INFRA_COMMON_PATH=%TRANSVERSE_TESTS_INFRA_PATH%/_Common
CALL "%TRANSVERSE_TESTS_INFRA_COMMON_PATH%/_Pathes.bat"




REM ------ Init. de la librairie Transverse  ------
CALL "%TRANSVERSE_PATH%/_Init.bat"

REM ------ Init. de la librairie de Testing ------
CALL "%TESTING_LIB_PATH%/_Init.bat"


REM ***** ATTENTION %MESSAGES_DISPLAYER% doit être un Script précisé en amont et existant ! *****
CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%MESSAGES_DISPLAYER%"





REM ============================= Pour les Id de Langue ==========================================
Rem Recup. de TESTING_UI_CONTROLLERS_ENUMS__LANG_US_ID, etc...
CALL "%TESTING_LIB_UI_CONTROLLERS_ENUMS_LANG_SCRIPT%"

SET TESTING_LIB_UI_LANG_ID=%TESTING_UI_CONTROLLERS_ENUMS__LANG_US_ID%





REM ==================== ACTIONS en fonction des params reçus ====================================	

REM ---- Pour appel aux Functions utilitaires de la librairie externe ----
IF %1. EQU AssertAreEqual. (
  Rem %2 : résultat obtenu
  Rem %3 : résultat attendu
  CALL "%TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay Equality "%TESTING_LIB_UI_LANG_ID%" %2 %3

) ELSE IF %1. EQU AssertIsBetween. (
  Rem %2 : résultat obtenu
  Rem [%3, %4[ : plage des valeurs autorisées
  CALL "%TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay IsBetween "%TESTING_LIB_UI_LANG_ID%" %2 %3 %4

) ELSE IF %1. EQU AssertAreNotEqual. (
  Rem %2 : résultat obtenu
  Rem %3 : résultat non attendu
  CALL "%TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay NoEquality "%TESTING_LIB_UI_LANG_ID%" %2 %3

) ELSE IF %1. EQU AssertDiskElementExists. (
  Rem %2 : DiskElement
  CALL "%TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay DiskElementExists "%TESTING_LIB_UI_LANG_ID%" %2

) ELSE IF %1. EQU AssertDiskElementDoesntExist. (
  Rem %2 : DiskElement
  CALL "%TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay DiskElementDoesntExist "%TESTING_LIB_UI_LANG_ID%" %2

)


GOTO :EOF