 @ECHO OFF
REM LA VAR D'ENV. LIB_NAME  DOIT ETRE DEFINIE EN AMONT !
REM LA VAR D'ENV. FOLDER_TO_PACKAGE_PATH  DOIT ETRE DEFINIE EN AMONT !
REM LES VARS D'ENV. SUBFOLDER_TO_PACKAGE_NAME et SUBFOLDER2_TO_PACKAGE_NAME
REM sont optionnelles.
REM 
REM  >Pour le contenu de FOLDER_TO_PACKAGE_PATH,
REM    seront seulement zippés : les dossiers %LIB_NAME%.*,
REM                            ainsi que les fichiers _Init.bat et __CALL.bat, présents à la racine de FOLDER_TO_PACKAGE_PATH.
REM
REM Il est comme évoqué, également possible de préciser un SUBFOLDER_TO_PACKAGE_NAME :
REM  qui est juste un sous-dossier supplémentaire de FOLDER_TO_PACKAGE_PATH, 
REM  que l'on souhaite également adjoindre au package à produire.
REM  Le Zip résultant contiendra alors à sa racine, ce sous-dossier en plus, avec tout son contenu.
REM  On peut également, dans le même but, préciser un autre sous-dossier
REM  à adjoindre au Zip : SUBFOLDER2_TO_PACKAGE_NAME.
REM
REM Seront après zippage, éliminés du Zip, les éléments suivants :
REM  *.lnk, *Package_MyLib_To*.bat



IF NOT DEFINED LIB_NAME (
  ECHO.
  ECHO LA VAR D'ENVIRONNEMENT  LIB_NAME  DOIT ETRE DEFINIE !
  ECHO.
  PAUSE
  GOTO :EOF
)

IF NOT DEFINED FOLDER_TO_PACKAGE_PATH (
  ECHO.
  ECHO LA VAR D'ENVIRONNEMENT  FOLDER_TO_PACKAGE_PATH  DOIT ETRE DEFINIE !
  ECHO.
  PAUSE
  GOTO :EOF

) ELSE (
  IF NOT EXIST "%FOLDER_TO_PACKAGE_PATH%" (
    ECHO.
    ECHO LE DOSSIER packager :  
    ECHO  "%FOLDER_TO_PACKAGE_PATH%"
    ECHO n'existe PAS.
    ECHO.
    PAUSE
    GOTO :EOF    
  )

)

SET SUBFOLDER_TO_PACKAGE_PATH=%FOLDER_TO_PACKAGE_PATH%/%SUBFOLDER_TO_PACKAGE_NAME%
IF DEFINED SUBFOLDER_TO_PACKAGE_NAME (
  IF NOT EXIST "%SUBFOLDER_TO_PACKAGE_PATH%" (
    ECHO.
    ECHO Le sous-dossier 1, a packager :
    ECHO  "%SUBFOLDER_TO_PACKAGE_PATH%" 
    ECHO n'existe pas. 
    ECHO.
    PAUSE
    GOTO :EOF    
  )
)

SET SUBFOLDER2_TO_PACKAGE_PATH=%FOLDER_TO_PACKAGE_PATH%/%SUBFOLDER2_TO_PACKAGE_NAME%
IF DEFINED SUBFOLDER2_TO_PACKAGE_NAME (
  IF NOT EXIST "%SUBFOLDER2_TO_PACKAGE_PATH%" (
    ECHO.
    ECHO Le sous-dossier 2, a packager :
    ECHO  "%SUBFOLDER2_TO_PACKAGE_PATH%" 
    ECHO n'existe pas. 
    ECHO.
    PAUSE
    GOTO :EOF    
  )
)





REM ===============================================================================================
:READY_TO_START

SET __CURRENT_SCRIPT_PATH_pckg__=%~dp0


REM --------------------- Quelques constantes ----------------------
SET PACKAGES_PATH=%PACKAGES_ROOT_PATH%/____Packages/%LIB_NAME%/zzDOS
SET PACKAGES_ARCHIVES_SUB_PATH=zzzzzzArchives


REM ------- Recup. de Scripts utilitaires et init. d'outils ------------
SET TRANSVERSE_PATH=%__CURRENT_SCRIPT_PATH_pckg__%..
CALL "%TRANSVERSE_PATH%/_Init.bat"

SET TRANSVERSE_INFRA_PATH=%TRANSVERSE_PATH%/Transverse.Infra
SET TRANSVERSE_INFRA_COMMON_PATH=%TRANSVERSE_INFRA_PATH%/_Common
CALL "%TRANSVERSE_INFRA_COMMON_PATH%/_Pathes.bat"
SET DATETIME_TOOL=%TRANSVERSE_INFRA_DATE_TIME_SCRIPT%
SET ZIPPER=%TRANSVERSE_INFRA_7ZIP_SCRIPT%

SET TRANSVERSE_UI_PATH=%TRANSVERSE_PATH%/Transverse.UI
SET TRANSVERSE_UI_COMMON_PATH=%TRANSVERSE_UI_PATH%/_Common
CALL "%TRANSVERSE_UI_COMMON_PATH%/_Pathes.bat"
SET MESSAGES_DISPLAYER=%TRANSVERSE_UI_MESSAGES_MESSAGES_DISPLAYER_SCRIPT%




REM ------------------- Recup. date et heure ---------------------------
SET CURRENT_DATE=
CALL "%DATETIME_TOOL%" GetDate CURRENT_DATE "."

SET THE_TIME=
CALL "%DATETIME_TOOL%" GetTime THE_TIME "h" "m" "s"

SET CURRENT_DATE_TIME=%CURRENT_DATE%_%THE_TIME%


REM ----------------- Nommage du Package a produire --------------------
SET PACKAGE_NAME=%LIB_NAME%_%CURRENT_DATE_TIME%%PACKAGE_NAME_SUFFIX%


REM -------- Nom complet (sans extension), du Package a produire --------
SET PACKAGE_PATH=%PACKAGES_PATH%/%PACKAGES_ARCHIVES_SUB_PATH%
SET PACKAGE_FILE=%PACKAGE_PATH%/%PACKAGE_NAME%


REM --------- Création du chemin du Package, si chemin inexistant -------
IF NOT EXIST "%PACKAGE_PATH%" MD "%PACKAGE_PATH%"

REM -------- Nom complet des dossiers où l'on dézippera --------
SET UNZIPPED_PACKAGE_UNIQUE_FOLDER=%PACKAGES_PATH%/%LIB_NAME%_%CURRENT_DATE_TIME%
SET UNZIPPED_PACKAGE_LAST_DEPLOYMENT_FOLDER=%PACKAGES_PATH%/__%LIB_NAME%_LastVersion


REM ---------------------- CREATION DU PACKAGE -------------------------
CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2

CALL "%ZIPPER%" AddToZip "%PACKAGE_FILE%" "%FOLDER_TO_PACKAGE_PATH%/%LIB_NAME%.*" 
CALL "%ZIPPER%" AddToZip "%PACKAGE_FILE%" "%FOLDER_TO_PACKAGE_PATH%/_Init.bat"

IF EXIST "%FOLDER_TO_PACKAGE_PATH%/__CALL_COMMAND.bat" (
  CALL "%ZIPPER%" AddToZip "%PACKAGE_FILE%" "%FOLDER_TO_PACKAGE_PATH%/__CALL_COMMAND.bat"
)
IF EXIST "%FOLDER_TO_PACKAGE_PATH%/__CALL_COMMAND_BY_SCRIPT_NAME_VAR.bat" (
  CALL "%ZIPPER%" AddToZip "%PACKAGE_FILE%" "%FOLDER_TO_PACKAGE_PATH%/__CALL_COMMAND_BY_SCRIPT_NAME_VAR.bat"
)

IF DEFINED SUBFOLDER_TO_PACKAGE_NAME (
  CALL "%ZIPPER%" AddToZip "%PACKAGE_FILE%" "%SUBFOLDER_TO_PACKAGE_PATH%" 
)
IF DEFINED SUBFOLDER2_TO_PACKAGE_NAME (
  CALL "%ZIPPER%" AddToZip "%PACKAGE_FILE%" "%SUBFOLDER2_TO_PACKAGE_PATH%" 
)


REM ----------- SUPPRESSION DE CERTAINS FICHIERS DU PACKAGE ------------
ECHO. & ECHO.
SET TO_REMOVE_1=*.lnk
SET TO_REMOVE_2=*Package_MyLib_To*.bat
CALL "%ZIPPER%" RemoveAllOccurencesFromZip "%PACKAGE_FILE%" "%TO_REMOVE_1%"
CALL "%ZIPPER%" RemoveAllOccurencesFromZip "%PACKAGE_FILE%" "%TO_REMOVE_2%"


REM ------------------- INFORMATION SUR L'AVANCEMENT --------------------
IF EXIST "%PACKAGE_FILE%.*" (
  CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 4
  CALL "%MESSAGES_DISPLAYER%" WriteMessage "LE PACKAGE"
  CALL "%MESSAGES_DISPLAYER%" WriteMessage " '%PACKAGE_FILE%'"
  CALL "%MESSAGES_DISPLAYER%" WriteMessage "va a present etre dezippe."
  CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
  CALL "%DATETIME_TOOL%" Delay "2" 
)  





REM ------------------- DECOMPRESSION DU PACKAGE -----------------------

ECHO. & ECHO.
REM - DEZIPPAGE dans un dossier unique et un dossier "Last version"(écrasé si existe) -
ECHO. & ECHO.

CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 3
CALL "%MESSAGES_DISPLAYER%" WriteMessage "- Creation du dossier unique : "
CALL "%MESSAGES_DISPLAYER%" WriteMessage "  '%UNZIPPED_PACKAGE_UNIQUE_FOLDER%'"
CALL "%DATETIME_TOOL%" Delay "2"
CALL "%MESSAGES_DISPLAYER%" WriteMessage ""
CALL "%ZIPPER%" UnZipIt "%PACKAGE_FILE%" "%UNZIPPED_PACKAGE_UNIQUE_FOLDER%"

SET DelayBeforeSuppr=5
SET PREFIX_RECREATE=
IF EXIST "%UNZIPPED_PACKAGE_LAST_DEPLOYMENT_FOLDER%" (
  SET PREFIX_RECREATE=Re-
  CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 3
  CALL "%MESSAGES_DISPLAYER%" WriteMessage "- Dans %DelayBeforeSuppr% secondes : SUPPRESSION du dossier avant sa re-creation"
  CALL "%MESSAGES_DISPLAYER%" WriteMessage "  '%UNZIPPED_PACKAGE_LAST_DEPLOYMENT_FOLDER%'"
  CALL "%MESSAGES_DISPLAYER%" WriteMessage ""

  CALL "%DATETIME_TOOL%" Delay "%DelayBeforeSuppr%"
  RD /S /Q "%UNZIPPED_PACKAGE_LAST_DEPLOYMENT_FOLDER%"
)
CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 3
CALL "%MESSAGES_DISPLAYER%" WriteMessage "- %PREFIX_RECREATE%Creation du dossier : "
CALL "%MESSAGES_DISPLAYER%" WriteMessage " '%UNZIPPED_PACKAGE_LAST_DEPLOYMENT_FOLDER%'"
CALL "%DATETIME_TOOL%" Delay "2"
CALL "%MESSAGES_DISPLAYER%" WriteMessage ""
CALL "%ZIPPER%" UnZipIt "%PACKAGE_FILE%" "%UNZIPPED_PACKAGE_LAST_DEPLOYMENT_FOLDER%"


REM ------------------- INFORMATION --------------------
CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 4
CALL "%MESSAGES_DISPLAYER%" WriteMessage "FIN DE L'OPERATION, dossier du package :"
CALL "%MESSAGES_DISPLAYER%" WriteMessage " '%PACKAGES_PATH%'"
CALL "%MESSAGES_DISPLAYER%" WriteMessage "" 2
CALL "%DATETIME_TOOL%" Delay "1"
@REM PAUSE
