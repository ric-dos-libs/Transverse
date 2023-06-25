@ECHO OFF

SET MESSAGES_DISPLAYER=%~1
SET TESTING_LIB=%~2


SET _tr_CURRENT_SCRIPT_PATH_tr_=%~dp0


REM ------------------------------------------------------------------------------------------
SET TESTS_COMMON_PATH=%_tr_CURRENT_SCRIPT_PATH_tr_%Transverse._Common
SET TESTS_DOMAIN_PATH=%_tr_CURRENT_SCRIPT_PATH_tr_%Transverse.Domain
SET TESTS_INFRA_PATH=%_tr_CURRENT_SCRIPT_PATH_tr_%Transverse.Infra


REM ------------------------------------------------------------------------------------------
REM Recup. de SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT
SET TEST_INFRA_COMMON_PATH=%TESTS_INFRA_PATH%/_Common
CALL "%TEST_INFRA_COMMON_PATH%/_Pathes.bat"



REM --------------------- Choix de l'afficheur de résultats de tests -------------------------
REM                  Notre adaptateur fait en effet très bien l'affaire, 
REM                vues les functions comme AssertAreEqual, qu'il expose.
SET TESTING_TOOL=%TESTING_LIB%


REM ***** ATTENTION %MESSAGES_DISPLAYER% et %TESTING_TOOL% doivent être des Scripts précisés en amont et existants ! *****
CALL "%SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%MESSAGES_DISPLAYER%"
CALL "%SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%TESTING_TOOL%"






REM ============ RUN des TESTS ==========================

  @REM Rem ------ Unit TESTS ------
  @REM CALL "%TESTS_COMMON_PATH%/_Run_UnitTests.bat"
  @REM PAUSE

  CALL "%TESTS_DOMAIN_PATH%/_Run_UnitTests.bat"
  PAUSE

  CALL "%TESTS_INFRA_PATH%/_Run_UnitTests.bat"
  PAUSE

