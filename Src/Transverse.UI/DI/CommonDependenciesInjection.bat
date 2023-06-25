@ECHO OFF
Rem Must be called by _DependenciesInjection.bat

Rem %1 : errors handler






REM ------------------- "Injection" ---------------------
REM        Met en fait en global des var. d'env.

SET TRANSVERSE_COMMON_ERRORS_HANDLER=%~1