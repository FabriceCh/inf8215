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
    format('~w est électrique? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(kitchen, X) :-
    format('~w se trouve généralement dans la cuisine? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(furniture, X) :-
    format('~w est un meuble? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(cooking_plate, X) :-
    format('~w possède une table de cuisson? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(coffee, X) :-
    format('~w permet de faire du café? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(complex_ui, X) :-
    format('~w possède une interface complexe? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(computer_access, X) :-
    format('~w est utilisé généralement avec une souris et un clavier? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(sucks, X) :-
    format('~w aspire des choses? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(dishes, X) :-
    format('~w fait partie de la vaisselle? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(pointy_ends, X) :-
    format('~w possède des bouts pointus? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(eat, X) :-
    format('~w mange-t-on à même cet objet? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(move_things, X) :-
    format('~w est utilisé pour transporter des choses? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(back, X) :-
    format('~w se porte sur le dos? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(plant, X) :-
    format('~w est une plante? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(wash, X) :-
    format('~w est utilisé pour nettoyer? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(hair, X) :-
    format('~w on s en met dans les cheveux? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(intrument, X) :-
    format('~w est un instrument de musique? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

ask(sleep, X) :-
    format('~w on dort dedans? (yes./no.)', [X]),
    read(Reponse),
    Reponse = 'yes'.

