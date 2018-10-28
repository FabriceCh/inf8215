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

ask(gouverne, Y) :-
    format('~w gouverne ? ', [Y]),
    read(Reponse),
    Reponse = 'oui'.

ask(musicien, X) :-
    format('~w est un musicien ? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(chanteur, X) :-
    format('~w est un chanteur ? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

personne(X) :- politicien(X).
personne(X) :- artiste(X).
artiste(X) :- ask(chanteur, X), chanteur(X).
artiste(X) :- ask(musicien, X), musicien(X).
politicien(X) :- gouverne(X, Y), pays(Y), ask(gouverne, Y).
chanteur(celine_dion).
musicien(john_lewis).
gouverne(stephen_harper,canada).
gouverne(barack_obama,usa).
pays(canada).
pays(usa).