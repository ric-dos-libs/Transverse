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

    SET TRANSVERSE_UNDER_TEST_NAME=7Zip.bat
    SET TRANSVERSE_UNDER_TEST_PATH=%TRANSVERSE_INFRA_PATH%
    SET TRANSVERSE_UNDER_TEST=%TRANSVERSE_UNDER_TEST_PATH%/%TRANSVERSE_UNDER_TEST_NAME%


    REM -------------------------------------------------------------------------------------------------------------

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 5
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "########### TESTS - RUNNING : '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %_CURRENT_NAMESPACE_% ] ########### "

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "             SCRIPT UNDER TEST : '%TRANSVERSE_UNDER_TEST_NAME%'"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2


    REM ========= Init. d'infos concernant les divers DiskElements qui seront impliqués pour les tests =========
    SET TRANSVERSE_TESTS_TEMP_SUBFOLDER=%TEMP%\__DOS_7ZipTests
    SET FOLDER_TO_ZIP_NAME=DiskElementsToZip
    SET TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME=SubFolder
    SET TRANSVERSE_TESTS_TXT_FILES_TO_ZIP_EXTENSION=txt
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT=File1.%TRANSVERSE_TESTS_TXT_FILES_TO_ZIP_EXTENSION%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT=File2.%TRANSVERSE_TESTS_TXT_FILES_TO_ZIP_EXTENSION%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT=File3.csv

    SET TRANSVERSE_TESTS_FOLDER_TO_ZIP=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/%FOLDER_TO_ZIP_NAME%
    SET TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER=%TRANSVERSE_TESTS_FOLDER_TO_ZIP%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_1=%TRANSVERSE_TESTS_FOLDER_TO_ZIP%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_2=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_3=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%

    
    REM ==============================================================================================================
    CALL :CreateDiskElementsToZip


    REM ====================================== TESTS =================================================================

    CALL :AddToZip_Run_TESTS
    CALL :UnZipIt_Run_TESTS
    CALL :RemoveAllOccurencesFromZip_Run_TESTS



    REM ==============================================================================================================    
    CALL :DeleteDiskElementsToZip

(ENDLOCAL
)

GOTO :EOF



REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction AddToZip =======
REM
:AddToZip_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de AddToZip ******"

    CALL :AddToZip_Nominal_ShouldZipSubmittedDiskElements

	(ENDLOCAL
	)
GOTO :EOF


REM ======= AddToZip_Nominal_ShouldZipSubmittedDiskElements =======
:AddToZip_Nominal_ShouldZipSubmittedDiskElements
	SETLOCAL

    CALL :AddToZip_And_UnZipIt_Common_Test "AddToZip_Nominal_ShouldZipSubmittedDiskElements"

	(ENDLOCAL
	)
GOTO :EOF




REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction UnZipIt =======
REM
:UnZipIt_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de UnZipIt ******"

    CALL :UnZipIt_Nominal_ShouldUnZipTheZippedDiskElements

	(ENDLOCAL
	)
GOTO :EOF


REM ======= UnZipIt_Nominal_ShouldUnZipTheZippedDiskElements =======
:UnZipIt_Nominal_ShouldUnZipTheZippedDiskElements
	SETLOCAL

    CALL :AddToZip_And_UnZipIt_Common_Test "UnZipIt_Nominal_ShouldUnZipTheZippedDiskElements"

	(ENDLOCAL
	)
GOTO :EOF



REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction RemoveAllOccurencesFromZip =======
REM
:RemoveAllOccurencesFromZip_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de RemoveAllOccurencesFromZip ******"

    CALL :RemoveAllOccurencesFromZip_Nominal_ShouldRemoveFromZipMentionnedDiskElements

	(ENDLOCAL
	)
GOTO :EOF


REM ======= RemoveAllOccurencesFromZip_Nominal_ShouldRemoveFromZipMentionnedDiskElements =======
:RemoveAllOccurencesFromZip_Nominal_ShouldRemoveFromZipMentionnedDiskElements
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RemoveAllOccurencesFromZip_Nominal_ShouldRemoveFromZipMentionnedDiskElements -"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"



    REM ============================= Remove From Zip phase ===============================================

    CALL :RemoveSomeDiskElementsFromZip "%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%" "*.txt"


    REM ============================= UnZip phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    CALL :UnZipZipFileToTargetFolder "%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%" "%__TARGET_FOLDER__%"

    SET __TARGET_UNZIPPED_FOLDER__=%__TARGET_FOLDER__%/%FOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_FILE_1__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_3__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%

    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_1__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_2__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_3__%"


    REM ============================ Clean Folders ================================================

    Rem __ZIP_FILE_FULLNAME__ doit être backslashé pour que le "DEL" fonctionne ! eh oui !!
    DEL "%__ZIP_FILE_FULLNAME__%"

    RD /S/Q "%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF





REM ================================= COMMON ===================================================================

REM ======= AddToZip_And_UnZipIt_Common_Test =======
:AddToZip_And_UnZipIt_Common_Test
	SETLOCAL

    SET __TEST_TITLE__=%~1

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- %__TEST_TITLE__% -"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"


    REM ============================= UnZip phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    CALL :UnZipZipFileToTargetFolder "%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%" "%__TARGET_FOLDER__%"

    SET __TARGET_UNZIPPED_FOLDER__=%__TARGET_FOLDER__%/%FOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_FILE_1__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_3__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_1__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_2__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_3__%"


    REM ============================ Clean Folders ================================================

    Rem __ZIP_FILE_FULLNAME__ doit être backslashé pour que le "DEL" fonctionne ! eh oui !!
    DEL "%__ZIP_FILE_FULLNAME__%"

    RD /S/Q "%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF






REM =============================== FACADES (pas vraiment nécessaires) ========================================

:AddCreatedDiskElementsToZip
  SETLOCAL
    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%~1

    CALL "%TRANSVERSE_UNDER_TEST%" AddToZip "%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%" "%TRANSVERSE_TESTS_FOLDER_TO_ZIP%"

  (ENDLOCAL
  )
GOTO :EOF


:UnZipZipFileToTargetFolder
  SETLOCAL
    SET __ZIP_FILE__=%~1
    SET __TARGET_FOLDER__=%~2

    CALL "%TRANSVERSE_UNDER_TEST%" UnZipIt "%__ZIP_FILE__%" "%__TARGET_FOLDER__%"

  (ENDLOCAL
  )
GOTO :EOF


:RemoveSomeDiskElementsFromZip
	SETLOCAL

    SET __ZIP_FILE__=%~1
    SET __TO_BE_REMOVED__=%~2

    CALL "%TRANSVERSE_UNDER_TEST%" RemoveAllOccurencesFromZip "%__ZIP_FILE__%" "%__TO_BE_REMOVED__%"

  (ENDLOCAL
  )
GOTO :EOF






REM =============================== Gestion du dossier de tests ==========================================
:CreateDiskElementsToZip
  SETLOCAL
    IF NOT EXIST "%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER%"  (
      MD "%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER%"
    )

    DIR *.* > "%TRANSVERSE_TESTS_FILE_TO_ZIP_1%"
    DIR *.bat > "%TRANSVERSE_TESTS_FILE_TO_ZIP_2%"
    ECHO "a=5;b=6;" > "%TRANSVERSE_TESTS_FILE_TO_ZIP_3%"

  (ENDLOCAL
  )
GOTO :EOF

:DeleteDiskElementsToZip
  SETLOCAL
    RD /S /Q "%TRANSVERSE_TESTS_TEMP_SUBFOLDER%"

  (ENDLOCAL
  )
GOTO :EOF

REM ===================================================================================================================