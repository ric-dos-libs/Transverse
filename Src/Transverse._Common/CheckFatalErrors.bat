@ECHO OFF


SET CURRENT_NAMESPACE=Transverse._Common
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU CheckVarExists. (
	CALL :CheckVarExists %2

) ELSE IF %1. EQU CheckValueAmong. (
	CALL :CheckValueAmong %2 %3 %4 %5 %6 %7 %8 %9
	
) ELSE IF %1. EQU FatalError. (
	CALL :FatalError %2
	
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

		@REM ECHO.
		@REM ECHO ====== FUNC : CheckVarExists - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM ECHO __VAR_NAME__='%__VAR_NAME__%'
		@REM ECHO.
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

		IF NOT DEFINED %__VAR_NAME__% (
      ECHO.
			CALL :FatalError "La var d'environnement %__VAR_NAME__% doit au prealable etre renseignee !"
		)
		
	(ENDLOCAL
	)
GOTO :EOF



REM ======= Regarde si la var %1 a pour valeur l'une des valeurs : %2 à %8
REM ======= Si oui alors on ne fait rien, SINON on declenche une fatal error (fermera alors la fenetre de script).
REM 		
REM PARAM. %1 : valeur de la var
REM PARAM. %2 : valeur possible 1 . DOIT ETRE RENSEIGNEE (sinon fatal error) <<<<<<<
REM PARAM. %3 : valeur possible 2 . Facultatif : pas pris en compte si non precise.
REM PARAM. %4 : valeur possible 3 . Facultatif : pas pris en compte si non precise.
REM PARAM. %5 : valeur possible 4 . Facultatif : pas pris en compte si non precise.
REM PARAM. %6 : valeur possible 5 . Facultatif : pas pris en compte si non precise.
REM PARAM. %7 : valeur possible 6 . Facultatif : pas pris en compte si non precise.
REM PARAM. %8 : valeur possible 7 . Facultatif : pas pris en compte si non precise.
REM
REM
:CheckValueAmong
	SETLOCAL
				
		SET __VAR__=%~1
    SET __VAL1_POSSIBLE__=%~2
    SET __VAL2_POSSIBLE__=%~3
    SET __VAL3_POSSIBLE__=%~4
    SET __VAL4_POSSIBLE__=%~5
    SET __VAL5_POSSIBLE__=%~6
    SET __VAL6_POSSIBLE__=%~7
    SET __VAL7_POSSIBLE__=%~8
    
		REM ECHO.
		REM ECHO ====== FUNC : CheckValueAmong - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		REM ECHO.
		REM ECHO __VAR__='%__VAR__%'
    REM ECHO __VAL1_POSSIBLE__='%__VAL1_POSSIBLE__%'
    REM ECHO __VAL2_POSSIBLE__='%__VAL2_POSSIBLE__%'
    REM ECHO __VAL3_POSSIBLE__='%__VAL3_POSSIBLE__%'
    REM ECHO __VAL4_POSSIBLE__='%__VAL4_POSSIBLE__%'
    REM ECHO __VAL5_POSSIBLE__='%__VAL5_POSSIBLE__%'
    REM ECHO __VAL6_POSSIBLE__='%__VAL6_POSSIBLE__%'
    REM ECHO __VAL7_POSSIBLE__='%__VAL7_POSSIBLE__%'
		REM ECHO.
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

    SET __POSSIBLES_VALUES__=
    IF "%__VAL1_POSSIBLE__%." NEQ "." SET __POSSIBLES_VALUES__=%__POSSIBLES_VALUES__%'%__VAL1_POSSIBLE__%',
    IF "%__VAL2_POSSIBLE__%." NEQ "." SET __POSSIBLES_VALUES__=%__POSSIBLES_VALUES__%'%__VAL2_POSSIBLE__%',
    IF "%__VAL3_POSSIBLE__%." NEQ "." SET __POSSIBLES_VALUES__=%__POSSIBLES_VALUES__%'%__VAL3_POSSIBLE__%',
    IF "%__VAL4_POSSIBLE__%." NEQ "." SET __POSSIBLES_VALUES__=%__POSSIBLES_VALUES__%'%__VAL4_POSSIBLE__%',
    IF "%__VAL5_POSSIBLE__%." NEQ "." SET __POSSIBLES_VALUES__=%__POSSIBLES_VALUES__%'%__VAL5_POSSIBLE__%',
    IF "%__VAL6_POSSIBLE__%." NEQ "." SET __POSSIBLES_VALUES__=%__POSSIBLES_VALUES__%'%__VAL6_POSSIBLE__%',
    IF "%__VAL7_POSSIBLE__%." NEQ "." SET __POSSIBLES_VALUES__=%__POSSIBLES_VALUES__%'%__VAL7_POSSIBLE__%',
    
    @REM ECHO __POSSIBLES_VALUES__=%__POSSIBLES_VALUES__%
    

    IF "%__POSSIBLES_VALUES__%." NEQ "." (
      
      IF "%__VAR__%." EQU "%__VAL1_POSSIBLE__%." GOTO OK
      
      IF "%__VAL2_POSSIBLE__%." NEQ "." (
        IF "%__VAR__%." EQU "%__VAL2_POSSIBLE__%." GOTO OK
      )

      IF "%__VAL3_POSSIBLE__%." NEQ "." (
        IF "%__VAR__%." EQU "%__VAL3_POSSIBLE__%." GOTO OK
      )

      IF "%__VAL4_POSSIBLE__%." NEQ "." (
        IF "%__VAR__%." EQU "%__VAL4_POSSIBLE__%." GOTO OK
      )

      IF "%__VAL5_POSSIBLE__%." NEQ "." (
        IF "%__VAR__%." EQU "%__VAL5_POSSIBLE__%." GOTO OK
      )

      IF "%__VAL6_POSSIBLE__%." NEQ "." (
        IF "%__VAR__%." EQU "%__VAL6_POSSIBLE__%." GOTO OK
      )

      IF "%__VAL7_POSSIBLE__%." NEQ "." (
        IF "%__VAR__%." EQU "%__VAL7_POSSIBLE__%." GOTO OK
      )                              


      :FATAL_ERROR
        ECHO.

        CALL :FatalError "La var a la valeur '%__VAR__%', or sa valeur n'est autorisee a etre que l'une des suivantes : %__POSSIBLES_VALUES__%"


    ) ELSE (
      CALL :CheckVarExists "__VAL1_POSSIBLE__"
    )

    :OK
		
	(ENDLOCAL
	)
GOTO :EOF


	

REM ======= Affiche dans la console le message d'erreur %1 =======
REM ======= puis feme la fenetre de script.
REM 		
REM PARAM. %1 : message d'erreur a afficher dans la console.
REM
REM
:FatalError
	SETLOCAL
				
		SET __ERROR_MESSAGE__=%~1

		REM ECHO.
		REM ECHO ====== FUNC : FatalError - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		REM ECHO.
		REM ECHO __ERROR_MESSAGE__='%__ERROR_MESSAGE__%'
		REM ECHO.
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

		ECHO.
		ECHO Fatal Error : 
		ECHO %__ERROR_MESSAGE__%
		ECHO.
		ECHO La fenetre de script va etre fermee.
		ECHO.
		PAUSE
		EXIT
		
	(ENDLOCAL
	)
GOTO :EOF
