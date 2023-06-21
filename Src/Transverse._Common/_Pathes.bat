@ECHO OFF

SET __c__CURRENT_SCRIPT_PATH__c__=%~dp0


SET SRC_COMMON_PATH=%__c__CURRENT_SCRIPT_PATH__c__%






REM -------------------- Chemins (et scripts) dans Transverse._Common --------------------------------------

SET SRC_COMMON_CHECK_FATAL_ERRORS_SCRIPT=%SRC_COMMON_PATH%CheckFatalErrors.bat
SET SRC_COMMON_CONSTANTS_SCRIPT=%SRC_COMMON_PATH%Constants.bat
SET SRC_COMMON_VARS_SCRIPT=%SRC_COMMON_PATH%Vars.bat
SET SRC_COMMON_STRING_SCRIPT=%SRC_COMMON_PATH%String.bat