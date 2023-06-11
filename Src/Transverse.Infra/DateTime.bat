@ECHO OFF


SET CURRENT_NAMESPACE=Transverse.Infra
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0






REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetDate. (
	CALL :GetDate %2 %3
	
) ELSE IF %1. EQU GetCurrentYear. (
	CALL :GetCurrentYear %2

) ELSE IF %1. EQU GetCurrentMonthNumber. (
	CALL :GetCurrentMonthNumber %2

) ELSE IF %1. EQU GetCurrentDayNumber. (
	CALL :GetCurrentDayNumber %2

) ELSE IF %1. EQU GetHour. (
	CALL :GetHour %2 %3

) ELSE IF %1. EQU GetHour. (
	CALL :GetHour %2 %3

) ELSE IF %1. EQU GetMinutes. (
	CALL :GetMinutes %2 %3

) ELSE IF %1. EQU GetSeconds. (
	CALL :GetSeconds %2 %3

) ELSE IF %1. EQU GetHourMinutes. (
	CALL :GetHourMinutes %2 %3 %4

) ELSE IF %1. EQU GetTime. (
	CALL :GetTime %2 %3 %4 %5

)


GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	

REM ======= Fonction chargee de retourner l'annee en cours au format : yyyy  =======
REM
REM PARAM. %1 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %1.
REM
:GetCurrentYear
	SETLOCAL
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetCurrentYear - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __RESULTAT__=%DATE:~6,4%

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %1=%__RESULTAT__%
	)
GOTO :EOF


REM ======= Fonction chargee de retourner le numéro de mois en cours au format : mm  =======
REM
REM PARAM. %1 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %1.
REM
:GetCurrentMonthNumber
	SETLOCAL
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetCurrentMonthNumber - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __RESULTAT__=%DATE:~3,2%

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %1=%__RESULTAT__%
	)
GOTO :EOF


REM ======= Fonction chargee de retourner le numéro de jour en cours au format : mm  =======
REM
REM PARAM. %1 : resultat retourne par reference
REM
REM RETURNS : par référence, le PARAM %1.
REM
:GetCurrentDayNumber
	SETLOCAL
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetCurrentDayNumber - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __RESULTAT__=%DATE:~0,2%

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %1=%__RESULTAT__%
	)
GOTO :EOF


REM ======= Fonction chargee de retourner la date du jour au format : yyyy%1mm%1dd  =======
REM
REM PARAM. %1 : resultat retourne par reference
REM PARAM. %2 : separateur eventuel
REM
REM RETURNS : par référence, le PARAM %1.
REM
:GetDate
	SETLOCAL

    SET __SEPARATOR__=%~2
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetDate - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
    @REM ECHO.
    @REM ECHO __SEPARATOR__='%__SEPARATOR__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __CURRENT_YEAR__=
    CALL :GetCurrentYear __CURRENT_YEAR__

    SET __CURRENT_MONTH_NUMBER__=
    CALL :GetCurrentMonthNumber __CURRENT_MONTH_NUMBER__

    SET __CURRENT_DAY_NUMBER__=
    CALL :GetCurrentDayNumber __CURRENT_DAY_NUMBER__

    SET __RESULTAT__=%__CURRENT_YEAR__%%__SEPARATOR__%%__CURRENT_MONTH_NUMBER__%%__SEPARATOR__%%__CURRENT_DAY_NUMBER__%

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %1=%__RESULTAT__%
	)
GOTO :EOF



REM ======= Fonction chargee de retourner l'heure au format : hhX  =======
REM         Avec X valant %2, ou h si %2 n'est pas precise ou vide ("")
REM
REM PARAM. %1 : resultat retourne par reference
REM PARAM. %2 : suffixe, val. par defaut : h
REM
REM RETURNS : par référence, le PARAM %1.
REM
:GetHour
	SETLOCAL

    SET __SUFFIX__=%~2
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetHour - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
    @REM ECHO __SUFFIX__='%__SUFFIX__%'
		@REM PAUSE
		@REM ECHO. & ECHO.

    IF "%__SUFFIX__%." EQU "." SET __SUFFIX__=h

    SET __RESULTAT__=%TIME:~0,2%%__SUFFIX__%

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %1=%__RESULTAT__%
	)
GOTO :EOF



REM ======= Fonction chargee de retourner les minutes de l'heure actuelle au format : mmX  =======
REM         Avec X valant %2
REM
REM PARAM. %1 : resultat retourne par reference
REM PARAM. %2 : suffixe éventuel
REM
REM RETURNS : par référence, le PARAM %1.
REM
:GetMinutes
	SETLOCAL

    SET __SUFFIX_MINUTES__=%~2
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetMinutes - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
    @REM ECHO __SUFFIX_MINUTES__='%__SUFFIX_MINUTES__%'
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __RESULTAT__=%TIME:~3,2%%__SUFFIX_MINUTES__%

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %1=%__RESULTAT__%
	)
GOTO :EOF


REM ======= Fonction chargee de retourner les secondes de l'heure actuelle au format : ssX  =======
REM         Avec X valant %2
REM
REM PARAM. %1 : resultat retourne par reference
REM PARAM. %2 : suffixe éventuel
REM
REM RETURNS : par référence, le PARAM %1.
REM
:GetSeconds
	SETLOCAL

    SET __SUFFIX_SECONDS__=%~2
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetSeconds - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
    @REM ECHO __SUFFIX_SECONDS__='%__SUFFIX_SECONDS__%'
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __RESULTAT__=%TIME:~6,2%%__SUFFIX_SECONDS__%

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %1=%__RESULTAT__%
	)
GOTO :EOF


REM ======= Fonction chargee de retourner heure et minutes au format : hhXmmY  =======
REM         Avec X valant %2, ou h si %2 n'est pas precise ou vide ("")
REM         Avec Y valant %3
REM
REM PARAM. %1 : resultat retourne par reference
REM PARAM. %2 : suffixe des heures, val. par defaut : h
REM PARAM. %3 : suffixe éventuel des minutes
REM
REM RETURNS : par référence, le PARAM %1.
REM
:GetHourMinutes
	SETLOCAL

    SET __SUFFIX_HOURS__=%~2
    SET __SUFFIX_MINUTES__=%~3
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetHourMinutes - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
    @REM ECHO __SUFFIX_HOURS__='%__SUFFIX_HOURS__%'
    @REM ECHO __SUFFIX_MINUTES__='%__SUFFIX_MINUTES__%'
		@REM PAUSE
		@REM ECHO. & ECHO.

    SET __HOUR__=
    CALL :GetHour __HOUR__ "%__SUFFIX_HOURS__%"

    SET __MINUTES__=
    CALL :GetMinutes __MINUTES__ "%__SUFFIX_MINUTES__%"    

    SET __RESULTAT__=%__HOUR__%%__MINUTES__%

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %1=%__RESULTAT__%
	)
GOTO :EOF


REM ======= Fonction chargee de retourner l'heure et minutes au format : hhXmmYssZ  =======
REM         Avec X valant %2, ou h si %2 n'est pas precise ou vide ("")
REM         Avec Y valant %3, ou m si %3 n'est pas precise ou vide ("")
REM         Avec Z valant %4
REM
REM PARAM. %1 : resultat retourne par reference
REM PARAM. %2 : suffixe des heures, val. par defaut : h
REM PARAM. %3 : suffixe des minutes, val. par defaut : m
REM PARAM. %4 : suffixe des secondes
REM
REM RETURNS : par référence, le PARAM %1.
REM
:GetTime
	SETLOCAL

    SET __SUFFIX_HOURS__=%~2
    SET __SUFFIX_MINUTES__=%~3
    SET __SUFFIX_SECONDS__=%~4
				
		@REM ECHO.
		@REM ECHO ====== FUNC : GetTime - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
    @REM ECHO __SUFFIX_HOURS__='%__SUFFIX_HOURS__%'
    @REM ECHO __SUFFIX_MINUTES__='%__SUFFIX_MINUTES__%'
    @REM ECHO __SUFFIX_SECONDS__='%__SUFFIX_SECONDS__%'
		@REM PAUSE
		@REM ECHO. & ECHO.

    IF "%__SUFFIX_MINUTES__%." EQU "." SET __SUFFIX_MINUTES__=m

    SET __HOUR_MINUTES__=
    CALL :GetHourMinutes __HOUR_MINUTES__ "%__SUFFIX_HOURS__%" "%__SUFFIX_MINUTES__%"

    SET __SECONDS__=
    CALL :GetSeconds __SECONDS__ "%__SUFFIX_SECONDS__%"    

    SET __RESULTAT__=%__HOUR_MINUTES__%%__SECONDS__%

    @REM ECHO __RESULTAT__='%__RESULTAT__%'
    @REM ECHO.
		
	(ENDLOCAL
		SET %1=%__RESULTAT__%
	)
GOTO :EOF
