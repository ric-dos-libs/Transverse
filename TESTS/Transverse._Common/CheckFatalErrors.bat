@ECHO OFF


REM Pour pouvoir utiliser les fonctions de ce source, 
REM le code appelant(ou l'un ses appelants), devra avoir été encadré ainsi :
REM  SETLOCAL ENABLEDELAYEDEXPANSION 
REM     appels aux fonctionnalités du présent .bat ...
REM  (ENDLOCAL
REM  )
REM 

SET CURRENT_NAMESPACE=Transverse._Common



REM ==================== FUNCTION CALL ====================================	
IF %1. EQU CheckVarExists. (
	CALL :CheckVarExists %2
	
)

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	

REM ======= Regarde si la var d'environnement de nom %1 existe =======
REM ======= Si elle existe alors on ne fait rien, SINON on declenche une fatal error (fermera alors la fenetre de script).
REM 		
REM PARAM. %1 : nom de la var. d'environnement.
REM
REM
:CheckVarExists
	SETLOCAL
				
		SET __VAR_NAME__=%~1

		REM ECHO.
		REM ECHO ====== FUNC : CheckVarExists - (%CURRENT_NAMESPACE%) ======
		REM ECHO.
		REM ECHO __VAR_NAME__='%__VAR_NAME__%'
		REM ECHO.
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

		IF NOT DEFINED %__VAR_NAME__% (
        	ECHO.
			CALL :FatalError "La var d'environnement %__VAR_NAME__% doit au prealable etre renseignee !"
		)
		
	(ENDLOCAL
	)
GOTO :EOF

	

REM ======= Affiche dans la console le message d'erreur %1 =======
REM ======= puis feme la fenetre de script.
REM 		
REM PARAM. %1 : message d'erreur a afficher dans la console.
REM
REM
:FatalError
	SETLOCAL
				
		SET __ERROR_MESSAGE__=%~1

		REM ECHO.
		REM ECHO ====== FUNC : FatalError - (%CURRENT_NAMESPACE%) ======
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
