@ECHO OFF

SET __TESTING_LIB_ROOT_PATH__tstl=%~dp0


REM %1 : Le Messages Displayer (script)
REM       (Ce Displayer devra posséder une function WriteMessage(message, nbFoisAffiche))


CALL "%__TESTING_LIB_ROOT_PATH__tstl%TestingLib.API/_Init.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
CALL "%__TESTING_LIB_ROOT_PATH__tstl%TestingLib.UI/_Init.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
CALL "%__TESTING_LIB_ROOT_PATH__tstl%TestingLib.Infra/_Init.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9