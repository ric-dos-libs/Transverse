@ECHO OFF


SET _$$$_CURRENT_SCRIPT_PATH_$$$dex_=%~dp0





REM ===========================================================================	
Rem %1 : retour par référence de l'assertion result ID (du Domain) mais converti pour 
Rem      le monde extérieur à la couche Application.
Rem %2 : DiskElement


SET __CONVERTED_ASSERTION_RESULT_ID__=
CALL "%TESTING_APPLICATION_DISK_ELEMENTS_SERVICE%" DoesntExist %2 __CONVERTED_ASSERTION_RESULT_ID__


SET %1=!__CONVERTED_ASSERTION_RESULT_ID__!

GOTO :EOF