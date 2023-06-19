Transverse._Common : sources communs/dispos pour toutes les couches (Application, Domain, Infra).
                     ATTENTION : afin de bien rester en phase avec la philosophie envisagée,
                                 la dépendance DOIT toujours être des couches VERS Transverse._Common, 
                                 jamais l'inverse !! 
(Même principe dans _ExternalTestingLib/ avec TestLib._Common/)                                 

----------------------------------

Quant au répertoire _Common, que l'on peut trouver à la racine de certaines couches, 
il sert de soutien commun, uniquement aux divers scripts de la dite couche. 

On notera que la couche Transverse._Common (idem pour TestLib._Common), 
contient à sa racine, un script _Pathes.bat, dont le rôle est de fournir des chemins ou nom de scripts, 
que sont suceptibles d'avoir besoin les : 
  .divers Transverse.xxx/_Common/_Pathes.bat
  .ainsi que les divers scripts de la couche Transverse._Common elle-même (idem pour TestLib._Common).

ATTENTION : pour des raisons de Clean Design, je souhaite que ce _Pathes.bat ne référence directement,
            QUE des chemins dans le périmètre des couches que sa présente couche est en droit d'adresser.
            Voir ci-dessous :



---------------------------------

Rappels : Src/Transverse.UI peut dépendre d'elle-même, et de :
            Src/Transverse._Common, Src/Transverse.Infra, et éventuellement Src/Transverse.Domain
          Src/Transverse.Infra peut dépendre d'elle-même, et de :
            Src/Transverse._Common, Src/Transverse.Application, et éventuellement Src/Transverse.Domain
          Src/Transverse.Application peut dépendre d'elle-même, et de :
            Src/Transverse._Common, Src/Transverse.Domain.            
          Src/Transverse.Domain peut dépendre d'elle-même, et de :
            Src/Transverse._Common.            
          Src/Transverse._Common peut dépendre d'elle-même, et c'est tout !


          TESTS/Transverse.Infra peut dépendre d'elle-même, et de :
            TESTS/Transverse._Common et Src/Transverse.Infra.
    ???         (et éventuellement Src/Transverse._Common  VIA  TESTS/Transverse._Common)             
    ????(et éventuellement TESTS/Transverse.Application et TESTS/Transverse.Domain)
ET D'_ExternalTestingLib.... VIA .... ????     
          TESTS/Transverse.Application peut dépendre d'elle-même, et de :
            TESTS/Transverse._Common et Src/Transverse.Application. 
    ???         (et éventuellement Src/Transverse._Common  VIA  TESTS/Transverse._Common) 
    ???(et éventuellement TESTS/Transverse.Domain)

          TESTS/Transverse.Domain peut dépendre d'elle-même, et de :
            TESTS/Transverse._Common et Src/Transverse.Domain.
    ???         (et éventuellement Src/Transverse._Common  VIA  TESTS/Transverse._Common) 

          TESTS/Transverse._Common peut dépendre d'elle-même, et de :
            Src/Transverse._Common.
          (Pour le dossier TESTS/Transverse._Common/_ExternalTestingLib/, voir explications plus bas.)



SIMULATION CONTRATS/INTERFACES:
-------------------------------
On pourra également noter qu'ici, Src/Transverse.UI/Messages/MessagesDisplayer.bat
est une IMPLÉMENTATION d'un afficheur possédant une function WriteMessage.
Lorsqu'un script d'une couche Non UI, souhaite bénéficier de ce script en l'appelant, 
il devra le voir comme un afficheur abstrait, comme une injection dépendance d'un type abstrait qui 
lui est faite, ceci pour ne pas dépendre de l'implémentation de cet afficheur. 
 Voir exemple dans _Run_Tests.bat qui choisit cette implémentation(=avoir une function WriteMessage)
 et la transmet aux divers scripts de tests, en tant que var. comme abstraite : MESSAGES_DISPLAYER.
 La seule chose que les utilisateurs en attendront c'est bien que ce script afficheur, possède bien
 une function WriteMessage(avec telle signature), car pour eux peu importe qu'il s'agisse concrètement 
 de Src/Transverse.UI/Messages/MessagesDisplayer.bat ou autre chose, seul le fait que ce Displayer possède
une function WriteMessage les intéresse.
Mon Src/Transverse.Infra/7Zip.bat est aussi basé sur cette idée : un script de gestion de zippage, avec des functions 
de base de zippage à implémenter. Ce script pourra alors être transmis en param. ou via var d'env. à d'autres, 
et ces derniers ont juste à savoir qu'il offre telles ou telles functions, mais n'ont pas du tout besoin de savoir
qu'il s'agit (niveau implémentation) de sevenZip ou autre chose !




On notera que ce qui se stitue dans TESTS/Transverse._Common/_ExternalTestingLib/,
équivaut à une sorte de librairie externe d'aide aux tests, et qu'on aurait 
voulue externe à notre projet DOS(Src/ et ses TESTS/) en lui-même.
C-à-d que _ExternalTestingLib serait normalement un Package à part avec ses propres couches.
Mais pour simplifier, j'ai quand même mis ceci dans ce dossier _ExternalTestingLib/
de TESTS/Transverse._Common/, puisqu'en effet ça n'est utilisé que pour la partie TESTS.
DONC ÉVIDEMMENT, _ExternalTestingLib TOTALEMENT INDÉPENDANT, n'aura absolument aucune référence vers Src/ ou TESTS/,
tout au plus on lui passera en param./var d'env., un EXTERNAL_TESTING_LIB_MESSAGES_DISPLAYER implémentant une 
certaine interface (c-à-d ici le fait d'avoir une function WriteMessage recevant en param. un texte).