@ECHO OFF


SET $$k$_CURRENT_NAMESPACE_$k$$=TestingLib.Domain._Common.Services
SET $$k$_CURRENT_SCRIPT_NAME_EXT_$k$$=%~nx0

@REM SET k$$_$CURRENT_SCRIPT_PATH$_$$k=%~dp0

@REM SET TESTING_LIB_INFRA_PATH=%k$$_$CURRENT_SCRIPT_PATH$_$$k%..
@REM SET TESTING_LIB_INFRA_COMMON_PATH=%TESTING_LIB_INFRA_PATH%/_Common

REM Recup. de ...
@REM CALL "%TESTING_LIB_INFRA_COMMON_PATH%/_Pathes.bat"






REM ==================== FUNCTION CALL ====================================	
IF %1. EQU Exists. (
	CALL :Exists %2 %3
	
)

GOTO :EOF





REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	
	
	
REM ======= Fonction chargee de renvoyer si le DiskElement %1 existe ou pas  =======
REM         Renvoi 1 si existe, sinon 0.
REM
REM PARAM. %1 : DiskElement
REM PARAM. %2 : param. pour retour par référence
REM
:Exists
	SETLOCAL

    SET __DISK_ELEMENT__=%~1

		@REM ECHO.
		@REM ECHO ====== FUNC : Exists - '%$$k$_CURRENT_SCRIPT_NAME_EXT_$k$$%' - [ %$$k$_CURRENT_NAMESPACE_$k$$% ] ======
    @REM ECHO.
		@REM ECHO __DISK_ELEMENT__='%__DISK_ELEMENT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    IF EXIST "%1" (
      SET __EXISTS__=1

    ) ELSE (
      SET __EXISTS__=0
    )


		
	(ENDLOCAL
    SET %2=%__EXISTS__%
	)
GOTO :EOF
