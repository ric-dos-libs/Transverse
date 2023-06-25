@ECHO OFF


SET $$$CURRENT_NAMESPACE$$$=TestingLib.UI.Views
SET $$$_CURRENT_SCRIPT_NAME_EXT_$$$=%~nx0

SET $$$_CURRENT_SCRIPT_PATH_$$$=%~dp0

SET TESTING_LIB_UI_PATH=%$$$_CURRENT_SCRIPT_PATH_$$$%..
SET TESTING_LIB_UI_COMMON_PATH=%TESTING_LIB_UI_PATH%/_Common



CALL "%TESTING_LIB_UI_COMMON_PATH%/_Pathes.bat"


REM Recup. de TESTING_LIB_APPLICATION_ENUMS_ASSERTION_RESULT_SUCCESS_ID, ...
CALL "%TESTING_LIB_APPLICATION_ENUMS_ASSERTION_RESULT_SCRIPT%"


REM ---- Verif. si "Injection de dépendances" ok ----
@REM CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%TESTING_LIB_UI_MESSAGES_DISPLAYER%"




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU EqualityAssertionResult. (
	CALL :EqualityAssertionResult %2 %3 %4 %5
	
) ELSE IF %1. EQU NoEqualityAssertionResult. (
	CALL :NoEqualityAssertionResult %2 %3 %4 %5


) ELSE IF %1. EQU IsBetweenAssertionResult. (
  CALL :IsBetweenAssertionResult %2 %3 %4 %5 %6


) ELSE IF %1. EQU DiskElementExistsAssertionResult. (
	CALL :DiskElementExistsAssertionResult %2 %3 %4
	
) ELSE IF %1. EQU DiskElementDoesntExistAssertionResult. (
	CALL :DiskElementDoesntExistAssertionResult %2 %3 %4
	
)



GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	
	
	
REM ======= Fonction chargee d'afficher le résultat de l'assertion d'égalité entre %2 et %3  =======
REM
REM PARAM. %1 : Id du résultat de l'assertion
REM PARAM. %2 : libellé du résultat de l'assertion
REM PARAM. %3 : resultat obtenu
REM PARAM. %4 : valeur attendue
REM
:EqualityAssertionResult
	SETLOCAL

    SET __ASSERTION_RESULT_ID__=%~1
    SET __ASSERTION_RESULT_LABEL__=%~2
		SET __VALUE__=%~3
    SET __EXPECTED_VALUE__=%~4

		@REM ECHO.
		@REM ECHO ====== FUNC : EqualityAssertionResult - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$$CURRENT_NAMESPACE$$$% ] ======
    @REM ECHO.
		@REM ECHO __ASSERTION_RESULT_ID__='%__ASSERTION_RESULT_ID__%'
    @REM ECHO __ASSERTION_RESULT_LABEL__='%__ASSERTION_RESULT_LABEL__%'
		@REM ECHO __VALUE__='%__VALUE__%'
    @REM ECHO __EXPECTED_VALUE__='%__EXPECTED_VALUE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage " Valeur attendue: '%__EXPECTED_VALUE__%'"
    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage " Valeur obtenue : '%__VALUE__%'"
    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage ""

    CALL :DisplayAssertionResult "%__ASSERTION_RESULT_ID__%" "%__ASSERTION_RESULT_LABEL__%"

		
	(ENDLOCAL
	)
GOTO :EOF



REM ======= Fonction chargee d'afficher le résultat d'une assertion de type :  
REM         %3 compris dans plage [%4, %5[
REM
REM PARAM. %1 : Id du résultat de l'assertion
REM PARAM. %2 : libellé du résultat de l'assertion
REM PARAM. %3 : resultat obtenu
REM PARAM. %4 : valeur min(incluse) attendue
REM PARAM. %5 : valeur max(exclue) attendue
REM
:IsBetweenAssertionResult
	SETLOCAL

    SET __ASSERTION_RESULT_ID__=%~1
    SET __ASSERTION_RESULT_LABEL__=%~2
		SET __VALUE__=%~3
    SET __LOW_LIMIT_VALUE__=%~4
    SET __HIGH_LIMIT_VALUE__=%~5

		@REM ECHO.
		@REM ECHO ====== FUNC : IsBetweenAssertionResult - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$$CURRENT_NAMESPACE$$$% ] ======
    @REM ECHO.
		@REM ECHO __ASSERTION_RESULT_ID__='%__ASSERTION_RESULT_ID__%'
    @REM ECHO __ASSERTION_RESULT_LABEL__='%__ASSERTION_RESULT_LABEL__%'
		@REM ECHO __VALUE__='%__VALUE__%'
    @REM ECHO __LOW_LIMIT_VALUE__='%__LOW_LIMIT_VALUE__%'
    @REM ECHO __HIGH_LIMIT_VALUE__='%__HIGH_LIMIT_VALUE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage " Plage de valeurs autorisees : ['%__LOW_LIMIT_VALUE__%' , '%__HIGH_LIMIT_VALUE__%'["
    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage " Valeur obtenue : '%__VALUE__%'"
    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage ""

    CALL :DisplayAssertionResult "%__ASSERTION_RESULT_ID__%" "%__ASSERTION_RESULT_LABEL__%"

		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= Fonction chargee d'afficher le résultat de l'assertion de non égalité entre %2 et %3  =======
REM
REM PARAM. %1 : Id du résultat de l'assertion
REM PARAM. %2 : libellé du résultat de l'assertion
REM PARAM. %3 : resultat obtenu
REM PARAM. %4 : valeur non attendue
REM
:NoEqualityAssertionResult
	SETLOCAL

    SET __ASSERTION_RESULT_ID__=%~1
    SET __ASSERTION_RESULT_LABEL__=%~2
		SET __VALUE__=%~3
    SET __NOT_EXPECTED_VALUE__=%~4

		@REM ECHO.
		@REM ECHO ====== FUNC : NoEqualityAssertionResult - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$$CURRENT_NAMESPACE$$$% ] ======
    @REM ECHO.
		@REM ECHO __ASSERTION_RESULT_ID__='%__ASSERTION_RESULT_ID__%'
    @REM ECHO __ASSERTION_RESULT_LABEL__='%__ASSERTION_RESULT_LABEL__%'
		@REM ECHO __VALUE__='%__VALUE__%'
    @REM ECHO __NOT_EXPECTED_VALUE__='%__NOT_EXPECTED_VALUE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage " Valeur NON attendue: '%__NOT_EXPECTED_VALUE__%'"
    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage " Valeur obtenue : '%__VALUE__%'"
    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage ""

    CALL :DisplayAssertionResult "%__ASSERTION_RESULT_ID__%" "%__ASSERTION_RESULT_LABEL__%"

		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= Fonction chargee d'afficher le résultat de l'assertion de NON existence  =======
REM         du DiskElement : %3.
REM
REM PARAM. %1 : Id du résultat de l'assertion
REM PARAM. %2 : libellé du résultat de l'assertion
REM PARAM. %3 : DiskElement
REM
:DiskElementDoesntExistAssertionResult
	SETLOCAL

    SET __ASSERTION_RESULT_ID__=%~1
    SET __ASSERTION_RESULT_LABEL__=%~2
		SET __DISK_ELEMENT__=%~3

		@REM ECHO.
		@REM ECHO ====== FUNC : DiskElementDoesntExistAssertionResult - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$$CURRENT_NAMESPACE$$$% ] ======
    @REM ECHO.
		@REM ECHO __ASSERTION_RESULT_ID__='%__ASSERTION_RESULT_ID__%'
    @REM ECHO __ASSERTION_RESULT_LABEL__='%__ASSERTION_RESULT_LABEL__%'
		@REM ECHO __DISK_ELEMENT__='%__DISK_ELEMENT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage " Assertion de Non existence du DiskElement :"
    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage "   '%3'"
    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage ""

    CALL :DisplayAssertionResult "%__ASSERTION_RESULT_ID__%" "%__ASSERTION_RESULT_LABEL__%"

		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= Fonction chargee d'afficher le résultat de l'assertion d'Existence  =======
REM         du DiskElement : %3.
REM
REM PARAM. %1 : Id du résultat de l'assertion
REM PARAM. %2 : libellé du résultat de l'assertion
REM PARAM. %3 : DiskElement
REM
:DiskElementExistsAssertionResult
	SETLOCAL

    SET __ASSERTION_RESULT_ID__=%~1
    SET __ASSERTION_RESULT_LABEL__=%~2
		SET __DISK_ELEMENT__=%~3

		@REM ECHO.
		@REM ECHO ====== FUNC : DiskElementExistsAssertionResult - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$$CURRENT_NAMESPACE$$$% ] ======
    @REM ECHO.
		@REM ECHO __ASSERTION_RESULT_ID__='%__ASSERTION_RESULT_ID__%'
    @REM ECHO __ASSERTION_RESULT_LABEL__='%__ASSERTION_RESULT_LABEL__%'
		@REM ECHO __DISK_ELEMENT__='%__DISK_ELEMENT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage " Assertion d'Existence du DiskElement :"
    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage "   '%3'"
    CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage ""

    CALL :DisplayAssertionResult "%__ASSERTION_RESULT_ID__%" "%__ASSERTION_RESULT_LABEL__%"

		
	(ENDLOCAL
	)
GOTO :EOF



REM ======= Fonction chargee d'afficher le résultat d'une assertion =======
REM
REM PARAM. %1 : Id du résultat de l'assertion
REM PARAM. %2 : libellé du résultat de l'assertion
REM
:DisplayAssertionResult
	SETLOCAL

    SET __ASSERTION_RESULT_ID__=%~1
    SET __ASSERTION_RESULT_LABEL__=%~2

		@REM ECHO.
		@REM ECHO ====== FUNC : DisplayAssertionResult - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$$CURRENT_NAMESPACE$$$% ] ======
    @REM ECHO.
		@REM ECHO __ASSERTION_RESULT_ID__='%__ASSERTION_RESULT_ID__%'
    @REM ECHO __ASSERTION_RESULT_LABEL__='%__ASSERTION_RESULT_LABEL__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    IF "%__ASSERTION_RESULT_ID__%" EQU "%TESTING_LIB_APPLICATION_ENUMS_ASSERTION_RESULT_SUCCESS_ID%" (
        CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage "   - %__ASSERTION_RESULT_LABEL__% -"
        CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage "" 2
        
    ) ELSE (
        CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage "   **********- %__ASSERTION_RESULT_LABEL__% -********** "
        CALL "%TESTING_LIB_UI_MESSAGES_DISPLAYER%" WriteMessage "" 2
        PAUSE
    )
		
	(ENDLOCAL
	)
GOTO :EOF