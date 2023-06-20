@ECHO OFF
REM ---------------- SCRIPT DE DECOUPLAGE/ADAPTATION POUR LIER LES 2 MONDES : ------------------
REM   à savoir : ma présente Architecture Transverse (partie TESTS/)   
REM              ET   une librairie externe comprenant des outils pour Testing.


SET $z$_$CURRENT_SCRIPT_PATH$_$z$=%~dp0
SET TESTS_COMMON_PATH=%$z$_$CURRENT_SCRIPT_PATH$_$z$%Transverse._Common

REM Recup. de SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT
CALL "%TESTS_COMMON_PATH%/_Pathes.bat"

REM ***** ATTENTION %MESSAGES_DISPLAYER% doit être un Script précisé en amont et existant ! *****
CALL "%SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%MESSAGES_DISPLAYER%"



REM --------- Choix de la Lib. Externe de Testing ----------
SET EXTERNAL_TESTING_LIB_PATH=%TESTS_COMMON_PATH%/../_ExternalTestingLib

SET EXTERNAL_TESTING_LIB_INFRA_PATH=%EXTERNAL_TESTING_LIB_PATH%/TestingLib.Infra
SET EXTERNAL_TESTING_LIB_INFRA_API_PATH=%EXTERNAL_TESTING_LIB_INFRA_PATH%/API
SET EXTERNAL_TESTING_LIB_INFRA_API_ENUMS_PATH=%EXTERNAL_TESTING_LIB_INFRA_API_PATH%/Enums
SET EXTERNAL_TESTING_LIB_INFRA_API_FRONT_CONTROLLER_SCRIPT=%EXTERNAL_TESTING_LIB_INFRA_API_PATH%/_FrontController.bat


Rem Recup. de TESTING_LIB_INFRA_API_ENUMS__LANG_US_ID, etc...
CALL "%EXTERNAL_TESTING_LIB_INFRA_API_ENUMS_PATH%/Lang.bat"


REM ------ Init. de la librairie externe ------
CALL "%EXTERNAL_TESTING_LIB_INFRA_PATH%/_Init.bat" "%MESSAGES_DISPLAYER%" 




SET EXTERNAL_TESTING_LIB_LANG_ID=%TESTING_LIB_INFRA_API_ENUMS__LANG_US_ID%

REM ==================== ACTIONS en fonction des params reçus ====================================	

REM ---- Pour appel aux Functions utilitaires de la librairie externe ----
IF %1. EQU AssertAreEqual. (
  Rem %2 : résultat obtenu
  Rem %3 : résultat attendu
  CALL "%EXTERNAL_TESTING_LIB_INFRA_API_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay Equality "%EXTERNAL_TESTING_LIB_LANG_ID%" %2 %3

) ELSE IF %1. EQU AssertIsBetween. (
  Rem %2 : résultat obtenu
  Rem [%3, %4[ : plage des valeurs autorisées
  CALL "%EXTERNAL_TESTING_LIB_INFRA_API_FRONT_CONTROLLER_SCRIPT%" AssertionResultDisplay IsBetween "%EXTERNAL_TESTING_LIB_LANG_ID%" %2 %3 %4

)

GOTO :EOF