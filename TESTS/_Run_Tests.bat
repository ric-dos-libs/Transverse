@ECHO OFF

REM ============ INIT =============================
SET CURRENT_SCRIPT_PATH=%~dp0


REM ----- Param. de la Gestion des messages -----
SET MESSAGES_HANDLING_PATH=%CURRENT_SCRIPT_PATH%Transverse.UI/Messages

SET MESSAGE_LABELS_SCRIPT=%MESSAGES_HANDLING_PATH%/MessagesLabel_FR.bat
SET MESSAGES_DISPLAYER=%MESSAGES_HANDLING_PATH%/MessagesDisplayer.bat
SET TESTS_RESULT_DISPLAYER=%MESSAGES_HANDLING_PATH%/TestsResultDisplayer.bat

REM Init. vars d'env. pour les messages affichables.
SET TESTS_DOMAIN_PATH=%CURRENT_SCRIPT_PATH%Transverse.Domain
CALL "%MESSAGE_LABELS_SCRIPT%"



REM ============ RUN TESTS ==========================

CALL "%TESTS_DOMAIN_PATH%/_Run_UnitTests.bat"