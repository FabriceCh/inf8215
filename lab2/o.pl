/*

- Akinator for objets

*/

%objects
vacuum(vacuum).
computer(computer).
phone(phone).
fork(fork).
broom(broom).
cactus(cactus).
plate(plate).
oven(oven).
range(range).
coffee_machine(coffee_machine).
toaster(toaster).
table(table).
pan(pan).
shampoo(shampoo).
dishwashing_detergent(dishwashing_detergent).
bed(bed).
key(key).
wallet(wallet).
backpack(backpack).
piano(piano).
lamp(lamp).
paper(paper).

wash(vacuum).
wash(broom).
wash(shampoo).
wash(dishwashing_detergent).
wash(dishwashing_detergent).

pointy_ends(fork).
pointy_ends(cactus).

move_things(wallet).
move_things(backpack).

kitchen(range).
kitchen(oven).
kitchen(coffee_machine).
kitchen(toaster).
kitchen(table).
kitchen(fork).
kitchen(plate).
kitchen(pan).
kitchen(dishwashing_detergent).

dishes(fork).
dishes(palte).
dishes(pan).

electric(vacuum).
electric(computer).
electric(phone).
electric(oven).
electric(range).
electric(coffee_machine).
electric(toaster).
electric(lamp).

complex_ui(computer).
complex_ui(phone).

furniture(range).
furniture(oven).
furniture(table).

%questions
ask(electric, X) :-
    format('~w est électrique? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(kitchen, X) :-
    format('~w se trouve généralement dans la cuisine? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(furniture, X) :-
    format('~w est un meuble? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(cooking_plate, X) :-
    format('~w possède une table de cuisson? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(coffee, X) :-
    format('~w permet de faire du café? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(complex_ui, X) :-
    format('~w possède une interface complexe? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(computer_access, X) :-
    format('~w est utilisé généralement avec une souris et un clavier? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(sucks, X) :-
    format('~w aspire des choses? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(dishes, X) :-
    format('~w fait partie de la vaisselle? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(pointy_ends, X) :-
    format('~w possède des bouts pointus? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(eat, X) :-
    format('~w mange-t-on à même cet objet? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(move_things, X) :-
    format('~w est utilisé pour transporter des choses? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(back, X) :-
    format('~w se porte sur le dos? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(plant, X) :-
    format('~w est une plante? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(wash, X) :-
    format('~w est utilisé pour nettoyer? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(hair, X) :-
    format('~w on s en met dans les cheveux? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(intrument, X) :-
    format('~w est un instrument de musique? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

ask(sleep, X) :-
    format('~w on dort dedans? (oui./non.)', [X]),
    read(Reponse),
    Reponse = 'oui'.

%tree
objet(X) :- ask(electric, X), qelectric(X).
objet(X) :- ask(kitchen, X), qkitchen(X).
objet(X) :- ask(move_things, X), qmove_things(X).
objet(X) :- ask(pointy_ends, X), qpointy_ends(X).
objet(X) :- ask(wash, X), qwash(X).
objet(X) :- ask(intrument, X), piano(X).
objet(X) :- ask(sleep, X), bed(X).
objet(X) :- paper(X).

qwash(X) :- ask(hair, X), shampoo(X).
qwash(X) :- broom(X).

qpointy_ends(X) :- ask(plant, X), cactus(X).
qpointy_ends(X) :- key(X).

qmove_things(X) :- ask(back, X), backpack(X).
qmove_things(X) :- wallet(X).

qkitchen(X) :- ask(dishes, X), qdishes(X).
qkitchen(X) :- ask(furniture, X), table(X).
qkitchen(X) :- dishwashing_detergent(X).

qdishes(X) :- ask(pointy_ends, X), fork(X).
qdishes(X) :- ask(eat, X), plate(X).
qdishes(X) :- pan(X).

qelectric(X) :- ask(kitchen, X), qkitchen_electric(X).
qelectric(X) :- ask(complex_ui, X), qcomplex_ui(X).
qelectric(X) :- ask(sucks, X), vacuum(X).
qelectric(X) :- lamp(X).

qcomplex_ui(X) :- ask(computer_access, X), computer(X).
qcomplex_ui(X) :- phone(X).

qkitchen_electric(X) :- ask(furniture, X), qfurniture(X).
qkitchen_electric(X) :- ask(coffee, X), coffee_machine(X).
qkitchen_electric(X) :- toaster(X).

qfurniture(X) :- ask(cooking_plate, X), range(X).
qfurniture(X) :- oven(X).