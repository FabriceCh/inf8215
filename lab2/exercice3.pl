% List of prerequirements for all the courses
requires(inf1010, inf1005C).	% INF1010 requires INF1005C
requires(log1000, inf1005C).
requires(log1000, inf1900).
requires(inf1600, inf1005C).
requires(inf1600, inf1500).
requires(inf1600, inf1900).
requires(inf2010, inf1010).
requires(inf2010, inf2810).
requires(inf2205, inf1900).
requires(inf2810, inf2010).
requires(log2410, inf1010).
requires(log2410, log1000).
requires(inf2705, inf2010).
requires(inf2705, mth1007).
requires(inf2705, log2990).
requires(inf1900, inf1600).
requires(inf1900, log1000).
requires(inf1900, inf2205).
requires(log2990, inf2705).

% Rule to get all the requirements for a course with duplicates
completeRequirements(X, Y) :- requires(X, Y); (requires(X, Z), completeRequirements(Z, Y)).

corequires(X, Y) :- requires(X, Y), requires(Y, X).