@ECHO OFF


SET CURRENT_NAMESPACE=Transverse.Infra._Common
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

SET __CURRENT_SCRIPT_PATH__=%~dp0



REM -----------------------------------------------------------------






REM ==================== FUNCTION CALL ====================================	
IF %1. EQU CheckDiskElementExists. (
	CALL :CheckDiskElementExists %2
	
) ELSE IF %1. EQU CheckDiskElementDoesntExist. (
	CALL :CheckDiskElementDoesntExist %2
	
)

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	

REM ======= Regarde si le DiskElement %1 existe =======
REM ======= Si il existe alors on ne fait rien, SINON on declenche une fatal error (fermera alors la fenetre de script).
REM 		
REM PARAM. %1 : le DiskElement
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
      CALL "%TRANSVERSE_INFRA_ERRORS_HANDLER%" RaiseFatalError "DiskElement '%__DISK_ELEMENT__%' inexistant !"
		)
		
	(ENDLOCAL
	)
GOTO :EOF



REM ======= Regarde si le DiskElement %1 n'existe pas =======
REM ======= Si il n'existe pas alors on ne fait rien, SINON on declenche une fatal error (fermera alors la fenetre de script).
REM 		
REM PARAM. %1 : le DiskElement
REM
REM
:CheckDiskElementDoesntExist
	SETLOCAL
				
		SET __DISK_ELEMENT__=%~1

		REM ECHO.
		REM ECHO ====== FUNC : CheckDiskElementDoesntExist - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		REM ECHO.
		REM ECHO __DISK_ELEMENT__='%__DISK_ELEMENT__%'
		REM ECHO.
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

		IF EXIST "%__DISK_ELEMENT__%" (
      ECHO.
      CALL "%TRANSVERSE_INFRA_ERRORS_HANDLER%" RaiseFatalError "DiskElement '%__DISK_ELEMENT__%' inexistant !"
		)
		
	(ENDLOCAL
	)
GOTO :EOF