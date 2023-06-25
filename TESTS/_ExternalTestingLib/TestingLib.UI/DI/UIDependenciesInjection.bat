@ECHO OFF
Rem Must be called by _DependenciesInjection.bat


REM %1 : Le Messages Displayer (script)
REM       (Ce Displayer devra posséder une function WriteMessage(message, nbFoisAffiche))




REM ------------------- "Injection" ---------------------
REM        Met en fait en global des var. d'env.

SET TESTING_LIB_UI_MESSAGES_DISPLAYER=%1