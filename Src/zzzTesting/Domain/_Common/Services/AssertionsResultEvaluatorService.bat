@ECHO OFF


SET $$_$CURRENT_NAMESPACE$$_$=Testing.Domain._Common.Services
SET $$$_CURRENT_SCRIPT_NAME_EXT_$$$=%~nx0

SET $$_$CURRENT_SCRIPT_PATH$_$$=%~dp0

SET TESTING_DOMAIN_PATH=%$$_$CURRENT_SCRIPT_PATH$_$$%../..
SET TESTING_DOMAIN_COMMON_PATH=%TESTING_DOMAIN_PATH%/_Common

REM Recup. de TESTING_DOMAIN_COMMON_ENUMS_PATH
CALL "%TESTING_DOMAIN_COMMON_PATH%/_Pathes.bat"

REM Recup. de TESTING_ASSERTION_RESULT_SUCCESS_ID et TESTING_ASSERTION_RESULT_FAILURE_ID
CALL "%TESTING_DOMAIN_COMMON_ENUMS_PATH%/AssertionResult.bat"





REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetEqualityAssertionResult. (
	CALL :GetEqualityAssertionResult %2 %3  %4
	
) ELSE IF %1. EQU GetIsBetweenAssertionResult. (
	CALL :GetIsBetweenAssertionResult %2 %3 %4  %5
	
) ELSE IF %1. EQU GetNoEqualityAssertionResult. (
	CALL :GetNoEqualityAssertionResult %2 %3 %4 %5
	
) 

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	
	
	
REM ======= Fonction chargee de verifier l'egalite entre %1 et %2  =======
REM ======= Si égalité, alors on renvoie %TESTING_ASSERTION_RESULT_SUCCESS_ID%, 
REM         sinon %TESTING_ASSERTION_RESULT_FAILURE_ID%
REM
REM PARAM. %1 : valeur obtenue
REM PARAM. %2 : valeur attendue
REM PARAM. %3 : val. de retour par référence.
REM
:GetEqualityAssertionResult
	SETLOCAL
				
		SET __VALUE__=%~1
    SET __EXPECTED_VALUE__=%~2

		
		@REM ECHO.
		@REM ECHO ====== FUNC : GetEqualityAssertionResult - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$_$CURRENT_NAMESPACE$$_$% ] ======
		@REM ECHO.
		@REM ECHO __VALUE__='%__VALUE__%'
    @REM ECHO __EXPECTED_VALUE__='%__EXPECTED_VALUE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

        
    IF "%__VALUE__%." EQU "%__EXPECTED_VALUE__%." (
      SET __ASSERTION_RESULT_ID__=%TESTING_ASSERTION_RESULT_SUCCESS_ID%
    ) ELSE (
      SET __ASSERTION_RESULT_ID__=%TESTING_ASSERTION_RESULT_FAILURE_ID%
    )
		
	(ENDLOCAL
    SET %3=%__ASSERTION_RESULT_ID__%
	)
GOTO :EOF




REM ======= Fonction chargee de verifier que %1 se situe dans la fourchette %2 inclus et %3 exclus  =======
REM        >>>>>>>> ATTENTION : VALABLE QUE sur des NOMBRES ENTIERS (positifs ou non)  !!!!!!!!!!!!! <<<<<<<
REM
REM ======= Si ok, alors on renvoie %TESTING_ASSERTION_RESULT_SUCCESS_ID%, 
REM         sinon %TESTING_ASSERTION_RESULT_FAILURE_ID%
REM
REM PARAM. %1 : valeur obtenue
REM PARAM. %2 : borne basse incluse
REM PARAM. %3 : borne haute exclue
REM PARAM. %4 : val. de retour par référence.
REM
:GetIsBetweenAssertionResult
	SETLOCAL
				
    SET __VALUE__=%~1
		SET __LOW_LIMIT_VALUE__=%~2
    SET __HIGH_LIMIT_VALUE__=%~3

		
		@REM ECHO.
		@REM ECHO ====== FUNC : GetIsBetweenAssertionResult - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$_$CURRENT_NAMESPACE$$_$% ] ======
		@REM ECHO.
    @REM ECHO __VALUE__='%__VALUE__%'
		@REM ECHO __LOW_LIMIT_VALUE__='%__LOW_LIMIT_VALUE__%'
    @REM ECHO __HIGH_LIMIT_VALUE__='%__HIGH_LIMIT_VALUE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __ASSERTION_RESULT_ID__=%TESTING_ASSERTION_RESULT_FAILURE_ID%
    IF %__VALUE__% GEQ %__LOW_LIMIT_VALUE__% (
      IF %__VALUE__% LSS %__HIGH_LIMIT_VALUE__% (
        SET __ASSERTION_RESULT_ID__=%TESTING_ASSERTION_RESULT_SUCCESS_ID%
      )
    )
		
	(ENDLOCAL
    SET %4=%__ASSERTION_RESULT_ID__%
	)
GOTO :EOF



REM ======= Fonction chargee de verifier la non egalite entre %1 et %2  =======
REM ======= Si non égalité, alors on renvoie %TESTING_ASSERTION_RESULT_SUCCESS_ID%, 
REM         sinon %TESTING_ASSERTION_RESULT_FAILURE_ID%
REM
REM PARAM. %1 : valeur obtenue
REM PARAM. %2 : valeur non attendue
REM PARAM. %3 : val. de retour par référence.
REM
:GetNoEqualityAssertionResult
	SETLOCAL
				
		SET __VALUE__=%~1
    SET __NOT_EXPECTED_VALUE__=%~2

		
		@REM ECHO.
		@REM ECHO ====== FUNC : GetNoEqualityAssertionResult - '%$$$_CURRENT_SCRIPT_NAME_EXT_$$$%' - [ %$$_$CURRENT_NAMESPACE$$_$% ] ======
		@REM ECHO.
		@REM ECHO __VALUE__='%__VALUE__%'
    @REM ECHO __NOT_EXPECTED_VALUE__='%__NOT_EXPECTED_VALUE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

        
    IF "%__VALUE__%." NEQ "%__NOT_EXPECTED_VALUE__%." (
      SET __ASSERTION_RESULT_ID__=%TESTING_ASSERTION_RESULT_SUCCESS_ID%
    ) ELSE (
      SET __ASSERTION_RESULT_ID__=%TESTING_ASSERTION_RESULT_FAILURE_ID%
    )
		
	(ENDLOCAL
    SET %3=%__ASSERTION_RESULT_ID__%
	)
GOTO :EOF
