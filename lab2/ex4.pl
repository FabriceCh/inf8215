/*
Akinator - people
Principe:
    -Avoir une base de connaissances pouvant définir n'importe quel personne de façon unique avec des booleans
    -Lorsque le jeu commence, le programme demande le moins de questions possibles.
        -Possède une banque de personnes encore possibles (B)
        -Tant que B contient plus d'une personne: 
            -Recherche dans B l'attribut qui possède le plus grand ratio de différence 
                (l'attribut qui une fois déterminé éliminera en moyenne la plus grande quantité de personnes, que ce soit vrai ou faux)
            -Pose la question en lien avec l'attribut trouvé
            -Élimine les personnes de B qui ne sont plus possibles
        -La réponse est la seule personne qui reste dans B
*/



personne(X) :- ask(real, X), real(X).

%reals
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

%politicians
politician(mikhail_gorbachev).
politician(joseph_staline).
politician(dwight_d_eisenhower).
politician(cleopatre).
politician(richard_nixon).

%linked to religion
religion(jesus).
religion(moses).
religion(pope_francis).

%boiiis
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

%related to art
artist(michael_jackson).
artist(jennifer_lawrence).
artist(banksy).
artist(jk_rowling).
artist(lady_gaga).
artist(quentin_tarantino).
artist(victor_hugo).
artist(denzel_washington).

%still alive
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

%related to video games
games(hideo_kojima).
games(lara_croft).
games(mario).
games(james_bond).

%actor
actor(jennifer_lawrence).
actor(quentin_tarantino).
actor(denzel_washington).

%singer
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