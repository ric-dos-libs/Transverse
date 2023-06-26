@ECHO OFF
Rem Must be called by _DependenciesInjection.bat

Rem %1 : errors handler (script devant posséder une function : RaiseFatalError(errorMsg))






REM ------------------- "Injection" ---------------------
REM        Met en fait en global des var. d'env.

SET TRANSVERSE_API_ERRORS_HANDLER=%~1