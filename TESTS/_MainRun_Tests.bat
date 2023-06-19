@ECHO OFF

SET CURRENT_SCRIPT_PATH=%~dp0




REM ----------- Choix des implementations pour les affichages de base ----------------
SET SRC_PATH=%CURRENT_SCRIPT_PATH%../Src
SET SRC_UI_PATH=%SRC_PATH%/Transverse.UI
SET SRC_UI_MESSAGES_PATH=%SRC_UI_PATH%/Messages
SET MESSAGES_DISPLAYER_SCRIPT=%SRC_UI_MESSAGES_PATH%/MessagesDisplayer.bat


REM -------- Désignation de l'adaptateur qui permettra le lien ---------
REM   entre la présente Archi. (partie TESTS) et une librairie (externe) de Testing
SET TESTING_LIB_ADAPTER_SCRIPT=%CURRENT_SCRIPT_PATH%_TestingLibAdapter.bat




REM ------- Paramétrage et Lancement des tests --------
CALL "%CURRENT_SCRIPT_PATH%_Run_Tests.bat" "%MESSAGES_DISPLAYER_SCRIPT%" "%TESTING_LIB_ADAPTER_SCRIPT%"
