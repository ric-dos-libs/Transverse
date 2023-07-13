@ECHO OFF
REM  Le présent .bat, permet de ne pas avoir à effectuer soi-même, l'appel préalable nécessaire(1fois), à ./_Init.bat.
REM
REM  PERMET D'EFFECTUER SUR LA PRÉSENTE LIBRAIRIE, UN APPEL A UNE FONCTION(de type "COMMANDE") D'UN SCRIPT À PRÉCISER DONC.
REM     -(COMMANDE : c-à-d pas de valeur attendue en retour de la fonction !!!)-
REM
REM   %1 : chemin+nom+ext (entre guillemets) du script dont lancer une fonction de type COMMANDE donc.
REM   %2 : Nom de la fonction (de type COMMANDE), NE PAS le mettre entre guillemets !
REM 
REM  Attention la fonction lancée, ne pourra l'être qu'avec au maximim 7 arguments : %3 à %9 !
REM 
REM    EXEMPLE : __call_command "./Transverse.Infra/7Zip.bat" PartialUnZip "J:/____Common/zzMyLocalPublishedPackages/ClassLibrary1.2.0.0.12.nupkg" "_rels/.rels" "t:/zzzUnPack"
REM
REM
REM  ATTENTION : LE PRÉSENT .BAT n'est PAS GARANTI exploitable pour lancer un appel à une fonction(de type QUERY) 
REM              c-à-d censée renvoyer une valeur.
REM              Pour faire cela, il faudra en général, taper le code à la main
REM               (donc appel manuel préalable au ./_Init.bat (1 fois suffira)), 
REM              PUIS potentiellement encadrer
REM              l'appel à la fonction(de type QUERY donc) du Script à lancer
REM              par un "SETLOCAL ENABLEDELAYEDEXPANSION ... ENDLOCAL":
REM               SETLOCAL ENABLEDELAYEDEXPANSION 
REM                 SET RETURNED_VALUE=
REM                 CALL "CheminNomDuScript.bat" NomFonctionDeTypeQuery ... RETURNED_VALUE ...
REM                 Rem RETURNED_VALUE accessible qu'ICI mais PAS après le ENDLOCAL !!
REM               ENDLOCAL
ECHO.
ECHO.



REM ---- Appel du _Init.bat, pour création de diverses vars d'env. nécessaires ou utiles ----
SET xx__CUR_DIR__xx=%~dp0
CALL "%xx__CUR_DIR__xx%_Init.bat"



REM ---- Vérifs ----
SET __SCRIPT_TO_LAUNCH__=%~1
SET __FUNCTION_TO_LAUNCH__=%2

CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__SCRIPT_TO_LAUNCH__"
CALL "%TRANSVERSE_COMMON_CHECK_FATAL_ERRORS_SCRIPT%" CheckVarExists "__FUNCTION_TO_LAUNCH__"



REM ---- Lancement de la fonction(de type COMMANDE) du script "%__SCRIPT_TO_LAUNCH__%" ----
CALL "%__SCRIPT_TO_LAUNCH__%" %__FUNCTION_TO_LAUNCH__%   %3 %4 %5 %6 %7 %8 %9


Rem pause


REM =====================================================================================
