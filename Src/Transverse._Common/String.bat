@ECHO OFF


SET CURRENT_NAMESPACE=Transverse._Common
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0


@REM ATTENTION: certaines fonctions
@REM             (comme : RepeatString),
@REM            necessiteront que le present .bat soit invoque
@REM            depuis un bloc :
@REM            SETLOCAL ENABLEDELAYEDEXPANSION
@REM              rem Appel ici...
@REM            ENDLOCAL




REM ==================== FUNCTION CALL ====================================	
IF %1. EQU ReplaceSubString. (
	CALL :ReplaceSubString %2 %3 %4 %5
	
) ELSE IF %1. EQU SlashToBackSlash. (
	CALL :SlashToBackSlash %2 %3

) ELSE IF %1. EQU BackSlashToSlash. (
	CALL :BackSlashToSlash %2 %3

) ELSE IF %1. EQU PointToSlash. (
	CALL :PointToSlash %2 %3

) ELSE IF %1. EQU RepeatString. (
	CALL :RepeatString %2 %3 %4

)

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	

REM ======= Fonction chargee de retourner une copie de la var %1  =======
REM 		Mais valant %1 concatainee %2 fois.
REM
REM PARAM. %1 : chaine source
REM PARAM. %2 : nb. de replications
REM PARAM. %3 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %3.
REM
:RepeatString
	SETLOCAL
				
		SET __SOURCE_STRING__=%~1
        SET __NB_REPLICATE__=%~2
        
		@REM ECHO.
		@REM ECHO ====== FUNC : DuplicateString - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
        @REM ECHO __NB_REPLICATE__='%__NB_REPLICATE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __RESULTAT__=

    REM Boucle FOR :
    SET iDeb=1
    SET iFin=%__NB_REPLICATE__%
    SET iStep=1
    FOR /l %%i IN (%iDeb%,%iStep%,%iFin%) DO (
        <nul set /p "=!__SOURCE_STRING__!" >nul
        SET __RESULTAT__=!__RESULTAT__!!__SOURCE_STRING__!
    )

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %3=%__RESULTAT__%
	)
GOTO :EOF



REM ======= Fonction chargee de retourner une copie de la var %1  =======
REM 		Mais dans laquelle : les eventuels Slash seront remplaces par un BackSlash.
REM
REM PARAM. %1 : chaine source
REM PARAM. %2 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %2.
REM
:SlashToBackSlash
	SETLOCAL
				
		SET __SOURCE_STRING__=%~1
        
		@REM ECHO.
		@REM ECHO ====== FUNC : SlashToBackSlash - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __RESULTAT__=
    CALL :ReplaceSubString "%__SOURCE_STRING__%" "/" "\" __RESULTAT__

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %2=%__RESULTAT__%
	)
GOTO :EOF


REM ======= Fonction chargee de retourner une copie de la var %1  =======
REM 		Mais dans laquelle : les eventuels BackSlash seront remplaces par un Slash.
REM
REM PARAM. %1 : chaine source
REM PARAM. %2 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %2.
REM
:BackSlashToSlash
	SETLOCAL
				
		SET __SOURCE_STRING__=%~1
        
		@REM ECHO.
		@REM ECHO ====== FUNC : BackSlashToSlash - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __RESULTAT__=
    CALL :ReplaceSubString "%__SOURCE_STRING__%" "\" "/" __RESULTAT__

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %2=%__RESULTAT__%
	)
GOTO :EOF

	
REM ======= Fonction chargee de retourner une copie de la var %1  =======
REM 		Mais dans laquelle : les eventuels Points seront remplaces par un Slash.
REM
REM PARAM. %1 : chaine source
REM PARAM. %2 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %2.
REM
:PointToSlash
	SETLOCAL
				
		SET __SOURCE_STRING__=%~1
        
		@REM ECHO.
		@REM ECHO ====== FUNC : PointToSlash - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __RESULTAT__=
    CALL :ReplaceSubString "%__SOURCE_STRING__%" "." "/" __RESULTAT__

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %2=%__RESULTAT__%
	)
GOTO :EOF    



REM ======= Fonction chargee de retourner une copie de la var %1  =======
REM 		Mais dans laquelle : les eventuelles sous-chaines valant %2
REM         seront remplacees par la chaine %3.

REM  ATTENTION : . REMPLACEMENT INSENSIBLE A LA CASSE !
REM              . NE POURRA PAS FONCTIONNER POUR TOUS LES TYPES DE CARACTERES, certains caracteres 
REM                seront fort probablement des caracteres specifiques qui feront planter "la formule de remplacement".
REM                Par exemple : 
REM                              . le remplacement de GUILLEMETS, ou de POINT D'EXCLAM.
REM                                   N'EST PAS GERE !!
REM                              . le remplacement PAR des GUILLEMETS, ou POINT D'EXCLAM.
REM                                   N'EST PAS GERE !!
REM
REM PARAM. %1 : chaine source
REM PARAM. %2 : sous-chaine a remplacer
REM PARAM. %3 : chaine de remplacement
REM PARAM. %4 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %4.
REM
:ReplaceSubString
	SETLOCAL
				
		SET __SOURCE_STRING__=%~1
    SET __SOURCE_SUBSTRING_TO_REPLACE__=%~2
    SET __REPLACING_STRING__=%~3
        
        
		@REM ECHO.
		@REM ECHO ====== FUNC : ReplaceSubString - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
    @REM ECHO __SOURCE_SUBSTRING_TO_REPLACE__='%__SOURCE_SUBSTRING_TO_REPLACE__%'
		@REM ECHO __REPLACING_STRING__='%__REPLACING_STRING__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    IF "%__SOURCE_STRING__%." EQU "." (
      SET __RESULTAT__=
      GOTO :MY_FUNCTION_END
    )
    IF "%__SOURCE_SUBSTRING_TO_REPLACE__%." EQU "." (
      SET __RESULTAT__=%__SOURCE_STRING__%
      GOTO :MY_FUNCTION_END
    )
    IF "%__REPLACING_STRING__%." EQU "." (
      SET __RESULTAT__=%__SOURCE_STRING__%
      GOTO :MY_FUNCTION_END
    )     
      
    REM NE PAS METTRE DE IF AUTOUR DU BLOC CI-DESOUS
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET "__RESULTAT__=!__SOURCE_STRING__:%__SOURCE_SUBSTRING_TO_REPLACE__%=%__REPLACING_STRING__%!"
    ENDLOCAL & SET "__RESULTAT__=%__RESULTAT__%"

    :MY_FUNCTION_END

    @REM REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM REM ECHO.

	(ENDLOCAL
    :BR
		SET %4=%__RESULTAT__%
	)
GOTO :EOF

