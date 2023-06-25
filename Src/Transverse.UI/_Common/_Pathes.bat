@ECHO OFF

SET __xx__CURRENT_SCRIPT_PATH__xx__=%~dp0

SET SRC_UI_COMMON_PATH=%__xx__CURRENT_SCRIPT_PATH__xx__%
SET SRC_UI_PATH=%SRC_UI_COMMON_PATH%..



REM ----- Dépendance vis-à-vis de la couche APPLICATION -------
SET SRC_APPLICATION_PATH=%SRC_UI_PATH%/../Transverse.Application
SET SRC_APPLICATION_COMMON_PATH=%SRC_APPLICATION_PATH%/_Common

CALL "%SRC_APPLICATION_COMMON_PATH%/_Pathes.bat"






REM -------------------- Chemins (et scripts) dans Transverse.UI --------------------------------------

SET SRC_UI_MESSAGES_PATH=%SRC_UI_PATH%/Messages

SET SRC_UI_MESSAGES_MESSAGES_DISPLAYER_SCRIPT=%SRC_UI_MESSAGES_PATH%/MessagesDisplayer.bat


