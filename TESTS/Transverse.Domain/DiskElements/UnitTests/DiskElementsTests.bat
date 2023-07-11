@ECHO OFF
@REM CLS

SET CURRENT_SCRIPT_PATH=%~dp0
SET TRANSVERSE_TESTS_DOMAIN_COMMON_PATH=%CURRENT_SCRIPT_PATH%../../_Common


REM ------------------- VERIFS ----------------------------------------

REM Recup. de TRANSVERSE_DOMAIN_PATH
REM et TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT
CALL "%TRANSVERSE_TESTS_DOMAIN_COMMON_PATH%/_Pathes.bat"


REM ***** ATTENTION %MESSAGES_DISPLAYER% et %TESTING_TOOL% doivent avoir été précisés en amont ! *****
CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "MESSAGES_DISPLAYER"
CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "TESTING_TOOL"




REM ---------------------------------------------------------------------

SETLOCAL ENABLEDELAYEDEXPANSION 
  SET _CURRENT_NAMESPACE_=Transverse.Domain.DiskElements.%TRANSVERSE_TESTS_UNIT_TESTS_SUBPATH%
  SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

  SET TRANSVERSE_UNDER_TEST_NAME=DiskElements.bat
  SET TRANSVERSE_UNDER_TEST_PATH=%TRANSVERSE_DOMAIN_PATH%/DiskElements
  SET TRANSVERSE_UNDER_TEST=%TRANSVERSE_UNDER_TEST_PATH%/%TRANSVERSE_UNDER_TEST_NAME%


  REM -------------------------------------------------------------------------------------------------------------

  CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 5
  CALL "%MESSAGES_DISPLAYER%" WriteMessage "########### TESTS - RUNNING : '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %_CURRENT_NAMESPACE_% ] ########### "

  CALL "%MESSAGES_DISPLAYER%" WriteMessage "             SCRIPT UNDER TEST : '%TRANSVERSE_UNDER_TEST_NAME%'"
  CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2

  
  REM ==============================================================================================================
    
  @REM CALL :GetDiskElementExtension_Run_TESTS
  CALL :AddExtensionToDiskElementIfHasNoExtensionAtAll_Run_TESTS

  


(ENDLOCAL
)
GOTO :EOF




REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction GetDiskElementExtension =======
REM
:GetDiskElementExtension_Run_TESTS
  SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de GetDiskElementExtension ******"

    CALL :GetDiskElementExtension_Nominal_ShouldReturnTheExtension
    CALL :GetDiskElementExtension_WhenWithoutExtension_ShouldReturnAnEmptyValue
    CALL :GetDiskElementExtension_WhenWithoutName_ShouldReturnTheExtension
		
  (ENDLOCAL
  )
GOTO :EOF


REM ======= GetDiskElementExtension_Nominal_ShouldReturnTheExtension =======
:GetDiskElementExtension_Nominal_ShouldReturnTheExtension
  SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDiskElementExtension_Nominal_ShouldReturnTheExtension -"
                            
    SET EXPECTED_RESULT=tut
    SET DISK_ELEMENT_FULLNAME=c:/aaa\toto.%EXPECTED_RESULT%
    CALL :GetDiskElementExtension_Run_Test "%DISK_ELEMENT_FULLNAME%" "%EXPECTED_RESULT%"

  (ENDLOCAL
  )
GOTO :EOF

REM ======= GetDiskElementExtension_WhenWithoutExtension_ShouldReturnAnEmptyValue =======
:GetDiskElementExtension_WhenWithoutExtension_ShouldReturnAnEmptyValue
  SETLOCAL
        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDiskElementExtension_WhenWithoutExtension_ShouldReturnAnEmptyValue -"

    SET EXPECTED_RESULT=
    SET DISK_ELEMENT_FULLNAME=c:/aaa/toto.%EXPECTED_RESULT%
    CALL :GetDiskElementExtension_Run_Test "%DISK_ELEMENT_FULLNAME%" "%EXPECTED_RESULT%"

    SET EXPECTED_RESULT=
    SET DISK_ELEMENT_FULLNAME=c:/aaa/toto%EXPECTED_RESULT%
    CALL :GetDiskElementExtension_Run_Test "%DISK_ELEMENT_FULLNAME%" "%EXPECTED_RESULT%"

    SET EXPECTED_RESULT=
    SET DISK_ELEMENT_FULLNAME=.%EXPECTED_RESULT%
    CALL :GetDiskElementExtension_Run_Test "%DISK_ELEMENT_FULLNAME%" "%EXPECTED_RESULT%"

  (ENDLOCAL
  )
GOTO :EOF

REM ======= GetDiskElementExtension_WhenWithoutName_ShouldReturnTheExtension =======
:GetDiskElementExtension_WhenWithoutName_ShouldReturnTheExtension
  SETLOCAL
				
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDiskElementExtension_WhenWithoutName_ShouldReturnTheExtension -"

    SET EXPECTED_RESULT=tut
    SET DISK_ELEMENT_FULLNAME=.%EXPECTED_RESULT%
    CALL :GetDiskElementExtension_Run_Test "%DISK_ELEMENT_FULLNAME%" "%EXPECTED_RESULT%"

  (ENDLOCAL
  )
GOTO :EOF


REM ======= Test de la fonction GetDiskElementExtension =======
REM 		
REM PARAM. %1 : fullname de l'element disque
REM PARAM. %2 : resultat attendu
REM
REM
:GetDiskElementExtension_Run_Test
  SETLOCAL
				
    SET __DISK_ELEMENT_FULLNAME__=%~1
    SET __EXPECTED_RESULT__=%~2

    REM ECHO.
    REM ECHO ====== FUNC : GetDiskElementExtension_Run_Test ======
    REM ECHO.
    REM ECHO __DISK_ELEMENT_FULLNAME__='%__DISK_ELEMENT_FULLNAME__%'
    REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
    REM ECHO.
    REM ECHO.
    REM PAUSE
    REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec DISK_ELEMENT_FULLNAME='%__DISK_ELEMENT_FULLNAME__%'"

    SET __RESULT__=
    CALL "%TRANSVERSE_UNDER_TEST%" GetDiskElementExtension "%__DISK_ELEMENT_FULLNAME__%" __RESULT__
    @REM ECHO __RESULT__=%__RESULT__%

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT__%" "%__EXPECTED_RESULT__%"

  (ENDLOCAL
  )

GOTO :EOF


REM====================================================================================================================



REM====================================================================================================================
REM ======= Lancement de tous les Tests pour la fonction AddExtensionToDiskElementIfHasNoExtensionAtAll =======
REM
:AddExtensionToDiskElementIfHasNoExtensionAtAll_Run_TESTS
  SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage ""	
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "   ****** TEST de AddExtensionToDiskElementIfHasNoExtensionAtAll ******"

    CALL :AddExtensionToDiskElementIfHasNoExtensionAtAll_WhenHasNoExtension_ShouldReturnWithThePassedExtension
    CALL :AddExtensionToDiskElementIfHasNoExtensionAtAll_WhenHasExtension_ShouldReturnTheOriginal
		
  (ENDLOCAL
  )
GOTO :EOF


REM ======= AddExtensionToDiskElementIfHasNoExtensionAtAll_WhenHasNoExtension_ShouldReturnWithThePassedExtension =======
:AddExtensionToDiskElementIfHasNoExtensionAtAll_WhenHasNoExtension_ShouldReturnWithThePassedExtension
  SETLOCAL

    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- AddExtensionToDiskElementIfHasNoExtensionAtAll_WhenHasNoExtension_ShouldReturnWithThePassedExtension -"

    SET EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE=txt
    SET DISK_ELEMENT_FULLNAME=c:/aaa\toto
    SET EXPECTED_RESULT=%DISK_ELEMENT_FULLNAME%.%EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE%
    CALL :AddExtensionToDiskElementIfHasNoExtensionAtAll_Run_Test "%EXPECTED_RESULT%" "%DISK_ELEMENT_FULLNAME%" "%EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE%"

    @REM CALL "%MESSAGES_DISPLAYER%" WriteMessage ""

    SET EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE=txt
    SET DISK_ELEMENT_FULLNAME=c:/aaa\toto.
    SET EXPECTED_RESULT=%DISK_ELEMENT_FULLNAME%%EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE%
    CALL :AddExtensionToDiskElementIfHasNoExtensionAtAll_Run_Test "%EXPECTED_RESULT%" "%DISK_ELEMENT_FULLNAME%" "%EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE%"

  (ENDLOCAL
  )
GOTO :EOF

REM ======= AddExtensionToDiskElementIfHasNoExtensionAtAll_WhenHasExtension_ShouldReturnTheOriginal =======
:AddExtensionToDiskElementIfHasNoExtensionAtAll_WhenHasExtension_ShouldReturnTheOriginal
  SETLOCAL
        
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
    CALL "%MESSAGES_DISPLAYER%" WriteMessage "- AddExtensionToDiskElementIfHasNoExtensionAtAll_WhenHasExtension_ShouldReturnTheOriginal -"

    SET EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE=txt
    SET DISK_ELEMENT_FULLNAME=c:/aaa\toto.xls
    SET EXPECTED_RESULT=%DISK_ELEMENT_FULLNAME%
    CALL :AddExtensionToDiskElementIfHasNoExtensionAtAll_Run_Test "%EXPECTED_RESULT%" "%DISK_ELEMENT_FULLNAME%" "%EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE%"

  (ENDLOCAL
  )
GOTO :EOF



REM ======= Test de la fonction AddExtensionToDiskElementIfHasNoExtensionAtAll =======
REM 		
REM PARAM. %1 : resultat attendu
REM PARAM. %2 : fullname de l'element disque
REM PARAM. %3 : extension à ajouter si %2  n'a pas d'extension
REM
REM
:AddExtensionToDiskElementIfHasNoExtensionAtAll_Run_Test
  SETLOCAL
				
    SET __EXPECTED_RESULT__=%~1
    SET __DISK_ELEMENT_FULLNAME__=%~2
    SET __EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE__=%~3

    @REM ECHO.
    @REM ECHO ====== FUNC : AddExtensionToDiskElementIfHasNoExtensionAtAll_Run_Test ======
    @REM ECHO.
    @REM ECHO __EXPECTED_RESULT__='%__EXPECTED_RESULT__%'
    @REM ECHO __DISK_ELEMENT_FULLNAME__='%__DISK_ELEMENT_FULLNAME__%'
    @REM ECHO __EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE__='%__EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE__%'
    @REM ECHO.
    @REM ECHO.
    @REM PAUSE
    @REM ECHO. & ECHO.

    CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec DISK_ELEMENT_FULLNAME='%__DISK_ELEMENT_FULLNAME__%' et EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE='%__EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE__%'"

    SET __RESULT__=
    CALL "%TRANSVERSE_UNDER_TEST%" AddExtensionToDiskElementIfHasNoExtensionAtAll "%__DISK_ELEMENT_FULLNAME__%" "%__EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE__%" __RESULT__
    @REM ECHO __RESULT__=%__RESULT__%

    CALL "%TESTING_TOOL%" AssertAreEqual "%__RESULT__%" "%__EXPECTED_RESULT__%"

  (ENDLOCAL
  )

GOTO :EOF


REM====================================================================================================================