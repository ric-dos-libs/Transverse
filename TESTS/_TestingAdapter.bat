@ECHO OFF
REM ---------------- SCRIPT DE DECOUPLAGE/ADAPTATION POUR LIER LES 2 MONDES : ------------------
REM   à savoir : ma présente Architecture Transverse (partie TESTS/)   
REM              ET   une librairie externe comprenant des outils pour Testing.


SET __tla__CURRENT_SCRIPT_PATH__tla__=%~dp0

SET TRANSVERSE_TESTS_PATH=%__tla__CURRENT_SCRIPT_PATH__tla__%



REM --------- Choix de la Lib. Externe de Testing ----------
SET EXTERNAL_TESTING_PATH=%TRANSVERSE_TESTS_PATH%../../../Testing/zzDOS/Src



SET EXTERNAL_TESTING_INFRA_PATH=%EXTERNAL_TESTING_PATH%/Testing.Infra
SET EXTERNAL_TESTING_INFRA_COMMON_PATH=%EXTERNAL_TESTING_INFRA_PATH%/_Common
Rem Malheureusement le flag ci-dessous, vu d'ici, est toujours indéfini ! Une optimisation à voir un jour...
IF NOT DEFINED FLAG_TESTING_INFRA_COMMON_PATHES_EXECUTED (
  CALL "%EXTERNAL_TESTING_INFRA_COMMON_PATH%/_Pathes.bat"
)

@REM SET EXTERNAL_TESTING_API_PATH=%EXTERNAL_TESTING_PATH%/Testing.API
@REM SET EXTERNAL_TESTING_API_COMMON_PATH=%EXTERNAL_TESTING_API_PATH%/_Common
@REM Rem Malheureusement le flag ci-dessous, vu d'ici, est toujours indéfini ! Une optimisation à voir un jour...
@REM IF NOT DEFINED FLAG_TESTING_API_COMMON_PATHES_EXECUTED (
@REM   CALL "%EXTERNAL_TESTING_API_COMMON_PATH%/_Pathes.bat"
@REM )


SET EXTERNAL_TESTING_UI_PATH=%EXTERNAL_TESTING_PATH%/Testing.UI
SET EXTERNAL_TESTING_UI_COMMON_PATH=%EXTERNAL_TESTING_UI_PATH%/_Common
Rem Malheureusement le flag ci-dessous, vu d'ici, est toujours indéfini ! Une optimisation à voir un jour...
IF NOT DEFINED FLAG_TESTING_UI_COMMON_PATHES_EXECUTED (
  CALL "%EXTERNAL_TESTING_UI_COMMON_PATH%/_Pathes.bat"
)


SET EXTERNAL_TESTING_UI_FRONT_CONTROLLER_SCRIPT=%TESTING_UI_CONTROLLERS_FRONT_CONTROLLER_SCRIPT%
SET EXTERNAL_TESTING_UI_CONTROLLERS_ENUMS_LANG_SCRIPT=%TESTING_UI_CONTROLLERS_ENUMS_LANG_SCRIPT%

REM Recup. de TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT
IF NOT DEFINED FLAG_TRANSVERSE_TESTS_INFRA_COMMON_PATHES_EXECUTED (
  SET TRANSVERSE_TESTS_INFRA_PATH=%__tla__CURRENT_SCRIPT_PATH__tla__%Transverse.Infra
  SET TRANSVERSE_TESTS_INFRA_COMMON_PATH=%TRANSVERSE_TESTS_INFRA_PATH%/_Common
  CALL "%TRANSVERSE_TESTS_INFRA_COMMON_PATH%/_Pathes.bat"
)


REM ------ Init. de la librairie Transverse  ------
SET TRANSVERSE_PATH=%TRANSVERSE_TESTS_PATH%../Src
CALL "%TRANSVERSE_PATH%/_Init.bat" "%MESSAGES_DISPLAYER%"

REM ------ Init. de la librairie externe ------
CALL "%EXTERNAL_TESTING_PATH%/_Init.bat" "%MESSAGES_DISPLAYER%"


REM ***** ATTENTION %MESSAGES_DISPLAYER% doit être un Script précisé en amont et existant ! *****
CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%MESSAGES_DISPLAYER%"





Rem Recup. de TESTING_UI_CONTROLLERS_ENUMS__LANG_US_ID, etc...
CALL "%EXTERNAL_TESTING_UI_CONTROLLERS_ENUMS_LANG_SCRIPT%"

SET EXTERNAL_TESTING_UI_LANG_ID=%TESTING_UI_CONTROLLERS_ENUMS__LANG_US_ID%




REM ==================== ACTIONS en fonction des params reçus ====================================	

REM ---- Pour appel aux Functions utilitaires de la librairie externe ----
IF %1. EQU AssertAreEqual. (
  Rem %2 : résultat obtenu
  Rem %3 : résultat attendu
  CALL "%EXTERNAL_TESTING_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay Equality "%EXTERNAL_TESTING_UI_LANG_ID%" %2 %3

) ELSE IF %1. EQU AssertIsBetween. (
  Rem %2 : résultat obtenu
  Rem [%3, %4[ : plage des valeurs autorisées
  CALL "%EXTERNAL_TESTING_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay IsBetween "%EXTERNAL_TESTING_UI_LANG_ID%" %2 %3 %4

) ELSE IF %1. EQU AssertAreNotEqual. (
  Rem %2 : résultat obtenu
  Rem %3 : résultat non attendu
  CALL "%EXTERNAL_TESTING_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay NoEquality "%EXTERNAL_TESTING_UI_LANG_ID%" %2 %3

) ELSE IF %1. EQU AssertDiskElementExists. (
  Rem %2 : DiskElement
  CALL "%EXTERNAL_TESTING_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay DiskElementExists "%EXTERNAL_TESTING_UI_LANG_ID%" %2

) ELSE IF %1. EQU AssertDiskElementDoesntExist. (
  Rem %2 : DiskElement
  CALL "%EXTERNAL_TESTING_UI_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay DiskElementDoesntExist "%EXTERNAL_TESTING_UI_LANG_ID%" %2

)




GOTO :EOF