@ECHO OFF
@REM CLS

SET CURRENT_SCRIPT_PATH=%~dp0
SET TESTS_COMMON_PATH=%CURRENT_SCRIPT_PATH%..


REM ------------------- VERIFS ----------------------------------------

REM Recup. de SRC_COMMON_PATH
CALL "%TESTS_COMMON_PATH%/_Pathes.bat"

REM ***** ATTENTION %MESSAGES_DISPLAYER% et %TESTS_RESULT_DISPLAYER% doivent avoir ete precises en amont ! *****
CALL "%SRC_COMMON_PATH%/CheckFatalErrors.bat" CheckVarExists MESSAGES_DISPLAYER
CALL "%SRC_COMMON_PATH%/CheckFatalErrors.bat" CheckVarExists TESTS_RESULT_DISPLAYER



REM ---------------------------------------------------------------------
SETLOCAL ENABLEDELAYEDEXPANSION 
    SET _CURRENT_NAMESPACE_=Transverse._Common.UnitTests
    SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

    SET SRC_UNDER_TEST_NAME=String.bat
    SET SRC_UNDER_TEST_PATH=%SRC_COMMON_PATH%
    SET SRC_UNDER_TEST=%SRC_UNDER_TEST_PATH%/%SRC_UNDER_TEST_NAME%


    REM -------------------------------------------------------------------------------------------------------------

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 5
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "########### TESTS - RUNNING : '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %_CURRENT_NAMESPACE_% ] ########### "

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "             SCRIPT UNDER TEST : '%SRC_UNDER_TEST_NAME%'"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2

    
    REM ==============================================================================================================
     
    CALL :RepeatString_Run_TESTS
    CALL :ReplaceSubString_Run_TESTS
    CALL :SlashToBackSlash_Run_TESTS
    CALL :BackSlashToSlash_Run_TESTS
    CALL :PointToSlash_Run_TESTS


(ENDLOCAL
)

GOTO :EOF


REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction RepeatString =======
REM
:RepeatString_Run_TESTS
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""		
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de RepeatString ******"

    CALL :RepeatString_Nominal_ShouldReturnTheAppropriateString
    CALL :RepeatString_WhenNbReplicateIs0_ShouldReturnAnEmptyString
    CALL :RepeatString_WhenNbReplicateIs1_ShouldReturnTheString
    CALL :RepeatString_WhenStringIsEmpty_ShouldReturnAnEmptyString
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= RepeatString_Nominal_ShouldReturnTheAppropriateString =======
:RepeatString_Nominal_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RepeatString_Nominal_ShouldReturnTheAppropriateString -"
    
    SET SOURCE_STRING=../..\
    SET EXPECTED_RESULT=%SOURCE_STRING%%SOURCE_STRING%%SOURCE_STRING%
    SET NB_REPLICATE=3
    CALL :RepeatString_Run_Test "%SOURCE_STRING%" "%NB_REPLICATE%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= RepeatString_WhenNbReplicateIs0_ShouldReturnAnEmptyString =======
:RepeatString_WhenNbReplicateIs0_ShouldReturnAnEmptyString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RepeatString_WhenNbReplicateIs0_ShouldReturnAnEmptyString -"
    
    SET SOURCE_STRING=../..\
    SET EXPECTED_RESULT=
    SET NB_REPLICATE=0
    CALL :RepeatString_Run_Test "%SOURCE_STRING%" "%NB_REPLICATE%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= RepeatString_WhenNbReplicateIs1_ShouldReturnTheString =======
:RepeatString_WhenNbReplicateIs1_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RepeatString_WhenNbReplicateIs1_ShouldReturnTheString -"
    
    SET SOURCE_STRING=../..\
    SET EXPECTED_RESULT=%SOURCE_STRING%
    SET NB_REPLICATE=1
    CALL :RepeatString_Run_Test "%SOURCE_STRING%" "%NB_REPLICATE%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= RepeatString_WhenStringIsEmpty_ShouldReturnAnEmptyString =======
:RepeatString_WhenStringIsEmpty_ShouldReturnAnEmptyString
	SETLOCAL
        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RepeatString_WhenStringIsEmpty_ShouldReturnAnEmptyString -"

    SET SOURCE_STRING=
    SET EXPECTED_RESULT=
    SET NB_REPLICATE=10
    CALL :RepeatString_Run_Test "%SOURCE_STRING%" "%NB_REPLICATE%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction RepeatString =======
REM 		
REM PARAM. %1 : chaine a repliquer
REM PARAM. %2 : nb. de replications
REM PARAM. %3 : resultat attendu
REM
REM
:RepeatString_Run_Test
	SETLOCAL
				
		SET __SOURCE_STRING__=%~1
    SET __NB_REPLICATE__=%~2
    SET __EXPECTED_RESULT__=%~3

		REM ECHO.
		REM ECHO ====== FUNC : RepeatString_Run_Test ======
		REM ECHO.
		REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
    REM ECHO __NB_REPLICATE__='%__NB_REPLICATE__%'
    REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		REM ECHO.
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec SOURCE_STRING='%__SOURCE_STRING__%' et NB_REPLICATE=%__NB_REPLICATE__%"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" RepeatString "%__SOURCE_STRING__%" "%__NB_REPLICATE__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================




REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction ReplaceSubString =======
REM
:ReplaceSubString_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de ReplaceSubString ******"

    CALL :ReplaceSubString_Nominal_ShouldReturnTheAppropriateString

    CALL :ReplaceSubString_WhenSubStringIsDoublePoint_ShouldReturnTheAppropriateString
    CALL :ReplaceSubString_WhenReplacementStringIsDoublePoint_ShouldReturnTheAppropriateString

    @REM CALL :ReplaceSubString_WhenSubStringIsExclamPoint_ShouldReturnTheAppropriateString
    @REM CALL :ReplaceSubString_WhenReplacementStringIsExclamPoint_ShouldReturnTheAppropriateString

    @REM CALL :ReplaceSubString_WhenSubStringIsDoubleQuote_ShouldReturnTheAppropriateString
    @REM CALL :ReplaceSubString_WhenReplacementStringIsDoubleQuote_ShouldReturnTheAppropriateString

    CALL :ReplaceSubString_WhenSubStringIsSimpleQuote_ShouldReturnTheAppropriateString
    CALL :ReplaceSubString_WhenReplacementStringIsSimpleQuote_ShouldReturnTheAppropriateString

    CALL :ReplaceSubString_WhenSubStringIsDoubleSlash_ShouldReturnAStringWithDoubleSlashReplaced    

    CALL :ReplaceSubString_WhenReplacementStringAndSubStringToReplHaveNotSameCase_ShouldReturnTheAppropriateStringWithoutCaringForCase

    CALL :ReplaceSubString_WhenStringIsEmpty_ShouldReturnAnEmptyString
    CALL :ReplaceSubString_WhenReplacementStringIsEmpty_ShouldReturnTheSameString
    CALL :ReplaceSubString_WhenSubstringIsEmpty_ShouldReturnTheSameString
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= ReplaceSubString_Nominal_ShouldReturnTheAppropriateString =======
:ReplaceSubString_Nominal_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_Nominal_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=AbCZeFG
    SET SOURCE_SUBSTRING_TO_REPLACE=Ze
    SET REPLACING_STRING=DE
    SET EXPECTED_RESULT=AbCDEFG
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ReplaceSubString_WhenSubStringIsDoublePoint_ShouldReturnTheAppropriateString =======
:ReplaceSubString_WhenSubStringIsDoublePoint_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenSubStringIsDoublePoint_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=A:C:F::G:::
    SET SOURCE_SUBSTRING_TO_REPLACE=:
    SET REPLACING_STRING=x
    SET EXPECTED_RESULT=AxCxFxxGxxx
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ReplaceSubString_WhenReplacementStringIsDoublePoint_ShouldReturnTheAppropriateString =======
:ReplaceSubString_WhenReplacementStringIsDoublePoint_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenReplacementStringIsDoublePoint_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=AxCxFxxGxxx
    SET SOURCE_SUBSTRING_TO_REPLACE=xX
    SET REPLACING_STRING=:
    SET EXPECTED_RESULT=AxCxF:G:x
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

@REM LE REMPLACEMENT DE POINT D'EXCLAM. N'EST PAS GERE !!!
@REM ======= ReplaceSubString_WhenSubStringIsExclamPoint_ShouldReturnTheAppropriateString =======
@REM :ReplaceSubString_WhenSubStringIsExclamPoint_ShouldReturnTheAppropriateString
@REM 	SETLOCAL

@REM     CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
@REM     CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenSubStringIsExclamPoint_ShouldReturnTheAppropriateString -"
    
@REM 		SET SOURCE_STRING=A!C!F!!G!!!
@REM     SET SOURCE_SUBSTRING_TO_REPLACE=!
@REM     SET REPLACING_STRING=x
@REM     SET EXPECTED_RESULT=AxCxFxxGxxx
@REM     CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

@REM 	(ENDLOCAL
@REM 	)
@REM GOTO :EOF

@REM LE REMPLACEMENT PAR UN POINT D'EXCLAM. N'EST PAS GERE !!!
@REM ======= ReplaceSubString_WhenReplacementStringIsExclamPoint_ShouldReturnTheAppropriateString =======
@REM :ReplaceSubString_WhenReplacementStringIsExclamPoint_ShouldReturnTheAppropriateString
@REM 	SETLOCAL

@REM     CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
@REM     CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenReplacementStringIsExclamPoint_ShouldReturnTheAppropriateString -"
    
@REM 		SET SOURCE_STRING=AxCxFxxGxxx
@REM     SET SOURCE_SUBSTRING_TO_REPLACE=xX
@REM     SET REPLACING_STRING=!
@REM     SET EXPECTED_RESULT=AxCxF!G!x
@REM     CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

@REM 	(ENDLOCAL
@REM 	)
@REM GOTO :EOF


@REM LE REMPLACEMENT DE GUILLEMETS N'EST PAS GERE !!!
@REM REM ======= ReplaceSubString_WhenSubStringIsDoubleQuote_ShouldReturnTheAppropriateString =======
@REM :ReplaceSubString_WhenSubStringIsDoubleQuote_ShouldReturnTheAppropriateString
@REM 	SETLOCAL

@REM     CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
@REM     CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenSubStringIsDoubleQuote_ShouldReturnTheAppropriateString -"
    
@REM 		SET SOURCE_STRING="AbCZ"eF"G
@REM     SET SOURCE_SUBSTRING_TO_REPLACE="
@REM     SET REPLACING_STRING=x
@REM     SET EXPECTED_RESULT=xAbCZxeFxG
@REM     CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

@REM 	(ENDLOCAL
@REM 	)
@REM GOTO :EOF


@REM LE REMPLACEMENT PAR DES GUILLEMETS N'EST PAS GERE !!!
@REM REM ======= ReplaceSubString_WhenReplacementStringIsDoubleQuote_ShouldReturnTheAppropriateString =======
@REM :ReplaceSubString_WhenReplacementStringIsDoubleQuote_ShouldReturnTheAppropriateString
@REM 	SETLOCAL

@REM     CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
@REM     CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenReplacementStringIsDoubleQuote_ShouldReturnTheAppropriateString -"
    
@REM 		SET SOURCE_STRING=xAbCZxeFxG
@REM     SET SOURCE_SUBSTRING_TO_REPLACE=x
@REM     SET REPLACING_STRING="
@REM     SET EXPECTED_RESULT="AbCZ"eF"G
@REM     CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

@REM 	(ENDLOCAL
@REM 	)
@REM GOTO :EOF



REM ======= ReplaceSubString_WhenSubStringIsSimpleQuote_ShouldReturnTheAppropriateString =======
:ReplaceSubString_WhenSubStringIsSimpleQuote_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenSubStringIsSimpleQuote_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING='AbCZ'eF'G
    SET SOURCE_SUBSTRING_TO_REPLACE='
    SET REPLACING_STRING=x
    SET EXPECTED_RESULT=xAbCZxeFxG
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ReplaceSubString_WhenReplacementStringIsSimpleQuote_ShouldReturnTheAppropriateString =======
:ReplaceSubString_WhenReplacementStringIsSimpleQuote_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenReplacementStringIsSimpleQuote_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=xAbCZxeFxG
    SET SOURCE_SUBSTRING_TO_REPLACE=x
    SET REPLACING_STRING='
    SET EXPECTED_RESULT='AbCZ'eF'G
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ReplaceSubString_WhenSubStringIsDoubleSlash_ShouldReturnAStringWithDoubleSlashReplaced =======
:ReplaceSubString_WhenSubStringIsDoubleSlash_ShouldReturnAStringWithDoubleSlashReplaced
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenSubStringIsDoubleSlash_ShouldReturnAStringWithDoubleSlashReplaced -"
    
		SET SOURCE_STRING=\\AbCZ\\eF\\G
    SET SOURCE_SUBSTRING_TO_REPLACE=\\
    SET REPLACING_STRING=/
    SET EXPECTED_RESULT=/AbCZ/eF/G
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= ReplaceSubString_WhenReplacementStringAndSubStringToReplHaveNotSameCase_ShouldReturnTheAppropriateStringWithoutCaringForCase =======
:ReplaceSubString_WhenReplacementStringAndSubStringToReplHaveNotSameCase_ShouldReturnTheAppropriateStringWithoutCaringForCase
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenReplacementStringAndSubStringToReplHaveNotSameCase_ShouldReturnTheAppropriateStringWithoutCaringForCase -"
    
		SET SOURCE_STRING=AAaaAAa
    SET SOURCE_SUBSTRING_TO_REPLACE=a
    SET REPLACING_STRING=B
    SET EXPECTED_RESULT=BBBBBBB
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= ReplaceSubString_WhenStringIsEmpty_ShouldReturnAnEmptyString =======
:ReplaceSubString_WhenStringIsEmpty_ShouldReturnAnEmptyString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenStringIsEmpty_ShouldReturnAnEmptyString -"
    
		SET SOURCE_STRING=
    SET SOURCE_SUBSTRING_TO_REPLACE=a
    SET REPLACING_STRING=B
    SET EXPECTED_RESULT=
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ReplaceSubString_WhenReplacementStringIsEmpty_ShouldReturnTheSameString =======
:ReplaceSubString_WhenReplacementStringIsEmpty_ShouldReturnTheSameString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenReplacementStringIsEmpty_ShouldReturnTheSameString -"
    
		SET SOURCE_STRING=ABCDEF
    SET SOURCE_SUBSTRING_TO_REPLACE=B
    SET REPLACING_STRING=
    SET EXPECTED_RESULT=ABCDEF
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ReplaceSubString_WhenSubstringIsEmpty_ShouldReturnTheSameString =======
:ReplaceSubString_WhenSubstringIsEmpty_ShouldReturnTheSameString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenSubstringIsEmpty_ShouldReturnTheSameString -"
    
		SET SOURCE_STRING=ABCDEF
    SET SOURCE_SUBSTRING_TO_REPLACE=
    SET REPLACING_STRING=Z
    SET EXPECTED_RESULT=ABCDEF
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction ReplaceSubString =======
REM 		
REM PARAM. %1 : chaine source
REM PARAM. %2 : sous-chaine a remplacer
REM PARAM. %3 : chaine de remplacement
REM PARAM. %4 : resultat attendu
REM
:ReplaceSubString_Run_Test
	SETLOCAL
				
		SET __SOURCE_STRING__=%~1
    SET __SOURCE_SUBSTRING_TO_REPLACE__=%~2
    SET __REPLACING_STRING__=%~3
    SET __EXPECTED_RESULT__=%~4

		@REM ECHO.
		@REM ECHO ====== FUNC : ReplaceSubString_Run_Test ======
		@REM ECHO.
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
    @REM ECHO __SOURCE_SUBSTRING_TO_REPLACE__='%__SOURCE_SUBSTRING_TO_REPLACE__%'
		@REM ECHO __REPLACING_STRING__='%__REPLACING_STRING__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec SOURCE_STRING='%__SOURCE_STRING__%', SOURCE_SUBSTRING_TO_REPLACE='%__SOURCE_SUBSTRING_TO_REPLACE__%', et REPLACING_STRING='%__REPLACING_STRING__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" ReplaceSubString "%__SOURCE_STRING__%" "%__SOURCE_SUBSTRING_TO_REPLACE__%" "%__REPLACING_STRING__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================







REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction SlashToBackSlash =======
REM
:SlashToBackSlash_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de SlashToBackSlash ******"

    CALL :SlashToBackSlash_Nominal_ShouldReturnTheAppropriateString
    CALL :SlashToBackSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= SlashToBackSlash_Nominal_ShouldReturnTheAppropriateString =======
:SlashToBackSlash_Nominal_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- SlashToBackSlash_Nominal_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=d:/aaa\bbbb//ccc/ddd///e\/f\\G
    SET EXPECTED_RESULT=d:\aaa\bbbb\\ccc\ddd\\\e\\f\\G
    CALL :SlashToBackSlash_Run_Test "%SOURCE_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= SlashToBackSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString =======
:SlashToBackSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- SlashToBackSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString -"
    
		SET SOURCE_STRING=
    SET EXPECTED_RESULT=
    CALL :SlashToBackSlash_Run_Test "%SOURCE_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction SlashToBackSlash =======
REM 		
REM PARAM. %1 : chaine source
REM PARAM. %2 : resultat attendu
REM
:SlashToBackSlash_Run_Test
	SETLOCAL
				
		SET __SOURCE_STRING__=%~1
    SET __EXPECTED_RESULT__=%~2

		@REM ECHO.
		@REM ECHO ====== FUNC : SlashToBackSlash_Run_Test ======
		@REM ECHO.
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec SOURCE_STRING='%__SOURCE_STRING__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" SlashToBackSlash "%__SOURCE_STRING__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================







REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction BackSlashToSlash =======
REM
:BackSlashToSlash_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de BackSlashToSlash ******"

    CALL :BackSlashToSlash_Nominal_ShouldReturnTheAppropriateString
    CALL :BackSlashToSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= BackSlashToSlash_Nominal_ShouldReturnTheAppropriateString =======
:BackSlashToSlash_Nominal_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- BackSlashToSlash_Nominal_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=d:\aaa/bbbb\\ccc/ddd\/e/\f\\\G
    SET EXPECTED_RESULT=d:/aaa/bbbb//ccc/ddd//e//f///G
    CALL :BackSlashToSlash_Run_Test "%SOURCE_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= BackSlashToSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString =======
:BackSlashToSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- BackSlashToSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString -"
    
		SET SOURCE_STRING=
    SET EXPECTED_RESULT=
    CALL :BackSlashToSlash_Run_Test "%SOURCE_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction BackSlashToSlash =======
REM 		
REM PARAM. %1 : chaine source
REM PARAM. %2 : resultat attendu
REM
:BackSlashToSlash_Run_Test
	SETLOCAL
				
		SET __SOURCE_STRING__=%~1
    SET __EXPECTED_RESULT__=%~2

		@REM ECHO.
		@REM ECHO ====== FUNC : BackSlashToSlash_Run_Test ======
		@REM ECHO.
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec SOURCE_STRING='%__SOURCE_STRING__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" BackSlashToSlash "%__SOURCE_STRING__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction PointToSlash =======
REM
:PointToSlash_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de PointToSlash ******"

    CALL :PointToSlash_Nominal_ShouldReturnTheAppropriateString
    CALL :PointToSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= PointToSlash_Nominal_ShouldReturnTheAppropriateString =======
:PointToSlash_Nominal_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PointToSlash_Nominal_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=d:.aaa/bbbb..ccc/ddd./e/.f...G
    SET EXPECTED_RESULT=d:/aaa/bbbb//ccc/ddd//e//f///G
    CALL :PointToSlash_Run_Test "%SOURCE_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= PointToSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString =======
:PointToSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PointToSlash_WhenStringIsEmpty_ShouldReturnAnEmptyString -"
    
		SET SOURCE_STRING=
    SET EXPECTED_RESULT=
    CALL :PointToSlash_Run_Test "%SOURCE_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction PointToSlash =======
REM 		
REM PARAM. %1 : chaine source
REM PARAM. %2 : resultat attendu
REM
:PointToSlash_Run_Test
	SETLOCAL
				
		SET __SOURCE_STRING__=%~1
    SET __EXPECTED_RESULT__=%~2

		@REM ECHO.
		@REM ECHO ====== FUNC : PointToSlash_Run_Test ======
		@REM ECHO.
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec SOURCE_STRING='%__SOURCE_STRING__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" PointToSlash "%__SOURCE_STRING__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================

