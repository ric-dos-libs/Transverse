@ECHO OFF


SET mui_CURRENT_NAMESPACE_mui=TestingLib.UI._Common.Messages
SET _mui_CURRENT_SCRIPT_NAME_EXT_mui_=%~nx0

SET _$mui_CURRENT_SCRIPT_PATH_mui$_=%~dp0


SET TESTING_LIB_UI_COMMON_PATH=%_$mui_CURRENT_SCRIPT_PATH_mui$_%..

REM Recup. de TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT et TESTING_LIB_COMMON_VARS_SCRIPT.
CALL "%TESTING_LIB_UI_COMMON_PATH%/_Pathes.bat"









REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetAssertionResultMessageLabel. (
	CALL :GetAssertionResultMessageLabel %2 %3 %4
	
)

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	

REM ======= Fonction chargee de retourner la label correspondant à un résultat d'assertion =======
REM         ceci dans la langue d'id %1.
REM
REM PARAM. %1 : id langue du label.
REM PARAM. %2 : assertion result id (pas l'id Domain mais celui converti)
REM PARAM. %3 : resultat retourne par reference
REM
:GetAssertionResultMessageLabel
SETLOCAL

    SET __LANG_ID__=%~1
    SET __CONVERTED_ASSERTION_RESULT_ID__=%~2

		@REM ECHO.
		@REM ECHO ====== FUNC : GetAssertionResultMessageLabel - '%_mui_CURRENT_SCRIPT_NAME_EXT_mui_%' - [ %mui_CURRENT_NAMESPACE_mui% ] ======
		@REM ECHO.
		@REM ECHO __LANG_ID__='%__LANG_ID__%'
    @REM ECHO __CONVERTED_ASSERTION_RESULT_ID__='%__CONVERTED_ASSERTION_RESULT_ID__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL :LoadAssertionResultMessageLabelTable "%__LANG_ID__%"

    SET __MESSAGE_LABEL__=
    CALL "%TESTING_LIB_COMMON_VARS_SCRIPT%" GetVarValue "ASSERTION_RESULT_MESSAGE_LABEL_" "%__CONVERTED_ASSERTION_RESULT_ID__%" __MESSAGE_LABEL__
    CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__MESSAGE_LABEL__"

(ENDLOCAL
  SET %3=%__MESSAGE_LABEL__%
)
:LoadAssertionResultMessageLabelTable
  SET __LANG_ID__=%~1
  SET LANG_MESSAGE_LABEL_TABLE_SCRIPT=%TESTING_LIB_UI_COMMON_MESSAGES_PATH%/AssertionResultMessageLabel_%__LANG_ID__%.bat
  CALL "%LANG_MESSAGE_LABEL_TABLE_SCRIPT%"
GOTO :EOF


