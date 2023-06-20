@ECHO OFF
@REM CLS

SET CURRENT_SCRIPT_PATH=%~dp0
SET TESTS_INFRA_COMMON_PATH=%CURRENT_SCRIPT_PATH%../_Common


REM ------------------- VERIFS ----------------------------------------

REM Recup. de SRC_INFRA_PATH et SRC_COMMON_PATH
REM et SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT
CALL "%TESTS_INFRA_COMMON_PATH%/_Pathes.bat"


REM ***** ATTENTION %MESSAGES_DISPLAYER% et %TESTING_TOOL% doivent être des Scripts précisés en amont et existants ! *****
CALL "%SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%MESSAGES_DISPLAYER%"
CALL "%SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%TESTING_TOOL%"





REM ---------------------------------------------------------------------
SET SRC_STRING_SCRIPT=%SRC_COMMON_PATH%/String.bat

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
     
    @REM CALL :GetDate_Run_TESTS
    @REM CALL :GetCurrentYear_Run_TESTS
    @REM CALL :GetCurrentMonthNumber_Run_TESTS
    @REM CALL :GetCurrentDayNumber_Run_TESTS



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
    CALL :GetDate_NominalWithSeparator_ShouldHaveALengthOf10
    CALL :GetDate_NominalWithSeparatorThatHas2Chars_ShouldHaveALengthOf12
    CALL :GetDate_NominalWithoutSeparator_ShouldHaveALengthOf8
    CALL :GetDate_Nominal_YearShouldBeValid
    CALL :GetDate_Nominal_MonthShouldBeValid
    CALL :GetDate_Nominal_DayShouldBeValid

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetDate_NominalWithSeparator_ShouldContainTheSeparatorAtTheRightPlaces =======
:GetDate_NominalWithSeparator_ShouldContainTheSeparatorAtTheRightPlaces
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDate_NominalWithSeparator_ShouldContainTheSeparatorAtTheRightPlaces -"
    
		SET SEPARATOR=/

    SET __RESULT__=
    CALL :GetDate_Run_Test "%SEPARATOR%" __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'

    SET FIRST_SEPARATOR=%__RESULT__:~4,1%
    SET SECOND_SEPARATOR=%__RESULT__:~7,1%
    
    CALL "%TESTING_TOOL%" AssertAreEqual "%FIRST_SEPARATOR%" "%SEPARATOR%"
    CALL "%TESTING_TOOL%" AssertAreEqual "%FIRST_SEPARATOR%" "%SECOND_SEPARATOR%"

	(ENDLOCAL
	)
GOTO :EOF



REM ======= GetDate_NominalWithSeparator_ShouldHaveALengthOf10 =======
:GetDate_NominalWithSeparator_ShouldHaveALengthOf10
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDate_NominalWithSeparator_ShouldHaveALengthOf10 -"
    
		SET SEPARATOR=/

    SET __RESULT__=
    CALL :GetDate_Run_Test "%SEPARATOR%" __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_LENGTH__=
    CALL "%SRC_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "10"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= GetDate_NominalWithSeparatorThatHas2Chars_ShouldHaveALengthOf12 =======
:GetDate_NominalWithSeparatorThatHas2Chars_ShouldHaveALengthOf12
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDate_NominalWithSeparatorThatHas2Chars_ShouldHaveALengthOf12 -"
    
		SET SEPARATOR=//

    SET __RESULT__=
    CALL :GetDate_Run_Test "%SEPARATOR%" __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_LENGTH__=
    CALL "%SRC_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "12"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetDate_NominalWithoutSeparator_ShouldHaveALengthOf8 =======
:GetDate_NominalWithoutSeparator_ShouldHaveALengthOf8
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDate_NominalWithoutSeparator_ShouldHaveALengthOf8 -"
    
		SET SEPARATOR=

    SET __RESULT__=
    CALL :GetDate_Run_Test "%SEPARATOR%" __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_LENGTH__=
    CALL "%SRC_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "8"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetDate_Nominal_YearShouldBeValid =======
:GetDate_Nominal_YearShouldBeValid
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDate_Nominal_YearShouldBeValid -"
    
		SET SEPARATOR=

    SET __RESULT__=
    CALL :GetDate_Run_Test "%SEPARATOR%" __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_YEAR__=%__RESULT__:~0,4% /1
    @REM ECHO __RESULT_YEAR__='%__RESULT_YEAR__%'

    SET /A __RESULT_NEXT_YEAR2__=%__RESULT_YEAR__% +2
    Rem +2 car on peut changer d'année dans la milliseconde ET AssertIsBetween attend une borne max exclue.
    @REM ECHO __RESULT_NEXT_YEAR2__='%__RESULT_NEXT_YEAR2__%'    

    SET __CURRENT_DATE__=%DATE%
    SET /A __CURRENT_YEAR__=%__CURRENT_DATE__:~6,4% /1

    CALL "%TESTING_TOOL%" AssertIsBetween "%__CURRENT_YEAR__%" "%__RESULT_YEAR__%" "%__RESULT_NEXT_YEAR2__%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= GetDate_Nominal_MonthShouldBeValid =======
:GetDate_Nominal_MonthShouldBeValid
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDate_Nominal_MonthShouldBeValid -"
    
		SET SEPARATOR=

    SET __RESULT__=
    CALL :GetDate_Run_Test "%SEPARATOR%" __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'

    @REM ECHO __RESULT_YEAR__='%__RESULT_YEAR__%'    
    SET __RESULT_MONTH__=%__RESULT__:~4,2%
    @REM ECHO __RESULT_MONTH__='%__RESULT_MONTH__%'

    SET __CURRENT_DATE__=%DATE%
    SET __CURRENT_MONTH__=%__CURRENT_DATE__:~3,2%
    SET __CURRENT_YEAR__=%__CURRENT_DATE__:~6,4%


    Rem --- Calcul AnneeMois suivant le suivant de __RESULT_MONTH__ ---
    SET /A __RESULT_NEXT_MONTH2__=%__RESULT_MONTH__% /1 +2
    Rem +2 car on peut changer d'année dans la milliseconde ET AssertIsBetween attend une borne max exclue.
    @REM ECHO __RESULT_NEXT_MONTH2__='%__RESULT_NEXT_MONTH2__%'

    SET __RESULT_YEAR__=%__RESULT__:~0,4%
    IF %__RESULT_NEXT_MONTH2__% GTR 12 (
      SET /A __RESULT_NEXT_MONTH2__=%__RESULT_NEXT_MONTH2__% -12
      @REM ECHO __RESULT_NEXT_MONTH2__='%__RESULT_NEXT_MONTH2__%'

      SET /A __RESULT_NEXT_MONTH2_YEAR__=%__RESULT_YEAR__%/1 +1

    ) ELSE (
      SET __RESULT_NEXT_MONTH2_YEAR__=%__RESULT_YEAR__%
    )
    @REM ECHO __RESULT_NEXT_MONTH2_YEAR__=%__RESULT_NEXT_MONTH2_YEAR__%

    CALL "%SRC_STRING_SCRIPT%" PadLeft "%__RESULT_NEXT_MONTH2__%" "0" "2" __RESULT_NEXT_MONTH2__
    @REM ECHO __RESULT_NEXT_MONTH2__='%__RESULT_NEXT_MONTH2__%'

    REM ----------------------------------------------
    CALL "%TESTING_TOOL%" AssertIsBetween "%__CURRENT_YEAR__%%__CURRENT_MONTH__%" "%__RESULT_YEAR__%%__RESULT_MONTH__%" "%__RESULT_NEXT_MONTH2_YEAR__%%__RESULT_NEXT_MONTH2__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetDate_Nominal_DayShouldBeValid =======
:GetDate_Nominal_DayShouldBeValid
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDate_Nominal_DayShouldBeValid -"
    
		SET SEPARATOR=

    SET __RESULT__=
    CALL :GetDate_Run_Test "%SEPARATOR%" __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_DAY__=%__RESULT__:~6,2% /1
    @REM ECHO __RESULT_DAY__='%__RESULT_DAY__%'

    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_DAY__%" "1" "32"

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
    CALL "%SRC_UNDER_TEST%" GetDate __RESULT__ "%__SEPARATOR__%"
    @REM ECHO __RESULT__='%__RESULT__%'
    
	(ENDLOCAL
    SET %2=%__RESULT__%
	)
GOTO :EOF

REM====================================================================================================================






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction GetCurrentYear =======
REM
:GetCurrentYear_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de GetCurrentYear ******"

    CALL :GetCurrentYear_Nominal_ShouldReturnAValidYear

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetCurrentYear_Nominal_ShouldReturnAValidYear =======
:GetCurrentYear_Nominal_ShouldReturnAValidYear
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetCurrentYear_Nominal_ShouldReturnAValidYear -"
    
    SET __RESULT__=
    CALL :GetCurrentYear_Run_Test __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_YEAR__=%__RESULT__% /1
    @REM ECHO __RESULT_YEAR__='%__RESULT_YEAR__%'

    SET /A __RESULT_NEXT_YEAR2__=%__RESULT_YEAR__% +2
    Rem +2 car on peut changer d'année dans la milliseconde ET AssertIsBetween attend une borne max exclue.
    @REM ECHO __RESULT_NEXT_YEAR2__='%__RESULT_NEXT_YEAR2__%'    

    SET __CURRENT_DATE__=%DATE%
    SET /A __CURRENT_YEAR__=%__CURRENT_DATE__:~6,4% /1

    CALL "%TESTING_TOOL%" AssertIsBetween "%__CURRENT_YEAR__%" "%__RESULT_YEAR__%" "%__RESULT_NEXT_YEAR2__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Appel à la fonction GetCurrentYear =======
REM 		
REM PARAM. %1 : resultat retourne par reference
REM
:GetCurrentYear_Run_Test
	SETLOCAL
				

		@REM ECHO.
		@REM ECHO ====== FUNC : GetCurrentYear_Run_Test ======
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" GetCurrentYear __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'
    
	(ENDLOCAL
    SET %1=%__RESULT__%
	)
GOTO :EOF

REM====================================================================================================================






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction GetCurrentMonthNumber =======
REM
:GetCurrentMonthNumber_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de GetCurrentMonthNumber ******"

    CALL :GetCurrentMonthNumber_Nominal_ShouldReturnAValidMonth

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetCurrentMonthNumber_Nominal_ShouldReturnAValidMonth =======
:GetCurrentMonthNumber_Nominal_ShouldReturnAValidMonth
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetCurrentMonthNumber_Nominal_ShouldReturnAValidMonth -"

    SET __RESULT__=
    CALL :GetCurrentMonthNumber_Run_Test __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_MONTH__=%__RESULT__% /1
    @REM ECHO __RESULT_MONTH__='%__RESULT_MONTH__%'

    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_MONTH__%" "1" "13"    
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= Appel à la fonction GetCurrentMonthNumber =======
REM 		
REM PARAM. %1 : resultat retourne par reference
REM
:GetCurrentMonthNumber_Run_Test
	SETLOCAL
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetCurrentMonthNumber_Run_Test ======
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" GetCurrentMonthNumber __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'
    
	(ENDLOCAL
    SET %1=%__RESULT__%
	)
GOTO :EOF

REM====================================================================================================================






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction GetCurrentDayNumber =======
REM
:GetCurrentDayNumber_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de GetCurrentDayNumber ******"

    CALL :GetCurrentDayNumber_Nominal_ShouldReturnAValidDay

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetCurrentDayNumber_Nominal_ShouldReturnAValidDay =======
:GetCurrentDayNumber_Nominal_ShouldReturnAValidDay
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetCurrentDayNumber_Nominal_ShouldReturnAValidDay -"

    SET __RESULT__=
    CALL :GetCurrentDayNumber_Run_Test __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_DAY__=%__RESULT__% /1
    @REM ECHO __RESULT_DAY__='%__RESULT_DAY__%'

    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_DAY__%" "1" "32"    
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= Appel à la fonction GetCurrentDayNumber =======
REM 		
REM PARAM. %1 : resultat retourne par reference
REM
:GetCurrentDayNumber_Run_Test
	SETLOCAL
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetCurrentDayNumber_Run_Test ======
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage

    SET __RESULT__=
    CALL "%SRC_UNDER_TEST%" GetCurrentDayNumber __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'
    
	(ENDLOCAL
    SET %1=%__RESULT__%
	)
GOTO :EOF

REM====================================================================================================================