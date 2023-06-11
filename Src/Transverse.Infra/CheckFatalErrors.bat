@ECHO OFF


SET CURRENT_NAMESPACE=Transverse.Infra
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0
SET __CURRENT_SCRIPT_PATH__=%~dp0

REM -----------------------------------------------------------------
REM Recup. de SRC_COMMON_PATH
CALL "%__CURRENT_SCRIPT_PATH__%_Common/_Pathes.bat"

SET SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT=%SRC_COMMON_PATH%/CheckFatalErrors.bat




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU CheckDiskElementExists. (
	CALL :CheckDiskElementExists %2
	
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
      CALL "%SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" FatalError "'%__DISK_ELEMENT__%' inexistant !"
		)
		
	(ENDLOCAL
	)
GOTO :EOF