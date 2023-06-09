@ECHO OFF


SET CURRENT_NAMESPACE=Transverse.UI.Messages
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

SET _CURRENT_SCRIPT_PATH_=%~dp0


SET TESTS_UI_COMMON_PATH=%_CURRENT_SCRIPT_PATH_%../_Common
REM Recup. de SRC_UI_MESSAGES_PATH
CALL "%TESTS_UI_COMMON_PATH%/_Pathes.bat"

SET _MESSAGES_DISPLAYER_=%SRC_UI_MESSAGES_PATH%/MessagesDisplayer.bat



REM ==================== FUNCTION CALL ====================================	
IF %1. EQU WriteEqualityResult. (
	CALL :WriteEqualityResult %2 %3
	
) 

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	
	
	
REM ======= Fonction chargee de verifier l'egalite entre %1 et %2  =======
REM ======= Un message de Success sera affiche en cas d'egalite
REM         Sinon un message de failure.
REM
REM PARAM. %1 : resultat obtenu
REM PARAM. %2 : valeur attendue
REM
:WriteEqualityResult
	SETLOCAL
				
		SET __VALUE__=%~1
        SET __EXPECTED_VALUE__=%~2

		
		REM ECHO.
		REM ECHO ====== FUNC : WriteEqualityResult - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		REM ECHO.
		REM ECHO __VALUE__='%__VALUE__%'
        REM ECHO __EXPECTED_VALUE__='%__EXPECTED_VALUE__%'
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

        
        CALL "%_MESSAGES_DISPLAYER_%" WriteMessage " Valeur attendue: '%__EXPECTED_VALUE__%'"
        CALL "%_MESSAGES_DISPLAYER_%" WriteMessage " Valeur obtenue : '%__VALUE__%'"
        CALL "%_MESSAGES_DISPLAYER_%" WriteMessage ""

        IF "%__VALUE__%." EQU "%__EXPECTED_VALUE__%." (
            CALL "%_MESSAGES_DISPLAYER_%" WriteMessage "   - !TEST_RESULT_MESSAGE%TEST_SUCCESS_ID%! ! -"
            CALL "%_MESSAGES_DISPLAYER_%" WriteMessage "" 2
            
        ) ELSE (
            CALL "%_MESSAGES_DISPLAYER_%" WriteMessage "   **********- !TEST_RESULT_MESSAGE%TEST_FAILURE_ID%! !! -********** "
            CALL "%_MESSAGES_DISPLAYER_%" WriteMessage "" 2
            PAUSE
        )
		
	(ENDLOCAL
	)
GOTO :EOF

