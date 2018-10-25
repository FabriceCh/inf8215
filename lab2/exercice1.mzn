include "globals.mzn";

%Nationalities: English, Spanish, Ukrainian, Norwegian, Japanese
set of int: Nationalities = 0..4;
int: English = 0;
int: Spanish = 1;
int: Ukrainian = 2;
int: Norwegian = 3;
int: Japanese = 4;

%Colors: Red, Green, White, Yellow, Blue
set of int: Colors = 0..4;
int: Red = 0;
int: Green = 1;
int: White = 2;
int: Yellow = 3;
int: Blue = 4;

%Animals: Dog, Fox, Horse, Zebra, Snails
set of int: Animals = 0..4;
int: Dog = 0;
int: Fox = 1;
int: Horse = 2;
int: Zebra = 3;
int: Snails = 4;

%Drinks: Coffee, Tea, Milk, OrangeJuice, Water
set of int: Drinks = 0..4;
int: Coffee = 0;
int: Tea = 1;
int: Milk = 2;
int: OrangeJuice = 3;
int: Water = 4;

%Jobs: Sculptor, Diplomat, Physician, Vilonist, Acrobat
set of int: Jobs = 0..4;
int: Sculptor = 0;
int: Diplomat = 1;
int: Physician = 2;
int: Violonist = 3;
int: Acrobat = 4;

set of int: Houses = 1..5;

array[Nationalities] of var Houses: nation;
array[Colors] of var Houses: color;
array[Animals] of var Houses: animal;
array[Drinks] of var Houses: drink;
array[Jobs] of var Houses: job;

predicate nextto(var Houses:h1, var Houses:h2) = 
       h1 == h2 + 1 \/ h2 == h1 + 1;

predicate rightof(var Houses:h1, var Houses:h2) =
       h1 == h2 + 1;
       
predicate leftof(var Houses:h1, var Houses:h2) =
       h1 == h2 - 1;

predicate middle(var Houses:h) = h == 3;

predicate left(var Houses:h) = h = 1;

predicate right(var Houses:h) = h = 5;

constraint
	alldifferent(nation) /\
	alldifferent(color) /\
	alldifferent(animal) /\
	alldifferent(drink) /\
	alldifferent(job) /\
	nation[English] == color[Red] /\
	nation[Spanish] == animal[Dog] /\
	color[Green] == drink[Coffee] /\
         nation[Ukrainian] == drink[Tea] /\
         color[Green] `rightof` color[White] /\
         job[Sculptor] == animal[Snails] /\
         job[Diplomat] == color[Yellow] /\
         middle(drink[Milk]) /\
         left(nation[Norwegian]) /\
         job[Physician] `nextto` animal[Fox] /\
         job[Diplomat] `nextto` animal[Horse] /\
         job[Violonist] == drink[OrangeJuice] /\
         nation[Japanese] == job[Acrobat] /\
         nation[Norwegian] `nextto` color[Blue];

solve satisfy;

output [
	"nation = [",
	show(nation[0]), ", ",
	show(nation[1]), ", ",
	show(nation[2]), ", ",
	show(nation[3]), ", ",
	show(nation[4]), "]\n",
	"color = [",
	show(color[0]), ", ",
	show(color[1]), ", ",
	show(color[2]), ", ",
	show(color[3]), ", ",
	show(color[4]), "]\n",
	"animal = [",
	show(animal[0]), ", ",
	show(animal[1]), ", ",
	show(animal[2]), ", ",
	show(animal[3]), ", ",
	show(animal[4]), "]\n",
	"drink  = [",
	show(drink[0]), ", ",
	show(drink[1]), ", ",
	show(drink[2]), ", ",
	show(drink[3]), ", ",
	show(drink[4]), "]\n",
	"job  = [",
	show(job[0]), ", ",
	show(job[1]), ", ",
	show(job[2]), ", ",
	show(job[3]), ", ",
	show(job[4]), "]\n"
];