@ECHO OFF

REM ==================== LE POINT D'ENTREE ===================================
REM        - pour initialiser les éléments nécessaires pour les TESTS
REM        - puis lancer tous les TESTS
REM ==========================================================================


SET _tmr_CURRENT_SCRIPT_PATH_tmr_=%~dp0

SET __TRANSVERSE_TESTS_PATH__=%_tmr_CURRENT_SCRIPT_PATH_tmr_%




REM -------- Désignation de l'adaptateur qui permettra le lien ---------
REM   entre la présente Archi.(partie TESTS) et la librairie de Testing
SET __TESTING_LIB_ADAPTER_SCRIPT__=%__TRANSVERSE_TESTS_PATH__%_TestingLibAdapter.bat



REM ------- Paramétrage et Lancement des tests --------
CALL "%__TRANSVERSE_TESTS_PATH__%_Run_Tests.bat" "%__TESTING_LIB_ADAPTER_SCRIPT__%"
