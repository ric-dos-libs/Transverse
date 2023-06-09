@ECHO OFF
@REM CLS

SETLOCAL ENABLEDELAYEDEXPANSION 

    SET CURRENT_SCRIPT_PATH=%~dp0
    CALL "%CURRENT_SCRIPT_PATH%../../_Common/_Pathes.bat"

    SET _CURRENT_NAMESPACE_=Transverse.Domain.DiskElements.UnitTests
    SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

    SET SRC_UNDER_TEST_PATH=%SRC_DOMAIN_PATH%/DiskElements
    SET SRC_UNDER_TEST=%SRC_UNDER_TEST_PATH%/DiskElements.bat
    
    REM ==============================================================================================================
     
    CALL :GetDiskElementExtension_Run_TESTS


(ENDLOCAL
)

GOTO :EOF



REM ======= Lancement de tous les Tests pour la fonction GetDiskElementExtension =======
REM
:GetDiskElementExtension_Run_TESTS
	SETLOCAL
				
		REM ECHO.
		REM ECHO ====== FUNC : GetDiskElementExtension_Run_TESTS ======
		REM ECHO.
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

        CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 4
        CALL "%MESSAGES_DISPLAYER%" WriteMessage "SCRIPT UNDER TEST : '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %_CURRENT_NAMESPACE_% ]"
        CALL "%MESSAGES_DISPLAYER%" WriteMessage ""

        CALL "%MESSAGES_DISPLAYER%" WriteMessage "****** TEST de GetDiskElementExtension -  ******"
        CALL "%MESSAGES_DISPLAYER%" WriteMessage ""

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
				
        SET EXPECTED_EXTENSION=tut
        SET DISK_ELEMENT_FULLNAME=c:/aaa\toto.%EXPECTED_EXTENSION%
        CALL :GetDiskElementExtension_Run_Test "%DISK_ELEMENT_FULLNAME%" "%EXPECTED_EXTENSION%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= GetDiskElementExtension_WhenWithoutExtension_ShouldReturnAnEmptyValue =======
:GetDiskElementExtension_WhenWithoutExtension_ShouldReturnAnEmptyValue
	SETLOCAL
        
        CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
        CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDiskElementExtension_WhenWithoutExtension_ShouldReturnAnEmptyValue -"

        SET EXPECTED_EXTENSION=
        SET DISK_ELEMENT_FULLNAME=c:/aaa/toto.%EXPECTED_EXTENSION%
        CALL :GetDiskElementExtension_Run_Test "%DISK_ELEMENT_FULLNAME%" "%EXPECTED_EXTENSION%"

        SET EXPECTED_EXTENSION=
        SET DISK_ELEMENT_FULLNAME=c:/aaa/toto%EXPECTED_EXTENSION%
        CALL :GetDiskElementExtension_Run_Test "%DISK_ELEMENT_FULLNAME%" "%EXPECTED_EXTENSION%"

        SET EXPECTED_EXTENSION=
        SET DISK_ELEMENT_FULLNAME=.%EXPECTED_EXTENSION%
        CALL :GetDiskElementExtension_Run_Test "%DISK_ELEMENT_FULLNAME%" "%EXPECTED_EXTENSION%"

	(ENDLOCAL
	)
GOTO :EOF

REM ======= GetDiskElementExtension_WhenWithoutName_ShouldReturnTheExtension =======
:GetDiskElementExtension_WhenWithoutName_ShouldReturnTheExtension
	SETLOCAL
				
        CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
        CALL "%MESSAGES_DISPLAYER%" WriteMessage "- GetDiskElementExtension_WhenWithoutName_ShouldReturnTheExtension -"

        SET EXPECTED_EXTENSION=tut
        SET DISK_ELEMENT_FULLNAME=.%EXPECTED_EXTENSION%
        CALL :GetDiskElementExtension_Run_Test "%DISK_ELEMENT_FULLNAME%" "%EXPECTED_EXTENSION%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Test de la fonction GetDiskElementExtension =======
REM 		
REM PARAM. %1 : fullname de l'element disque
REM PARAM. %2 : extension attendue
REM
REM
:GetDiskElementExtension_Run_Test
	SETLOCAL
				
		SET __DISK_ELEMENT_FULLNAME__=%~1
        SET __EXPECTED_EXTENSION__=%~2

		REM ECHO.
		REM ECHO ====== FUNC : GetDiskElementExtension_Run_Test ======
		REM ECHO.
		REM ECHO __DISK_ELEMENT_FULLNAME__='%__DISK_ELEMENT_FULLNAME__%'
        REM ECHO __EXPECTED_EXTENSION__='%__EXPECTED_EXTENSION__%'
		REM ECHO.
		REM ECHO.
		REM PAUSE
		REM ECHO. & ECHO.

        CALL "%MESSAGES_DISPLAYER%" WriteMessage " Avec __DISK_ELEMENT_FULLNAME__='%__DISK_ELEMENT_FULLNAME__%'"

        SET __RESULT_EXTENSION__=
        CALL "%SRC_UNDER_TEST%" GetDiskElementExtension "!__DISK_ELEMENT_FULLNAME__!" __RESULT_EXTENSION__
        
        CALL "%TESTS_RESULT_DISPLAYER%" WriteEqualityResult "%__RESULT_EXTENSION__%" "%__EXPECTED_EXTENSION__%"
		
	(ENDLOCAL
	)
GOTO :EOF