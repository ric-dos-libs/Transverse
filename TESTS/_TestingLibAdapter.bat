@ECHO OFF
REM ---------------- SCRIPT DE DECOUPLAGE/ADAPTATION POUR LIER LES 2 MONDES : ------------------
REM   à savoir : ma présente Architecture Transverse (partie TESTS/)   
REM              ET   une librairie externe comprenant des outils pour Testing.


SET __tla__CURRENT_SCRIPT_PATH__tla__=%~dp0


REM --------- Choix de la Lib. Externe de Testing ----------
SET EXTERNAL_TESTING_LIB_PATH=%__tla__CURRENT_SCRIPT_PATH__tla__%_ExternalTestingLib

SET EXTERNAL_TESTING_LIB_INFRA_PATH=%EXTERNAL_TESTING_LIB_PATH%/TestingLib.Infra
SET EXTERNAL_TESTING_LIB_INFRA_COMMON_PATH=%EXTERNAL_TESTING_LIB_INFRA_PATH%/_Common
Rem Malheureusement le flag ci-dessous, vu d'ici, est toujours indéfini ! Une optimisation à voir un jour...
IF NOT DEFINED FLAG_TESTING_LIB_INFRA_COMMON_PATHES_EXECUTED (
  CALL "%EXTERNAL_TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"
)

@REM SET EXTERNAL_TESTING_LIB_API_PATH=%EXTERNAL_TESTING_LIB_PATH%/TestingLib.API
@REM SET EXTERNAL_TESTING_LIB_API_COMMON_PATH=%EXTERNAL_TESTING_LIB_API_PATH%/_Common
@REM Rem Malheureusement le flag ci-dessous, vu d'ici, est toujours indéfini ! Une optimisation à voir un jour...
@REM IF NOT DEFINED FLAG_TESTING_LIB_API_COMMON_PATHES_EXECUTED (
@REM   CALL "%EXTERNAL_TESTING_LIB_API_COMMON_PATH%/_Pathes.bat"
@REM )


SET EXTERNAL_TESTING_LIB_UI_PATH=%EXTERNAL_TESTING_LIB_PATH%/TestingLib.UI
SET EXTERNAL_TESTING_LIB_UI_COMMON_PATH=%EXTERNAL_TESTING_LIB_UI_PATH%/_Common
Rem Malheureusement le flag ci-dessous, vu d'ici, est toujours indéfini ! Une optimisation à voir un jour...
IF NOT DEFINED FLAG_TESTING_LIB_UI_COMMON_PATHES_EXECUTED (
  CALL "%EXTERNAL_TESTING_LIB_UI_COMMON_PATH%/_Pathes.bat"
)


SET EXTERNAL_TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT=%TESTING_LIB_UI_CONTROLLERS_FRONT_CONTROLLER_SCRIPT%
SET EXTERNAL_TESTING_LIB_UI_CONTROLLERS_ENUMS_LANG_SCRIPT=%TESTING_LIB_UI_CONTROLLERS_ENUMS_LANG_SCRIPT%

REM Recup. de SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT
IF NOT DEFINED FLAG_TESTS_INFRA_COMMON_PATHES_EXECUTED (
  SET TESTS_INFRA_PATH=%__tla__CURRENT_SCRIPT_PATH__tla__%Transverse.Infra
  SET TESTS_INFRA_COMMON_PATH=%TESTS_INFRA_PATH%/_Common
  CALL "%TESTS_INFRA_COMMON_PATH%/_Pathes.bat"
)

REM ***** ATTENTION %MESSAGES_DISPLAYER% doit être un Script précisé en amont et existant ! *****
CALL "%SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%MESSAGES_DISPLAYER%"



REM ------ Init. de la librairie externe ------
CALL "%EXTERNAL_TESTING_LIB_PATH%/_Init.bat" "%MESSAGES_DISPLAYER%"

Rem Recup. de TESTING_LIB_UI_CONTROLLERS_ENUMS__LANG_US_ID, etc...
CALL "%EXTERNAL_TESTING_LIB_UI_CONTROLLERS_ENUMS_LANG_SCRIPT%"

SET EXTERNAL_TESTING_LIB_UI_LANG_ID=%TESTING_LIB_UI_CONTROLLERS_ENUMS__LANG_US_ID%




REM ==================== ACTIONS en fonction des params reçus ====================================	

REM ---- Pour appel aux Functions utilitaires de la librairie externe ----
IF %1. EQU AssertAreEqual. (
  Rem %2 : résultat obtenu
  Rem %3 : résultat attendu
  CALL "%EXTERNAL_TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay Equality "%EXTERNAL_TESTING_LIB_UI_LANG_ID%" %2 %3

) ELSE IF %1. EQU AssertIsBetween. (
  Rem %2 : résultat obtenu
  Rem [%3, %4[ : plage des valeurs autorisées
  CALL "%EXTERNAL_TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay IsBetween "%EXTERNAL_TESTING_LIB_UI_LANG_ID%" %2 %3 %4

) ELSE IF %1. EQU AssertAreNotEqual. (
  Rem %2 : résultat obtenu
  Rem %3 : résultat non attendu
  CALL "%EXTERNAL_TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay NoEquality "%EXTERNAL_TESTING_LIB_UI_LANG_ID%" %2 %3

) ELSE IF %1. EQU AssertDiskElementExists. (
  Rem %2 : DiskElement
  CALL "%EXTERNAL_TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay DiskElementExists "%EXTERNAL_TESTING_LIB_UI_LANG_ID%" %2

) ELSE IF %1. EQU AssertDiskElementDoesntExist. (
  Rem %2 : DiskElement
  CALL "%EXTERNAL_TESTING_LIB_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay DiskElementDoesntExist "%EXTERNAL_TESTING_LIB_UI_LANG_ID%" %2

)




GOTO :EOF