@ECHO OFF
@REM CLS

SET CURRENT_SCRIPT_PATH=%~dp0
SET TRANSVERSE_TESTS_INFRA_COMMON_PATH=%CURRENT_SCRIPT_PATH%../_Common


REM ------------------- VERIFS ----------------------------------------

REM Recup. de TRANSVERSE_INFRA_PATH
REM et TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT, TRANSVERSE_COMMON_STRING_SCRIPT
CALL "%TRANSVERSE_TESTS_INFRA_COMMON_PATH%/_Pathes.bat"


REM ***** ATTENTION %MESSAGES_DISPLAYER% et %TESTING_TOOL% doivent être des Scripts précisés en amont et existants ! *****
CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%MESSAGES_DISPLAYER%"
CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%TESTING_TOOL%"




REM ---------------------------------------------------------------------

SETLOCAL ENABLEDELAYEDEXPANSION 
    SET _CURRENT_NAMESPACE_=Transverse.Infra.%TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH%
    SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

    SET TRANSVERSE_UNDER_TEST_NAME=DateTime.bat
    SET TRANSVERSE_UNDER_TEST_PATH=%TRANSVERSE_INFRA_PATH%
    SET TRANSVERSE_UNDER_TEST=%TRANSVERSE_UNDER_TEST_PATH%/%TRANSVERSE_UNDER_TEST_NAME%


    REM -------------------------------------------------------------------------------------------------------------

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 5
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "########### TESTS - RUNNING : '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %_CURRENT_NAMESPACE_% ] ########### "

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "             SCRIPT UNDER TEST : '%TRANSVERSE_UNDER_TEST_NAME%'"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2


    REM ==============================================================================================================
     
    CALL :GetDate_Run_TESTS
    CALL :GetCurrentYear_Run_TESTS
    CALL :GetCurrentMonthNumber_Run_TESTS
    CALL :GetCurrentDayNumber_Run_TESTS
    CALL :GetHour_Run_TESTS
    CALL :GetMinutes_Run_TESTS
    CALL :GetSeconds_Run_TESTS
    CALL :GetHourMinutes_Run_TESTS
    @REM CALL :GetTime_Run_TESTS //@Todo


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
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

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
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

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
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

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

    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" PadLeft "%__RESULT_NEXT_MONTH2__%" "0" "2" __RESULT_NEXT_MONTH2__
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
    CALL "%TRANSVERSE_UNDER_TEST%" GetDate __RESULT__ "%__SEPARATOR__%"
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
    CALL "%TRANSVERSE_UNDER_TEST%" GetCurrentYear __RESULT__
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
    CALL "%TRANSVERSE_UNDER_TEST%" GetCurrentMonthNumber __RESULT__
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
    CALL "%TRANSVERSE_UNDER_TEST%" GetCurrentDayNumber __RESULT__
    @REM ECHO __RESULT__='%__RESULT__%'
    
	(ENDLOCAL
    SET %1=%__RESULT__%
	)
GOTO :EOF

REM====================================================================================================================






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction GetHour =======
REM
:GetHour_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de GetHour ******"

    CALL :GetHour_WithSuffixMentionned_ShouldReturnTheHourWithTheMentionnedSuffix
    CALL :GetHour_WithoutSuffixMentionned_ShouldReturnTheHourWithTheDefaultSuffix
    CALL :GetHour_Nominal_ShouldReturnA2DigitsValidHour

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetHour_WithSuffixMentionned_ShouldReturnTheHourWithTheMentionnedSuffix =======
:GetHour_WithSuffixMentionned_ShouldReturnTheHourWithTheMentionnedSuffix
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetHour_WithSuffixMentionned_ShouldReturnTheHourWithTheMentionnedSuffix -"

    SET __HOUR_SUFFIX__=Hrs

    SET __RESULT__=
    CALL :GetHour_Run_Test __RESULT__ "%__HOUR_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_ENDING__=%__RESULT__:~-3%

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_ENDING__%" "%__HOUR_SUFFIX__%"
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetHour_WithoutSuffixMentionned_ShouldReturnTheHourWithTheDefaultSuffix =======
:GetHour_WithoutSuffixMentionned_ShouldReturnTheHourWithTheDefaultSuffix
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetHour_WithoutSuffixMentionned_ShouldReturnTheHourWithTheDefaultSuffix -"

    SET __HOUR_SUFFIX__=

    SET __RESULT__=
    CALL :GetHour_Run_Test __RESULT__ "%__HOUR_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_ENDING__=%__RESULT__:~-1%

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_ENDING__%" "h"
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetHour_Nominal_ShouldReturnA2DigitsValidHour =======
:GetHour_Nominal_ShouldReturnA2DigitsValidHour
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetHour_Nominal_ShouldReturnA2DigitsValidHour -"

    Rem -------------- Avec Suffixe heures -------------------------------------
    SET __HOUR_SUFFIX__=Hrs

    SET __RESULT__=
    CALL :GetHour_Run_Test __RESULT__ "%__HOUR_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_HOUR__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_HOUR__%" "0" "25"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,3%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "%__HOUR_SUFFIX__%"

    SET __RESULT_LENGTH__=
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "5"     


    Rem -------------- Sans Suffixe heures -------------------------------------
    SET __HOUR_SUFFIX__=

    SET __RESULT__=
    CALL :GetHour_Run_Test __RESULT__ "%__HOUR_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_HOUR__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_HOUR__%" "0" "25"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,1%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "h"

    SET __RESULT_LENGTH__=
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "3"    
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= Appel à la fonction GetHour =======
REM 		
REM PARAM. %1 : resultat retourne par reference
REM PARAM. %2 : suffixe éventuel
REM
:GetHour_Run_Test
	SETLOCAL
				
    SET __HOUR_SUFFIX__=%~2

		@REM ECHO.
		@REM ECHO ====== FUNC : GetHour_Run_Test ======
    @REM ECHO.
    @REM ECHO __HOUR_SUFFIX__='%__HOUR_SUFFIX__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec HOUR_SUFFIX='%__HOUR_SUFFIX__%'"

    SET __RESULT__=
    CALL "%TRANSVERSE_UNDER_TEST%" GetHour __RESULT__ "%__HOUR_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'
    
	(ENDLOCAL
    SET %1=%__RESULT__%
	)
GOTO :EOF

REM====================================================================================================================






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction GetMinutes =======
REM
:GetMinutes_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de GetMinutes ******"

    CALL :GetMinutes_WithSuffixMentionned_ShouldReturnTheMinutesWithTheMentionnedSuffix
    CALL :GetMinutes_WithoutSuffixMentionned_ShouldReturnTheMinutesWithoutSuffix
    CALL :GetMinutes_Nominal_ShouldReturnA2DigitsValidMinutesValue

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetMinutes_WithSuffixMentionned_ShouldReturnTheMinutesWithTheMentionnedSuffix =======
:GetMinutes_WithSuffixMentionned_ShouldReturnTheMinutesWithTheMentionnedSuffix
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetMinutes_WithSuffixMentionned_ShouldReturnTheMinutesWithTheMentionnedSuffix -"

    SET __MINUTES_SUFFIX__=mn

    SET __RESULT__=
    CALL :GetMinutes_Run_Test __RESULT__ "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_ENDING__=%__RESULT__:~-2%

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_ENDING__%" "%__MINUTES_SUFFIX__%"
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetMinutes_WithoutSuffixMentionned_ShouldReturnTheMinutesWithoutSuffix =======
:GetMinutes_WithoutSuffixMentionned_ShouldReturnTheMinutesWithoutSuffix
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetMinutes_WithoutSuffixMentionned_ShouldReturnTheMinutesWithoutSuffix -"

    SET __MINUTES_SUFFIX__=

    SET __RESULT__=
    CALL :GetMinutes_Run_Test __RESULT__ "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_MINUTES__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_MINUTES__%" "0" "60"    

    SET __RESULT_LENGTH__=
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__    

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "2"
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetMinutes_Nominal_ShouldReturnA2DigitsValidMinutesValue =======
:GetMinutes_Nominal_ShouldReturnA2DigitsValidMinutesValue
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetMinutes_Nominal_ShouldReturnA2DigitsValidMinutesValue -"


    Rem -------------- Avec Suffixe minutes -------------------------------------
    SET __MINUTES_SUFFIX__=mn

    SET __RESULT__=
    CALL :GetMinutes_Run_Test __RESULT__ "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_MINUTES__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_MINUTES__%" "0" "60"

    SET __RESULT_MINUTES_SUFFIX__=%__RESULT__:~2,2%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_MINUTES_SUFFIX__%" "%__MINUTES_SUFFIX__%"

    SET __RESULT_LENGTH__=
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "4"   



    Rem -------------- Sans Suffixe minutes -------------------------------------
    SET __MINUTES_SUFFIX__=

    SET __RESULT__=
    CALL :GetMinutes_Run_Test __RESULT__ "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_MINUTES__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_MINUTES__%" "0" "60"

    SET __RESULT_LENGTH__=
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "2"
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= Appel à la fonction GetMinutes =======
REM 		
REM PARAM. %1 : resultat retourne par reference
REM PARAM. %2 : suffixe éventuel
REM
:GetMinutes_Run_Test
	SETLOCAL
				
    SET __MINUTES_SUFFIX__=%~2

		@REM ECHO.
		@REM ECHO ====== FUNC : GetMinutes_Run_Test ======
    @REM ECHO.
    @REM ECHO __MINUTES_SUFFIX__='%__MINUTES_SUFFIX__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec MINUTES_SUFFIX='%__MINUTES_SUFFIX__%'"

    SET __RESULT__=
    CALL "%TRANSVERSE_UNDER_TEST%" GetMinutes __RESULT__ "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'
    
	(ENDLOCAL
    SET %1=%__RESULT__%
	)
GOTO :EOF






REM====================================================================================================================
REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction GetSeconds =======
REM
:GetSeconds_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de GetSeconds ******"

    CALL :GetSeconds_WithSuffixMentionned_ShouldReturnTheSecondsWithTheMentionnedSuffix
    CALL :GetSeconds_WithoutSuffixMentionned_ShouldReturnTheSecondsWithoutSuffix
    CALL :GetSeconds_Nominal_ShouldReturnA2DigitsValidSecondsValue

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetSeconds_WithSuffixMentionned_ShouldReturnTheSecondsWithTheMentionnedSuffix =======
:GetSeconds_WithSuffixMentionned_ShouldReturnTheSecondsWithTheMentionnedSuffix
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetSeconds_WithSuffixMentionned_ShouldReturnTheSecondsWithTheMentionnedSuffix -"

    SET __SECONDS_SUFFIX__=sec

    SET __RESULT__=
    CALL :GetSeconds_Run_Test __RESULT__ "%__SECONDS_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_ENDING__=%__RESULT__:~-3%

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_ENDING__%" "%__SECONDS_SUFFIX__%"
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetSeconds_WithoutSuffixMentionned_ShouldReturnTheSecondsWithoutSuffix =======
:GetSeconds_WithoutSuffixMentionned_ShouldReturnTheSecondsWithoutSuffix
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetSeconds_WithoutSuffixMentionned_ShouldReturnTheSecondsWithoutSuffix -"

    SET __SECONDS_SUFFIX__=

    SET __RESULT__=
    CALL :GetSeconds_Run_Test __RESULT__ "%__SECONDS_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_SECONDS__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_SECONDS__%" "0" "60"

    SET __RESULT_LENGTH__=
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__    

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "2"
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetSeconds_Nominal_ShouldReturnA2DigitsValidSecondsValue =======
:GetSeconds_Nominal_ShouldReturnA2DigitsValidSecondsValue
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetSeconds_Nominal_ShouldReturnA2DigitsValidSecondsValue -"


    Rem -------------- Avec Suffixe secondes -------------------------------------
    SET __SECONDS_SUFFIX__=sec

    SET __RESULT__=
    CALL :GetSeconds_Run_Test __RESULT__ "%__SECONDS_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_SECONDS__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_SECONDS__%" "0" "60"

    SET __RESULT_SECONDS_SUFFIX__=%__RESULT__:~2,3%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_SECONDS_SUFFIX__%" "%__SECONDS_SUFFIX__%"

    SET __RESULT_LENGTH__=
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "5"   



    Rem -------------- Sans Suffixe secondes -------------------------------------
    SET __SECONDS_SUFFIX__=

    SET __RESULT__=
    CALL :GetSeconds_Run_Test __RESULT__ "%__SECONDS_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_SECONDS__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_SECONDS__%" "0" "60"

    SET __RESULT_LENGTH__=
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" GetStringLength "%__RESULT__%" __RESULT_LENGTH__

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_LENGTH__%" "2"

    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= Appel à la fonction GetSeconds =======
REM 		
REM PARAM. %1 : resultat retourne par reference
REM PARAM. %2 : suffixe éventuel
REM
:GetSeconds_Run_Test
	SETLOCAL
				
    SET __SECONDS_SUFFIX__=%~2

		@REM ECHO.
		@REM ECHO ====== FUNC : GetSeconds_Run_Test ======
    @REM ECHO.
    @REM ECHO __SECONDS_SUFFIX__='%__SECONDS_SUFFIX__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec SECONDS_SUFFIX='%__SECONDS_SUFFIX__%'"

    SET __RESULT__=
    CALL "%TRANSVERSE_UNDER_TEST%" GetSeconds __RESULT__ "%__SECONDS_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'
    
	(ENDLOCAL
    SET %1=%__RESULT__%
	)
GOTO :EOF

REM====================================================================================================================






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction GetHourMinutes =======
REM
:GetHourMinutes_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de GetHourMinutes ******"

    CALL :GetHourMinutes_WithHourSuffixMentionned_ShouldReturnTheHourMinutesWithTheHourSuffixMentionned
    CALL :GetHourMinutes_WithoutHourSuffixMentionned_ShouldReturnTheHourMinutesWithTheHourDefaultSuffix

    CALL :GetHourMinutes_WithMinutesSuffixMentionned_ShouldReturnTheHourMinutesWithTheMinutesSuffixMentionned
    CALL :GetHourMinutes_WithoutMinutesSuffixMentionned_ShouldReturnTheHourMinutesWithoutMinutesSuffix

    CALL :GetHourMinutes_Nominal_ShouldContainA2DigitsValidHour
    CALL :GetHourMinutes_Nominal_ShouldContainA2DigitsValidMinutesValue

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetHourMinutes_WithHourSuffixMentionned_ShouldReturnTheHourMinutesWithTheHourSuffixMentionned =======
:GetHourMinutes_WithHourSuffixMentionned_ShouldReturnTheHourMinutesWithTheHourSuffixMentionned
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetHourMinutes_WithHourSuffixMentionned_ShouldReturnTheHourMinutesWithTheHourSuffixMentionned -"

    SET __HOUR_SUFFIX__=Hrs
    
    Rem -------------- Avec Suffixe minutes --------------------------------------------------
    SET __MINUTES_SUFFIX__=mn
    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,3%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "%__HOUR_SUFFIX__%"


    Rem -------------- Sans Suffixe minutes --------------------------------------------------
    SET __MINUTES_SUFFIX__=
    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,3%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "%__HOUR_SUFFIX__%"    
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetHourMinutes_WithoutHourSuffixMentionned_ShouldReturnTheHourMinutesWithTheHourDefaultSuffix =======
:GetHourMinutes_WithoutHourSuffixMentionned_ShouldReturnTheHourMinutesWithTheHourDefaultSuffix
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetHourMinutes_WithoutHourSuffixMentionned_ShouldReturnTheHourMinutesWithTheHourDefaultSuffix -"

    SET __HOUR_SUFFIX__=
    
    Rem -------------- Avec Suffixe minutes --------------------------------------------------
    SET __MINUTES_SUFFIX__=mn
    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,1%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "h"


    Rem -------------- Sans Suffixe minutes --------------------------------------------------
    SET __MINUTES_SUFFIX__=
    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT___RESULT_HOUR_SUFFIX__ENDING__=%__RESULT__:~2,1%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "h"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetHourMinutes_WithMinutesSuffixMentionned_ShouldReturnTheHourMinutesWithTheMinutesSuffixMentionned =======
:GetHourMinutes_WithMinutesSuffixMentionned_ShouldReturnTheHourMinutesWithTheMinutesSuffixMentionned
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetHourMinutes_WithMinutesSuffixMentionned_ShouldReturnTheHourMinutesWithTheMinutesSuffixMentionned -"

    SET __MINUTES_SUFFIX__=mn
    
    Rem -------------- Avec Suffixe heures --------------------------------------------------
    SET __HOUR_SUFFIX__=Hrs
    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_ENDING__=%__RESULT__:~-2%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_ENDING__%" "%__MINUTES_SUFFIX__%"


    Rem -------------- Sans Suffixe heures --------------------------------------------------
    SET __HOUR_SUFFIX__=
    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET __RESULT_ENDING__=%__RESULT__:~-2%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_ENDING__%" "%__MINUTES_SUFFIX__%" 
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetHourMinutes_WithoutMinutesSuffixMentionned_ShouldReturnTheHourMinutesWithoutMinutesSuffix =======
:GetHourMinutes_WithoutMinutesSuffixMentionned_ShouldReturnTheHourMinutesWithoutMinutesSuffix
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetHourMinutes_WithoutMinutesSuffixMentionned_ShouldReturnTheHourMinutesWithoutMinutesSuffix -"

    SET __MINUTES_SUFFIX__=
    
    Rem -------------- Avec Suffixe heures --------------------------------------------------
    SET __HOUR_SUFFIX__=Hrs
    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_ENDING__=%__RESULT__:~-2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_ENDING__%" "0" "60"

    SET /A __RESULT_MINUTES__=%__RESULT__:~5,2% /1
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_ENDING__%" "%__RESULT_MINUTES__%"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,3%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "%__HOUR_SUFFIX__%"    


    Rem -------------- Sans Suffixe heures --------------------------------------------------
    SET __HOUR_SUFFIX__=
    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_ENDING__=%__RESULT__:~-2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_ENDING__%" "0" "60"

    SET /A __RESULT_MINUTES__=%__RESULT__:~3,2% /1
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_ENDING__%" "%__RESULT_MINUTES__%"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,1%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "h"
    
	(ENDLOCAL
	)
GOTO :EOF


REM ======= GetHourMinutes_Nominal_ShouldContainA2DigitsValidHour =======
:GetHourMinutes_Nominal_ShouldContainA2DigitsValidHour
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetHourMinutes_Nominal_ShouldContainA2DigitsValidHour -"

   
    Rem -------------- Avec Suffixe heures et avec suffixe minutes -------------------------------------
    SET __HOUR_SUFFIX__=Hrs
    SET __MINUTES_SUFFIX__=mn

    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_HOUR__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_HOUR__%" "0" "25"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,3%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "%__HOUR_SUFFIX__%"


    Rem -------------- Sans Suffixe heures et avec suffixe minutes -------------------------------------
    SET __HOUR_SUFFIX__=
    SET __MINUTES_SUFFIX__=mn

    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_HOUR__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_HOUR__%" "0" "25"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,1%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "h"



    Rem -------------- Avec Suffixe heures et sans suffixe minutes -------------------------------------
    SET __HOUR_SUFFIX__=Hrs
    SET __MINUTES_SUFFIX__=

    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_HOUR__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_HOUR__%" "0" "25"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,3%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "%__HOUR_SUFFIX__%"



    Rem -------------- Sans Suffixe heures et sans suffixe minutes -------------------------------------
    SET __HOUR_SUFFIX__=
    SET __MINUTES_SUFFIX__=

    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_HOUR__=%__RESULT__:~0,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_HOUR__%" "0" "25"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,1%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "h"

    
	(ENDLOCAL
	)
GOTO :EOF

REM ======= GetHourMinutes_Nominal_ShouldContainA2DigitsValidMinutesValue =======
:GetHourMinutes_Nominal_ShouldContainA2DigitsValidMinutesValue
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetHourMinutes_Nominal_ShouldContainA2DigitsValidMinutesValue -"

   
    Rem -------------- Avec Suffixe heures et avec suffixe minutes -------------------------------------
    SET __HOUR_SUFFIX__=Hrs
    SET __MINUTES_SUFFIX__=mn

    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_MINUTES__=%__RESULT__:~5,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_MINUTES__%" "0" "60"

    SET __RESULT_MINUTES_SUFFIX__=%__RESULT__:~7,2%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_MINUTES_SUFFIX__%" "%__MINUTES_SUFFIX__%"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,3%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "%__HOUR_SUFFIX__%"


    Rem -------------- Sans Suffixe heures et avec suffixe minutes -------------------------------------
    SET __HOUR_SUFFIX__=
    SET __MINUTES_SUFFIX__=mn

    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_MINUTES__=%__RESULT__:~3,2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_MINUTES__%" "0" "60"

    SET __RESULT_MINUTES_SUFFIX__=%__RESULT__:~5,2%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_MINUTES_SUFFIX__%" "%__MINUTES_SUFFIX__%"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,1%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "h"


    Rem -------------- Avec Suffixe heures et sans suffixe minutes -------------------------------------
    SET __HOUR_SUFFIX__=Hrs
    SET __MINUTES_SUFFIX__=

    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_ENDING__=%__RESULT__:~-2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_ENDING__%" "0" "60"

    SET /A __RESULT_MINUTES__=%__RESULT__:~5,2% /1
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_ENDING__%" "%__RESULT_MINUTES__%"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,3%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "%__HOUR_SUFFIX__%"


    Rem -------------- Sans Suffixe heures et sans suffixe minutes -------------------------------------
    SET __HOUR_SUFFIX__=
    SET __MINUTES_SUFFIX__=

    SET __RESULT__=
    CALL :GetHourMinutes_Run_Test __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'

    SET /A __RESULT_ENDING__=%__RESULT__:~-2% /1
    CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT_ENDING__%" "0" "60"

    SET /A __RESULT_MINUTES__=%__RESULT__:~3,2% /1
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_ENDING__%" "%__RESULT_MINUTES__%"

    SET __RESULT_HOUR_SUFFIX__=%__RESULT__:~2,1%
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT_HOUR_SUFFIX__%" "h"

    
	(ENDLOCAL
	)
GOTO :EOF



REM ======= Appel à la fonction GetHourMinutes =======
REM 		
REM PARAM. %1 : resultat retourne par reference
REM PARAM. %2 : suffixe des heures
REM PARAM. %3 : suffixe des minutes
REM
REM RETURNS : par référence, le PARAM %1.
REM
:GetHourMinutes_Run_Test
	SETLOCAL
				
    SET __HOUR_SUFFIX__=%~2
    SET __MINUTES_SUFFIX__=%~3

		@REM ECHO.
		@REM ECHO ====== FUNC : GetHourMinutes_Run_Test ======
    @REM ECHO.
    @REM ECHO __HOUR_SUFFIX__='%__HOUR_SUFFIX__%'
    @REM ECHO __MINUTES_SUFFIX__='%__MINUTES_SUFFIX__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec HOUR_SUFFIX='%__HOUR_SUFFIX__%' et MINUTES_SUFFIX='%__MINUTES_SUFFIX__%'"

    SET __RESULT__=
    CALL "%TRANSVERSE_UNDER_TEST%" GetHourMinutes __RESULT__ "%__HOUR_SUFFIX__%" "%__MINUTES_SUFFIX__%"
    @REM ECHO __RESULT__='%__RESULT__%'
    
	(ENDLOCAL
    SET %1=%__RESULT__%
	)
GOTO :EOF

REM====================================================================================================================
