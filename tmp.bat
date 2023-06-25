@REM @echo off

@REM set "myVar=Hello World"
@REM @REM setlocal enabledelayedexpansion

@REM set "length=0"
@REM set "temp=!myVar!"

@REM :loop
@REM if defined temp (
@REM   set "temp=!temp:~1!"
@REM   set /a "length+=1"
@REM   goto loop
@REM )

@REM echo La longueur de la variable est : %length%

@REM @REM endlocal

@REM SET LENGTH=
@REM call ./Src/Transverse._Common/String.bat GetStringLength "111" LENGTH
@REM ECHo donc LENGTH=%LENGTH%


@REM SET monTruc=6+1
@REM echo %monTruc%
@REM SET /A monCalcul=2+4
@REM echo %monCalcul%

@REM SET RES=
@REM call ./Src/Transverse._Common/String.bat PadLeft "AAAA" "x" "Bb" RES
@REM ECHO RES=%RES%


@REM SET RES=
@REM call ./Src/Transverse._Common/String.bat WithoutSpace " A A A " RES
@REM ECHO RES='%RES%'

@REM SET RES=
@REM call ./Src/Transverse._Common/String.bat RemoveSubString " ABXCXD " "x" RES
@REM ECHO RES='%RES%'


@REM SET RES=
@REM call ./Src/Transverse.Infra/DateTime.bat GetDate "." RES
@REM ECHO RES=%RES%

@REM SET RES=
@REM call ./Src/Transverse.Infra/DateTime.bat GetHour RES "h"
@REM ECHO RES='%RES%'

@REM SET RES=
@REM call ./Src/Transverse.Infra/DateTime.bat GetHourMinutes RES "H" "mn"
@REM ECHO RES='%RES%'

@REM SET RES=
@REM call ./Src/Transverse.Infra/DateTime.bat GetMinutes RES
@REM ECHO RES='%RES%'

@REM SET RES=
@REM call ./Src/Transverse.Infra/DateTime.bat GetSeconds RES "secondes!"
@REM ECHO RES='%RES%'

@REM SET RES=
@REM call ./Src/Transverse.Infra/DateTime.bat GetTime RES ":" "mn" "s"
@REM ECHO RES='%RES%'

@REM SET zzz=t:/zzzZIP
@REM call ./Src/Transverse.Infra/7Zip.bat AddToZip "%zzz%" "t:/ZZZZzZZzZZZZ"
@REM PUSHD "%CD%"
@REM call P:/zzDOS/Src/Transverse.Infra/7Zip.bat UnZipIt "%zzz%" "T:/ZZAAZZY"
@REM   @REM call P:/zzDOS/Src/Transverse.Infra/7Zip.bat UnZipIt "%zzz%"
@REM POPD
@REM call P:/zzDOS/Src/Transverse.Infra/7Zip.bat RemoveAllOccurencesFromZip "%zzz%" "*.pdf"

 


@REM  @echo off

@REM setlocal enabledelayedexpansion

@REM set var1=10%%
@REM set "var2=10^!"
@REM set var3=10""

@REM echo La variable var1 contient : !var1!
@REM echo La variable var2 contient : !var2!
@REM echo La variable var3 contient : !var3!




@REM @echo off

@REM SETLOCAL ENABLEDELAYEDEXPANSION

@REM   SET "file=temp_myFile.txt"

@REM   SET "file_content="
@REM   FOR /f "usebackq delims=" %%L IN ("%file%") DO (
@REM     SET READ_LINE=%%L
@REM     SET "file_content=!file_content!!READ_LINE!"
@REM     ECHO !READ_LINE!
@REM     @REM PAUSE
@REM   )

@REM   ECHO Le contenu du fichier est : '!file_content!'

@REM   SET RES=
@REM   call ./Src/Transverse._Common/String.bat ReplaceSubString "ABXCXD" "x" "!file_content!" RES
@REM   ECHO RES='%RES%'

@REM ENDLOCAL


@REM SET __STRING__=ABCDEF
@REM @REM SET RES=%__STRING__:~10,20%
@REM @REM ECHO RES='%RES%'
      
@REM       :loop
@REM       IF DEFINED __TEMP__ (
@REM         SET "__TEMP__=!__TEMP__:~1!"
@REM         @REM SET /a "__STRING_LENGTH__+=1"
@REM         GOTO loop
@REM       )


@REM @echo off

@REM SET FALSE=FALSE
@REM SET TRUE=TRUE
@REM SETLOCAL ENABLEDELAYEDEXPANSION

@REM     SET "__STRING__=ABCDEFX.GGKF2"
@REM     SET "__SUBSTRING__=X.."

@REM       SET __STRING_WITHOUT_SUBSTRING__=!__STRING__:%__SUBSTRING__%=!
@REM       IF "%__STRING__%" EQU "%__STRING_WITHOUT_SUBSTRING__%" (
@REM         SET __RESULT__=%FALSE%
@REM       ) ELSE (
@REM         SET __RESULT__=%TRUE%
@REM       )
@REM       ECHO __RESULT__=%__RESULT__%
@REM ENDLOCAL
@REM ECHO __RESULT__=%__RESULT__%

@REM @ECHO OFF

@REM :XXX
@REM CALL :F1545
@REM CALL :F2000
@REM CALL :F1545
@REM GOTO :EOF

@REM :F2000
@REM SETLOCAL
@REM   ECHo F2000
@REM   GOTO XXX
@REM   :XXX
@REM   echo in F2000
@REM ENDLOCAL
@REM GOTO :EOF

@REM :F1545
@REM SETLOCAL
@REM   ECHo F1545
@REM   IF "." EQU "." GOTO XXX
@REM   :XXX
@REM   echo prems
@REM ENDLOCAL
@REM GOTO :EOF

@REM @echo off

@REM set "STR=Hello World"
@REM set "N=4"

@REM setlocal enabledelayedexpansion

@REM set "TEMP_N=!N!"
@REM set "RESULT=!STR:~-%N%!"

@REM echo Les %N% derniers caractères de !STR! sont : !RESULT!

@REM endlocal




@REM @ECHO OFF
@REM SET v1=ABC
@REM SET v2=ABC
@REM if "%v1%." EQU "%v2%." (
@REM   ECHO EGAUX
@REM ) ELSE (
@REM   ECHO PAS EGAUX
@REM )

@REM SET MA_VAR=aa
@REM SET MA_VAR=AA
@REM SET MA_VAR=
@REM SET POSSIB_V1=aa
@REM @REM SET POSSIB_V1=
@REM SET POSSIB_V2=Aa
@REM SET POSSIB_V3=Aaa
@REM SET POSSIB_V4=Aaad
@REM SET POSSIB_V5=Aaadd
@REM SET POSSIB_V6=Aaadde
@REM SET POSSIB_V7=
@REM @REM CALL "%CD%/Src/Transverse._Common/CheckFatalErrors.bat" CheckValueAmong "%MA_VAR%" "%POSSIB_V1%" "%POSSIB_V2%" "%POSSIB_V3%" "%POSSIB_V4%" "%POSSIB_V5%" "%POSSIB_V6%" "%POSSIB_V7%"
@REM CALL "%CD%/Src/Transverse._Common/CheckFatalErrors.bat" CheckValueAmong "%MA_VAR%" "%POSSIB_V1%" "%POSSIB_V7%"

@REM @echo off
@REM setlocal enabledelayedexpansion
@REM   SET PRENOM=Richard
@REM   SET Bonjour_Richard=Hello

@REM   ECHO !Bonjour_%PRENOM%!
@REM endlocal

@REM @echo off
@REM SET ENUM_CONVERSION_1=100
@REM   SETLOCAL ENABLEDELAYEDEXPANSION
@REM     SET "__GET_EQUALITY_ASSERTION_RESULT_USE_CASE_RESPONSE__=1"
@REM     SET PRENOM=Richard
@REM     SET Bonjour_Richard=Hello
@REM     ECHO '!Bonjour_%PRENOM%!'
@REM     ECHO.
@REM     ECHO __GET_EQUALITY_ASSERTION_RESULT_USE_CASE_RESPONSE__=!__GET_EQUALITY_ASSERTION_RESULT_USE_CASE_RESPONSE__!
@REM     SET __ASSERTION_RESULT__=!ENUM_CONVERSION_%__GET_EQUALITY_ASSERTION_RESULT_USE_CASE_RESPONSE__%!
@REM     echo __ASSERTION_RESULT__=!__ASSERTION_RESULT__! ; %__ASSERTION_RESULT__%
@REM   ENDLOCAL    



@REM :Temp_Test
@REM   SETLOCAL
				
@REM     SET __RESULT__=0
@REM     SET __LOW_LIM__=0
@REM     SET __HIGH_LIM__=10

@REM     CALL "%TESTING_TOOL%" AssertIsBetween "%__RESULT__%" "%__LOW_LIM__%" "%__HIGH_LIM__%"

@REM   (ENDLOCAL
@REM   )

@REM GOTO :EOF

@REM pushd %CD%
@REM   t:
@REM   cd t:/\zzzzEssaisDOCKER
@REM   cd toto\\\\///titi\\///\\tutu
@REM   dir
@REM POPD

@echo off
@REM IF not EXIST "T:" goto :eof

@REM echo NONONON!

@REM IF DEFINED __TRANSVERSE_COMMON_PATHES_EXECUTED__ GOTO :EOF
@REM SET __TRANSVERSE_COMMON_PATHES_EXECUTED__=yes
@REM echo WHAT !

@REM @echo off
@REM cls
@REM @REM call "./Src/_Init.bat"
@REM SET LENGTH=
@REM call "./Src/Transverse._Common/String.bat" GetStringLength "111" LENGTH
@REM ECHo donc LENGTH=%LENGTH%

@REM @echo off
@REM cls
@REM call "./Src/_Init.bat"
@REM @REM CALL "%CD%/Src/Transverse._Common/CheckFatalErrors.bat" CheckVarExists TUTI



