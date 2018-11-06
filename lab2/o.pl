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
objet(X) :- ask(electric, X), electric(X).
objet(X) :- ask(kitchen, X), kitchen(X).
objet(X) :- ask(move_things, X), move_things(X).
objet(X) :- ask(pointy_ends, X), pointy_ends(X).
objet(X) :- ask(wash, X), wash(X).
objet(X) :- ask(intrument, X), piano(X).
objet(X) :- ask(sleep, X), bed(X).
objet(X) :- paper(X).

wash(X) :- ask(hair, X), shampoo(X).
wash(X) :- broom(X).

pointy_ends(X) :- ask(plant, X), cactus(X).
pointy_ends(X) :- key(X).

move_things(X) :- ask(back, X), backpack(X).
move_things(X) :- wallet(X).

kitchen(X) :- ask(dishes, X), dishes(X).
kitchen(X) :- ask(furniture, X), table(X).
kitchen(X) :- dishwashing_detergent(X).

dishes(X) :- ask(pointy_ends, X), fork(X).
dishes(X) :- ask(eat, X), plate(X).
dishes(X) :- pan(X).

electric(X) :- ask(kitchen, X), kitchen_electric(X).
electric(X) :- ask(complex_ui, X), complex_ui(X).
electric(X) :- ask(sucks, X), vacuum(X).
electric(X) :- lamp(X).

complex_ui(X) :- ask(computer_access, X), computer(X).
complex_ui(X) :- phone(X).

kitchen_electric(X) :- ask(furniture, X), furniture(X).
kitchen_electric(X) :- ask(coffee, X), coffee_machine(X).
kitchen_electric(X) :- toaster(X).

furniture(X) :- ask(cooking_plate, X), range(X).
furniture(X) :- oven(X).