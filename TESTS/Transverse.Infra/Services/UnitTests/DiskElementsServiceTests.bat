@ECHO OFF
@REM CLS

SET CURRENT_SCRIPT_PATH=%~dp0
SET TRANSVERSE_TESTS_INFRA_COMMON_PATH=%CURRENT_SCRIPT_PATH%../../_Common


REM ------------------- VERIFS ----------------------------------------

REM Recup. de TRANSVERSE_INFRA_PATH
REM et TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT, TRANSVERSE_COMMON_STRING_SCRIPT
CALL "%TRANSVERSE_TESTS_INFRA_COMMON_PATH%/_Pathes.bat"


REM ***** ATTENTION %MESSAGES_DISPLAYER% et %TESTING_TOOL% doivent être des Scripts précisés en amont et existants ! *****
CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%MESSAGES_DISPLAYER%"
CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%TESTING_TOOL%"




REM ---------------------------------------------------------------------

SETLOCAL ENABLEDELAYEDEXPANSION 
    SET _CURRENT_NAMESPACE_=Transverse.Infra.%TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH%.Services
    SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

    SET TRANSVERSE_UNDER_TEST_NAME=DiskElementsService.bat
    SET TRANSVERSE_UNDER_TEST_PATH=%TRANSVERSE_INFRA_SERVICES_PATH%
    SET TRANSVERSE_UNDER_TEST=%TRANSVERSE_UNDER_TEST_PATH%/%TRANSVERSE_UNDER_TEST_NAME%


    REM -------------------------------------------------------------------------------------------------------------

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 5
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "########### TESTS - RUNNING : '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %_CURRENT_NAMESPACE_% ] ########### "

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "             SCRIPT UNDER TEST : '%TRANSVERSE_UNDER_TEST_NAME%'"
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2


    
    REM ==============================================================================================================
    REM ====================================== TESTS =================================================================

    CALL :_Run_TESTS

    REM ==============================================================================================================    
    REM ==============================================================================================================    

(ENDLOCAL
)

GOTO :EOF


REM====================================================================================================================
REM ======= Lancement de tous les Tests =======
REM
:_Run_TESTS
	SETLOCAL

    CALL :CopyFolder_Run_TESTS
    CALL :DeleteFolder_Run_TESTS
    CALL :Exists_Run_TESTS
    CALL :DoesntExist_Run_TESTS

	(ENDLOCAL
	)
GOTO :EOF


REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction CopyFolder =======
REM
:CopyFolder_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de CopyFolder ******"

    CALL :CopyFolder_WhenDestiFolderExists_ShouldCopySourceFolderIntoDestiFolder
    CALL :CopyFolder_WhenDestiFolderDoesntExist_ShouldCreateItAndCopySourceFolderIntoThisDestiFolder

	(ENDLOCAL
	)
GOTO :EOF


REM ======= CopyFolder_WhenDestiFolderExists_ShouldCopySourceFolderIntoDestiFolder =======
:CopyFolder_WhenDestiFolderExists_ShouldCopySourceFolderIntoDestiFolder
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- CopyFolder_WhenDestiFolderExists_ShouldCopySourceFolderIntoDestiFolder -"


    SET __TEST__ROOT_PATH__=%TEMP%/_DOS_Tests_CopyFolder
    IF EXIST "%__TEST__ROOT_PATH__%" RD /S /Q "%__TEST__ROOT_PATH__%"


    REM ================= Create source folder ===============
    SET __SRC_FOLDER__=%__TEST__ROOT_PATH__%/TheSourceFolder

    SET __SUBDIR1_NAME__=SubDirB
    SET __SUBDIR1_PATH__=SubDirA/%__SUBDIR1_NAME__%
    SET __SUBDIR1_FILE_NAME_EXT__=B.txt

    SET __SUBDIR1x_NAME__=SubDirBx
    SET __SUBDIR1x_PATH__=SubDirA/%__SUBDIR1x_NAME__%

    SET __SUBDIR2_NAME__=SubDirC
    SET __SUBDIR2_PATH__=%__SUBDIR1_PATH__%/%__SUBDIR2_NAME__%
    SET __SUBDIR2_FILE_NAME_EXT__=C.txt
    SET __SUBDIR2_EMPTY_FILE_NAME_EXT__=C2_Empty.txt

    SET __SRC_SUBDIR1_PATH__=%__SRC_FOLDER__%/%__SUBDIR1_PATH__%
    SET __SRC_SUBDIR1_FILE__=%__SRC_SUBDIR1_PATH__%/%__SUBDIR1_FILE_NAME_EXT__%
    MD "%__SRC_SUBDIR1_PATH__%"
    DIR *.* > "%__SRC_SUBDIR1_FILE__%"

    SET __SRC_SUBDIR1x_PATH__=%__SRC_FOLDER__%/%__SUBDIR1x_PATH__%
    MD "%__SRC_SUBDIR1x_PATH__%"

    SET __SRC_SUBDIR2_PATH__=%__SRC_FOLDER__%/%__SUBDIR2_PATH__%
    SET __SRC_SUBDIR2_FILE__=%__SRC_SUBDIR2_PATH__%/%__SUBDIR2_FILE_NAME_EXT__%
    SET __SRC_SUBDIR2_EMPTY_FILE__=%__SRC_SUBDIR2_PATH__%/%__SUBDIR2_EMPTY_FILE_NAME_EXT__%
    MD "%__SRC_SUBDIR2_PATH__%"
    DIR *.* > "%__SRC_SUBDIR2_FILE__%"
    COPY NUL "%__SRC_SUBDIR2_EMPTY_FILE__%"

    
    REM ================= Create source folder ===============
    SET __DEST_FOLDER__=%__TEST__ROOT_PATH__%/TheDestiFolder
    MD "%__DEST_FOLDER__%"


    REM ================= Copy ===============
    CALL "%TRANSVERSE_UNDER_TEST%" CopyFolder "%__SRC_FOLDER__%" "%__DEST_FOLDER__%"


    REM ================ ASSERTS =============
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__DEST_FOLDER__%/%__SUBDIR1_PATH__%/%__SUBDIR1_FILE_NAME_EXT__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__DEST_FOLDER__%/%__SUBDIR2_PATH__%/%__SUBDIR2_FILE_NAME_EXT__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__DEST_FOLDER__%/%__SUBDIR2_PATH__%/%__SUBDIR2_EMPTY_FILE_NAME_EXT__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__DEST_FOLDER__%/%__SUBDIR1x_PATH__%"


    REM ============================ Clean Tests Folder ================================================
    RD /S/Q "%__TEST__ROOT_PATH__%"


	(ENDLOCAL
	)
GOTO :EOF



REM ======= CopyFolder_WhenDestiFolderDoesntExist_ShouldCreateItAndCopySourceFolderIntoThisDestiFolder =======
:CopyFolder_WhenDestiFolderDoesntExist_ShouldCreateItAndCopySourceFolderIntoThisDestiFolder
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- CopyFolder_WhenDestiFolderDoesntExist_ShouldCreateItAndCopySourceFolderIntoThisDestiFolder -"


    SET __TEST__ROOT_PATH__=%TEMP%/_DOS_Tests_CopyFolder
    IF EXIST "%__TEST__ROOT_PATH__%" RD /S /Q "%__TEST__ROOT_PATH__%"


    REM ================= Create source folder ===============
    SET __SRC_FOLDER__=%__TEST__ROOT_PATH__%/TheSourceFolder

    SET __SUBDIR1_NAME__=SubDirB
    SET __SUBDIR1_PATH__=SubDirA/%__SUBDIR1_NAME__%
    SET __SUBDIR1_FILE_NAME_EXT__=B.txt

    SET __SUBDIR1x_NAME__=SubDirBx
    SET __SUBDIR1x_PATH__=SubDirA/%__SUBDIR1x_NAME__%

    SET __SUBDIR2_NAME__=SubDirC
    SET __SUBDIR2_PATH__=%__SUBDIR1_PATH__%/%__SUBDIR2_NAME__%
    SET __SUBDIR2_FILE_NAME_EXT__=C.txt
    SET __SUBDIR2_EMPTY_FILE_NAME_EXT__=C2_Empty.txt

    SET __SRC_SUBDIR1_PATH__=%__SRC_FOLDER__%/%__SUBDIR1_PATH__%
    SET __SRC_SUBDIR1_FILE__=%__SRC_SUBDIR1_PATH__%/%__SUBDIR1_FILE_NAME_EXT__%
    MD "%__SRC_SUBDIR1_PATH__%"
    DIR *.* > "%__SRC_SUBDIR1_FILE__%"

    SET __SRC_SUBDIR1x_PATH__=%__SRC_FOLDER__%/%__SUBDIR1x_PATH__%
    MD "%__SRC_SUBDIR1x_PATH__%"

    SET __SRC_SUBDIR2_PATH__=%__SRC_FOLDER__%/%__SUBDIR2_PATH__%
    SET __SRC_SUBDIR2_FILE__=%__SRC_SUBDIR2_PATH__%/%__SUBDIR2_FILE_NAME_EXT__%
    SET __SRC_SUBDIR2_EMPTY_FILE__=%__SRC_SUBDIR2_PATH__%/%__SUBDIR2_EMPTY_FILE_NAME_EXT__%
    MD "%__SRC_SUBDIR2_PATH__%"
    DIR *.* > "%__SRC_SUBDIR2_FILE__%"
    COPY NUL "%__SRC_SUBDIR2_EMPTY_FILE__%"

    
    REM ================= Define source folder ===============
    SET __DEST_FOLDER__=%__TEST__ROOT_PATH__%/TheDestiFolder


    REM ================= Copy ===============
    CALL "%TRANSVERSE_UNDER_TEST%" CopyFolder "%__SRC_FOLDER__%" "%__DEST_FOLDER__%"


    REM ================ ASSERTS =============
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__DEST_FOLDER__%/%__SUBDIR1_PATH__%/%__SUBDIR1_FILE_NAME_EXT__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__DEST_FOLDER__%/%__SUBDIR2_PATH__%/%__SUBDIR2_FILE_NAME_EXT__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__DEST_FOLDER__%/%__SUBDIR2_PATH__%/%__SUBDIR2_EMPTY_FILE_NAME_EXT__%"
    CALL "%TESTING_TOOL%" AssertDiskElementExists "%__DEST_FOLDER__%/%__SUBDIR1x_PATH__%"


    REM ============================ Clean Tests Folder ================================================
    RD /S/Q "%__TEST__ROOT_PATH__%"


	(ENDLOCAL
	)
GOTO :EOF



REM ===================================================================================================================



REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction DeleteFolder =======
REM
:DeleteFolder_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de DeleteFolder ******"

    CALL :DeleteFolder_WhenDestiFolderExists_ShouldDeleteFolder
   
    REM Test ci-dessous non réalisable, car je n'ai pas moyen de vérifier s'il affiche bien un message pour cette non existence du dossier
    @REM CALL :DeleteFolder_WhenDestiFolderDoesntExist_ShouldWarnUser


	(ENDLOCAL
	)
GOTO :EOF


REM ======= DeleteFolder_WhenDestiFolderExists_ShouldDeleteFolder =======
:DeleteFolder_WhenDestiFolderExists_ShouldDeleteFolder
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- DeleteFolder_WhenDestiFolderExists_ShouldDeleteFolder -"


    SET __TEST__ROOT_PATH__=%TEMP%/_DOS_Tests_DeleteFolder
    IF EXIST "%__TEST__ROOT_PATH__%" RD /S /Q "%__TEST__ROOT_PATH__%"


    REM ================= Create source folder ===============
    SET __FOLDER_TO_DELETE__=%__TEST__ROOT_PATH__%/TheFolderToDelete

    SET __SUBDIR1_NAME__=SubDirB
    SET __SUBDIR1_PATH__=SubDirA/%__SUBDIR1_NAME__%
    SET __SUBDIR1_FILE_NAME_EXT__=B.txt

    SET __SUBDIR1x_NAME__=SubDirBx
    SET __SUBDIR1x_PATH__=SubDirA/%__SUBDIR1x_NAME__%

    SET __SUBDIR2_NAME__=SubDirC
    SET __SUBDIR2_PATH__=%__SUBDIR1_PATH__%/%__SUBDIR2_NAME__%
    SET __SUBDIR2_FILE_NAME_EXT__=C.txt
    SET __SUBDIR2_EMPTY_FILE_NAME_EXT__=C2_Empty.txt

    SET __ROOT_SUBDIR1_PATH__=%__FOLDER_TO_DELETE__%/%__SUBDIR1_PATH__%
    SET __ROOT_SUBDIR1_FILE__=%__ROOT_SUBDIR1_PATH__%/%__SUBDIR1_FILE_NAME_EXT__%
    MD "%__ROOT_SUBDIR1_PATH__%"
    DIR *.* > "%__ROOT_SUBDIR1_FILE__%"

    SET __ROOT_SUBDIR1x_PATH__=%__FOLDER_TO_DELETE__%/%__SUBDIR1x_PATH__%
    MD "%__ROOT_SUBDIR1x_PATH__%"

    SET __ROOT_SUBDIR2_PATH__=%__FOLDER_TO_DELETE__%/%__SUBDIR2_PATH__%
    SET __ROOT_SUBDIR2_FILE__=%__ROOT_SUBDIR2_PATH__%/%__SUBDIR2_FILE_NAME_EXT__%
    SET __ROOT_SUBDIR2_EMPTY_FILE__=%__ROOT_SUBDIR2_PATH__%/%__SUBDIR2_EMPTY_FILE_NAME_EXT__%
    MD "%__ROOT_SUBDIR2_PATH__%"
    DIR *.* > "%__ROOT_SUBDIR2_FILE__%"
    Copy NUL "%__ROOT_SUBDIR2_EMPTY_FILE__%"

    

    REM ================= Delete without prompt ===============
    CALL "%TRANSVERSE_UNDER_TEST%" DeleteFolder "%__FOLDER_TO_DELETE__%" "%FALSE%"


    REM ================ ASSERTS =============
    CALL "%TESTING_TOOL%" AssertDiskElementDoesntExist "%__FOLDER_TO_DELETE__%"


    REM ============================ Clean Tests Folder ================================================
    RD /S/Q "%__TEST__ROOT_PATH__%"


	(ENDLOCAL
	)
GOTO :EOF


REM ===================================================================================================================





REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction Exists =======
REM
:Exists_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de Exists ******"

    CALL :Exists_WhenDiskElementDoesntExist_ShouldReturnFalse
    CALL :Exists_WhenDiskElementExists_ShouldReturnTrue

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Exists_WhenDiskElementDoesntExist_ShouldReturnFalse =======
:Exists_WhenDiskElementDoesntExist_ShouldReturnFalse
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- Exists_WhenDiskElementDoesntExist_ShouldReturnFalse -"


    SET __TEST__ROOT_PATH__=%TEMP%/_DOS_Tests_Exists
    IF EXIST "%__TEST__ROOT_PATH__%" RD /S /Q "%__TEST__ROOT_PATH__%"
    MD "%__TEST__ROOT_PATH__%"


    REM ================= Disk Element (non existing) ===============
    SET __DISK_ELEMENT__=%__TEST__ROOT_PATH__%/NonExistingDiskElement


    REM ================= Call Exists ===============
    SET __RESPONSE__=
    CALL "%TRANSVERSE_UNDER_TEST%" Exists "%__DISK_ELEMENT__%" __RESPONSE__
    

    REM ================ ASSERTS =============
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESPONSE__%" "%FALSE%"


    REM ============================ Clean Tests Folder ================================================
    RD /S/Q "%__TEST__ROOT_PATH__%"


	(ENDLOCAL
	)
GOTO :EOF


REM ======= Exists_WhenDiskElementExists_ShouldReturnTrue =======
:Exists_WhenDiskElementExists_ShouldReturnTrue
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- Exists_WhenDiskElementExists_ShouldReturnTrue -"


    SET __TEST__ROOT_PATH__=%TEMP%/_DOS_Tests_Exists
    IF EXIST "%__TEST__ROOT_PATH__%" RD /S /Q "%__TEST__ROOT_PATH__%"


    REM ================= Create Disk Elements ===============
    SET __DISK_ELEMENT1__=%__TEST__ROOT_PATH__%/AFolder
    MD "%__DISK_ELEMENT1__%"

    SET __DISK_ELEMENT1a__=%__DISK_ELEMENT1__%/A.txt
    DIR *.* > "%__DISK_ELEMENT1a__%"

    SET __DISK_ELEMENT1b_EMPTY_FILE__=%__DISK_ELEMENT1__%/B_Empty.txt
    Copy NUL "%__DISK_ELEMENT1b_EMPTY_FILE__%"

    SET __DISK_ELEMENT2_EMPTY_FOLDER__=%__TEST__ROOT_PATH__%/BFolder_Empty
    MD "%__DISK_ELEMENT2_EMPTY_FOLDER__%"    


    REM ================= Call Exists ===============
    SET __RESPONSE1__=
    CALL "%TRANSVERSE_UNDER_TEST%" Exists "%__DISK_ELEMENT1__%" __RESPONSE1__

    SET __RESPONSE1a__=
    CALL "%TRANSVERSE_UNDER_TEST%" Exists "%__DISK_ELEMENT1a__%" __RESPONSE1a__
    SET __RESPONSE1b__=
    CALL "%TRANSVERSE_UNDER_TEST%" Exists "%__DISK_ELEMENT1b_EMPTY_FILE__%" __RESPONSE1b__

    SET __RESPONSE2__=
    CALL "%TRANSVERSE_UNDER_TEST%" Exists "%__DISK_ELEMENT2_EMPTY_FOLDER__%" __RESPONSE2__


    REM ================ ASSERTS =============
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESPONSE1__%" "%TRUE%"
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESPONSE1a__%" "%TRUE%"
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESPONSE1b__%" "%TRUE%"
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESPONSE2__%" "%TRUE%"


    REM ============================ Clean Tests Folder ================================================
    RD /S/Q "%__TEST__ROOT_PATH__%"


	(ENDLOCAL
	)
GOTO :EOF



REM ===================================================================================================================






REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction DoesntExist =======
REM
:DoesntExist_Run_TESTS
	SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	3        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de DoesntExist ******"

    CALL :DoesntExist_WhenDiskElementDoesntExist_ShouldReturnTrue
    CALL :DoesntExist_WhenDiskElementExists_ShouldReturnFalse

	(ENDLOCAL
	)
GOTO :EOF


REM ======= DoesntExist_WhenDiskElementDoesntExist_ShouldReturnTrue =======
:DoesntExist_WhenDiskElementDoesntExist_ShouldReturnTrue
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- DoesntExist_WhenDiskElementDoesntExist_ShouldReturnTrue -"


    SET __TEST__ROOT_PATH__=%TEMP%/_DOS_Tests_DoesntExist
    IF EXIST "%__TEST__ROOT_PATH__%" RD /S /Q "%__TEST__ROOT_PATH__%"
    MD "%__TEST__ROOT_PATH__%"


    REM ================= Disk Element (non existing) ===============
    SET __DISK_ELEMENT__=%__TEST__ROOT_PATH__%/NonExistingDiskElement


    REM ================= Call DoesntExist ===============
    SET __RESPONSE__=
    CALL "%TRANSVERSE_UNDER_TEST%" DoesntExist "%__DISK_ELEMENT__%" __RESPONSE__
    

    REM ================ ASSERTS =============
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESPONSE__%" "%TRUE%"


    REM ============================ Clean Tests Folder ================================================
    RD /S/Q "%__TEST__ROOT_PATH__%"


	(ENDLOCAL
	)
GOTO :EOF


REM ======= DoesntExist_WhenDiskElementExists_ShouldReturnFalse =======
:DoesntExist_WhenDiskElementExists_ShouldReturnFalse
	SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- DoesntExist_WhenDiskElementExists_ShouldReturnFalse -"


    SET __TEST__ROOT_PATH__=%TEMP%/_DOS_Tests_DoesntExist
    IF EXIST "%__TEST__ROOT_PATH__%" RD /S /Q "%__TEST__ROOT_PATH__%"


    REM ================= Create Disk Elements ===============
    SET __DISK_ELEMENT1__=%__TEST__ROOT_PATH__%/AFolder
    MD "%__DISK_ELEMENT1__%"

    SET __DISK_ELEMENT1a__=%__DISK_ELEMENT1__%/A.txt
    DIR *.* > "%__DISK_ELEMENT1a__%"

    SET __DISK_ELEMENT1b_EMPTY_FILE__=%__DISK_ELEMENT1__%/B_Empty.txt
    Copy NUL "%__DISK_ELEMENT1b_EMPTY_FILE__%"

    SET __DISK_ELEMENT2_EMPTY_FOLDER__=%__TEST__ROOT_PATH__%/BFolder_Empty
    MD "%__DISK_ELEMENT2_EMPTY_FOLDER__%"    


    REM ================= Call DoesntExist ===============
    SET __RESPONSE1__=
    CALL "%TRANSVERSE_UNDER_TEST%" DoesntExist "%__DISK_ELEMENT1__%" __RESPONSE1__

    SET __RESPONSE1a__=
    CALL "%TRANSVERSE_UNDER_TEST%" DoesntExist "%__DISK_ELEMENT1a__%" __RESPONSE1a__
    SET __RESPONSE1b__=
    CALL "%TRANSVERSE_UNDER_TEST%" DoesntExist "%__DISK_ELEMENT1b_EMPTY_FILE__%" __RESPONSE1b__

    SET __RESPONSE2__=
    CALL "%TRANSVERSE_UNDER_TEST%" DoesntExist "%__DISK_ELEMENT2_EMPTY_FOLDER__%" __RESPONSE2__


    REM ================ ASSERTS =============
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESPONSE1__%" "%FALSE%"
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESPONSE1a__%" "%FALSE%"
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESPONSE1b__%" "%FALSE%"
    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESPONSE2__%" "%FALSE%"


    REM ============================ Clean Tests Folder ================================================
    RD /S/Q "%__TEST__ROOT_PATH__%"


	(ENDLOCAL
	)
GOTO :EOF



REM ===================================================================================================================
