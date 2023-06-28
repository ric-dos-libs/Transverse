@ECHO OFF



SET CURRENT_NAMESPACE=Transverse.Infra.Services
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0

SET de_CURRENT_SCRIPT_PATH_de=%~dp0



REM -----------------------------------------------------------------
REM Recup. de constantes
SET TRANSVERSE_INFRA_COMMON_PATH=%de_CURRENT_SCRIPT_PATH_de%../_Common
CALL "%TRANSVERSE_INFRA_COMMON_PATH%/_Pathes.bat"

CALL "%TRANSVERSE_COMMON_CONSTANTS_SCRIPT%"





REM ==================== FUNCTION CALL ====================================	
IF %1. EQU EmptyFolder. (
	CALL :EmptyFolder %2 %3
	
) ELSE IF %1. EQU DeleteFolder. (
	CALL :DeleteFolder %2 %3
	
) ELSE IF %1. EQU CopyFolder. (
	CALL :CopyFolder %2 %3
	
) ELSE IF %1. EQU DeleteFile. (
	CALL :DeleteFile %2 %3 %4

) ELSE IF %1. EQU Exists. (
	CALL :Exists %2 %3

) ELSE IF %1. EQU DoesntExist. (
	CALL :DoesntExist %2 %3

) 


@REM ELSE IF %1. EQU DeleteFolderIfNotThisOne. (
@REM 	CALL :DeleteFolderIfNotThisOne %2 %3 %4
@REM )

@REM ELSE IF %1. EQU CreateSymbolicLinkToFolder. (
@REM 	CALL :CreateSymbolicLinkToFolder %2 %3
@REM )


GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	
	
	
REM ======= ATTENTION : fonction chargee d'effacer totalement le dossier %1  =======
REM 		
REM PARAM. %1 : chemin+nom du dossier
REM PARAM. %2 (facultatif) : le passer <> 1, si l'on ne souhaite pas une pause avec message d'avertissement, avant suppression. (Val. par défaut : 1)
REM
:DeleteFolder
	SETLOCAL
				
		SET __FOLDER__=%~1
		SET __PROMPT_BEFORE_DELETE__=%~2
		
		
		
		SET __PROMPT_BEFORE_DELETE_ON__=1
		
		IF "!__PROMPT_BEFORE_DELETE__!." EQU "."  (
			SET __PROMPT_BEFORE_DELETE__=!__PROMPT_BEFORE_DELETE_ON__!
		)

		
		ECHO.
		ECHO ====== FUNC : DeleteFolder - (%CURRENT_NAMESPACE%) ======
		ECHO.
		ECHO '__FOLDER__'='%__FOLDER__%'
		ECHO '__PROMPT_BEFORE_DELETE__'='%__PROMPT_BEFORE_DELETE__%'
		ECHO. & ECHO.
		REM PAUSE
		
		IF EXIST "!__FOLDER__!" (
		
			IF "!__PROMPT_BEFORE_DELETE__!" EQU "!__PROMPT_BEFORE_DELETE_ON__!" (
				ECHO.
				ECHO ATTENTION, 
				ECHO le dossier suivant existe et va etre efface :
				ECHO  "!__FOLDER__!"
				ECHO.
				PAUSE
				
			) ELSE (
				ECHO. & ECHO.
				ECHO SUPPRESSION DU DOSSIER :
				ECHO "!__FOLDER__!"
				ECHO. & ECHO.
				
			)
			
			RD /S /Q "!__FOLDER__!"	

		)		

		
	(ENDLOCAL
	)
GOTO :EOF




@REM REM ======= Fonction qui : =======
@REM REM   supprimera le dossier %2  si :  %1 <> %2. (Case sensitive)
@REM REM
@REM REM PARAM. %1 : chemin+nom du dossier a conserver
@REM REM PARAM. %2 : chemin+nom du dossier à comparer à %1
@REM REM PARAM. %3 : 0 si l'on ne souhaite pas de pause avec message d'avertissement, avant suppression, 1 sinon.
@REM REM
@REM :DeleteFolderIfNotThisOne
@REM 	SETLOCAL
	
@REM 		SET __FOLDER_TO_KEEP__=%~1
@REM 		SET __FOLDER_TO_DELETE_IF_DIFFERENT__=%~2
@REM 		SET __PROMPT_BEFORE_DELETE__=%~3
		
		
@REM 		SET __DELETE__=NO
@REM 		IF "!__FOLDER_TO_KEEP__!" NEQ "!__FOLDER_TO_DELETE_IF_DIFFERENT__!" (
@REM 			SET __DELETE__=YES
@REM 		)
	
		
@REM 		ECHO. & ECHO.
@REM 		ECHO ====== FUNC : DeleteFolderIfNotThisOne - (%CURRENT_NAMESPACE%) ======
@REM 		ECHO.
@REM 		ECHO __FOLDER_TO_KEEP__=%__FOLDER_TO_KEEP__%
@REM 		ECHO __FOLDER_TO_DELETE_IF_DIFFERENT__=%__FOLDER_TO_DELETE_IF_DIFFERENT__%
@REM 		ECHO __PROMPT_BEFORE_DELETE__=%__PROMPT_BEFORE_DELETE__%
@REM 		ECHO.
@REM 		ECHO __DELETE__=%__DELETE__%
@REM 		ECHO. & ECHO.
@REM 		REM PAUSE & ECHO. & ECHO.
		
@REM 		IF "!__DELETE__!" EQU "YES" (
@REM 			CALL :DeleteFolder "!__FOLDER_TO_DELETE_IF_DIFFERENT__!" "!__PROMPT_BEFORE_DELETE__!"
@REM 		)

	
@REM 	(ENDLOCAL
		
@REM 	)
@REM GOTO :EOF
	
	
	
	
REM ======= ATTENTION : fonction chargee de vider TOTALEMENT le dossier %1  =======
REM                     Mais si le dossier n'existait pas, il est cree (vide donc).
REM 		
REM PARAM. %1 : chemin+nom du dossier que l'on veut vider, ou creer vide.
REM PARAM. %2 (facultatif) : le passer <> 1, si l'on ne souhaite pas une pause avec message d'avertissement, en cas de suppression. (Val. par défaut : 1)
REM
:EmptyFolder
	SETLOCAL
				
		SET __FOLDER__=%~1
		SET __PROMPT_BEFORE_DELETE__=%~2

		
		ECHO.
		ECHO ====== FUNC : EmptyFolder - (%CURRENT_NAMESPACE%) ======
		ECHO.
		ECHO '__FOLDER__'='%__FOLDER__%'
		ECHO __PROMPT_BEFORE_DELETE__=%__PROMPT_BEFORE_DELETE__%
		ECHO.
		REM PAUSE
		ECHO. & ECHO.
		
		CALL :DeleteFolder "!__FOLDER__!" "!__PROMPT_BEFORE_DELETE__!"
		
		MKDIR "!__FOLDER__!"
		
	(ENDLOCAL
	)
GOTO :EOF



REM Fonction chargee de copier la totalite du dossier %1 dans le dossier %2.
REM (%2 sera cree si inexistant).
REM  Rem.1 : si des fichiers de meme nom mais plus recents existent deja dans %2, <<<<<
REM          alors ils ne seront pas ecrases.
REM  Rem.2 : ici, la demande de copie d'un lien symbolique, donnera lieu a la copie  -(sous-dossiers eventuellement inclus compris)-  de ce qui est pointed par ce lien.
REM
REM PARAM. %1 : chemin+nom du DOSSIER source.
REM PARAM. %2 : chemin+nom du DOSSIER desti.
REM
:CopyFolder
	SETLOCAL
				
		SET __SOURCE_FOLDER__=%~1
		SET __DESTI_FOLDER__=%~2

		
		ECHO.
		ECHO ====== FUNC : CopyFolder - (%CURRENT_NAMESPACE%) ======
		ECHO.
		ECHO '__SOURCE_FOLDER__'='%__SOURCE_FOLDER__%'
		ECHO '__DESTI_FOLDER__'='%__DESTI_FOLDER__%'
		ECHO.
		REM PAUSE
		ECHO. & ECHO.		
		
		IF EXIST "!__SOURCE_FOLDER__!"   (
			IF NOT EXIST "!__DESTI_FOLDER__!"  MKDIR "!__DESTI_FOLDER__!"
			XCOPY /D /Y /E/S   "!__SOURCE_FOLDER__!"  "!__DESTI_FOLDER__!"
		)
		
		
	(ENDLOCAL
	)
GOTO :EOF



@REM REM ======= Fonction chargee de creer le lien symbolique %1, pointant vers le dossier physique : %2  =======
@REM REM         Rem.: si le lien symbolique existait deja, alors il est prealablement supprimé (le lien pas ce qu'il pointait).
@REM REM 		
@REM REM PARAM. %1 : chemin+nom du lien symbolique à créer.
@REM REM PARAM. %2 : chemin du dossier sur lequel %1 devra pointer.
@REM REM
@REM :CreateSymbolicLinkToFolder
@REM 	SETLOCAL
				
@REM 		SET __SYMBOLIC_LINK_TO_CREATE__=%~1
@REM 		SET __SYMBOLIC_LINK_POINTED_PATH__=%~2
		
			
@REM 			CALL :DeleteSymbolicLink "!__SYMBOLIC_LINK_TO_CREATE__!"

@REM 			ECHO.
@REM 			ECHO ====== FUNC : CreateSymbolicLinkToFolder - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
@REM 			ECHO.
@REM 			ECHO '__SYMBOLIC_LINK_TO_CREATE__'='%__SYMBOLIC_LINK_TO_CREATE__%'	
@REM 			ECHO '__SYMBOLIC_LINK_POINTED_PATH__'='%__SYMBOLIC_LINK_POINTED_PATH__%'
@REM 			rem ECHO 'DOS_EXEC_AS_ADMIN'='%DOS_EXEC_AS_ADMIN%'
@REM 			ECHO. & ECHO.
@REM 			REM PAUSE			
			
			
@REM 			!DOS_EXEC_AS_ADMIN! "/cmd:MKLINK /D ~!__SYMBOLIC_LINK_TO_CREATE__!~ ~!__SYMBOLIC_LINK_POINTED_PATH__!~"
@REM 			ECHO. & ECHO.
			
@REM 		REM )
		
@REM 	(ENDLOCAL
@REM 	)
@REM GOTO :EOF



REM ======= Fonction chargee de supprimer un lien symbolique pointant vers un dossier (Rem.: n'effacera pas le dossier qui etait pointé)  =======
REM 		
REM PARAM. %1 : chemin+nom du lien symbolique a supprimer
REM
:DeleteSymbolicLink
	SETLOCAL
				
		SET __SYMBOLIC_LINK_TO_DELETE__=%~1
		
			
		IF EXIST "!__SYMBOLIC_LINK_TO_DELETE__!" (
			ECHO.
			ECHO ====== FUNC : DeleteSymbolicLink - (%CURRENT_NAMESPACE%) ======
			ECHO.
			ECHO '__SYMBOLIC_LINK_TO_DELETE__'='%__SYMBOLIC_LINK_TO_DELETE__%'
			ECHO.
			REM PAUSE
			
			RMDIR "!__SYMBOLIC_LINK_TO_DELETE__!"
			ECHO. & ECHO.
			
		)
		
	(ENDLOCAL
	)
GOTO :EOF



	
REM ======= Fonction chargee d'effacer le fichier %1  =======
REM 		
REM PARAM. %1 : chemin+nom+ext du fichier
REM PARAM. %2 (facultatif) : le passer <> 1, si l'on ne souhaite pas une pause avec message d'avertissement, avant suppression. (Val. par défaut : 1)
REM PARAM. %3 (facultatif) : le passer <> 1, si l'on ne souhaite pas que cet effacement soit récursif à travers les sous dossiers (Val. par défaut : 0)
REM
:DeleteFile
	SETLOCAL
				
		SET __FILE__=%~1
		SET __PROMPT_BEFORE_DELETE__=%~2
		SET __RECURSIVE__=%~3
		
		
		
		SET __PROMPT_BEFORE_DELETE_ON__=1
		SET __RECURSIVE_ON__=1
		
		
		IF "!__PROMPT_BEFORE_DELETE__!." EQU "."  (
			SET __PROMPT_BEFORE_DELETE__=!__PROMPT_BEFORE_DELETE_ON__!
		)

		
		ECHO.
		ECHO ====== FUNC : DeleteFile - (%CURRENT_NAMESPACE%) ======
		ECHO.
		ECHO '__FILE__'='%__FILE__%'
		ECHO '__RECURSIVE__'='%__RECURSIVE__%'
		ECHO '__PROMPT_BEFORE_DELETE__'='%__PROMPT_BEFORE_DELETE__%'
		ECHO. & ECHO.
		REM PAUSE
		
		
		SET DO_DELETE=
		IF "!__RECURSIVE__!" NEQ "!__RECURSIVE_ON__!" (
			IF EXIST "!__FILE__!" (
			
				IF "!__PROMPT_BEFORE_DELETE__!" EQU "!__PROMPT_BEFORE_DELETE_ON__!" (
					ECHO.
					ECHO ATTENTION, 
					ECHO le fichier suivant existe, et va etre efface :
					ECHO  "!__FILE__!"
					ECHO.
					PAUSE
					
				) ELSE (
					ECHO. & ECHO.
					ECHO SUPPRESSION DU FICHIER :
					ECHO "!__FILE__!"
					ECHO. & ECHO.
					
				)
				
				SET DEL_OPTIONS=
				SET DO_DELETE=1

			)
		
		
		) ELSE (
				IF "!__PROMPT_BEFORE_DELETE__!" EQU "!__PROMPT_BEFORE_DELETE_ON__!" (
					ECHO.
					ECHO ATTENTION, 
					ECHO les fichiers de meme que :
					ECHO  "!__FILE__!"
					ECHO vont etre supprimes dans son arborescence.
					ECHO.
					PAUSE
					
				) ELSE (
					ECHO. & ECHO.
					ECHO SUPPRESSION DES FICHIERS DE MEME NOM QUE :
					ECHO "!__FILE__!"
					ECHO DANS L'ARBORESCENCE de ce fichier.
					ECHO. & ECHO.
					
				)	

				SET DEL_OPTIONS=/S
				SET DO_DELETE=1
		
		)
		
		IF "!DO_DELETE!" EQU "1" (
			SET DEL_COMMAND=DEL !DEL_OPTIONS! "!__FILE__!"

			!DEL_COMMAND!
		)

		
	(ENDLOCAL
	)
GOTO :EOF


REM ======= Fonction chargee de renvoyer si le DiskElement %1 existe  =======
REM         Renvoi %TRUE% si existe, sinon %FALSE%.
REM
REM PARAM. %1 : DiskElement
REM PARAM. %2 : param. pour retour par référence
REM
:Exists
	SETLOCAL

    SET __DISK_ELEMENT__=%~1

		@REM ECHO.
		@REM ECHO ====== FUNC : Exists - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
    @REM ECHO.
		@REM ECHO __DISK_ELEMENT__='%__DISK_ELEMENT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    IF EXIST "%1" (
      SET __EXISTS__=%TRUE%

    ) ELSE (
      SET __EXISTS__=%FALSE%
    )


	(ENDLOCAL
    SET %2=%__EXISTS__%
	)
GOTO :EOF


REM ======= Fonction chargee de renvoyer si le DiskElement %1 n'existe pas  =======
REM         Renvoi %TRUE% si n'existe pas, sinon %FALSE%.
REM
REM PARAM. %1 : DiskElement
REM PARAM. %2 : param. pour retour par référence
REM
:DoesntExist
	SETLOCAL

    SET __DISK_ELEMENT__=%~1

		@REM ECHO.
		@REM ECHO ====== FUNC : DoesntExist - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
    @REM ECHO.
		@REM ECHO __DISK_ELEMENT__='%__DISK_ELEMENT__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.

    IF NOT EXIST "%1" (
      SET __NOT_EXISTS__=%TRUE%

    ) ELSE (
      SET __NOT_EXISTS__=%FALSE%
    )

		
	(ENDLOCAL
    SET %2=%__NOT_EXISTS__%
	)
GOTO :EOF