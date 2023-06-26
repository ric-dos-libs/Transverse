  Tout d'abord concernant la sous-architecture zzTesting
    (de par ses couches _Common, Domain, Application, Infra, etc...) ,
  elle doit obéir aux mêmes règles que l'Architecture Transverse.*,
  règles décrites plus bas.

  J'ai annexé Testing, directement dans la "solution"  de développement de la
  "librairie" Transverse, car bien qu'elle soit pensée uniquement pour être
  utilisée uniquement par la partie TESTS/ d'une architecture (par ex. ici /TESTS/),
  elle dépend quand même, de quelques fichiers généraux de l'architecture Transverse !
   (CheckFatalErrors.bat, Vars.bat, ...), je ne voulais pas dupliquer.
  Après tout, l'idée du mot "TRANSVERSE" est d'offrir un complet d'outils transverses,
  aussi bien pour faire du Testing que pour faire tout autre chose.
  Je livre donc comme un tout, mais dans lequel j'essaie toutefois de maintenir le strict 
  minimum de dépendances, et en respctant bien celles-ci AUSSI à l'intérieur de chaque archi. même,
  c-à-d dépendance entre couches 
     (_Common<-Domain<-Application<-(Infra,UI,API) et Application->_Common, et (Infra,UI,API)->_Common)
  Transverse pourra donc servir dans son intégralité livrée, comme "librairie" de base, 
  pour toute autre archi. future.


================================ ATTENTION =======================================

La librairie Transverse.* hors TESTS/ NE DOIT PAS DÉPENDRE du tout de l'archi. Testing !!!!
La dépendance peut par contre, SI VARIMENT BESOIN, s'éxercer dans l'autre sens,
mais l'idée est quand même que la lib. Testing conserve au maximum son autonomie.

DONC AUCUNE partie de l'archi. Transverse.* (hors TESTS/) ne doit référencer un quelconque 
élément de l'archi. Testing !!

REM.: afin que la lib. Testing ait le minimum de points de contact avec la lib. Transverse,
      chaque couche de la lib. Testing, possède un script _PathesToTransverse.bat,
      qui sera son point unique de contact, avec la couche de même nom dans la lib. Transverse.



================================ ATTENTION =======================================

>>>>> AVANT de pouvoir utiliser la présente architecture :
         IL FAUDRA avoir LANCÉ une fois (au moins), le _Init.bat situé à sa racine.


>>>>> AVANT de pouvoir utiliser l'architecture Testing :
         IL FAUDRA avoir LANCÉ une fois (au moins), le _Init.bat situé à sa racine.

   REM.: chaque couche de chaque lib., possède son errors handler, 
         ex. : TRANSVERSE_INFRA_ERRORS_HANDLER pour la couche Infra de la lib. Transverse.
               TESTING_UI_ERRORS_HANDLER pour la couche UI de la lib Testing.
         Même si en réalité, pour une lib. donnée, pour l'instant on a affecté 
         le même à toutes ses couches (cf. _Init.bat à la racine de la lib.).



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

