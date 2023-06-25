@ECHO OFF

REM ==================== LE POINT D'ENTREE ===================================
REM        - pour initialiser les éléments nécessaires pour les TESTS
REM        - puis lancer tous les TESTS
REM ==========================================================================


SET _tmr_CURRENT_SCRIPT_PATH_tmr_=%~dp0

SET TRANSVERSE_PATH=%_tmr_CURRENT_SCRIPT_PATH_tmr_%../Src
SET TRANSVERSE_UI_PATH=%TRANSVERSE_PATH%/Transverse.UI
SET TRANSVERSE_UI_COMMON_PATH=%TRANSVERSE_UI_PATH%/_Common

CALL "%TRANSVERSE_UI_COMMON_PATH%/_Pathes.bat"



REM ----------- Choix des implementations pour les affichages de base ----------------
SET MESSAGES_DISPLAYER_SCRIPT=%TRANSVERSE_UI_MESSAGES_MESSAGES_DISPLAYER_SCRIPT%



REM -------- Désignation de l'adaptateur qui permettra le lien ---------
REM   entre la présente Archi. (partie TESTS) et une librairie (externe) de Testing
SET TESTING_LIB_ADAPTER_SCRIPT=%_tmr_CURRENT_SCRIPT_PATH_tmr_%_TestingLibAdapter.bat




REM ------- Paramétrage et Lancement des tests --------
CALL "%_tmr_CURRENT_SCRIPT_PATH_tmr_%_Run_Tests.bat" "%MESSAGES_DISPLAYER_SCRIPT%" "%TESTING_LIB_ADAPTER_SCRIPT%"
