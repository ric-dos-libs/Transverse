@ECHO OFF


SET $$CURRENT_NAMESPACE$$=TestingLib._Common
SET $$_CURRENT_SCRIPT_NAME_EXT_$$=%~nx0




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU CheckVarExists. (
	CALL :CheckVarExists %2

) ELSE IF %1. EQU CheckDiskElementExists. (
	CALL :CheckDiskElementExists %2

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
		REM ECHO ====== FUNC : CheckVarExists - '%$$_CURRENT_SCRIPT_NAME_EXT_$$%' - [ %$$CURRENT_NAMESPACE$$% ] ======
		REM ECHO.
		REM ECHO __VAR_NAME__='%__VAR_NAME__%'
		REM ECHO.
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

		IF NOT DEFINED %__VAR_NAME__% (
      ECHO.
			CALL :RaiseFatalError "La var d'environnement %__VAR_NAME__% doit au prealable etre renseignee !"
		)
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= Regarde si le DiskElement %1 existe =======
REM ======= Si il existe alors on ne fait rien, SINON on declenche une fatal error (fermera alors la fenetre de script).
REM 		
REM PARAM. %1 : URL du DiskElement.
REM
REM
:CheckDiskElementExists
	SETLOCAL
				
		SET __DISK_ELEMENT__=%~1

		REM ECHO.
		REM ECHO ====== FUNC : CheckDiskElementExists - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		REM ECHO.
		REM ECHO __DISK_ELEMENT__='%__DISK_ELEMENT__%'
		REM ECHO.
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

		IF NOT EXIST "%__DISK_ELEMENT__%" (
      ECHO.
			CALL :RaiseFatalError "Le DiskElement '%__DISK_ELEMENT__%' est inexistant !"
		)
		
	(ENDLOCAL
	)
GOTO :EOF