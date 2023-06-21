@ECHO OFF

SET _tmr_CURRENT_SCRIPT_PATH_tmr_=%~dp0

SET SRC_PATH=%_tmr_CURRENT_SCRIPT_PATH_tmr_%../Src
SET SRC_UI_PATH=%SRC_PATH%/Transverse.UI
SET SRC_UI_COMMON_PATH=%SRC_UI_PATH%/_Common

CALL "%SRC_UI_COMMON_PATH%/_Pathes.bat"



REM ----------- Choix des implementations pour les affichages de base ----------------
SET MESSAGES_DISPLAYER_SCRIPT=%SRC_UI_MESSAGES_MESSAGES_DISPLAYER_SCRIPT%


REM -------- Désignation de l'adaptateur qui permettra le lien ---------
REM   entre la présente Archi. (partie TESTS) et une librairie (externe) de Testing
SET TESTING_LIB_ADAPTER_SCRIPT=%_tmr_CURRENT_SCRIPT_PATH_tmr_%_TestingLibAdapter.bat




REM ------- Paramétrage et Lancement des tests --------
CALL "%_tmr_CURRENT_SCRIPT_PATH_tmr_%_Run_Tests.bat" "%MESSAGES_DISPLAYER_SCRIPT%" "%TESTING_LIB_ADAPTER_SCRIPT%"