@ECHO OFF


SET m_CURRENT_NAMESPACE_m=Testing.Application.UseCases.Mappers
SET _m_CURRENT_SCRIPT_NAME_EXT_m_=%~nx0

SET _$m_CURRENT_SCRIPT_PATH_m$_=%~dp0


SET TESTING_APPLICATION_COMMON_PATH=%_$m_CURRENT_SCRIPT_PATH_m$_%../../_Common

REM Recup. de TESTING_COMMON_CHECK_FATAL_ERRORS_SCRIPT et TESTING_COMMON_VARS_SCRIPT.
REM et TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_SCRIPT
CALL "%TESTING_APPLICATION_COMMON_PATH%/_Pathes.bat"

REM Recup. de TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_SUCCESS_ID, ...
CALL "%TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_SCRIPT%"




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU ConvertAssertionResultEnum. (
	CALL :ConvertAssertionResultEnum %2 %3
	
)

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	

REM ======= Fonction chargee de convertir une valeur enum du Domain (AssertionResult) (%1) =======
REM         en Enum pour l'extérieur à la couche Application.
REM
REM PARAM. %1 : valeur enum du Domain
REM PARAM. %2 : resultat retourne par reference
REM
:ConvertAssertionResultEnum
SETLOCAL

    SET __DOMAIN_VALUE__=%~1

		@REM ECHO.
		@REM ECHO ====== FUNC : ConvertAssertionResultEnum - '%_m_CURRENT_SCRIPT_NAME_EXT_m_%' - [ %m_CURRENT_NAMESPACE_m% ] ======
		@REM ECHO.
		@REM ECHO __DOMAIN_VALUE__='%__DOMAIN_VALUE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL :LoadAssertionResultEnumsConversionTable

    SET __CONVERTED_VALUE__=
    CALL "%TESTING_COMMON_VARS_SCRIPT%" GetVarValue "ENUM_CONVERSION_" "%__DOMAIN_VALUE__%" __CONVERTED_VALUE__
    CALL "%TESTING_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__CONVERTED_VALUE__"
    @REM ECHO __CONVERTED_VALUE__=%__CONVERTED_VALUE__%


(ENDLOCAL
  SET %2=%__CONVERTED_VALUE__%
)
:LoadAssertionResultEnumsConversionTable
  SET ENUM_CONVERSION_%TESTING_ASSERTION_RESULT_SUCCESS_ID%=%TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_SUCCESS_ID%
  SET ENUM_CONVERSION_%TESTING_ASSERTION_RESULT_FAILURE_ID%=%TESTING_APPLICATION_ENUMS_ASSERTION_RESULT_FAILURE_ID%
GOTO :EOF


