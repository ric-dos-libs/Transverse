@ECHO OFF

REM PAS DE TESTS écrits pour les functions : PartialUnPackLibDotnetContent et PartialUnPackContent
REM  qui sont quasiment des passe-plat vers : PartialUnZipContent qui elle, possède des TESTS.
REM  De plus, il faudrait avoir un dossier d'Assets pour les Tests, afin d'y loger des fichiers .nupkg donc existants 
REM  pour les tests. Enfin, PartialUnPackLibDotnetContent (qui utilise PartialUnPackContent) a quand même été testé à la mano. 
REM  une fois, et il est très peu probable que ces functions changent, de même que leurs dépendances.


SET CURRENT_NAMESPACE=Transverse.Infra.Services
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

SET nug_CURRENT_SCRIPT_PATH_=%~dp0


REM -----------------------------------------------------------------
SET __NUGET_EXTENSION__=nupkg




REM -----------------------------------------------------------------
REM Recup. de constantes
SET TRANSVERSE_INFRA_COMMON_PATH=%nug_CURRENT_SCRIPT_PATH_%../_Common
CALL "%TRANSVERSE_INFRA_COMMON_PATH%/_Pathes.bat"

REM Recup. de constantes (TRUE, FALSE)
CALL "%TRANSVERSE_COMMON_CONSTANTS_SCRIPT%"







REM ==================== FUNCTION CALL ====================================	
IF %1. EQU PartialUnPackLibDotnetContent. (
	CALL :PartialUnPackLibDotnetContent %2 %3 %4
	
) ELSE IF %1. EQU PartialUnPackContent. (
	CALL :PartialUnPackContent %2 %3 %4
	
) 

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================



REM ======= Fonction chargee de Dézipper dans le repertoire %3 :
REM          uniquement le CONTENU de l'arborescence interne lib/net%2/ du Package Nuget de chemin+nom(+ext) %1, 
REM          %2 désignant la version Major.minor de .NET, du projet dont est issu le Nuget.
REM
REM           Rem. : c'est bien LE CONTENU de l'arborescence lib/net%2/, donc SANS le chemin lib/net%2/! qui sera dézippée dans %3.
REM
REM         Si le fichier %1 n'existe pas => message de fatal error puis fermeture fenetre.
REM         Si le repertoire %3 n'existe pas, alors il est cree.
REM
REM 
REM PARAM. %1 : chemin+nom du Package Nuget (avec ou sans extension, elle sera ajoutée(%__NUGET_EXTENSION__%) si absente)
REM PARAM. %2 : version Major.minor de .NET, du projet dont est issu le Nuget.
REM PARAM. %3 : repertoire vers lequel dezipper. Val. par defaut : "." (repertoire courant)
REM
:PartialUnPackLibDotnetContent
	SETLOCAL

    SET __NUGET_FILE__=%~1
    SET __DOTNET_VERSION__=%~2
    SET __TARGET_FOLDER__=%~3

		@REM ECHO.
		@REM ECHO ====== FUNC : PartialUnPackLibDotnetContent - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
    @REM ECHO.
		@REM ECHO __NUGET_FILE__='%__NUGET_FILE__%'
    @REM ECHO __DOTNET_VERSION__='%__DOTNET_VERSION__%'
    @REM ECHO __TARGET_FOLDER__='%__TARGET_FOLDER__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__NUGET_FILE__"
    CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__DOTNET_VERSION__"

    SET __NUGET_CONTENT_TO_EXTRACT__=lib/net%__DOTNET_VERSION__%

    CALL :PartialUnPackContent "%__NUGET_FILE__%" "%__NUGET_CONTENT_TO_EXTRACT__%" "%__TARGET_FOLDER__%"
		
	(ENDLOCAL
	)
GOTO :EOF




	
REM ======= Fonction chargee de Dézipper dans le repertoire %3 :
REM         - ou bien uniquement le CONTENU de l'arborescence interne %2 du Package Nuget de chemin+nom(+ext) %1, si %2 désigne un chemin interne au Nuget
REM            ATTENTION dans ce cas %2 ne doit pas représenter la racine du Nuget 
REM                      (c-à-d qu'une valeur :   "" ou "/" ou "\" ou "." ou "./" ou ".\", etc... ne donnera rien de traitable ici !!) 
REM           Rem. : c'est bien LE CONTENU de l'arborescence %2, donc SANS son chemin ! qui sera dézippée dans %3.
REM
REM         - ou bien le fichier %2 du Package Nuget de chemin+nom(+ext) %1, si %2 désigne un fichier (avec chemin ou non) interne au Nuget
REM           Rem. : c'est bien LE FICHIER %2 lui-même SANS son chemin ! qui sera alors dézippé dans %3.
REM        
REM         Si le fichier %1 n'existe pas => message de fatal error puis fermeture fenetre.
REM         Si le repertoire %3 n'existe pas, alors il est cree.
REM
REM 
REM PARAM. %1 : chemin+nom du Package Nuget (avec ou sans extension, elle sera ajoutée(%__NUGET_EXTENSION__%) si absente)
REM PARAM. %2 : arborescence ou fichier -(dans le fichier Nuget)- que l'on veut extraire.
REM PARAM. %3 : repertoire vers lequel dezipper. Val. par defaut : "." (repertoire courant)
REM
:PartialUnPackContent
	SETLOCAL

    SET __NUGET_FILE__=%~1
    SET __NUGET_CONTENT_TO_EXTRACT__=%~2
    SET __TARGET_FOLDER__=%~3

		@REM ECHO.
		@REM ECHO ====== FUNC : PartialUnPackContent - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
    @REM ECHO.
		@REM ECHO __NUGET_FILE__='%__NUGET_FILE__%'
    @REM ECHO __NUGET_CONTENT_TO_EXTRACT__='%__NUGET_CONTENT_TO_EXTRACT__%'
    @REM ECHO __TARGET_FOLDER__='%__TARGET_FOLDER__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__NUGET_FILE__"
    CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__NUGET_CONTENT_TO_EXTRACT__"

    REM On ajoute à %__NUGET_FILE__%, l'extension %__NUGET_EXTENSION__% si non précisée.
    CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" EndsWith "%__NUGET_FILE__%" ".%__NUGET_EXTENSION__%" "%TRUE%" __NUGET_FILE__
    @REM ECHO __NUGET_FILE__='%__NUGET_FILE__%'

    CALL "%TRANSVERSE_INFRA_7ZIP_SCRIPT%" PartialUnZipContent "%__NUGET_FILE__%" "%__NUGET_CONTENT_TO_EXTRACT__%" "%__TARGET_FOLDER__%"
		
	(ENDLOCAL
	)
GOTO :EOF