@ECHO OFF

SET __ZIPPER_PATH__=C:\Program Files\7-Zip
SET __ZIPPER__=%__ZIPPER_PATH__%/7z.exe
SET __ZIP_EXTENSION__=7z


REM -----------------------------------------------------------------

SET CURRENT_NAMESPACE=Transverse.Infra
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

SET _CURRENT_SCRIPT_PATH_=%~dp0




REM -----------------------------------------------------------------
REM Recup. de 
REM  TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT et TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT, et autres...
SET TRANSVERSE_INFRA_COMMON_PATH=%_CURRENT_SCRIPT_PATH_%_Common
CALL "%TRANSVERSE_INFRA_COMMON_PATH%/_Pathes.bat"






REM ==================== FUNCTION CALL ====================================	
IF %1. EQU AddToZip. (
	CALL :AddToZip %2 %3
	
) ELSE IF %1. EQU UnZipIt. (
	CALL :UnZipIt %2 %3

) ELSE IF %1. EQU PartialUnZip. (
	CALL :PartialUnZip %2 %3 %4
 
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
REM PARAM. %1 : chemin+nom du fichier compresse (avec ou sans extension, elle sera ajoutée(%__ZIP_EXTENSION__%) si absente)
REM PARAM. %2 : DiskElement a ajouter dans le fichier compresse 
REM
:AddToZip
	SETLOCAL

    SET __ZIP_FILE__=%~1
    SET __DISK_ELEMENT_To_ADD__=%~2
				
		@REM ECHO.
		@REM ECHO ====== FUNC : AddToZip - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
    @REM ECHO __ZIP_FILE__='%__ZIP_FILE__%'
    @REM ECHO __DISK_ELEMENT_To_ADD__='%__DISK_ELEMENT_To_ADD__%'
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__ZIP_FILE__"

    CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%__DISK_ELEMENT_To_ADD__%"

    REM AJOUT DE L'EXTENSION %__ZIP_EXTENSION__% si besoin.
    CALL "%TRANSVERSE_DOMAIN_DISK_ELEMENTS_DISKELEMENTS_SCRIPT%" AddExtensionToDiskElementIfHasNoExtensionAtAll "%__ZIP_FILE__%" "%__ZIP_EXTENSION__%" __ZIP_FILE__

    CALL "%__ZIPPER__%" a "%__ZIP_FILE__%" "%__DISK_ELEMENT_To_ADD__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Fonction chargee de Dézipper le fichier compresse de chemin+nom %1 =======
REM         vers le repertoire %2.
REM         Si le fichier %1 n'existe pas => message de fatal error puis fermeture fenetre.
REM         Si le repertoire %2 n'existe pas, alors il est cree.
REM 
REM PARAM. %1 : chemin+nom du fichier compresse (avec ou sans extension, elle sera ajoutée(%__ZIP_EXTENSION__%) si absente)
REM PARAM. %2 : repertoire vers lequel dezipper. Val. par defaut : "." (repertoire courant)
REM
:UnZipIt
	SETLOCAL

    SET __ZIP_FILE__=%~1
    SET __TARGET_FOLDER__=%~2
				
		@REM ECHO.
		@REM ECHO ====== FUNC : UnZipIt - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
    @REM ECHO __ZIP_FILE__='%__ZIP_FILE__%'
    @REM ECHO __TARGET_FOLDER__='%__TARGET_FOLDER__%'
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__ZIP_FILE__"    

    IF "%__TARGET_FOLDER__%." EQU "." SET __TARGET_FOLDER__=.

    IF NOT EXIST "%__TARGET_FOLDER__%" (
      MD "%__TARGET_FOLDER__%"
    )

    REM AJOUT DE L'EXTENSION %__ZIP_EXTENSION__% si besoin.
    CALL "%TRANSVERSE_DOMAIN_DISK_ELEMENTS_DISKELEMENTS_SCRIPT%" AddExtensionToDiskElementIfHasNoExtensionAtAll "%__ZIP_FILE__%" "%__ZIP_EXTENSION__%" __ZIP_FILE__

    CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%__TARGET_FOLDER__%"
    CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%__ZIP_FILE__%"

    CALL "%__ZIPPER__%" x "%__ZIP_FILE__%" -o"%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF


REM ======= Fonction chargee de Dézipper dans le repertoire %3,
REM         - ou bien l'arborescence interne %2 du fichier compresse de chemin+nom %1, si %2 désigne un chemin interne au zip
REM            ATTENTION dans ce cas %2 ne doit pas représenter la racine du Zip 
REM                      (c-à-d qu'une valeur :   "" ou "/" ou "\" ou "." ou "./" ou ".\", etc... ne donnera rien de traitable ici !!) 
REM           Rem. : ce qui sera dézippé dans %3, sera tout le CONTENU de %2 ! (toute profondeur).
REM
REM         - ou bien le fichier %2 du fichier compresse de chemin+nom %1, si %2 désigne un fichier (avec chemin ou non) interne au zip
REM
REM        
REM         Si le fichier %1 n'existe pas => message de fatal error puis fermeture fenetre.
REM         Si le repertoire %3 n'existe pas, alors il est cree.
REM 
REM PARAM. %1 : chemin+nom du fichier compresse (avec ou sans extension, elle sera ajoutée(%__ZIP_EXTENSION__%) si absente)
REM PARAM. %2 : arborescence ou fichier -(dans le fichier zip)- que l'on veut extraire.
REM PARAM. %3 : repertoire vers lequel dezipper. Val. par defaut : "." (repertoire courant)
REM
:PartialUnZip
	SETLOCAL

    SET __ZIP_FILE__=%~1
    SET __ZIP_CONTENT_TO_UNZIP__=%~2
    SET __TARGET_FOLDER__=%~3
				
		@REM ECHO.
		@REM ECHO ====== FUNC : PartialUnZip - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
    @REM ECHO __ZIP_FILE__='%__ZIP_FILE__%'
    @REM ECHO __ZIP_CONTENT_TO_UNZIP__='%__ZIP_CONTENT_TO_UNZIP__%'
    @REM ECHO __TARGET_FOLDER__='%__TARGET_FOLDER__%'
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__ZIP_FILE__"
    CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__ZIP_CONTENT_TO_UNZIP__"

    IF "%__TARGET_FOLDER__%." EQU "." SET __TARGET_FOLDER__=.

    IF NOT EXIST "%__TARGET_FOLDER__%" (
      MD "%__TARGET_FOLDER__%"
    )

    REM AJOUT DE L'EXTENSION %__ZIP_EXTENSION__% si besoin.
    CALL "%TRANSVERSE_DOMAIN_DISK_ELEMENTS_DISKELEMENTS_SCRIPT%" AddExtensionToDiskElementIfHasNoExtensionAtAll "%__ZIP_FILE__%" "%__ZIP_EXTENSION__%" __ZIP_FILE__

    CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%__TARGET_FOLDER__%"
    CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%__ZIP_FILE__%"


    CALL "%__ZIPPER__%" x -y "%__ZIP_FILE__%" "%__ZIP_CONTENT_TO_UNZIP__%" -o"%__TARGET_FOLDER__%"

	(ENDLOCAL
	)
GOTO :EOF



REM ======= Fonction chargee de retirer du fichier compresse de chemin+nom %1, =======
REM         tous les DiskElements vérifiant :  %2 (par exe. %2 = "*.lnk")
REM         Si le fichier %1 n'existe pas => message de fatal error puis fermeture fenetre.
REM 
REM PARAM. %1 : chemin+nom du fichier compresse (avec ou sans extension, elle sera ajoutée(%__ZIP_EXTENSION__%) si absente)
REM PARAM. %2 : ce qu'il faudra retirer du fihier compresse. (Ex: "*.txt")
REM
:RemoveAllOccurencesFromZip
	SETLOCAL

    SET __ZIP_FILE__=%~1
    SET __TO_BE_REMOVED__=%~2
				
		@REM ECHO.
		@REM ECHO ====== FUNC : RemoveAllOccurencesFromZip - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
    @REM ECHO __ZIP_FILE__='%__ZIP_FILE__%'
    @REM ECHO __TO_BE_REMOVED__='%__TO_BE_REMOVED__%'
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__ZIP_FILE__"

    REM AJOUT DE L'EXTENSION %__ZIP_EXTENSION__% si besoin.
    CALL "%TRANSVERSE_DOMAIN_DISK_ELEMENTS_DISKELEMENTS_SCRIPT%" AddExtensionToDiskElementIfHasNoExtensionAtAll "%__ZIP_FILE__%" "%__ZIP_EXTENSION__%" __ZIP_FILE__

    IF "%__TO_BE_REMOVED__%." NEQ "." (

      CALL "%TRANSVERSE_INFRA_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckDiskElementExists "%__ZIP_FILE__%"
    
      CALL "%__ZIPPER__%" d -r "%__ZIP_FILE__%" "%__TO_BE_REMOVED__%"
    )

	(ENDLOCAL
	)
GOTO :EOF