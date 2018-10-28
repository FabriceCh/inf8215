/*
Akinator - people
Principe:
    -Avoir une base de connaissances pouvant définir n'importe quel personne de façon unique avec des booleans
    -Lorsque le jeu commence, le programme demande le moins de questions possibles.
        -Possède une banque de personnes encore possibles (B)
        -Tant que B contient plus d'une personne: 
            -Recherche dans B l'attribut qui possède le plus grand ratio de différence 
                (l'attribut qui une fois déterminé éliminera la plus grande quantité de personnes, que ce soit vrai ou faux)
            -Pose la question en lien avec l'attribut trouvé
            -Élimine les personnes de B qui ne sont plus possibles
        -La réponse est la seule personne qui reste dans B
*/

write('welcome to Akinator! I will ask you some questions and try to guess what person you are thinking about.').