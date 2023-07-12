@ECHO OFF
Rem Must be called by _DependenciesInjection.bat

Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))
Rem %2 : messages displayer (script devant posséder une function : WriteMessage(msg, nbFoisAffiche=1))





REM ------------------- "Injection" ---------------------
REM        Met en fait en global des var. d'env.

SET TRANSVERSE_INFRA_ERRORS_HANDLER=%~1
SET TRANSVERSE_INFRA_MESSAGES_DISPLAYER=%~2