@ECHO OFF

SET CURRENT_SCRIPT_PATH=%~dp0

SET TESTS_DOMAIN_PATH=%CURRENT_SCRIPT_PATH%Transverse.Domain
SET TESTS_UI_PATH=%CURRENT_SCRIPT_PATH%Transverse.UI

SET TESTS_UI_COMMON_PATH=%TESTS_UI_PATH%/_Common
SET TESTS_UI_MESSAGES_PATH=%TESTS_UI_PATH%/Messages

REM Recup. de SRC_UI_MESSAGES_PATH et TESTS_COMMON_PATH
CALL "%TESTS_UI_COMMON_PATH%/_Pathes.bat"



REM -------------- Choix des implementations pour l'affichage ----------------
SET MESSAGES_DISPLAYER=%SRC_UI_MESSAGES_PATH%/MessagesDisplayer.bat

SET TESTS_RESULT_DISPLAYER=%TESTS_UI_MESSAGES_PATH%/TestsResultDisplayer.bat
SET MESSAGE_LABELS_SCRIPT=%TESTS_UI_MESSAGES_PATH%/MessagesLabel_FR.bat


REM ------------ Init. vars d'env. pour les messages affichables --------------
REM .
CALL "%MESSAGE_LABELS_SCRIPT%"




REM ============ RUN TESTS ==========================

CALL "%TESTS_COMMON_PATH%/_Run_UnitTests.bat"
PAUSE

CALL "%TESTS_DOMAIN_PATH%/_Run_UnitTests.bat"
PAUSE