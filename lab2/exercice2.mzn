%Exercice 2: Round-Robin

include "globals.mzn";

% nbTeams est lu a partir du fichier N14a.dzn
int: nbTeams;

% Doit aller de 1 a nbTeams sinon error: Index set mismatch
% pv est lu a partir du fichier N14a.dzn
array[1..nbTeams, 1..nbTeams] of int: pv;

% Valeur possibles
set of int: Games = 1..nbTeams;

% On cree un array pour montrer chaque equipe joue contre qui
% En i,j, on trouve l'equipe contre laquelle l'equipe i joue au jeme match
array[1..nbTeams, 1..nbTeams-1] of int: matchs;

int: j;

constraint
  % Chaque equipe joue contre chaque autre 1 seule fois
  forall(i in 1..nbTeams)(
      alldifferent(matchs[i][j] | j in nb nbTeams-1);
  );
  
  % Une equipe ne joue pas 2 matchs en meme temps
  forAll(j in 1..nbTeams-1)(
    alldifferent(matchs[i][j] | i in nbTeams);
  );
  
  % Quand une equipe joue contre une autre, l'autre joue contre aussi
  
  % Une equipe ne joue pas contre elle-meme
  forall(i
  
  % Une equipe ne joue pas 4x de suite a l'etranger ou 4x de suite a domicile
  
  % On veut une reponse qui satisfait les contraintes
  solve satisfy;
  
