@ECHO OFF


SET $$$CURRENT_NAMESPACE$$$=TestingLib.UI.Messages
SET $$$_CURRENT_SCRIPT_NAME_EXT_$$$=%~nx0
SET $$$_CURRENT_SCRIPT_PATH_$$$=%~dp0

SET TESTING_LIB_UI_MESSAGES_PATH=%$$$_CURRENT_SCRIPT_PATH_$$$%
SET TESTING_LIB_UI_COMMON_PATH=%$$$_CURRENT_SCRIPT_PATH_$$$%../_Common



REM ----------------------------------------------------------------------
REM Recup. de 
REM TESTING_LIB_COMMON_CONSTANTS_SCRIPT et TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT
CALL "%TESTING_LIB_UI_COMMON_PATH%/_Pathes.bat"



REM -------------------- Recup. de constantes -------------------------------
CALL "%TESTING_LIB_COMMON_CONSTANTS_SCRIPT%"







REM ==================== FUNCTION CALL ====================================	
IF %1. EQU AssertAreEqual. (
	CALL :AssertAreEqual %2 %3 %4 %5
	
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
:AssertAreEqual
	SETLOCAL

    SET __LANG__=%~1
    SET __MESSAGES_DISPLAYER__=%~2
		SET __VALUE__=%~3
    SET __EXPECTED_VALUE__=%~4

		@REM ECHO.
		@REM ECHO ====== FUNC : AssertAreEqual - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$$CURRENT_NAMESPACE$$$% ] ======
    @REM ECHO.
		@REM ECHO __LANG__='%__LANG__%'
    @REM ECHO __MESSAGES_DISPLAYER__='%__MESSAGES_DISPLAYER__%'
		@REM ECHO __VALUE__='%__VALUE__%'
    @REM ECHO __EXPECTED_VALUE__='%__EXPECTED_VALUE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

        
    IF "%__VALUE__%." EQU "%__EXPECTED_VALUE__%." (
        SET __IS_SUCCESS__=%TESTING_LIB_TRUE%
    ) ELSE (
      SET __IS_SUCCESS__=%TESTING_LIB_FALSE%
    )

    CALL :WriteResult "%__LANG__%" "%__MESSAGES_DISPLAYER__%" "%__IS_SUCCESS__%"
		
	(ENDLOCAL
	)
GOTO :EOF



REM ======= Fonction chargee de verifier d'afficher un message  =======
REM         de reussite ou non d'un test.
REM
REM PARAM. %1 : mettre %TESTING_LIB_TRUE% si test reussi ou bien %TESTING_LIB_FALSE% si echec du test.
REM
:WriteResult
	SETLOCAL
				
    SET __LANG__=%~1
    SET __MESSAGES_DISPLAYER__=%~2        
		SET __IS_SUCCESS__=%~3

    IF "%__LANG__%" EQU "US" (
      CALL "%TESTING_LIB_UI_MESSAGES_PATH%MessagesLabel_US.bat"
    ) ELSE (
      CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" FatalError "__LANG__ n'a pas une valeur('%__LANG__%') parmi celles possibles !"
    )    

		
		@REM ECHO.
		@REM ECHO ====== FUNC : WriteResult - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$$CURRENT_NAMESPACE$$$% ] ======
		@REM ECHO.
		@REM ECHO __LANG__='%__LANG__%'
    @REM ECHO __MESSAGES_DISPLAYER__='%__MESSAGES_DISPLAYER__%'    
		@REM ECHO __IS_SUCCESS__='%__IS_SUCCESS__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

        
    CALL "%__MESSAGES_DISPLAYER__%" WriteMessage " Valeur attendue: '%__EXPECTED_VALUE__%'"
    CALL "%__MESSAGES_DISPLAYER__%" WriteMessage " Valeur obtenue : '%__VALUE__%'"
    CALL "%__MESSAGES_DISPLAYER__%" WriteMessage ""

    IF "%__IS_SUCCESS__%" EQU "%TESTING_LIB_TRUE%" (
        CALL "%__MESSAGES_DISPLAYER__%" WriteMessage "   - !TESTING_LIB_TEST_RESULT_MESSAGE%TESTING_LIB_TEST_SUCCESS_ID%! ! -"
        CALL "%__MESSAGES_DISPLAYER__%" WriteMessage "" 2
        
    ) ELSE (
        CALL "%__MESSAGES_DISPLAYER__%" WriteMessage "   **********- !TESTING_LIB_TEST_RESULT_MESSAGE%TESTING_LIB_TEST_FAILURE_ID%! !! -********** "
        CALL "%__MESSAGES_DISPLAYER__%" WriteMessage "" 2
        PAUSE
    )
		
	(ENDLOCAL
	)
GOTO :EOF
