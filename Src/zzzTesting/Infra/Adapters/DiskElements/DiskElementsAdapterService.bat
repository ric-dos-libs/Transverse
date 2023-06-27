@ECHO OFF



SET __CURRENT_NAMESPACE_adptdsk__=Testing.Infra.Adapters.DiskElements
SET __CURRENT_SCRIPT_NAME_EXT_adptdsk__=%~nx0

SET __CURRENT_SCRIPT_PATH_adptdsk__=%~dp0

SET TESTING_INFRA_COMMON_PATH=%__CURRENT_SCRIPT_PATH_adptdsk__%../../_Common



REM -----------------------------------------------------------------
REM Recup. de constantes
CALL "%TESTING_INFRA_COMMON_PATH%/_Pathes.bat"

CALL "%TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_SCRIPT%"






REM ==================== FUNCTION CALL ====================================	
IF %1. EQU Exists. (
	CALL :Exists %2 %3

) ELSE IF %1. EQU DoesntExist. (
	CALL :DoesntExist %2 %3

) 


GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================


REM ======= Fonction chargee de renvoyer si le DiskElement %1 existe  =======
REM         Renvoi %TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_SUCCESS_ID% si existe, 
REM         sinon %TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_FAILURE_ID%.
REM
REM PARAM. %1 : DiskElement
REM PARAM. %2 : param. pour retour par référence
REM
:Exists
	SETLOCAL

    SET __DISK_ELEMENT__=%~1

		@REM ECHO.
		@REM ECHO ====== FUNC : Exists - '%__CURRENT_SCRIPT_NAME_EXT_adptdsk__%' - [ %__CURRENT_NAMESPACE_adptdsk__% ] ======
    @REM ECHO.
		@REM ECHO __DISK_ELEMENT__='%__DISK_ELEMENT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __EXISTS__=
    CALL "%TESTING_INFRA_SERVICES_DISK_ELEMENTS_SERVICE_SCRIPT%" Exists "%__DISK_ELEMENT__%" __EXISTS__

    IF %__EXISTS__% EQU %TRUE% (
      SET __EXISTS__=%TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_SUCCESS_ID%

    ) ELSE (
      SET __EXISTS__=%TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_FAILURE_ID%
    )

		
	(ENDLOCAL
    SET %2=%__EXISTS__%
	)
GOTO :EOF


REM ======= Fonction chargee de renvoyer si le DiskElement %1 n'existe pas  =======
REM         Renvoi %TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_SUCCESS_ID% si n'existe pas, 
REM         sinon %TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_FAILURE_ID%.
REM
REM PARAM. %1 : DiskElement
REM PARAM. %2 : param. pour retour par référence
REM
:DoesntExist
	SETLOCAL

    SET __DISK_ELEMENT__=%~1

		@REM ECHO.
		@REM ECHO ====== FUNC : DoesntExist - '%__CURRENT_SCRIPT_NAME_EXT_adptdsk__%' - [ %__CURRENT_NAMESPACE_adptdsk__% ] ======
    @REM ECHO.
		@REM ECHO __DISK_ELEMENT__='%__DISK_ELEMENT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __NOT_EXISTS__=
    CALL "%TESTING_INFRA_SERVICES_DISK_ELEMENTS_SERVICE_SCRIPT%" DoesntExist "%__DISK_ELEMENT__%" __NOT_EXISTS__

    IF %__NOT_EXISTS__% EQU %TRUE% (
      SET __NOT_EXISTS__=%TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_SUCCESS_ID%

    ) ELSE (
      SET __NOT_EXISTS__=%TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_FAILURE_ID%
    )

		
	(ENDLOCAL
    SET %2=%__NOT_EXISTS__%
	)
GOTO :EOF