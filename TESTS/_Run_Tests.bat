@ECHO OFF

SET __TESTING_LIB_ADAPTER__=%~1


SET _tr_CURRENT_SCRIPT_PATH_tr_=%~dp0
SET __TRANSVERSE_TESTS_PATH__=%_tr_CURRENT_SCRIPT_PATH_tr_%
SET __TRANSVERSE_PATH__=%__TRANSVERSE_TESTS_PATH__%../Src


REM ------------------------------------------------------------------------------------------
SET TRANSVERSE_TESTS_COMMON_PATH=%__TRANSVERSE_TESTS_PATH__%/Transverse._Common
SET TRANSVERSE_TESTS_DOMAIN_PATH=%__TRANSVERSE_TESTS_PATH__%Transverse.Domain
SET TRANSVERSE_TESTS_INFRA_PATH=%__TRANSVERSE_TESTS_PATH__%Transverse.Infra



REM ------------------------------------------------------------------------------------------
REM Recup. de TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT
SET TRANSVERSE_TESTS_INFRA_COMMON_PATH=%TRANSVERSE_TESTS_INFRA_PATH%/_Common
CALL "%TRANSVERSE_TESTS_INFRA_COMMON_PATH%/_Pathes.bat"


REM --------------------- Choix de l'afficheur de messages -----------------------------------
REM       (Ce Displayer devra posséder une function WriteMessage(message, nbFoisAffiche))
SET TRANSVERSE_UI_PATH=%__TRANSVERSE_PATH__%/Transverse.UI
SET TRANSVERSE_UI_COMMON_PATH=%TRANSVERSE_UI_PATH%/_Common
CALL "%TRANSVERSE_UI_COMMON_PATH%/_Pathes.bat"
SET MESSAGES_DISPLAYER=%TRANSVERSE_UI_MESSAGES_MESSAGES_DISPLAYER_SCRIPT%


REM --------------------- Choix de l'adaptateur entre nos TESTS/ -----------------------------
REM                       et une librairie d'outils de Testing
SET TESTING_TOOL=%__TESTING_LIB_ADAPTER__%

REM ***** ATTENTION %TESTING_TOOL% doit être un Scripts précisé en amont et existant ! *****
CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%TESTING_TOOL%"






REM ============ RUN des TESTS ==========================

  @REM Rem ------ Unit TESTS ------
  CALL "%TRANSVERSE_TESTS_COMMON_PATH%/_Run_UnitTests.bat"
  PAUSE

  CALL "%TRANSVERSE_TESTS_DOMAIN_PATH%/_Run_UnitTests.bat"
  PAUSE

  CALL "%TRANSVERSE_TESTS_INFRA_PATH%/_Run_UnitTests.bat"
  PAUSE

