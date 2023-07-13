@ECHO OFF


SET u$$CURRENT_NAMESPACE$$u=Transverse._Common
SET u$$_CURRENT_SCRIPT_NAME_EXT_$$u=%~nx0




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetVarValue. (
	CALL :GetVarValue %2 %3 %4

)

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	


REM ======= Retourne la valeur de la varaible d'environnement dont le nom est =======
REM         %1%2
REM 		
REM PARAM. %1 : préfixe du nom de la var. d'environnement.
REM PARAM. %2 : suffixe du nom de la var. d'environnement.
REM PARAM. %3 : retour par référence, de la valeur de la dite var d'environnement.
REM  
:GetVarValue
SETLOCAL ENABLEDELAYEDEXPANSION
  SET __VAR_PREFIX__=%~1
  SET __VAR_SUFFIX__=%~2

  @REM ECHO.
  @REM ECHO ====== FUNC : GetVarValue - '%u$$_CURRENT_SCRIPT_NAME_EXT_$$u%' - [ %u$$CURRENT_NAMESPACE$$u% ] ======
  @REM ECHO.
  @REM ECHO.
  @REM ECHO __VAR_PREFIX__=%__VAR_PREFIX__%
  @REM ECHO __VAR_SUFFIX__=%__VAR_SUFFIX__%
  @REM ECHO.
  @REM PAUSE

  SET __THE_RESULT__=!%__VAR_PREFIX__%%__VAR_SUFFIX__%!
  @REM ECHO __RESULT__=!__THE_RESULT__!

(ENDLOCAL
  SET %3=%__THE_RESULT__%
)
GOTO :EOF