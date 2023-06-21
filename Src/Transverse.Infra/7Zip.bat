@ECHO OFF

SET ZIPPER_PATH=C:\Program Files\7-Zip
SET ZIPPER=%ZIPPER_PATH%/7z.exe
SET ZIP_EXTENSION=7z


REM -----------------------------------------------------------------

SET CURRENT_NAMESPACE=Transverse.Infra
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

SET _CURRENT_SCRIPT_PATH_=%~dp0




REM -----------------------------------------------------------------
REM Recup. de 
REM  SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT et SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT
SET SRC_INFRA_COMMON_PATH=%_CURRENT_SCRIPT_PATH_%_Common
CALL "%SRC_INFRA_COMMON_PATH%/_Pathes.bat"






REM ==================== FUNCTION CALL ====================================	
IF %1. EQU AddToZip. (
	CALL :AddToZip %2 %3
	
) ELSE IF %1. EQU UnZipIt. (
	CALL :UnZipIt %2 %3
 
) ELSE IF %1. EQU RemoveAllOccurencesFromZip. (
	CALL :RemoveAllOccurencesFromZip %2 %3

)

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	

REM ======= Fonction chargee de creer et/ou completer un fichier compresse de chemin+nom %1 =======
REM         en y ajoutant le DiskElement %2.
REM         Si %1 non renseigne => message de fatal error puis fermeture fenetre.
REM         Si %2 n'existe pas => message de fatal error puis fermeture fenetre.
REM 
REM PARAM. %1 : chemin+nom du fichier compresse (SANS extension) !!!!! <<<<
REM PARAM. %2 : DiskElement a ajouter dans le fichier compresse 
REM
:AddToZip
	SETLOCAL

    SET __ZIP_FILE__=%~1
    SET __DISK_ELEMENT_To_ADD__=%~2
				
		ECHO.
		ECHO ====== FUNC : AddToZip - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		ECHO.
    ECHO __ZIP_FILE__='%__ZIP_FILE__%'
    ECHO __DISK_ELEMENT_To_ADD__='%__DISK_ELEMENT_To_ADD__%'
		@REM PAUSE
		ECHO. & ECHO.

    CALL "%SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__ZIP_FILE__"

    CALL "%SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%__DISK_ELEMENT_To_ADD__%"

    SET __ZIP_FILE__=%__ZIP_FILE__%.%ZIP_EXTENSION%
    CALL "%ZIPPER%" a "%__ZIP_FILE__%" "%__DISK_ELEMENT_To_ADD__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Fonction chargee de dezipper le fichier compresse de chemin+nom %1 =======
REM         vers le repertoire %2.
REM         Si le fichier %1 n'existe pas => message de fatal error puis fermeture fenetre.
REM         Si le repertoire %2 alors il est cree.
REM 
REM PARAM. %1 : chemin+nom du fichier compresse (SANS extension) !!!!! <<<<
REM PARAM. %2 : repertoire vers lequel dezipper. Val. par defaut : "." (repertoire courant)
REM
:UnZipIt
	SETLOCAL

    SET __ZIP_FILE__=%~1
    SET __TARGET_FOLDER__=%~2
				
		ECHO.
		ECHO ====== FUNC : UnZipIt - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		ECHO.
    ECHO __ZIP_FILE__='%__ZIP_FILE__%'
    ECHO __TARGET_FOLDER__='%__TARGET_FOLDER__%'
		@REM PAUSE
		ECHO. & ECHO.

    IF "%__TARGET_FOLDER__%." EQU "." SET __TARGET_FOLDER__=.

    IF NOT EXIST "%__TARGET_FOLDER__%" (
      MD "%__TARGET_FOLDER__%"
    )

    SET __ZIP_FILE__=%__ZIP_FILE__%.%ZIP_EXTENSION%

    CALL "%SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%__TARGET_FOLDER__%"
    CALL "%SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%__ZIP_FILE__%"

    PUSHD "%CD%"
      CD /D "%__TARGET_FOLDER__%"
      CALL "%ZIPPER%" x "%__ZIP_FILE__%"
    POPD

	(ENDLOCAL
	)
GOTO :EOF



REM ======= Fonction chargee de retirer du fichier compresse de chemin+nom %1, =======
REM         tous les DiskElements vérifiant :  %2 (par exe. %2 = "*.lnk")
REM         Si le fichier %1 n'existe pas => message de fatal error puis fermeture fenetre.
REM 
REM PARAM. %1 : chemin+nom du fichier compresse (SANS extension) !!!!! <<<<
REM PARAM. %2 : ce qu'il faudra retirer du fihier compresse. (Ex: "*.txt")
REM
:RemoveAllOccurencesFromZip
	SETLOCAL

    SET __ZIP_FILE__=%~1
    SET __TO_BE_REMOVED__=%~2
				
		ECHO.
		ECHO ====== FUNC : RemoveAllOccurencesFromZip - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		ECHO.
    ECHO __ZIP_FILE__='%__ZIP_FILE__%'
    ECHO __TO_BE_REMOVED__='%__TO_BE_REMOVED__%'
		@REM PAUSE
		ECHO. & ECHO.

    SET __ZIP_FILE__=%__ZIP_FILE__%.%ZIP_EXTENSION%

    IF "%__TO_BE_REMOVED__%." NEQ "." (

      CALL "%SRC_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%__ZIP_FILE__%"
    
      CALL "%ZIPPER%" d -r "%__ZIP_FILE__%" "%__TO_BE_REMOVED__%"
    )

	(ENDLOCAL
	)
GOTO :EOF