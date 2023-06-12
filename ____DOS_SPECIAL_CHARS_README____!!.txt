Le DOS possèdent certains caractères spéciaux, qu'il n'est pas si simple de faire intervenir dans
des formules DOS (traitement sur var d'env. en possédant, par exemple), ou pas si simple à integrer au sein 
de la valeur d'une var. d'env., sans que cela pose problème par la suite, ou soit mal interprété par la suite 
ou d'emblée.

contiennent ou non CES CARACTÈRES !
 identifiés à ce jour comme tels :
   %   
   !   
   "


>>>DANS MES TESTS, j'ai arrêté, je NE m'amuse(rai) PLUS à vouloir TRAITER LES CAS OÙ mes vars 
contiennent CES CARACTÈRES !
Tant pis pas le temps, top gourmand/redondant et contraignant à fair, et surtout *INUTILE*,
puisque l'on sait d'emblée que le test va foirer.
DONC MON MESSAGE EST CLAIR : si une var. d'env. contient l'un de ces caractères, la probabilité
pour qu'une de mes fonctions la recevant en param., foire ou n'honore pas correctement sa mission,
est quasi-certaine. Voilà, c'est dit et à retenir.


NEANMOINS, il faut tout de même savoir ceci :
 D'une façon générale, POUR METTRE DANS UNE VAR D'ENV. le SYMBOLE :
   %   : il faut l'échapper par %  :   SET v=10%%   ( sera alors bien interprete comme : SET v=10% )
   !   : il faut l'échapper par ^ ET mettre le tout entre guillemets :   "SET v=10^!"  ( sera alors bien interprete comme : SET v=10! )
   
   "   : il n'y a rien a faire :   SET v=10" sera bien interprete comme  : SET v=10"
   ""   : il n'y a rien a faire :  SET v=10"" sera bien interprete comme  : SET v=10""
    PAR CONTRE, LE SOUCI avec les GUILLEMETS, c'est que les GUILLEMETS ENCADRANTES POUR LES PARAMS 
    SERONT RETIREES par mes bat de FUNCTIONS, ou les FUNCTIONS elles-même ! Gênant....


BON VOILA, donc nous voilà mis en garde et invités à être vigilants...    