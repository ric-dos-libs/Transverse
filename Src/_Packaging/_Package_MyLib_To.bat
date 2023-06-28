@ECHO OFF
REM
REM La VAR D'ENV.  PACKAGE_TYPE devra etre precisee en amont
REM  (Valeurs acceptees: DEV  ou PROD)
REM


SET pckml_CURRENT_SCRIPT_PATH_pckml=%~dp0
SET FOLDER_TO_PACKAGE_PATH=%pckml_CURRENT_SCRIPT_PATH_pckml%..
REM ----------------------------------------------------------------




SET LIB_NAME=Transverse
SET SUBFOLDER_TO_PACKAGE_NAME=_Packaging
SET SUBFOLDER2_TO_PACKAGE_NAME=zzzTesting

Rem Chemin du script PACKAGE_TO_%PACKAGE_TYPE%.bat à utiliser.
SET PACKAGER_PATH=%pckml_CURRENT_SCRIPT_PATH_pckml%




REM ----------------------------------------------------------------
SET PACKAGER=%PACKAGER_PATH%/PACKAGE_TO_%PACKAGE_TYPE%.bat
IF DEFINED PACKAGE_TYPE (
  IF EXIST "%PACKAGER%" (
    CALL "%PACKAGER%"

  ) ELSE (
    ECHO.
    ECHO Le Packager :
    ECHO  '%PACKAGER%'
    ECHO n'existe pas.
    ECHO.

  )

) ELSE (
  ECHO.
  ECHO La var d'environnement PACKAGE_TYPE doit etre precisee.
  ECHO.

)  
pause