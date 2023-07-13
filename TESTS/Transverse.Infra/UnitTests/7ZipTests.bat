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
    SET TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME=DiskElementsToZip
    SET TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME=SubFolder
    SET TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME=SubFolder2
    SET TRANSVERSE_TESTS_TXT_FILES_TO_ZIP_EXTENSION=txt
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT=File1.%TRANSVERSE_TESTS_TXT_FILES_TO_ZIP_EXTENSION%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT=File2.%TRANSVERSE_TESTS_TXT_FILES_TO_ZIP_EXTENSION%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT=File3.csv
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT=File4.%TRANSVERSE_TESTS_TXT_FILES_TO_ZIP_EXTENSION%

    SET TRANSVERSE_TESTS_FOLDER_TO_ZIP=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%
    SET TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER=%TRANSVERSE_TESTS_FOLDER_TO_ZIP%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    SET TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER2=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_1=%TRANSVERSE_TESTS_FOLDER_TO_ZIP%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_2=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_3=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%
    SET TRANSVERSE_TESTS_FILE_TO_ZIP_4=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER2%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%

    
    REM ==============================================================================================================


    REM ====================================== TESTS =================================================================

    
    SET _TEST_WITH_ZIP_FILE_EXTENSION_=%TRUE%
    CALL :_Run_TESTS "%_TEST_WITH_ZIP_FILE_EXTENSION_%"


    SET _TEST_WITH_ZIP_FILE_EXTENSION_=%FALSE%
    CALL :_Run_TESTS "%_TEST_WITH_ZIP_FILE_EXTENSION_%"



    REM ==============================================================================================================    

(ENDLOCAL
)

GOTO :EOF


REM====================================================================================================================
REM ======= Lancement de tous les Tests =======
REM
:_Run_TESTS
	SETLOCAL
				
    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1

  CALL :CreateDiskElementsToZip

    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TESTS avec Zip File Extension mentionned : '%__TEST_WITH_ZIP_FILE_EXTENSION__%'  ******"
    CALL "%TRANSVERSE_INFRA_DATE_TIME_SCRIPT%" Delay "3"

    CALL :AddToZip_Run_TESTS "%__TEST_WITH_ZIP_FILE_EXTENSION__%"
    CALL :UnZipIt_Run_TESTS "%__TEST_WITH_ZIP_FILE_EXTENSION__%"
    CALL :PartialUnZip_Run_TESTS "%__TEST_WITH_ZIP_FILE_EXTENSION__%"
    CALL :PartialUnZipContent_Run_TESTS "%__TEST_WITH_ZIP_FILE_EXTENSION__%"
    CALL :RemoveAllOccurencesFromZip_Run_TESTS "%__TEST_WITH_ZIP_FILE_EXTENSION__%"

  CALL :DeleteDiskElementsToZip

	(ENDLOCAL
	)
GOTO :EOF


REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction AddToZip =======
REM
:AddToZip_Run_TESTS
	SETLOCAL
				
    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1

    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de AddToZip ******"

    CALL :AddToZip_Nominal_ShouldZipSubmittedDiskElements "%__TEST_WITH_ZIP_FILE_EXTENSION__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= AddToZip_Nominal_ShouldZipSubmittedDiskElements =======
:AddToZip_Nominal_ShouldZipSubmittedDiskElements
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1

    CALL :AddToZip_And_UnZipIt_Common_Test "AddToZip_Nominal_ShouldZipSubmittedDiskElements" "%__TEST_WITH_ZIP_FILE_EXTENSION__%"

	(ENDLOCAL
	)
GOTO :EOF




REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction UnZipIt =======
REM
:UnZipIt_Run_TESTS
	SETLOCAL
				
    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1

    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de UnZipIt ******"

    CALL :UnZipIt_Nominal_ShouldUnZipTheZippedDiskElements "%__TEST_WITH_ZIP_FILE_EXTENSION__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= UnZipIt_Nominal_ShouldUnZipTheZippedDiskElements =======
:UnZipIt_Nominal_ShouldUnZipTheZippedDiskElements
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1

    CALL :AddToZip_And_UnZipIt_Common_Test "UnZipIt_Nominal_ShouldUnZipTheZippedDiskElements" "%__TEST_WITH_ZIP_FILE_EXTENSION__%"

	(ENDLOCAL
	)
GOTO :EOF



REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction PartialUnZip =======
REM
:PartialUnZip_Run_TESTS
	SETLOCAL
				
    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1

    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de PartialUnZip ******"

    CALL :PartialUnZip_Nominal_ShouldUnZipOneOfTheZipFolder "%__TEST_WITH_ZIP_FILE_EXTENSION__%"
    CALL :PartialUnZip_Nominal2_ShouldUnZipOneOfTheZipFolder "%__TEST_WITH_ZIP_FILE_EXTENSION__%"
    CALL :PartialUnZip_Nominal_ShouldUnZipOneOfTheZipFile "%__TEST_WITH_ZIP_FILE_EXTENSION__%"
    CALL :PartialUnZip_Nominal2_ShouldUnZipOneOfTheZipFile "%__TEST_WITH_ZIP_FILE_EXTENSION__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= PartialUnZip_Nominal_ShouldUnZipOneOfTheZipFolder =======
:PartialUnZip_Nominal_ShouldUnZipOneOfTheZipFolder
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1
    
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PartialUnZip_Nominal_ShouldUnZipOneOfTheZipFolder -"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "  Avec Zip File Extension mentionned : '%__TEST_WITH_ZIP_FILE_EXTENSION__%'"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z

    IF "%__TEST_WITH_ZIP_FILE_EXTENSION__%" EQU "%TRUE%" (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME__%
    ) ELSE (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%
    )


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"


    REM ============================= PartialUnZip phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    SET __TARGET_UNZIPPED_FOLDER__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_FILE_1__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_3__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_4__=%__TARGET_UNZIPPED_SUBFOLDER2__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%

    SET __ZIP_CONTENT_TO_UNZIP__=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    CALL :PartialUnZipToTargetFolder "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__ZIP_CONTENT_TO_UNZIP__%" "%__TARGET_FOLDER__%"

    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_1__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_2__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_3__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_4__%"


    REM ============================ Clean Folders ================================================

    Rem __ZIP_FILE_FULLNAME__ doit être backslashé pour que le "DEL" fonctionne ! eh oui !!
    DEL "%__ZIP_FILE_FULLNAME__%"

    RD /S/Q "%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= PartialUnZip_Nominal2_ShouldUnZipOneOfTheZipFolder =======
:PartialUnZip_Nominal2_ShouldUnZipOneOfTheZipFolder
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1
    
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PartialUnZip_Nominal2_ShouldUnZipOneOfTheZipFolder -"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "  Avec Zip File Extension mentionned : '%__TEST_WITH_ZIP_FILE_EXTENSION__%'"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z

    IF "%__TEST_WITH_ZIP_FILE_EXTENSION__%" EQU "%TRUE%" (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME__%
    ) ELSE (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%
    )


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"


    REM ============================= PartialUnZip phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    SET __TARGET_UNZIPPED_FOLDER__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_FILE_1__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_3__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_4__=%__TARGET_UNZIPPED_SUBFOLDER2__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%

    SET __ZIP_CONTENT_TO_UNZIP__=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%
    CALL :PartialUnZipToTargetFolder "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__ZIP_CONTENT_TO_UNZIP__%" "%__TARGET_FOLDER__%"

    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_1__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_2__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_3__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_4__%"


    REM ============================ Clean Folders ================================================

    Rem __ZIP_FILE_FULLNAME__ doit être backslashé pour que le "DEL" fonctionne ! eh oui !!
    DEL "%__ZIP_FILE_FULLNAME__%"

    RD /S/Q "%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= PartialUnZip_Nominal_ShouldUnZipOneOfTheZipFile =======
:PartialUnZip_Nominal_ShouldUnZipOneOfTheZipFile
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1
    
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PartialUnZip_Nominal_ShouldUnZipOneOfTheZipFile -"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "  Avec Zip File Extension mentionned : '%__TEST_WITH_ZIP_FILE_EXTENSION__%'"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z

    IF "%__TEST_WITH_ZIP_FILE_EXTENSION__%" EQU "%TRUE%" (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME__%
    ) ELSE (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%
    )


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"


    REM ============================= PartialUnZip phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    SET __TARGET_UNZIPPED_FOLDER__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_FILE_1__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_3__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_4__=%__TARGET_UNZIPPED_SUBFOLDER2__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%

    SET __ZIP_CONTENT_TO_UNZIP__=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    CALL :PartialUnZipToTargetFolder "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__ZIP_CONTENT_TO_UNZIP__%" "%__TARGET_FOLDER__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_1__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_2__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_3__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_4__%"


    REM ============================ Clean Folders ================================================

    Rem __ZIP_FILE_FULLNAME__ doit être backslashé pour que le "DEL" fonctionne ! eh oui !!
    DEL "%__ZIP_FILE_FULLNAME__%"

    RD /S/Q "%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF




REM ======= PartialUnZip_Nominal2_ShouldUnZipOneOfTheZipFile =======
:PartialUnZip_Nominal2_ShouldUnZipOneOfTheZipFile
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1
    
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PartialUnZip_Nominal2_ShouldUnZipOneOfTheZipFile -"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "  Avec Zip File Extension mentionned : '%__TEST_WITH_ZIP_FILE_EXTENSION__%'"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z

    IF "%__TEST_WITH_ZIP_FILE_EXTENSION__%" EQU "%TRUE%" (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME__%
    ) ELSE (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%
    )


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%"

    REM Ajout d'un fichier à la racine du Zip.
    SET __TEMP_FILE_TO_ADD_TO_ZIP_ROOT__=zzTempFileForUnitTestWxyz.txt
    DIR "c:" > "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"
    CALL "%TRANSVERSE_UNDER_TEST%" AddToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"


    REM ============================= PartialUnZip phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    SET __TARGET_UNZIPPED_FOLDER__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_FILE_1__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_3__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_4__=%__TARGET_UNZIPPED_SUBFOLDER2__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%
    SET __TARGET_UNZIPPED_TEMP_FILE_ADDED_TO_ZIP_ROOT__=%__TARGET_FOLDER__%/%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%

    SET __ZIP_CONTENT_TO_UNZIP__=%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%
    CALL :PartialUnZipToTargetFolder "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__ZIP_CONTENT_TO_UNZIP__%" "%__TARGET_FOLDER__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_TEMP_FILE_ADDED_TO_ZIP_ROOT__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_1__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_2__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_3__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_4__%"


    REM ============================ Clean Folders ================================================

    Rem __ZIP_FILE_FULLNAME__ doit être backslashé pour que le "DEL" fonctionne ! eh oui !!
    DEL "%__ZIP_FILE_FULLNAME__%"

    DEL "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"

    RD /S/Q "%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF

REM====================================================================================================================



REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction PartialUnZipContent =======
REM
:PartialUnZipContent_Run_TESTS
	SETLOCAL
				
    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1

    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de PartialUnZipContent ******"

    CALL :PartialUnZipContent_Nominal_ShouldUnZipOneOfTheZipFolderContent "%__TEST_WITH_ZIP_FILE_EXTENSION__%"
    CALL :PartialUnZipContent_Nominal_ShouldUnZipOneOfTheZipFile "%__TEST_WITH_ZIP_FILE_EXTENSION__%"
    CALL :PartialUnZipContent_Nominal2_ShouldUnZipOneOfTheZipFile "%__TEST_WITH_ZIP_FILE_EXTENSION__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= PartialUnZipContent_Nominal_ShouldUnZipOneOfTheZipFolderContent =======
:PartialUnZipContent_Nominal_ShouldUnZipOneOfTheZipFolderContent
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1
    
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PartialUnZipContent_Nominal_ShouldUnZipOneOfTheZipFolderContent -"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "  Avec Zip File Extension mentionned : '%__TEST_WITH_ZIP_FILE_EXTENSION__%'"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z

    IF "%__TEST_WITH_ZIP_FILE_EXTENSION__%" EQU "%TRUE%" (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME__%
    ) ELSE (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%
    )


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%"

    REM Ajout d'un fichier à la racine du Zip.
    SET __TEMP_FILE_TO_ADD_TO_ZIP_ROOT__=zzTempFileForUnitTestWxyz.txt
    DIR "*.*" > "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"
    CALL "%TRANSVERSE_UNDER_TEST%" AddToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"


    REM ============================= PartialUnZipContent phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    SET __ZIP_CONTENT_TO_UNZIP__=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%

    SET __TARGET_NON_EXISTING_FOLDER__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_FILE_2__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_3__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_4__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%

    CALL :PartialUnZipContentToTargetFolder "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__ZIP_CONTENT_TO_UNZIP__%" "%__TARGET_FOLDER__%"

    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_NON_EXISTING_FOLDER__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_2__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_3__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_4__%"


    REM ============================ Clean Folders ================================================

    Rem __ZIP_FILE_FULLNAME__ doit être backslashé pour que le "DEL" fonctionne ! eh oui !!
    DEL "%__ZIP_FILE_FULLNAME__%"

    DEL "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"

    RD /S/Q "%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= PartialUnZipContent_Nominal_ShouldUnZipOneOfTheZipFile =======
:PartialUnZipContent_Nominal_ShouldUnZipOneOfTheZipFile
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1
    
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PartialUnZipContent_Nominal_ShouldUnZipOneOfTheZipFile -"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "  Avec Zip File Extension mentionned : '%__TEST_WITH_ZIP_FILE_EXTENSION__%'"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z

    IF "%__TEST_WITH_ZIP_FILE_EXTENSION__%" EQU "%TRUE%" (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME__%
    ) ELSE (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%
    )


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%"

    REM Ajout d'un fichier à la racine du Zip.
    SET __TEMP_FILE_TO_ADD_TO_ZIP_ROOT__=zzTempFileForUnitTestWxyz.txt
    DIR "*.*" > "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"
    CALL "%TRANSVERSE_UNDER_TEST%" AddToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"


    REM ============================= PartialUnZipContent phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    SET __ZIP_CONTENT_TO_UNZIP__=%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%

    SET __TARGET_UNZIPPED_FILE__=%__TARGET_FOLDER__%/%__ZIP_CONTENT_TO_UNZIP__%
    SET __TARGET_NON_EXISTING_FOLDER__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%
    SET __TARGET_NON_EXISTING_FILE_2__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET __TARGET_NON_EXISTING_FILE_3__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%
    SET __TARGET_NON_EXISTING_FILE_4__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%

    CALL :PartialUnZipContentToTargetFolder "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__ZIP_CONTENT_TO_UNZIP__%" "%__TARGET_FOLDER__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_NON_EXISTING_FOLDER__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_NON_EXISTING_FILE_2__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_NON_EXISTING_FILE_3__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_NON_EXISTING_FILE_4__%"


    REM ============================ Clean Folders ================================================

    Rem __ZIP_FILE_FULLNAME__ doit être backslashé pour que le "DEL" fonctionne ! eh oui !!
    DEL "%__ZIP_FILE_FULLNAME__%"

    DEL "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"

    RD /S/Q "%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= PartialUnZipContent_Nominal2_ShouldUnZipOneOfTheZipFile =======
:PartialUnZipContent_Nominal2_ShouldUnZipOneOfTheZipFile
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1
    
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- PartialUnZipContent_Nominal2_ShouldUnZipOneOfTheZipFile -"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "  Avec Zip File Extension mentionned : '%__TEST_WITH_ZIP_FILE_EXTENSION__%'"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z

    IF "%__TEST_WITH_ZIP_FILE_EXTENSION__%" EQU "%TRUE%" (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME__%
    ) ELSE (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%
    )


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%"

    REM Ajout d'un fichier à la racine du Zip.
    SET __TEMP_FILE_TO_ADD_TO_ZIP_ROOT__=zzTempFileForUnitTestWxyz.txt
    DIR "*.*" > "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"
    CALL "%TRANSVERSE_UNDER_TEST%" AddToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"


    REM ============================= PartialUnZipContent phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    SET __ZIP_CONTENT_TO_UNZIP__=%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%

    SET __TARGET_UNZIPPED_FILE__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%
    SET __TARGET_NON_EXISTING_FOLDER__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%

    CALL :PartialUnZipContentToTargetFolder "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__ZIP_CONTENT_TO_UNZIP__%" "%__TARGET_FOLDER__%"

    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_NON_EXISTING_FOLDER__%"    
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE__%"


    REM ============================ Clean Folders ================================================

    Rem __ZIP_FILE_FULLNAME__ doit être backslashé pour que le "DEL" fonctionne ! eh oui !!
    DEL "%__ZIP_FILE_FULLNAME__%"

    DEL "%__TEMP_FILE_TO_ADD_TO_ZIP_ROOT__%"

    RD /S/Q "%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF




REM ===================================================================================================================








REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction RemoveAllOccurencesFromZip =======
REM
:RemoveAllOccurencesFromZip_Run_TESTS
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de RemoveAllOccurencesFromZip ******"

    CALL :RemoveAllOccurencesFromZip_Nominal_ShouldRemoveFromZipMentionnedDiskElements "%__TEST_WITH_ZIP_FILE_EXTENSION__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= RemoveAllOccurencesFromZip_Nominal_ShouldRemoveFromZipMentionnedDiskElements =======
:RemoveAllOccurencesFromZip_Nominal_ShouldRemoveFromZipMentionnedDiskElements
	SETLOCAL

    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~1

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- RemoveAllOccurencesFromZip_Nominal_ShouldRemoveFromZipMentionnedDiskElements -"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "  Avec Zip File Extension mentionned : '%__TEST_WITH_ZIP_FILE_EXTENSION__%'"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z

    IF "%__TEST_WITH_ZIP_FILE_EXTENSION__%" EQU "%TRUE%" (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME__%
    ) ELSE (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%
    )


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"



    REM ============================= Remove From Zip phase ===============================================

    CALL :RemoveSomeDiskElementsFromZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "*.txt"


    REM ============================= UnZip phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    CALL :UnZipZipFileToTargetFolder "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__TARGET_FOLDER__%"

    SET __TARGET_UNZIPPED_FOLDER__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_FILE_1__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_3__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_4__=%__TARGET_UNZIPPED_SUBFOLDER2__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%
    
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_1__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_2__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_3__%"
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__TARGET_UNZIPPED_FILE_4__%"

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
    SET __TEST_WITH_ZIP_FILE_EXTENSION__=%~2

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- %__TEST_TITLE__% -"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "  Avec Zip File Extension mentionned : '%__TEST_WITH_ZIP_FILE_EXTENSION__%'"
    

    SET __ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%\__DOS_Tests7ZipFile
    SET __ZIP_FILE_FULLNAME__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%.7z

    IF "%__TEST_WITH_ZIP_FILE_EXTENSION__%" EQU "%TRUE%" (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME__%
    ) ELSE (
      SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%__ZIP_FILE_FULLNAME_WITHOUT_EXTENSION__%
    )


    REM ============================= Zip phase ===============================================
    IF EXIST "%__ZIP_FILE_FULLNAME__%" DEL "%__ZIP_FILE_FULLNAME__%"

    CALL :AddCreatedDiskElementsToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%"

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__ZIP_FILE_FULLNAME__%"


    REM ============================= UnZip phase ===============================================
    SET __TARGET_FOLDER__=%TRANSVERSE_TESTS_TEMP_SUBFOLDER%/UnZippedContent
    IF EXIST "%__TARGET_FOLDER__%" RD /S/Q "%__TARGET_FOLDER__%"

    CALL :UnZipZipFileToTargetFolder "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__TARGET_FOLDER__%"

    SET __TARGET_UNZIPPED_FOLDER__=%__TARGET_FOLDER__%/%TRANSVERSE_TESTS_FOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_SUBFOLDER2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_SUBFOLDER2_TO_ZIP_NAME%
    SET __TARGET_UNZIPPED_FILE_1__=%__TARGET_UNZIPPED_FOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_1_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_2__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_2_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_3__=%__TARGET_UNZIPPED_SUBFOLDER__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_3_NAME_EXT%
    SET __TARGET_UNZIPPED_FILE_4__=%__TARGET_UNZIPPED_SUBFOLDER2__%/%TRANSVERSE_TESTS_FILE_TO_ZIP_4_NAME_EXT%

    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_1__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_2__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_3__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__TARGET_UNZIPPED_FILE_4__%"


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
    SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%~1

    CALL "%TRANSVERSE_UNDER_TEST%" AddToZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%TRANSVERSE_TESTS_FOLDER_TO_ZIP%"

  (ENDLOCAL
  )
GOTO :EOF


:UnZipZipFileToTargetFolder
  SETLOCAL
    SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%~1
    SET __TARGET_FOLDER__=%~2

    CALL "%TRANSVERSE_UNDER_TEST%" UnZipIt "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__TARGET_FOLDER__%"

  (ENDLOCAL
  )
GOTO :EOF


:PartialUnZipToTargetFolder
  SETLOCAL
    SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%~1
    SET __ZIP_CONTENT_TO_UNZIP__=%~2
    SET __TARGET_FOLDER__=%~3

    CALL "%TRANSVERSE_UNDER_TEST%" PartialUnZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__ZIP_CONTENT_TO_UNZIP__%" "%__TARGET_FOLDER__%"

  (ENDLOCAL
  )
GOTO :EOF

:PartialUnZipContentToTargetFolder
  SETLOCAL
    SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%~1
    SET __ZIP_CONTENT_TO_UNZIP__=%~2
    SET __TARGET_FOLDER__=%~3

    CALL "%TRANSVERSE_UNDER_TEST%" PartialUnZipContent "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__ZIP_CONTENT_TO_UNZIP__%" "%__TARGET_FOLDER__%"

  (ENDLOCAL
  )
GOTO :EOF


:RemoveSomeDiskElementsFromZip
	SETLOCAL

    SET __ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__=%~1
    SET __TO_BE_REMOVED__=%~2

    CALL "%TRANSVERSE_UNDER_TEST%" RemoveAllOccurencesFromZip "%__ZIP_FILE_FULLNAME_WITH_OR_WITHOUT_EXTENSION__%" "%__TO_BE_REMOVED__%"

  (ENDLOCAL
  )
GOTO :EOF






REM =============================== Gestion du dossier de tests ==========================================
:CreateDiskElementsToZip
  SETLOCAL
    IF NOT EXIST "%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER%"  (
      MD "%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER%"
    )
    IF NOT EXIST "%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER2%"  (
      MD "%TRANSVERSE_TESTS_FOLDER_TO_ZIP_SUBFOLDER2%"
    )    

    DIR *.* > "%TRANSVERSE_TESTS_FILE_TO_ZIP_1%"
    DIR *.bat > "%TRANSVERSE_TESTS_FILE_TO_ZIP_2%"
    ECHO "a=5;b=6;" > "%TRANSVERSE_TESTS_FILE_TO_ZIP_3%"
    ECHO "%DATE%" > "%TRANSVERSE_TESTS_FILE_TO_ZIP_4%"

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