%Exercice 2: Round-Robin

include "globals.mzn";
include "alldifferent.mzn";

int: nbTeams;

% Doit aller de 1 a nbTeams sinon error: Index set mismatch
array[1..nbTeams, 1..nbTeams] of var 0..1: pv;

% Valeur possibles
set of int: Games = 1..nbTeams-1;
set of int: Teams = 1..nbTeams;

% On cree un array pour montrer chaque equipe joue contre qui
% En i,j, on trouve l'equipe contre laquelle l'equipe i joue au jeme match
array[1..nbTeams, 1..nbTeams-1] of var 1..nbTeams: matchs;

constraint
  % Chaque equipe joue contre chaque autre 1 seule fois
  forall(i in Teams)(
      alldifferent([matchs[i,j] | j in Games])
  ) /\
  
  % Une equipe ne joue pas 2 matchs en meme temps
  forall(j in Games)(
    alldifferent([matchs[i,j] | i in Teams])
  ) /\
  
  % Quand une equipe joue contre une autre, l'autre joue contre elle
  forall(i in Teams)(
      forall(j in Games)(
        matchs[i,j] == matchs[j,i]
      )
  ) /\
  
  % Une equipe ne joue pas contre elle-meme
  forall(i in Teams)(
      forall(j in Games)(
          matchs[i,j] != i 
      )
  );
  
  % Une equipe ne joue pas 4x de suite a l'etranger ou 4x de suite a domicile
  
  % On veut une reponse qui satisfait les contraintes
  solve satisfy;
  