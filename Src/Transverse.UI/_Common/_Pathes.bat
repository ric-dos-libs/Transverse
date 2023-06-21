@ECHO OFF

SET __xx__CURRENT_SCRIPT_PATH__xx__=%~dp0

SET SRC_UI_COMMON_PATH=%__xx__CURRENT_SCRIPT_PATH__xx__%
SET SRC_UI_PATH=%SRC_UI_COMMON_PATH%..

SET SRC_INFRA_PATH=%SRC_UI_PATH%/../Transverse.Infra
SET SRC_INFRA_COMMON_PATH=%SRC_INFRA_PATH%/_Common

CALL "%SRC_INFRA_COMMON_PATH%/_Pathes.bat"




REM -------------------- Chemins (et scripts) dans Transverse.UI --------------------------------------

SET SRC_UI_MESSAGES_PATH=%SRC_UI_PATH%/Messages

SET SRC_UI_MESSAGES_MESSAGES_DISPLAYER_SCRIPT=%SRC_UI_MESSAGES_PATH%/MessagesDisplayer.bat


