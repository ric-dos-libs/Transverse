@ECHO OFF
@REM CLS

SET CURRENT_SCRIPT_PATH=%~dp0
SET TESTS_INFRA_COMMON_PATH=%CURRENT_SCRIPT_PATH%../_Common


REM ------------------- VERIFS ----------------------------------------

REM Recup. de SRC_INFRA_PATH 
REM et SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT
CALL "%TESTS_INFRA_COMMON_PATH%/_Pathes.bat"

REM ***** ATTENTION %MESSAGES_DISPLAYER% et %TESTING_TOOL% doivent être des Scripts précisés en amont et existants ! *****
CALL "%SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%MESSAGES_DISPLAYER%"
CALL "%SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%TESTING_TOOL%"





REM ---------------------------------------------------------------------
SETLOCAL ENABLEDELAYEDEXPANSION 
    SET _CURRENT_NAMESPACE_=Transverse.Infra.UnitTests
    SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

    SET SRC_UNDER_TEST_NAME=DateTime.bat
    SET SRC_UNDER_TEST_PATH=%SRC_INFRA_PATH%
    SET SRC_UNDER_TEST=%SRC_UNDER_TEST_PATH%/%SRC_UNDER_TEST_NAME%


    REM -------------------------------------------------------------------------------------------------------------

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 5
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "########### TESTS - RUNNING : '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %_CURRENT_NAMESPACE_% ] ########### "

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "             SCRIPT UNDER TEST : '%SRC_UNDER_TEST_NAME%'"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2


    REM ==============================================================================================================
     
    CALL :GetDate_Run_TESTS



(ENDLOCAL
)

GOTO :EOF



REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction GetDate =======
REM
:GetDate_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de GetDate ******"

    CALL :GetDate_NominalWithSeparator_ShouldContainTheSeparatorAtTheRightPlaces
    @REM CALL :GetDate_NominalWithSeparator_ShouldHaveALengthOf10
    @REM CALL :GetDate_NominalWithoutSeparator_ShouldHaveALengthOf8

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetDate_Nominal_ShouldContainTheSeparatorAtTheRightPlaces =======
:GetDate_Nominal_ShouldContainTheSeparatorAtTheRightPlaces
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDate_Nominal_ShouldContainTheSeparatorAtTheRightPlaces -"
    
		SET SEPARATOR=.
    SET EXPECTED_RESULT=%STRING%

    SET __RESULT__=
    CALL :GetDate_Run_Test "%SEPARATOR%" __RESULT__

    SET FIRST_SEPARATOR=%__RESULT__:~4,1%
    SET SECOND_SEPARATOR=%__RESULT__:~7,1%
    

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Appel à la fonction GetDate =======
REM 		
REM PARAM. %1 : separator
REM PARAM. %2 : resultat retourne par reference
REM
:GetDate_Run_Test
	SETLOCAL
				
    SET __SEPARATOR__=%~1

		@REM ECHO.
		@REM ECHO ====== FUNC : GetDate_Run_Test ======
		@REM ECHO.
		@REM ECHO __SEPARATOR__='%__SEPARATOR__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec SEPARATOR='%__SEPARATOR__%'"

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" GetDate "%__SEPARATOR__%" __RESULT__
    
	(ENDLOCAL
    SET %2=%__RESULT__%
	)
GOTO :EOF

REM====================================================================================================================
