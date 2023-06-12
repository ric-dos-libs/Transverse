@ECHO OFF


SET CURRENT_NAMESPACE=Transverse._Common
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0
SET _$_CURRENT_SCRIPT_PATH_$_=%~dp0


@REM ATTENTION: certaines fonctions
@REM             (comme : RepeatString),
@REM            necessiteront que le present .bat soit invoque
@REM            depuis un bloc :
@REM              SETLOCAL ENABLEDELAYEDEXPANSION
@REM                rem Appel ici...
@REM              ENDLOCAL


REM Pour Recup. : TRUE, FALSE.
SET SRC_COMMON_PATH=%_$_CURRENT_SCRIPT_PATH_$_%
SET SRC_COMMON_CONSTANTS_SCRIPT=%SRC_COMMON_PATH%/Constants.bat
CALL "%SRC_COMMON_CONSTANTS_SCRIPT%"

REM
SET SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT=%SRC_COMMON_PATH%/CheckFatalErrors.bat





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

) ELSE IF %1. EQU GetStringLength. (
	CALL :GetStringLength %2 %3

) ELSE IF %1. EQU PadLeft. (
	CALL :PadLeft %2 %3 %4 %5

) ELSE IF %1. EQU RemoveSubString. (
	CALL :RemoveSubString %2 %3 %4

) ELSE IF %1. EQU WithoutSpace. (
	CALL :WithoutSpace %2 %3

) ELSE IF %1. EQU ContainsSubString. (
	CALL :ContainsSubString %2 %3 %4

) ELSE IF %1. EQU EndsWith. (
	CALL :EndsWith %2 %3 %4 %5

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
		@REM ECHO ====== FUNC : RepeatString - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
    @REM ECHO __NB_REPLICATE__='%__NB_REPLICATE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __RESULT__=

    REM Boucle FOR :
    SET iDeb=1
    SET iFin=%__NB_REPLICATE__%
    SET iStep=1
    FOR /l %%i IN (%iDeb%,%iStep%,%iFin%) DO (
        <nul set /p "=!__SOURCE_STRING__!" >nul
        SET __RESULT__=!__RESULT__!!__SOURCE_STRING__!
    )

    @REM ECHO __RESULT__='%__RESULT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %3=%__RESULT__%
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

    SET __RESULT__=
    CALL :ReplaceSubString "%__SOURCE_STRING__%" "/" "\" __RESULT__

    @REM ECHO __RESULT__='%__RESULT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %2=%__RESULT__%
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

    SET __RESULT__=
    CALL :ReplaceSubString "%__SOURCE_STRING__%" "\" "/" __RESULT__

    @REM ECHO __RESULT__='%__RESULT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %2=%__RESULT__%
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

    SET __RESULT__=
    CALL :ReplaceSubString "%__SOURCE_STRING__%" "." "/" __RESULT__

    @REM ECHO __RESULT__='%__RESULT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %2=%__RESULT__%
	)
GOTO :EOF    



REM ======= Fonction chargee de retourner une copie de la var %1  =======
REM 		Mais dans laquelle : les eventuelles sous-chaines valant %2
REM         seront remplacees par la chaine %3.
REM
REM  ATTENTION : . SI L'ON SOUHAITE RETIRER UNE SOUS-CHAINE, NE PAS UTILISER un %3 valant vide ("")
REM                MAIS, A LA PLACE UTILISER LA FONCTION RemoveSubString. Car ici, si %3 vaut vide
REM                alors on retourne %1, c'est comme ça car %4 (donc qui doit suivre %3) est la valeur de retour.
REM
REM              . REMPLACEMENT INSENSIBLE A LA CASSE !
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
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
    @REM ECHO __SOURCE_SUBSTRING_TO_REPLACE__='%__SOURCE_SUBSTRING_TO_REPLACE__%'
		@REM ECHO __REPLACING_STRING__='%__REPLACING_STRING__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    IF "%__SOURCE_STRING__%." EQU "." (
      SET __RESULT__=
      GOTO :MY_FUNCTION_END
    )
    IF "%__SOURCE_SUBSTRING_TO_REPLACE__%." EQU "." (
      SET __RESULT__=%__SOURCE_STRING__%
      GOTO :MY_FUNCTION_END
    )
    IF "%__REPLACING_STRING__%." EQU "." (
      SET __RESULT__=%__SOURCE_STRING__%
      GOTO :MY_FUNCTION_END
    )     
      
    REM NE PAS METTRE DE IF AUTOUR DU BLOC CI-DESOUS
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET "__RESULT__=!__SOURCE_STRING__:%__SOURCE_SUBSTRING_TO_REPLACE__%=%__REPLACING_STRING__%!"
    ENDLOCAL & SET "__RESULT__=%__RESULT__%"

    :MY_FUNCTION_END

    @REM ECHO __RESULT__='%__RESULT__%'
    @REM ECHO.

	(ENDLOCAL
		SET %4=%__RESULT__%
	)
GOTO :EOF




REM ======= Fonction chargee de retourner la longueur de la chaine %1  =======
REM
REM PARAM. %1 : chaine
REM PARAM. %2 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %2.
REM
:GetStringLength
    SETLOCAL ENABLEDELAYEDEXPANSION

      SET __STRING__=%~1
          
      @REM ECHO.
      @REM ECHO ====== FUNC : GetStringLength - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
      @REM ECHO.
      @REM ECHO __STRING__='%__STRING__%'
      @REM ECHO.
      @REM PAUSE
      @REM ECHO. & ECHO.    

      SET "__STRING_LENGTH__=0"
      SET "__TEMP__=!__STRING__!"

      :loop
      IF DEFINED __TEMP__ (
        SET "__TEMP__=!__TEMP__:~1!"
        SET /a "__STRING_LENGTH__+=1"
        GOTO loop
      )


    (ENDLOCAL
      @REM ECHO __STRING_LENGTH__=%__STRING_LENGTH__%
      @REM REM ECHO.      
      SET %2=%__STRING_LENGTH__%
    )
GOTO :EOF


REM ======= Fonction chargee de retourner à partir de la chaine %1  =======
REM         Une chaine prefixee par autant de caractere %2 qu'il faudra
REM         pour obtenir une chaine de longueur totale valant %3.
REM
REM         Si %1 a une longueur sup. ou égale a %3, alors rien ne sera fait.
REM         Si %2 a plus de 1 caractere, alors seul son 1er sera considere.
REM
REM PARAM. %1 : chaine
REM PARAM. %2 : caractere de remplissage
REM PARAM. %3 : longueur finale souhaitee
REM PARAM. %4 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %4.
REM
:PadLeft
    SETLOCAL ENABLEDELAYEDEXPANSION

      SET __STRING__=%~1
      SET __FILL_CHAR__=%~2
      SET __FINAL_LENGTH__=%~3

          
      @REM ECHO.
      @REM ECHO ====== FUNC : PadLeft - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
      @REM ECHO.
      @REM ECHO __STRING__='%__STRING__%'
      @REM ECHO __FILL_CHAR__='%__FILL_CHAR__%'
      @REM ECHO __FINAL_LENGTH__='%__FINAL_LENGTH__%'
      @REM ECHO.
      @REM PAUSE
      @REM ECHO. & ECHO.

      SET __RESULT__=%__STRING__%

      IF "%__FILL_CHAR__%." EQU "." GOTO NOTHING_TO_DO

      REM Que le 1er caractere
      SET __FILL_CHAR__=%__FILL_CHAR__:~0,1%

      SET __STRING_LENGTH__=
      CALL :GetStringLength "%__STRING__%" __STRING_LENGTH__
      
      SET /A __NB_FILL_CHARS__=%__FINAL_LENGTH__%-%__STRING_LENGTH__%
      @REM ECHO __NB_FILL_CHARS__='%__NB_FILL_CHARS__%'

      IF %__NB_FILL_CHARS__% GTR 0 (

          SET __FILL_CHARS__=
          CALL :RepeatString "%__FILL_CHAR__%" "%__NB_FILL_CHARS__%" __FILL_CHARS__

          SET __RESULT__=!__FILL_CHARS__!%__STRING__%
        
      )

      :NOTHING_TO_DO
      @REM ECHO __RESULT__='%__RESULT__%'
      @REM ECHO.    

    (ENDLOCAL
      SET %4=%__RESULT__%
    )
GOTO :EOF


REM ======= Fonction chargee de retourner une valeur valant %1 mais sans ses sous-chaines 
REM         eventuelles valant %2.
REM
REM     ATTENTION: INSENSIBLE a la casse !
REM
REM PARAM. %1 : chaine
REM PARAM. %2 : sous-chaine a retirer
REM PARAM. %3 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %3.
REM
:RemoveSubString
    SETLOCAL ENABLEDELAYEDEXPANSION

      SET __SOURCE_STRING__=%~1
      SET __SUBSTRING_TO_REMOVE__=%~2
          
      @REM ECHO.
      @REM ECHO ====== FUNC : RemoveSubString - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
      @REM ECHO.
      @REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
      @REM ECHO __SUBSTRING_TO_REMOVE__='%__SUBSTRING_TO_REMOVE__%'
      @REM ECHO.
      @REM PAUSE
      @REM ECHO. & ECHO.    

      IF "%__SUBSTRING_TO_REMOVE__%." EQU "." (
        SET __RESULT__=%__SOURCE_STRING__%

      ) ELSE (
        IF "%__SOURCE_STRING__%." EQU "." (
          SET __RESULT__=
        ) ELSE (
          SET __RESULT__=!__SOURCE_STRING__:%__SUBSTRING_TO_REMOVE__%=!
        )

      )

      @REM ECHO __RESULT__='%__RESULT__%'
      @REM ECHO.          

    (ENDLOCAL
      SET %3=%__RESULT__%
    )
GOTO :EOF


REM ======= Fonction chargee de retourner une valeur valant %1 mais sans ses espaces eventuels =======
REM
REM PARAM. %1 : chaine
REM PARAM. %2 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %2.
REM
:WithoutSpace
    SETLOCAL

      SET __SOURCE_STRING__=%~1
          
      @REM ECHO.
      @REM ECHO ====== FUNC : WithoutSpace - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
      @REM ECHO.
      @REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
      @REM ECHO.
      @REM PAUSE
      @REM ECHO. & ECHO.    

      SET __RESULT__=
      CALL :RemoveSubString "%__SOURCE_STRING__%" " " __RESULT__

      @REM ECHO __RESULT__='%__RESULT__%'
      @REM ECHO.          

    (ENDLOCAL
      SET %2=%__RESULT__%
    )
GOTO :EOF



REM ======= Fonction chargee de retourner %TRUE% si la sous-chaine %2 est incluse dans la chaine %1, =======
REM         sinon elle retourne %FALSE%.
REM
REM        ATTENTION: RECHERCHE INSENSIBLE A LA CASSE.
REM
REM PARAM. %1 : chaine
REM PARAM. %2 : sous-chaine recherchee
REM PARAM. %3 : resultat retourne par reference : %TRUE% ou %FALSE%
REM
REM RETURNS : par référence, le PARAM %3.
REM
:ContainsSubString
    SETLOCAL ENABLEDELAYEDEXPANSION

      SET __STRING__=%~1
      SET __SUBSTRING__=%~2
          
      @REM ECHO.
      @REM ECHO ====== FUNC : ContainsSubString - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
      @REM ECHO.
      @REM ECHO __STRING__='%__STRING__%'
      @REM ECHO __SUBSTRING__='%__SUBSTRING__%'
      @REM ECHO.
      @REM PAUSE
      @REM ECHO. & ECHO.    

      SET __RESULT__=%FALSE%

      IF "%__STRING__%." EQU "." GOTO DONE
      IF "%__SUBSTRING__%." EQU "." GOTO DONE
      
      SET __STRING_WITHOUT_SUBSTRING__=!__STRING__:%__SUBSTRING__%=!
      IF "%__STRING__%" EQU "%__STRING_WITHOUT_SUBSTRING__%" (
        SET __RESULT__=%FALSE%
      ) ELSE (
        SET __RESULT__=%TRUE%
      )

      :DONE
      @REM ECHO __RESULT__='%__RESULT__%'
      @REM ECHO.          

    (ENDLOCAL
      SET %3=%__RESULT__%
    )
GOTO :EOF


REM ======= Fonction chargee de retourner une chaine a partir de %1 :
REM         . Si %1 se termine par %2, et que %3 vaut %TRUE%, alors ok on retourne juste %1
REM         . Si %1 ne se termine pas par %2, et que %3 vaut %TRUE%, alors on retourne %1%2
REM         . Si %1 se termine par %2, et que %3 vaut %FALSE%, alors on retourne %1 sans sa terminaison %2
REM         . Si %1 ne se termine pas par %2, et que %3 vaut %FALSE%, alors ok on retourne juste %1
REM
REM        ATTENTION: SENSIBLE A LA CASSE.
REM
REM PARAM. %1 : chaine
REM PARAM. %2 : sous-chaine de terminaison
REM PARAM. %3 : %TRUE% si l'on veut un resultat avec la terminaison %2
REM             %FALSE% si l'on veut ne veut pas un resultat avec la terminaison %2
REM PARAM. %4 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %4.
REM
:EndsWith
    SETLOCAL ENABLEDELAYEDEXPANSION

      SET __STRING__=%~1
      SET __ENDING_SUBSTRING__=%~2
      SET __WITH_ENDING_SUBSTRING__=%~3
          
      @REM ECHO.
      @REM ECHO ====== FUNC : EndsWith - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
      @REM ECHO.
      @REM ECHO __STRING__='%__STRING__%'
      @REM ECHO __ENDING_SUBSTRING__='%__ENDING_SUBSTRING__%'
      @REM ECHO __WITH_ENDING_SUBSTRING__='%__WITH_ENDING_SUBSTRING__%'
      @REM ECHO.
      @REM PAUSE
      @REM ECHO. & ECHO.

      CALL "%SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckValueAmong "%__WITH_ENDING_SUBSTRING__%" "%TRUE%" "%FALSE%"
      

      SET __ENDING_SUBSTRING_LENGTH__=
      CALL :GetStringLength "%__ENDING_SUBSTRING__%" __ENDING_SUBSTRING_LENGTH__
      @REM ECHO __ENDING_SUBSTRING_LENGTH__=%__ENDING_SUBSTRING_LENGTH__%

      REM Recup. des __ENDING_SUBSTRING_LENGTH__ derniers caracteres de : __STRING__
      SET __STRING_ENDING__=!__STRING__:~-%__ENDING_SUBSTRING_LENGTH__%!
      @REM ECHO __STRING_ENDING__='%__STRING_ENDING__%'


      IF "%__STRING_ENDING__%" EQU "%__ENDING_SUBSTRING__%" (
        IF "%__WITH_ENDING_SUBSTRING__%" EQU "%TRUE%" (
          GOTO RETURN_STRING
        ) ELSE (
          SET __RESULT__=!__STRING__:~0,-%__ENDING_SUBSTRING_LENGTH__%!
          GOTO DONE
        )

      ) ELSE (
        IF "%__WITH_ENDING_SUBSTRING__%" EQU "%TRUE%" (
          SET __RESULT__=%__STRING__%%__ENDING_SUBSTRING__%
          GOTO DONE
        ) ELSE (
          GOTO RETURN_STRING  
        )

      )

      :RETURN_STRING
      SET __RESULT__=%__STRING__%

      :DONE
      @REM ECHO __RESULT__='%__RESULT__%'
      @REM ECHO.          

    (ENDLOCAL
      SET %4=%__RESULT__%
    )
GOTO :EOF