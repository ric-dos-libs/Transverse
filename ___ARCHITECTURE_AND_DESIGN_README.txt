Ci-dessous, je parle de la "librairie" "Transverse", mais peu importe, il pourrait s'agir 
d'une toute autre "librairie" "ZZZ", "TestingLib", etc... !


================================ ATTENTION =======================================

>>>>> AVANT de pouvoir utiliser une Lib,
      IL FAUDRA LANCER une fois (au moins), le _Init.bat situé à sa racine.



============= Concernant le répertoire SRC/ =====================================================================

  - Transverse._Common : sources communs/dispos pour toutes les couches (Application, Domain, API, UI, Infra).
                       ATTENTION : afin de bien rester en phase avec la philosophie envisagée,
                                   la dépendance DOIT toujours être des couches VERS Transverse._Common, 
                                   jamais l'inverse !! 

  - Aussi, on gardera comme cap : CLEAN ARCHITECTURE (avec dépendances des couches respectées et mono-directionnelle).
     Les couches .API(Controllers (pour requêtes JSON)), 
                 .UI(Views,ViewModels, Controllers(pour requêtes de Views)) 
                 .Infra (Implém. de Repositories, Divers services bas niveau, etc...)
     dépendent de la couche Application, et donc se plient à ses Interfaces et DTOs, etc...


  - Un peu plus détail :
    SRC/Transverse._Common, contient notamment à sa racine, un fichier _Pathes.bat,
      -(qui contient sous forme de vars d'env., des chemins pointant UNIQUEMENT dans la couche SRC/Transverse._Common)-
    et ce SRC/Transverse._Common/_Pathes.bat ne DEVRA être invoqué DIRECTEMENT QUE comme suit :
        - soit par n'importe quel source de la couche SRC/Transverse._Common elle-même.
        - soit par le source _Pathes.bat du répertoire racine _Common de la couche Domain,
          c-à-d par : SRC/Transverse.Domain/_Common/_Pathes.bat

          Plus précisément :
            * Le fichier SRC/Transverse.Domain/_Common/_Pathes.bat contient :
              - un appel à SRC/Transverse._Common/_Pathes.bat
              - et sous forme de vars d'env., des chemins pointant dans la couche SRC/Transverse.Domain elle-même.
            
            * Le fichier SRC/Transverse.Application/_Common/_Pathes.bat contient : 
              - un appel à SRC/Transverse.Domain/_Common/_Pathes.bat
              - et sous forme de vars d'env., des chemins pointant dans la couche SRC/Transverse.Application elle-même.


            * Le fichier SRC/Transverse.Infra/_Common/_Pathes.bat contient : 
              - un appel à SRC/Transverse.Application/_Common/_Pathes.bat
              - et sous forme de vars d'env., des chemins pointant dans la couche SRC/Transverse.Infra elle-même.

            * Le fichier SRC/Transverse.API/_Common/_Pathes.bat contient : 
              - un appel à SRC/Transverse.Application/_Common/_Pathes.bat
              - et sous forme de vars d'env., des chemins pointant dans la couche SRC/Transverse.API elle-même.

            * Le fichier SRC/Transverse.UI/_Common/_Pathes.bat contient : 
              - un appel à SRC/Transverse.Application/_Common/_Pathes.bat
              - et sous forme de vars d'env., des chemins pointant dans la couche SRC/Transverse.UI elle-même.





============= Concernant le répertoire TESTS/ =====================================================================
        (Son arborescence doit suivre celle de SRC/, concernant les éléments à tester)

        * Le fichier TESTS/Transverse._Common/_Pathes.bat contient :
           - un appel à SRC/Transverse._Common/_Pathes.bat
           - et sous forme de vars d'env., des chemins pointant dans la couche TESTS/Transverse._Common elle-même.

        * Le fichier TESTS/Transverse.Domain/_Common/_Pathes.bat contient :
           - un appel à TESTS/Transverse._Common/_Pathes.bat et à SRC/Transverse.Domain/_Common/_Pathes.bat
           - et sous forme de vars d'env., des chemins pointant dans la couche TESTS/Transverse.Domain elle-même.
        
        * Le fichier TESTS/Transverse.Application/_Common/_Pathes.bat contient :
           - un appel à TESTS/Transverse._Common/_Pathes.bat et à SRC/Transverse.Application/_Common/_Pathes.bat
           - et sous forme de vars d'env., des chemins pointant dans la couche TESTS/Transverse.Application elle-même.


        * Le fichier TESTS/Transverse.Infra/_Common/_Pathes.bat contient :
           - un appel à TESTS/Transverse._Common/_Pathes.bat et à SRC/Transverse.Infra/_Common/_Pathes.bat
           - et sous forme de vars d'env., des chemins pointant dans la couche TESTS/Transverse.Infra elle-même.






================================ SIMULATION de D.I. et D'INTERFACES POUR DECOUPLAGE =============================

On trouvera un exemple dans ma "librairie" TestingLib.
Qui comporte un fichier TestingLib.Infra\_Init.bat (équivalent Startup.cs :) disons),
dans lequel on pratique une pseudo Injection de Dépendances, en y appelant
des bats comme : TestingLib.Infra\DI\DomainDependenciesInjection.bat ou ApplicationDependenciesInjection.bat,
chargés de fixer une valeur globale dans une var d'env., pour préciser
par exemple, une implémentation de Repository (script), dans une var d'env. 
qui sera alors exploitable par les scripts attendant cette var nommée.
Mais évidemment cette var (ce script) précisé donc en amont,
devra pour que ça fonctionne, posséder les functions attendues 
par le code l'utilisant (respectant par là un contrat, une interface comme attendue).
