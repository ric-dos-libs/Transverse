@ECHO OFF

SET MESSAGES_DISPLAYER=%~1
SET TESTING_LIB=%~2


SET _tr_CURRENT_SCRIPT_PATH_tr_=%~dp0


REM ------------------------------------------------------------------------------------------
SET TRANSVERSE_TESTS_COMMON_PATH=%_tr_CURRENT_SCRIPT_PATH_tr_%Transverse._Common
SET TRANSVERSE_TESTS_DOMAIN_PATH=%_tr_CURRENT_SCRIPT_PATH_tr_%Transverse.Domain
SET TRANSVERSE_TESTS_INFRA_PATH=%_tr_CURRENT_SCRIPT_PATH_tr_%Transverse.Infra


REM ------------------------------------------------------------------------------------------
REM Recup. de TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT
SET TEST_INFRA_COMMON_PATH=%TRANSVERSE_TESTS_INFRA_PATH%/_Common
CALL "%TEST_INFRA_COMMON_PATH%/_Pathes.bat"



REM --------------------- Choix de l'afficheur de résultats de tests -------------------------
REM                  Notre adaptateur fait en effet très bien l'affaire, 
REM                vues les functions comme AssertAreEqual, qu'il expose.
SET TESTING_TOOL=%TESTING_LIB%


REM ***** ATTENTION %MESSAGES_DISPLAYER% et %TESTING_TOOL% doivent être des Scripts précisés en amont et existants ! *****
CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%MESSAGES_DISPLAYER%"
CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%TESTING_TOOL%"






REM ============ RUN des TESTS ==========================

  @REM Rem ------ Unit TESTS ------
  @REM CALL "%TRANSVERSE_TESTS_COMMON_PATH%/_Run_UnitTests.bat"
  @REM PAUSE

  @REM CALL "%TRANSVERSE_TESTS_DOMAIN_PATH%/_Run_UnitTests.bat"
  @REM PAUSE

  CALL "%TRANSVERSE_TESTS_INFRA_PATH%/_Run_UnitTests.bat"
  PAUSE

