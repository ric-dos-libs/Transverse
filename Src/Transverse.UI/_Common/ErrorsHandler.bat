@ECHO OFF


SET CURRENT_NAMESPACE=Transverse.UI._Common
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU RaiseFatalError. (
	CALL :RaiseFatalError %2
	
)

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	

REM ======= Signale une erreur fatale de message texte %1 =======
REM ======= puis ferme la fenetre de script.
REM 		
REM PARAM. %1 : message d'erreur.
REM
:RaiseFatalError
	SETLOCAL
				
		SET __ERROR_MESSAGE__=%~1

		REM ECHO.
		REM ECHO ====== FUNC : RaiseFatalError - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		REM ECHO.
		REM ECHO __ERROR_MESSAGE__='%__ERROR_MESSAGE__%'
		REM ECHO.
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

		ECHO.
		ECHO Fatal Error : 
		ECHO %__ERROR_MESSAGE__%
		ECHO.
		ECHO La fenetre de script va etre fermee.
		ECHO.
		PAUSE
		EXIT
		
	(ENDLOCAL
	)
GOTO :EOF
