@ECHO OFF


REM Pour pouvoir utiliser les fonctions de ce source, 
REM le code appelant(ou l'un ses appelants), devra avoir été encadré ainsi :
REM  SETLOCAL ENABLEDELAYEDEXPANSION 
REM     appels aux fonctionnalités du présent .bat ...
REM  (ENDLOCAL
REM  )
REM 

SET CURRENT_NAMESPACE=Transverse.Domain.DiskElements



REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetDiskElementExtension. (
	CALL :GetDiskElementExtension %2 %3
	
) 

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	
	
	
REM ======= Fonction chargee de retourner l'extension du DiskElement %1  =======
REM 		
REM PARAM. %1 : (chemin+)nom.ext du DiskElement.
REM PARAM. %2 : variable reçue par référence qui suite à cet appel, contiendra l'extension de %1.
REM
REM RETURNS : par référence, le PARAM %2.
REM
:GetDiskElementExtension
	SETLOCAL
				
		SET __DISK_ELEMENT_FULLNAME_=%~1

        @REM SET __DISK_ELEMENT_EXT_=%__DISK_ELEMENT_FULLNAME_:*.=%%
		FOR %%F IN ("%__DISK_ELEMENT_FULLNAME_%") DO SET "__DISK_ELEMENT_EXT_=%%~xF"

		REM SUPPR. DE L'EVENTUEL "." RESIDUEL (Dans le cas ou __DISK_ELEMENT_EXT_ non vide en fait)
		IF "%__DISK_ELEMENT_EXT_%x" NEQ "x" (
			SET __DISK_ELEMENT_EXT_=%__DISK_ELEMENT_EXT_:.=%
		)

		
		@REM ECHO.
		@REM ECHO ====== FUNC : GetDiskElementExtension - (%CURRENT_NAMESPACE%) ======
		@REM ECHO.
		@REM ECHO __DISK_ELEMENT_FULLNAME_='%__DISK_ELEMENT_FULLNAME_%'
		@REM ECHO.
		@REM ECHO __DISK_ELEMENT_EXT_='%__DISK_ELEMENT_EXT_%'
		@REM ECHO.
		@REM REM PAUSE
		@REM ECHO. & ECHO.
		
		
	(ENDLOCAL
		SET %2=%__DISK_ELEMENT_EXT_%
	)
GOTO :EOF

