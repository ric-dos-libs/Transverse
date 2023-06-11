@REM @ECHO OFF

IF NOT DEFINED PACKAGE_TYPE (
  ECHO.
  ECHO LA VAR D'ENVIRONNEMENT  PACKAGE_TYPE  DOIT ETRE DEFINIE !
  ECHO   VALEURS ATTENDUES : PROD ou DEV
  ECHO.
  PAUSE
  GOTO :EOF
)


REM --------------------------------------
SET FOLDER_TO_PACKAGE=Src

SET PACKAGES_PATH=%CD%/_Packages
SET PACKAGES_ARCHIVES_SUB_PATH=zzzzzzArchives
SET UNZIPPED_SRC_FOLDER_NAME=Scripts


REM --------------------------------------------------------------------
SET $_CURRENT_SCRIPT_PATH_$=%~dp0
SET SRC_PATH=%$_CURRENT_SCRIPT_PATH_$%/Src
SET SRC_INFRA_PATH=%SRC_PATH%/Transverse.Infra

SET INFRA_DATE_TIME_SCRIPT=%SRC_INFRA_PATH%/DateTime.bat

REM ----------------** Choix du zipper **-------------------------------
SET INFRA_ZIP_SCRIPT=%SRC_INFRA_PATH%/7Zip.bat


REM ----------------- Nommage du Package a produire --------------------
SET CURRENT_DATE=
CALL "%INFRA_DATE_TIME_SCRIPT%" GetDate CURRENT_DATE "."

SET THE_TIME=
CALL "%INFRA_DATE_TIME_SCRIPT%" GetTime THE_TIME "h" "m" "s"

SET CURRENT_DATE_TIME=%CURRENT_DATE%_%THE_TIME%

SET PACKAGE_NAME=%FOLDER_TO_PACKAGE%_%CURRENT_DATE_TIME%
SET PACKAGE_PATH=%PACKAGES_PATH%/%PACKAGE_TYPE%/%PACKAGES_ARCHIVES_SUB_PATH%
SET PACKAGE_FILE=%PACKAGE_PATH%/%PACKAGE_NAME%




REM ---------------------- CREATION DU PACKAGE -------------------------
ECHO. & ECHO.
CALL "%INFRA_ZIP_SCRIPT%" AddToZip "%PACKAGE_FILE%" "./%FOLDER_TO_PACKAGE%" 


REM ----------- SUPPRESSION DE CERTAINS FICHIERS DU PACKAGE ------------
ECHO. & ECHO.
SET TO_REMOVE_1=*.lnk
CALL "%INFRA_ZIP_SCRIPT%" RemoveAllOccurencesFromZip "%PACKAGE_FILE%" "%TO_REMOVE_1%"



REM ------------------- DECOMPRESSION DU PACKAGE -----------------------
REM ---------------- ET RENOMMAGE DU DOSSIER OBTENU de -----------------
REM --------- %FOLDER_TO_PACKAGE% à %UNZIPPED_SRC_FOLDER_NAME% ---------
ECHO. & ECHO.
PUSHD "%CD%"
  CD /D "%PACKAGE_PATH%"
  CD ..
  
  REM -DEMANDE SI SUPPR. ou Non, de la forme dezippee de l'ancien package eventuellement deja existante -
  REM  La Supprimera si on repond Oui !
  IF EXIST "%CD%/%UNZIPPED_SRC_FOLDER_NAME%" RD /S "%CD%/%UNZIPPED_SRC_FOLDER_NAME%"

  REM - DEZIPPAGE et obtention d'un dossier de nom %FOLDER_TO_PACKAGE% -
  ECHO. & ECHO.
  CALL "%INFRA_ZIP_SCRIPT%" UnZipIt "%PACKAGE_FILE%" "."
  
  REM SI ON A REFUSE L'ECRASEMENT (car en effet une question a ete posee suite au RD ... ci-dessus )
  REM c-a-d si %CD%/%UNZIPPED_SRC_FOLDER_NAME% existe encore.
  IF EXIST "%CD%/%UNZIPPED_SRC_FOLDER_NAME%" (
    SET UNZIPPED_SRC_FOLDER_NAME=%UNZIPPED_SRC_FOLDER_NAME%_%CURRENT_DATE_TIME%
  )    
  REN "%FOLDER_TO_PACKAGE%" "%UNZIPPED_SRC_FOLDER_NAME%"

POPD

PAUSE