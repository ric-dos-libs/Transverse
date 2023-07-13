REM PERMET D'EFFECTUER UN APPEL A UNE FONCTIONNALITÉ (%1) DE LA PRÉSENTE LIBRAIRIE, 
REM SANS AVOIR A SE SOUCIER DE L'APPEL PRÉALABLE NÉCESSAIRE à ./_Init.bat !
REM  Attention toutefois : la commande (%1) à lancer, ne pourra pas être lancée avec plus de de 8 arguments !
ECHO.
ECHO.

SET xx__CUR_DIR__xx=%~dp0
CALL "%xx__CUR_DIR__xx%\_Init.bat" 

CALL %1  %2 %3 %4 %5 %6 %7 %8 %9

Rem pause
