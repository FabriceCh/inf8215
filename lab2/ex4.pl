/*
Akinator - people
*/

%questions
ask(real, X) :-
    format('~w is a real person? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(stillAlive, X) :-
    format('~w is still alive? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(politician, X) :- 
    format('~w is a politician? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(religion, X) :- 
    format('~w is related to religion? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(boy, X) :- 
    format('~w is a man? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(artist, X) :- 
    format('~w is an artist? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(games, X) :- 
    format('~w is linked to video games? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(actor, X) :- 
    format('~w is an actor? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(singer, X) :- 
    format('~w is a singer? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(plumber, X) :-
    format('~w is a plumber? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(american, X) :-
    format('~w is american? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(army_general, X) :-
    format('~w is an army general? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(black, X) :-
    format('~w is black? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

%tree
personne(X) :- ask(real, X), qreal(X).
personne(X) :- ask(games, X), qgames(X).
personne(X) :- true, m(X). %moses

qgames(X) :- ask(boy, X), qboy(X).
qgames(X) :- true, lc(X). %lara croft

qboy(X) :- ask(plumber, X), mario(X). %mario
qboy(X) :- jb(X). %james bond

qreal(X) :- ask(stillAlive, X), qstillAlive(X).
qreal(X) :- ask(politician, X), qpolitician(X).
qreal(X) :- ask(artist, X), qartist(X).
qreal(X) :- ask(religion, X), jesus(X). %jesus
qreal(X) :- true, as(X). %Ayrton Senna

qpolitician(X) :- ask(american, X), qamerican(X).
qpolitician(X) :- ask(boy, X), j(X). %joseph staline
qpolitician(X) :- c(X). %cleopatre

qamerican(X) :- ask(army_general, X), dd(X). %Dwight D Eisenhower
qamerican(X) :- rn(X). %Richard Nixon

qartist(X) :- ask(singer, X), mj(X). %micheal jackson
qartist(X) :- victor(X). %victor hugo

qstillAlive(X) :- ask(artist, X), qarts(X).
qstillAlive(X) :- ask(politician, X), mg(X). %mikhail gorbachev
qstillAlive(X) :- ask(religion, X), pf(X). %pope francis
qstillAlive(X) :- fa(X). %fernando alonso

qarts(X) :- ask(actor, X), qactor(X).
qarts(X) :- ask(boy, X), qartist_boy(X).
qarts(X) :- ask(singer, X), lg(X). %lady gaga
qarts(X) :- jk(X). %jk rowling

qactor(X) :- ask(boy, X), qactor_boy(X).
qactor(X) :- jl(X). %jennifer lawrence

qactor_boy(X) :- ask(black, X), dw(X). %denzel washington
qactor_boy(X) :- qt(X). % tarantino

qartist_boy(X) :- ask(games, X), hk(X). % hideo kojima
qartist_boy(X) :- b(X). % banksy

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

%boys (17)
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


mj(michael_jackson).
mg(mikhail_gorbachev).
jl(jennifer_lawrence).
hk(hideo_kojima).
b(banksy).
lc(lara_croft).
mario(mario).
jk(jk_rowling).
lg(lady_gaga).
qt(quentin_tarantino).
j(joseph_staline).
dd(dwight_d_eisenhower).
c(cleopatre).
victor(victor_hugo).
jesus(jesus).
as(ayrton_senna).
m(moses).
fa(fernando_alonso).
pf(pope_francis).
jb(james_bond).
dw(denzel_washington).
rn(richard_nixon).




