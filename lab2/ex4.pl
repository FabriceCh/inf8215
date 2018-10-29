/*
Akinator - people
Principe:
    -Avoir une base de connaissances pouvant définir n'importe quelle entité de façon unique avec des booleans
    -Lorsque le jeu commence, le programme demande le moins de questions possibles.
        -Possède une banque d'entités encore possibles (B)
        -Tant que B contient plus d'une entité: 
            -Recherche dans B l'attribut qui possède le plus grand ratio de différence 
                (l'attribut qui une fois déterminé éliminera en moyenne la plus grande quantité d'entités, que ce soit vrai ou faux)
            -Pose la question en lien avec l'attribut trouvé
            -Élimine les entités de B qui ne sont plus possibles
        -La réponse est la seule entité qui reste dans B
*/





ask(real, X) :-
    format('~w is a real person? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(stillAlive, X) :-
    format('~w is still alive? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(politician, X) :- 
    format('~w is a politician? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(religion, X) :- 
    format('~w is related to religion? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(boy, X) :- 
    format('~w is a man? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(artist, X) :- 
    format('~w is an artist? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(games, X) :- 
    format('~w is linked to video games? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(actor, X) :- 
    format('~w is an actor? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(singer, X) :- 
    format('~w is a singer? ', [X]),
    read(Reponse),
    Reponse = 'oui'.

personne(X) :- ask(real, X), real(X).

real(X) :- ask(stillAlive, X), stillAlive(X).
real(X) :- ask(politician, X), politician(X).



%reals (18)
real(michael_jackson).
real(mikhail_gorbachev).
real(jennifer_lawrence).
real(hideo_kojima).
real(banksy).

real(jk_rowling).
real(lady_gaga).
real(quentin_tarantino).
real(joseph_staline).
real(dwight_d_eisenhower).

real(cleopatre).
real(victor_hugo).
real(jesus).
real(ayrton_senna).
real(fernando_alonso).

real(pope_francis).
real(denzel_washington).
real(richard_nixon).

%still alive (10)
stillAlive(mikhail_gorbachev).
stillAlive(jennifer_lawrence).
stillAlive(hideo_kojima).
stillAlive(banksy).
stillAlive(jk_rowling).

stillAlive(lady_gaga).
stillAlive(quentin_tarantino).
stillAlive(fernando_alonso).
stillAlive(pope_francis).
stillAlive(denzel_washington).

%politicians (5)
politician(mikhail_gorbachev).
politician(joseph_staline).
politician(dwight_d_eisenhower).
politician(cleopatre).
politician(richard_nixon).

%linked to religion (3)
religion(jesus).
religion(moses).
religion(pope_francis).

%boiiis (17)
boy(michael_jackson).
boy(mikhail_gorbachev).
boy(hideo_kojima).
boy(banksy).
boy(mario).

boy(quentin_tarantino).
boy(joseph_staline).
boy(dwight_d_eisenhower).
boy(victor_hugo).
boy(jesus).

boy(ayrton_senna).
boy(moses).
boy(fernando_alonso).
boy(pope_francis).
boy(james_bond).

boy(denzel_washington).
boy(richard_nixon).

%artists (8)
artist(michael_jackson).
artist(jennifer_lawrence).
artist(banksy).
artist(jk_rowling).
artist(lady_gaga).

artist(quentin_tarantino).
artist(victor_hugo).
artist(denzel_washington).



%related to video games (4)
games(hideo_kojima).
games(lara_croft).
games(mario).
games(james_bond).

%actor (3)
actor(jennifer_lawrence).
actor(quentin_tarantino).
actor(denzel_washington).

%singer (2)
singer(michael_jackson).
singer(lady_gaga).


michael_jackson.
mikhail_gorbachev.
jennifer_lawrence.
hideo_kojima.
banksy.
lara_croft.
mario.
jk_rowling.
lady_gaga.
quentin_tarantino.
joseph_staline.
dwight_d_eisenhower.
cleopatre.
victor_hugo .
jesus.
ayrton_senna.
moses.
fernando_alonso.
pope_francis.
james_bond.
denzel_washington.
richard_nixon.