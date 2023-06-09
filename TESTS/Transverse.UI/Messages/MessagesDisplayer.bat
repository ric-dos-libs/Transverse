@ECHO OFF


REM Pour pouvoir utiliser les fonctions de ce source, 
REM le code appelant(ou l'un ses appelants), devra avoir été encadré ainsi :
REM  SETLOCAL ENABLEDELAYEDEXPANSION 
REM     appels aux fonctionnalités du présent .bat ...
REM  (ENDLOCAL
REM  )
REM 

SET CURRENT_NAMESPACE=Transverse.UI.Messages



REM ==================== FUNCTION CALL ====================================	
IF %1. EQU WriteMessage. (
	CALL :WriteMessage %2 %3
	
) 

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	
	
	
REM ======= Fonction chargee d'ecrire le message %1  =======
REM 		
REM PARAM. %1 : message a ecrire.
REM PARAM. %2 : nb. de fois que l'on doit ecrire ce message (1 ligne par fois).
REM
:WriteMessage
	SETLOCAL
				
		SET __MESSAGE__=%~1
        SET __TIMES__=%~2

        IF NOT DEFINED __TIMES__ SET __TIMES__=1
		
		REM ECHO.
		REM ECHO ====== FUNC : WriteMessage - (%CURRENT_NAMESPACE%) ======
		REM ECHO.
		REM ECHO __MESSAGE__='%__MESSAGE__%'
        REM ECHO __TIMES__='%__TIMES__%'
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

        REM Boucle FOR :
        SET iDeb=1
        SET iFin=%__TIMES__%
        SET iStep=1
        FOR /l %%i IN (%iDeb%,%iStep%,%iFin%) DO (

            IF NOT DEFINED __MESSAGE__ (
                ECHO.
            ) ELSE (
                ECHO %__MESSAGE__%
            )

        )        

	(ENDLOCAL
	)
GOTO :EOF

