@ECHO OFF


SET $$_$CURRENT_NAMESPACE$_$$=TestingLib.Application._Common.Services
SET $$$_CURRENT_SCRIPT_NAME_EXT_$$$=%~nx0

SET $$_$CURRENT_SCRIPT_PATH$_$$=%~dp0


SET TESTING_LIB_APPLICATION_COMMON_PATH=%$$_$CURRENT_SCRIPT_PATH$_$$%..



REM Recup. de TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT
CALL "%TESTING_LIB_APPLICATION_COMMON_PATH%/_Pathes.bat"

REM ---- Verif. si "Injection de dépendances" ok ----
CALL "%TESTING_LIB_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%TESTING_LIB_MESSAGES_LABEL_REPOSITORY_SCRIPT%" 






REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetMessageLabel. (
  Rem %2 : Id du message.
  Rem %3 : Id de la langue
	CALL :GetMessageLabel %2 %3 %4
	
)

GOTO :EOF




REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	
	
	
REM ======= Fonction chargee de retourner le label(dans la langue d'Id %2) correspondant 
REM         au message d'Id %1.
REM         
REM
REM PARAM. %1 : Id du message
REM PARAM. %2 : Id de la langue
REM PARAM. %3 : val. de retour par référence.
REM
:GetMessageLabel
	SETLOCAL
				
		SET __MESSAGE_ID__=%~1
    SET __LANG_ID__=%~2

		
		@REM ECHO.
		@REM ECHO ====== FUNC : GetMessageLabel - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$_$CURRENT_NAMESPACE$_$$% ] ======
		@REM ECHO.
		@REM ECHO __MESSAGE_ID__='%__MESSAGE_ID__%'
    @REM ECHO __LANG_ID__='%__LANG_ID__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __MESSAGE_LABEL__=
    CALL "%TESTING_LIB_MESSAGES_LABEL_REPOSITORY_SCRIPT%" GetMessageLabel "%__LANG_ID__%" "%__MESSAGE_ID__%" __MESSAGE_LABEL__
    @REM ECHO __MESSAGE_LABEL__='%__MESSAGE_LABEL__%'
		
	(ENDLOCAL
    SET %3=%__MESSAGE_LABEL__%
	)
GOTO :EOF
