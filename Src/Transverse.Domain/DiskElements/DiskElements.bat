@ECHO OFF


SET CURRENT_NAMESPACE=Transverse.Domain.DiskElements
SET _CURRENT_SCRIPT_NAME_EXT_=%~nx0



REM ==================== FUNCTION CALL ====================================	
IF %1. EQU GetDiskElementExtension. (
	CALL :GetDiskElementExtension %2 %3
	
) ELSE IF %1. EQU AddExtensionToDiskElementIfHasNoExtensionAtAll. (
	CALL :AddExtensionToDiskElementIfHasNoExtensionAtAll %2 %3 %4
	
) 

GOTO :EOF	

	
	
	
	
	
	
	
REM =============================================================================================================================================
REM ======================================= FUNCTIONS DEFINITION ================================================================================
REM =============================================================================================================================================
	
	
	
REM ======= Fonction chargee de retourner l'extension du DiskElement %1  =======
REM 		
REM PARAM. %1 : (chemin+)nom.ext du DiskElement.
REM PARAM. %2 : variable reçue par référence qui suite à cet appel, contiendra l'extension de %1.
REM
REM RETURNS : par référence, le PARAM %2.
REM
:GetDiskElementExtension
	SETLOCAL
				
		SET __DISK_ELEMENT_FULLNAME__=%~1

		
		@REM ECHO.
		@REM ECHO ====== FUNC : GetDiskElementExtension - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM ECHO __DISK_ELEMENT_FULLNAME__='%__DISK_ELEMENT_FULLNAME__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.		

		FOR %%F IN ("%__DISK_ELEMENT_FULLNAME__%") DO SET "__DISK_ELEMENT_EXT__=%%~xF"

		REM SUPPR. DE L'EVENTUEL "." RESIDUEL (Dans le cas ou __DISK_ELEMENT_EXT__ non vide en fait)
		IF "%__DISK_ELEMENT_EXT__%x" NEQ "x" (
			SET __DISK_ELEMENT_EXT__=%__DISK_ELEMENT_EXT__:.=%
		)
	
		
	(ENDLOCAL
		SET %2=%__DISK_ELEMENT_EXT__%
	)
GOTO :EOF



REM ======= Fonction chargee de retourner %1 s'il possède déjà une extension(quelconque) =======
REM         sinon de retourner %1 avec l'extension %2.
REM 		
REM PARAM. %1 : (chemin+)nom.ext du DiskElement.
REM PARAM. %2 : extension à ajouter si besoin.
REM PARAM. %3 : variable reçue par référence qui suite à cet appel, contiendra le résultat.
REM
REM RETURNS : par référence, le PARAM %3.
REM
:AddExtensionToDiskElementIfHasNoExtensionAtAll
	SETLOCAL
				
		SET __DISK_ELEMENT_FULLNAME__=%~1
    SET __EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE__=%~2
		
		@REM ECHO.
		@REM ECHO ====== FUNC : AddExtensionToDiskElementIfHasNoExtensionAtAll - '%_CURRENT_SCRIPT_NAME_EXT_%' - [ %CURRENT_NAMESPACE% ] ======
		@REM ECHO.
		@REM ECHO __DISK_ELEMENT_FULLNAME__='%__DISK_ELEMENT_FULLNAME__%'
    @REM ECHO __EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE__='%__EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE__%'
		@REM ECHO.
		@REM PAUSE
		@REM ECHO. & ECHO.		

    SET __CURRENT_EXTENSION__=
    CALL :GetDiskElementExtension "%__DISK_ELEMENT_FULLNAME__%" __CURRENT_EXTENSION__
    @REM ECHO __CURRENT_EXTENSION__='%__CURRENT_EXTENSION__%'

    IF "%__CURRENT_EXTENSION__%x" EQU "x" (
      REM On retire l'éventuel "." final de __DISK_ELEMENT_FULLNAME__
      CALL "%TRANSVERSE_COMMON_STRING_SCRIPT%" EndsWith "%__DISK_ELEMENT_FULLNAME__%" "." "%FALSE%" __DISK_ELEMENT_FULLNAME__
      @REM ECHO __DISK_ELEMENT_FULLNAME__='!__DISK_ELEMENT_FULLNAME__!'

      SET __RESULTING_DISK_ELEMENT_FULLNAME__=!__DISK_ELEMENT_FULLNAME__!.%__EXTENSION_TO_ADD_IF_NOT_ALREADY_ONE__%

    ) ELSE (
      SET __RESULTING_DISK_ELEMENT_FULLNAME__=%__DISK_ELEMENT_FULLNAME__%
    )
	
		
	(ENDLOCAL
		SET %3=%__RESULTING_DISK_ELEMENT_FULLNAME__%
	)
GOTO :EOF

