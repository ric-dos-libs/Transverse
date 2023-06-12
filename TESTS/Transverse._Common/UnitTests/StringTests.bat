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

SET SRC_COMMON_CONSTANTS_SCRIPT=%SRC_COMMON_PATH%/Constants.bat
CALL "%SRC_COMMON_CONSTANTS_SCRIPT%"



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
    CALL :RemoveSubString_Run_TESTS
    CALL :SlashToBackSlash_Run_TESTS
    CALL :BackSlashToSlash_Run_TESTS
    CALL :PointToSlash_Run_TESTS
    CALL :GetStringLength_Run_TESTS
    CALL :PadLeft_Run_TESTS
    CALL :WithoutSpace_Run_TESTS
    CALL :ContainsSubString_Run_TESTS
    CALL :EndsWith_Run_TESTS


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
    CALL :RepeatString_WhenStringIsSpace_ShouldReturnTheAppropriateString
		
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

REM ======= RepeatString_WhenStringIsSpace_ShouldReturnTheAppropriateString =======
:RepeatString_WhenStringIsSpace_ShouldReturnTheAppropriateString
	SETLOCAL
        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RepeatString_WhenStringIsSpace_ShouldReturnTheAppropriateString -"

    SET SOURCE_STRING= 
    SET EXPECTED_RESULT=    
    SET NB_REPLICATE=4
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

		@REM ECHO.
		@REM ECHO ====== FUNC : RepeatString_Run_Test ======
		@REM ECHO.
		@REM ECHO __SOURCE_STRING__='%__SOURCE_STRING__%'
    @REM ECHO __NB_REPLICATE__='%__NB_REPLICATE__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

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

    CALL :ReplaceSubString_WhenSubStringIsWithDoublePoint_ShouldReturnTheAppropriateString
    CALL :ReplaceSubString_WhenReplacementStringIsWithDoublePoint_ShouldReturnTheAppropriateString

    CALL :ReplaceSubString_WhenSubStringIsWithSimpleQuote_ShouldReturnTheAppropriateString
    CALL :ReplaceSubString_WhenReplacementStringIsWithSimpleQuote_ShouldReturnTheAppropriateString

    CALL :ReplaceSubString_WhenSubStringIsWithDoubleSlash_ShouldReturnAStringWithDoubleSlashReplaced
    CALL :ReplaceSubString_WhenReplacementStringIsWithDoubleSlash_ShouldReturnTheAppropriateString

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

REM ======= ReplaceSubString_WhenSubStringIsWithDoublePoint_ShouldReturnTheAppropriateString =======
:ReplaceSubString_WhenSubStringIsWithDoublePoint_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenSubStringIsWithDoublePoint_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=A:C:F::G:::
    SET SOURCE_SUBSTRING_TO_REPLACE=:
    SET REPLACING_STRING=x
    SET EXPECTED_RESULT=AxCxFxxGxxx
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ReplaceSubString_WhenReplacementStringIsWithDoublePoint_ShouldReturnTheAppropriateString =======
:ReplaceSubString_WhenReplacementStringIsWithDoublePoint_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenReplacementStringIsWithDoublePoint_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=AxCxFxxGxxx
    SET SOURCE_SUBSTRING_TO_REPLACE=xX
    SET REPLACING_STRING=:
    SET EXPECTED_RESULT=AxCxF:G:x
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ReplaceSubString_WhenSubStringIsWithSimpleQuote_ShouldReturnTheAppropriateString =======
:ReplaceSubString_WhenSubStringIsWithSimpleQuote_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenSubStringIsWithSimpleQuote_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING='AbCZ'eF'G
    SET SOURCE_SUBSTRING_TO_REPLACE='
    SET REPLACING_STRING=x
    SET EXPECTED_RESULT=xAbCZxeFxG
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ReplaceSubString_WhenReplacementStringIsWithSimpleQuote_ShouldReturnTheAppropriateString =======
:ReplaceSubString_WhenReplacementStringIsWithSimpleQuote_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenReplacementStringIsWithSimpleQuote_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=xAbCZxeFxG
    SET SOURCE_SUBSTRING_TO_REPLACE=x
    SET REPLACING_STRING='
    SET EXPECTED_RESULT='AbCZ'eF'G
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ReplaceSubString_WhenSubStringIsWithDoubleSlash_ShouldReturnAStringWithDoubleSlashReplaced =======
:ReplaceSubString_WhenSubStringIsWithDoubleSlash_ShouldReturnAStringWithDoubleSlashReplaced
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenSubStringIsWithDoubleSlash_ShouldReturnAStringWithDoubleSlashReplaced -"
    
		SET SOURCE_STRING=\\AbCZ\\eF\\G
    SET SOURCE_SUBSTRING_TO_REPLACE=\\
    SET REPLACING_STRING=/
    SET EXPECTED_RESULT=/AbCZ/eF/G
    CALL :ReplaceSubString_Run_Test "%SOURCE_STRING%" "%SOURCE_SUBSTRING_TO_REPLACE%" "%REPLACING_STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= ReplaceSubString_WhenReplacementStringIsWithDoubleSlash_ShouldReturnTheAppropriateString =======
:ReplaceSubString_WhenReplacementStringIsWithDoubleSlash_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ReplaceSubString_WhenReplacementStringIsWithDoubleSlash_ShouldReturnTheAppropriateString -"
    
		SET SOURCE_STRING=abcacbbA
    SET SOURCE_SUBSTRING_TO_REPLACE=A
    SET REPLACING_STRING=E\\F
    SET EXPECTED_RESULT=E\\FbcE\\FcbbE\\F
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






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction GetStringLength =======
REM
:GetStringLength_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de GetStringLength ******"

    CALL :GetStringLength_Nominal_ShouldReturnTheAppropriateLength
    CALL :GetStringLength_WhenStringIsEmpty_ShouldReturn0
    CALL :GetStringLength_WhenStringIsOnlyWithSpaces_ShouldReturnTheAppropriateLength
    CALL :GetStringLength_WhenStringContainsDoublePoint_ShouldReturnTheAppropriateLength
    CALL :GetStringLength_WhenStringContainsSimpleQuote_ShouldReturnTheAppropriateLength
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetStringLength_Nominal_ShouldReturnTheAppropriateLength =======
:GetStringLength_Nominal_ShouldReturnTheAppropriateLength
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetStringLength_Nominal_ShouldReturnTheAppropriateLength -"
    
		SET STRING=ABCdEFGH
    SET EXPECTED_RESULT=8
    CALL :GetStringLength_Run_Test "%STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= GetStringLength_WhenStringIsEmpty_ShouldReturn0 =======
:GetStringLength_WhenStringIsEmpty_ShouldReturn0
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetStringLength_WhenStringIsEmpty_ShouldReturn0 -"
    
		SET STRING=
    SET EXPECTED_RESULT=0
    CALL :GetStringLength_Run_Test "%STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetStringLength_WhenStringIsOnlyWithSpaces_ShouldReturnTheAppropriateLength =======
:GetStringLength_WhenStringIsOnlyWithSpaces_ShouldReturnTheAppropriateLength
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetStringLength_WhenStringIsOnlyWithSpaces_ShouldReturnTheAppropriateLength -"
    
		SET STRING=    
    SET EXPECTED_RESULT=4
    CALL :GetStringLength_Run_Test "%STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetStringLength_WhenStringContainsDoublePoint_ShouldReturnTheAppropriateLength =======
:GetStringLength_WhenStringContainsDoublePoint_ShouldReturnTheAppropriateLength
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetStringLength_WhenStringContainsDoublePoint_ShouldReturnTheAppropriateLength -"
    
		SET STRING=1::A::7:
    SET EXPECTED_RESULT=8
    CALL :GetStringLength_Run_Test "%STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= GetStringLength_WhenStringContainsSimpleQuote_ShouldReturnTheAppropriateLength =======
:GetStringLength_WhenStringContainsSimpleQuote_ShouldReturnTheAppropriateLength
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetStringLength_WhenStringContainsSimpleQuote_ShouldReturnTheAppropriateLength -"
    
		SET STRING=a'1'A''7'
    SET EXPECTED_RESULT=9
    CALL :GetStringLength_Run_Test "%STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction GetStringLength =======
REM 		
REM PARAM. %1 : chaine source
REM PARAM. %2 : resultat attendu
REM
:GetStringLength_Run_Test
	SETLOCAL
				
		SET __STRING__=%~1
    SET __EXPECTED_RESULT__=%~2

		@REM ECHO.
		@REM ECHO ====== FUNC : GetStringLength_Run_Test ======
		@REM ECHO.
		@REM ECHO __STRING__='%__STRING__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec STRING='%__STRING__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" GetStringLength "%__STRING__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================





REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction PadLeft =======
REM
:PadLeft_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de PadLeft ******"

    CALL :PadLeft_Nominal_ShouldReturnTheAppropriateString
    CALL :PadLeft_WhenStringIsEmpty_ShouldReturnOnlyFillingChars
    CALL :PadLeft_WhenStringLengthIsHigherThanTheMinimalFinalLength_ShouldReturnTheString
    CALL :PadLeft_WhenStringLengthIsEqualToTheMinimalFinalLength_ShouldReturnTheString
    CALL :PadLeft_WhenFillCharIsEmpty_ShouldReturnTheString
    CALL :PadLeft_WhenFillCharIsSpace_ShouldReturnTheAppropriateString
    CALL :PadLeft_WhenFillCharIsAStringWithMoreThanOneChar_ShouldConsiderOnlyItsFirstCharAndReturnTheAppropriateString
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= PadLeft_Nominal_ShouldReturnTheAppropriateString =======
:PadLeft_Nominal_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PadLeft_Nominal_ShouldReturnTheAppropriateString -"
    
		SET STRING=Abc
    SET FILL_CHAR=0
    SET FINAL_LENGTH=5
    SET EXPECTED_RESULT=00Abc
    CALL :PadLeft_Run_Test "%STRING%" "%FILL_CHAR%" "%FINAL_LENGTH%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= PadLeft_WhenStringIsEmpty_ShouldReturnOnlyFillingChars =======
:PadLeft_WhenStringIsEmpty_ShouldReturnOnlyFillingChars
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PadLeft_WhenStringIsEmpty_ShouldReturnOnlyFillingChars -"
    
		SET STRING=
    SET FILL_CHAR=0
    SET FINAL_LENGTH=5
    SET EXPECTED_RESULT=00000
    CALL :PadLeft_Run_Test "%STRING%" "%FILL_CHAR%" "%FINAL_LENGTH%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= PadLeft_WhenStringLengthIsHigherThanTheMinimalFinalLength_ShouldReturnTheString =======
:PadLeft_WhenStringLengthIsHigherThanTheMinimalFinalLength_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PadLeft_WhenStringLengthIsHigherThanTheMinimalFinalLength_ShouldReturnTheString -"
    
		SET STRING=ABCDE
    SET FILL_CHAR=0
    SET FINAL_LENGTH=4
    SET EXPECTED_RESULT=%STRING%
    CALL :PadLeft_Run_Test "%STRING%" "%FILL_CHAR%" "%FINAL_LENGTH%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= PadLeft_WhenStringLengthIsEqualToTheMinimalFinalLength_ShouldReturnTheString =======
:PadLeft_WhenStringLengthIsEqualToTheMinimalFinalLength_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PadLeft_WhenStringLengthIsEqualToTheMinimalFinalLength_ShouldReturnTheString -"
    
		SET STRING=ABCDE
    SET FILL_CHAR=0
    SET FINAL_LENGTH=5
    SET EXPECTED_RESULT=%STRING%
    CALL :PadLeft_Run_Test "%STRING%" "%FILL_CHAR%" "%FINAL_LENGTH%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= PadLeft_WhenFillCharIsEmpty_ShouldReturnTheString =======
:PadLeft_WhenFillCharIsEmpty_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PadLeft_WhenFillCharIsEmpty_ShouldReturnTheString -"
    
		SET STRING=ABCDE
    SET FILL_CHAR=
    SET FINAL_LENGTH=5
    SET EXPECTED_RESULT=%STRING%
    CALL :PadLeft_Run_Test "%STRING%" "%FILL_CHAR%" "%FINAL_LENGTH%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= PadLeft_WhenFillCharIsSpace_ShouldReturnTheAppropriateString =======
:PadLeft_WhenFillCharIsSpace_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PadLeft_WhenFillCharIsSpace_ShouldReturnTheAppropriateString -"
    
		SET STRING=ABCD
    SET FILL_CHAR= 
    SET FINAL_LENGTH=6
    SET EXPECTED_RESULT=%FILL_CHAR%%FILL_CHAR%%STRING%
    CALL :PadLeft_Run_Test "%STRING%" "%FILL_CHAR%" "%FINAL_LENGTH%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= PadLeft_WhenFillCharIsAStringWithMoreThanOneChar_ShouldConsiderOnlyItsFirstCharAndReturnTheAppropriateString =======
:PadLeft_WhenFillCharIsAStringWithMoreThanOneChar_ShouldConsiderOnlyItsFirstCharAndReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PadLeft_WhenFillCharIsAStringWithMoreThanOneChar_ShouldConsiderOnlyItsFirstCharAndReturnTheAppropriateString -"
    
		SET STRING=ABCD
    SET FILL_CHAR=XYZ
    SET FINAL_LENGTH=6
    SET EXPECTED_RESULT=XX%STRING%
    CALL :PadLeft_Run_Test "%STRING%" "%FILL_CHAR%" "%FINAL_LENGTH%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction PadLeft =======
REM 		
REM PARAM. %1 : chaine source
REM PARAM. %2 : caractere de remplissage
REM PARAM. %3 : longueur finale souhaitee
REM PARAM. %4 : resultat attendu
REM
:PadLeft_Run_Test
	SETLOCAL
				
		SET __STRING__=%~1
    SET __FILL_CHAR__=%~2
    SET __FINAL_LENGTH__=%~3
    SET __EXPECTED_RESULT__=%~4

		@REM ECHO.
		@REM ECHO ====== FUNC : PadLeft_Run_Test ======
		@REM ECHO.
		@REM ECHO __STRING__='%__STRING__%'
    @REM ECHO __FILL_CHAR__='%__FILL_CHAR__%'
    @REM ECHO __FINAL_LENGTH__='%__FINAL_LENGTH__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec STRING='%__STRING__%', FILL_CHAR='%__FILL_CHAR__%' et FINAL_LENGTH='%__FINAL_LENGTH__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" PadLeft "%__STRING__%" "%__FILL_CHAR__%" "%__FINAL_LENGTH__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================




REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction RemoveSubString =======
REM
:RemoveSubString_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de RemoveSubString ******"

    CALL :RemoveSubString_Nominal_ShouldReturnTheAppropriateString
    CALL :RemoveSubString_WhenCaseIsDifferent_ShouldBeCaseInsensitive
    CALL :RemoveSubString_WhenStringIsEmpty_ShouldReturnAnEmptyString
    CALL :RemoveSubString_WhenSubStringDoesntExistWithinTheString_ShouldReturnTheString
    CALL :RemoveSubString_WhenSubStringIsEmpty_ShouldReturnTheString
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= RemoveSubString_Nominal_ShouldReturnTheAppropriateString =======
:RemoveSubString_Nominal_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RemoveSubString_Nominal_ShouldReturnTheAppropriateString -"
    
		SET STRING=AxBXCxxXDXxE
    SET SUBSTRING_TO_REMOVE=x
    SET EXPECTED_RESULT=ABCDE
    CALL :RemoveSubString_Run_Test "%STRING%" "%SUBSTRING_TO_REMOVE%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= RemoveSubString_WhenCaseIsDifferent_ShouldBeCaseInsensitive =======
:RemoveSubString_WhenCaseIsDifferent_ShouldBeCaseInsensitive
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RemoveSubString_WhenCaseIsDifferent_ShouldBeCaseInsensitive -"
    
		SET STRING=AxBXCxxXDXxE
    SET SUBSTRING_TO_REMOVE=x
    SET EXPECTED_RESULT=ABCDE
    CALL :RemoveSubString_Run_Test "%STRING%" "%SUBSTRING_TO_REMOVE%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= RemoveSubString_WhenStringIsEmpty_ShouldReturnAnEmptyString =======
:RemoveSubString_WhenStringIsEmpty_ShouldReturnAnEmptyString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RemoveSubString_WhenStringIsEmpty_ShouldReturnAnEmptyString -"
    
		SET STRING=
    SET SUBSTRING_TO_REMOVE=x
    SET EXPECTED_RESULT=
    CALL :RemoveSubString_Run_Test "%STRING%" "%SUBSTRING_TO_REMOVE%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= RemoveSubString_WhenSubStringDoesntExistWithinTheString_ShouldReturnTheString =======
:RemoveSubString_WhenSubStringDoesntExistWithinTheString_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RemoveSubString_WhenSubStringDoesntExistWithinTheString_ShouldReturnTheString -"
    
		SET STRING=ABCD
    SET SUBSTRING_TO_REMOVE=x
    SET EXPECTED_RESULT=%STRING%
    CALL :RemoveSubString_Run_Test "%STRING%" "%SUBSTRING_TO_REMOVE%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= RemoveSubString_WhenSubStringIsEmpty_ShouldReturnTheString =======
:RemoveSubString_WhenSubStringIsEmpty_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RemoveSubString_WhenSubStringIsEmpty_ShouldReturnTheString -"
    
		SET STRING=ABCD
    SET SUBSTRING_TO_REMOVE=
    SET EXPECTED_RESULT=%STRING%
    CALL :RemoveSubString_Run_Test "%STRING%" "%SUBSTRING_TO_REMOVE%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction RemoveSubString =======
REM 		
REM PARAM. %1 : chaine
REM PARAM. %2 : sous-chaine a retirer
REM PARAM. %3 : resultat attendu
REM
:RemoveSubString_Run_Test
	SETLOCAL
				
		SET __STRING__=%~1
    SET __SUBSTRING_TO_REMOVE__=%~2
    SET __EXPECTED_RESULT__=%~3

		@REM ECHO.
		@REM ECHO ====== FUNC : RemoveSubString_Run_Test ======
		@REM ECHO.
		@REM ECHO __STRING__='%__STRING__%'
    @REM ECHO __SUBSTRING_TO_REMOVE__='%__SUBSTRING_TO_REMOVE__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec STRING='%__STRING__%', et SUBSTRING_TO_REMOVE='%__SUBSTRING_TO_REMOVE__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" RemoveSubString "%__STRING__%" "%__SUBSTRING_TO_REMOVE__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================





REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction WithoutSpace =======
REM
:WithoutSpace_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de WithoutSpace ******"

    CALL :WithoutSpace_Nominal_ShouldReturnTheAppropriateString
    CALL :WithoutSpace_WhenStringIsEmpty_ShouldReturnAnEmptyString
    CALL :WithoutSpace_WhenTheresNoSpaceWithinTheString_ShouldReturnTheString
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= WithoutSpace_Nominal_ShouldReturnTheAppropriateString =======
:WithoutSpace_Nominal_ShouldReturnTheAppropriateString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- WithoutSpace_Nominal_ShouldReturnTheAppropriateString -"
    
		SET STRING=  A B C  D  E 
    SET EXPECTED_RESULT=ABCDE
    CALL :WithoutSpace_Run_Test "%STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= WithoutSpace_WhenStringIsEmpty_ShouldReturnAnEmptyString =======
:WithoutSpace_WhenStringIsEmpty_ShouldReturnAnEmptyString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- WithoutSpace_WhenStringIsEmpty_ShouldReturnAnEmptyString -"
    
		SET STRING=
    SET EXPECTED_RESULT=%STRING%
    CALL :WithoutSpace_Run_Test "%STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= WithoutSpace_WhenTheresNoSpaceWithinTheString_ShouldReturnTheString =======
:WithoutSpace_WhenTheresNoSpaceWithinTheString_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- WithoutSpace_WhenTheresNoSpaceWithinTheString_ShouldReturnTheString -"
    
		SET STRING=ABC
    SET EXPECTED_RESULT=%STRING%
    CALL :WithoutSpace_Run_Test "%STRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction WithoutSpace =======
REM 		
REM PARAM. %1 : chaine
REM PARAM. %2 : resultat attendu
REM
:WithoutSpace_Run_Test
	SETLOCAL
				
		SET __STRING__=%~1
    SET __EXPECTED_RESULT__=%~2

		@REM ECHO.
		@REM ECHO ====== FUNC : WithoutSpace_Run_Test ======
		@REM ECHO.
		@REM ECHO __STRING__='%__STRING__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec STRING='%__STRING__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" WithoutSpace "%__STRING__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction ContainsSubString =======
REM
:ContainsSubString_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de ContainsSubString ******"

    CALL :ContainsSubString_WhenStringContainsSubString_ShouldReturnTrue
    CALL :ContainsSubString_WhenStringDoesntContainSubString_ShouldReturnFalse
    CALL :ContainsSubString_WhenCaseIsDifferent_ShouldBeCaseInsensitive
    CALL :ContainsSubString_WhenStringIsEmpty_ShouldReturnFalse
    CALL :ContainsSubString_WhenSubStringIsEmpty_ShouldReturnFalse
		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= ContainsSubString_WhenStringContainsSubString_ShouldReturnTrue =======
:ContainsSubString_WhenStringContainsSubString_ShouldReturnTrue
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ContainsSubString_WhenStringContainsSubString_ShouldReturnTrue -"
    
		SET STRING=ABC\E
    SET SUBSTRING=\
    SET EXPECTED_RESULT=%TRUE%
    CALL :ContainsSubString_Run_Test "%STRING%" "%SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ContainsSubString_WhenStringDoesntContainSubString_ShouldReturnFalse =======
:ContainsSubString_WhenStringDoesntContainSubString_ShouldReturnFalse
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ContainsSubString_WhenStringDoesntContainSubString_ShouldReturnFalse -"
    
		SET STRING=ABCE
    SET SUBSTRING=D
    SET EXPECTED_RESULT=%FALSE%
    CALL :ContainsSubString_Run_Test "%STRING%" "%SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= ContainsSubString_WhenCaseIsDifferent_ShouldBeCaseInsensitive =======
:ContainsSubString_WhenCaseIsDifferent_ShouldBeCaseInsensitive
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ContainsSubString_WhenCaseIsDifferent_ShouldBeCaseInsensitive -"
    
		SET STRING=ABC
    SET SUBSTRING=b
    SET EXPECTED_RESULT=%TRUE%
    CALL :ContainsSubString_Run_Test "%STRING%" "%SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= ContainsSubString_WhenStringIsEmpty_ShouldReturnFalse =======
:ContainsSubString_WhenStringIsEmpty_ShouldReturnFalse
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ContainsSubString_WhenStringIsEmpty_ShouldReturnFalse -"
    
		SET STRING=
    SET SUBSTRING=x
    SET EXPECTED_RESULT=%FALSE%
    CALL :ContainsSubString_Run_Test "%STRING%" "%SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= ContainsSubString_WhenSubStringIsEmpty_ShouldReturnFalse =======
:ContainsSubString_WhenSubStringIsEmpty_ShouldReturnFalse
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- ContainsSubString_WhenSubStringIsEmpty_ShouldReturnFalse -"
    
		SET STRING=ABCD
    SET SUBSTRING=
    SET EXPECTED_RESULT=%FALSE%
    CALL :ContainsSubString_Run_Test "%STRING%" "%SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction ContainsSubString =======
REM 		
REM PARAM. %1 : chaine
REM PARAM. %2 : sous-chaine a retirer
REM PARAM. %3 : resultat attendu
REM
:ContainsSubString_Run_Test
	SETLOCAL
				
		SET __STRING__=%~1
    SET __SUBSTRING__=%~2
    SET __EXPECTED_RESULT__=%~3

		@REM ECHO.
		@REM ECHO ====== FUNC : ContainsSubString_Run_Test ======
		@REM ECHO.
		@REM ECHO __STRING__='%__STRING__%'
    @REM ECHO __SUBSTRING__='%__SUBSTRING__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec STRING='%__STRING__%', et SUBSTRING='%__SUBSTRING__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" ContainsSubString "%__STRING__%" "%__SUBSTRING__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction EndsWith =======
REM
:EndsWith_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de EndsWith ******"

    CALL :EndsWith_WhenWeWantTheEndingAndTheStringAlreadyEndsWithIt_ShouldReturnTheString
    CALL :EndsWith_WhenWeWantTheEndingAndTheStringDoesntEndWithIt_ShouldReturnTheStringPlusTheEnding
    CALL :EndsWith_WhenWeDontWantTheEndingAndTheStringEndsWithIt_ShouldReturnTheStringWithoutThisEnding
    CALL :EndsWith_WhenWeDontWantTheEndingAndTheStringDoesntEndWithIt_ShouldReturnTheString

    CALL :EndsWith_WhenCaseIsDifferent_ShouldBeCaseSensitive

    CALL :EndsWith_WhenWeWantTheEndingAndTheStringIsEmpty_ShouldReturnTheEnding
    CALL :EndsWith_WhenWeDontWantTheEndingAndTheStringIsEmpty_ShouldReturnTheString

    CALL :EndsWith_WhenEndingIsEmpty_ShouldReturnTheString

	(ENDLOCAL
	)
GOTO :EOF


REM ======= EndsWith_WhenWeWantTheEndingAndTheStringAlreadyEndsWithIt_ShouldReturnTheString =======
:EndsWith_WhenWeWantTheEndingAndTheStringAlreadyEndsWithIt_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- EndsWith_WhenWeWantTheEndingAndTheStringAlreadyEndsWithIt_ShouldReturnTheString -"
    
		SET STRING=ABCDxyz
    SET ENDING_SUBSTRING=xyz
    SET WITH_ENDING_SUBSTRING=%TRUE%
    SET EXPECTED_RESULT=%STRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= EndsWith_WhenWeWantTheEndingAndTheStringDoesntEndWithIt_ShouldReturnTheStringPlusTheEnding =======
:EndsWith_WhenWeWantTheEndingAndTheStringDoesntEndWithIt_ShouldReturnTheStringPlusTheEnding
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- EndsWith_WhenWeWantTheEndingAndTheStringDoesntEndWithIt_ShouldReturnTheStringPlusTheEnding -"
    
		SET STRING=ABCD
    SET ENDING_SUBSTRING=xyz
    SET WITH_ENDING_SUBSTRING=%TRUE%
    SET EXPECTED_RESULT=%STRING%%ENDING_SUBSTRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= EndsWith_WhenWeDontWantTheEndingAndTheStringEndsWithIt_ShouldReturnTheStringWithoutThisEnding =======
:EndsWith_WhenWeDontWantTheEndingAndTheStringEndsWithIt_ShouldReturnTheStringWithoutThisEnding
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- EndsWith_WhenWeDontWantTheEndingAndTheStringEndsWithIt_ShouldReturnTheStringWithoutThisEnding -"
    
		SET STRING=ABCDxyz
    SET ENDING_SUBSTRING=xyz
    SET WITH_ENDING_SUBSTRING=%FALSE%
    SET EXPECTED_RESULT=ABCD
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= EndsWith_WhenWeDontWantTheEndingAndTheStringDoesntEndWithIt_ShouldReturnTheString =======
:EndsWith_WhenWeDontWantTheEndingAndTheStringDoesntEndWithIt_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- EndsWith_WhenWeDontWantTheEndingAndTheStringDoesntEndWithIt_ShouldReturnTheString -"
    
		SET STRING=ABCD
    SET ENDING_SUBSTRING=xyz
    SET WITH_ENDING_SUBSTRING=%FALSE%
    SET EXPECTED_RESULT=%STRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= EndsWith_WhenCaseIsDifferent_ShouldBeCaseSensitive =======
:EndsWith_WhenCaseIsDifferent_ShouldBeCaseSensitive
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- EndsWith_WhenCaseIsDifferent_ShouldBeCaseSensitive -"
    
		SET STRING=ABCDxYz
    SET ENDING_SUBSTRING=XYZ
    SET WITH_ENDING_SUBSTRING=%TRUE%
    SET EXPECTED_RESULT=%STRING%%ENDING_SUBSTRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"

		SET STRING=ABCDxYz
    SET ENDING_SUBSTRING=XYZ
    SET WITH_ENDING_SUBSTRING=%FALSE%
    SET EXPECTED_RESULT=%STRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"    

	(ENDLOCAL
	)
GOTO :EOF


REM ======= EndsWith_WhenWeWantTheEndingAndTheStringIsEmpty_ShouldReturnTheEnding =======
:EndsWith_WhenWeWantTheEndingAndTheStringIsEmpty_ShouldReturnTheEnding
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- EndsWith_WhenWeWantTheEndingAndTheStringIsEmpty_ShouldReturnTheEnding -"
    
		SET STRING=
    SET ENDING_SUBSTRING=XYZ
    SET WITH_ENDING_SUBSTRING=%TRUE%
    SET EXPECTED_RESULT=%ENDING_SUBSTRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= EndsWith_WhenWeDontWantTheEndingAndTheStringIsEmpty_ShouldReturnTheString =======
:EndsWith_WhenWeDontWantTheEndingAndTheStringIsEmpty_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- EndsWith_WhenWeDontWantTheEndingAndTheStringIsEmpty_ShouldReturnTheString -"
    
		SET STRING=
    SET ENDING_SUBSTRING=XYZ
    SET WITH_ENDING_SUBSTRING=%FALSE%
    SET EXPECTED_RESULT=%STRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= EndsWith_WhenEndingIsEmpty_ShouldReturnTheString =======
:EndsWith_WhenEndingIsEmpty_ShouldReturnTheString
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- EndsWith_WhenEndingIsEmpty_ShouldReturnTheString -"
    
		SET STRING=ABCD
    SET ENDING_SUBSTRING=
    SET WITH_ENDING_SUBSTRING=%TRUE%
    SET EXPECTED_RESULT=%STRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"

		SET STRING=ABCD
    SET ENDING_SUBSTRING=
    SET WITH_ENDING_SUBSTRING=%FALSE%
    SET EXPECTED_RESULT=%STRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"    

		SET STRING=
    SET ENDING_SUBSTRING=
    SET WITH_ENDING_SUBSTRING=%FALSE%
    SET EXPECTED_RESULT=%STRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"    

		SET STRING=
    SET ENDING_SUBSTRING=
    SET WITH_ENDING_SUBSTRING=%TRUE%
    SET EXPECTED_RESULT=%STRING%
    CALL :EndsWith_Run_Test "%STRING%" "%ENDING_SUBSTRING%" "%WITH_ENDING_SUBSTRING%" "%EXPECTED_RESULT%"    


	(ENDLOCAL
	)
GOTO :EOF



REM ======= Test de la fonction EndsWith =======
REM 		
REM PARAM. %1 : chaine
REM PARAM. %2 : sous-chaine de terminaison
REM PARAM. %3 : %TRUE% si l'on veut un resultat avec la terminaison %2
REM             %FALSE% si l'on veut ne veut pas un resultat avec la terminaison %2
REM PARAM. %4 : resultat attendu
REM
:EndsWith_Run_Test
	SETLOCAL
				
    SET __STRING__=%~1
    SET __ENDING_SUBSTRING__=%~2
    SET __WITH_ENDING_SUBSTRING__=%~3
    SET __EXPECTED_RESULT__=%~4

		@REM ECHO.
		@REM ECHO ====== FUNC : EndsWith_Run_Test ======
		@REM ECHO.
		@REM ECHO __STRING__='%__STRING__%'
    @REM ECHO __ENDING_SUBSTRING__='%__ENDING_SUBSTRING__%'
    @REM ECHO __WITH_ENDING_SUBSTRING__='%__WITH_ENDING_SUBSTRING__%'
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec STRING='%__STRING__%', ENDING_SUBSTRING='%__ENDING_SUBSTRING__%', et WITH_ENDING_SUBSTRING='%__WITH_ENDING_SUBSTRING__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" EndsWith "%__STRING__%" "%__ENDING_SUBSTRING__%" "%__WITH_ENDING_SUBSTRING__%" __RESULT__
    
    CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT__%" "%__EXPECTED_RESULT__%"
		
	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================
