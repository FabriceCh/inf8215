% List of prerequirements for all the courses
requires(inf1010, inf1005C).	% INF1010 requires INF1005C
requires(log1000, inf1005C).
requires(inf1600, inf1005C).
requires(inf1600, inf1500).
requires(inf2010, inf1010).
requires(log2410, inf1010).
requires(log2410, log1000).
requires(inf2705, inf2010).
requires(inf2705, mth1007).

corequires(log1000, inf1900).
corequires(inf1600, inf1900).
corequires(inf2010, inf2810).
corequires(inf2205, inf1900).
corequires(inf2705, log2990).

% Rule to get all the requirements for a course with duplicates
completeRequirements(X, Y) :- requires(X, Y); (requires(X, Z), completeRequirements(Z, Y)).

courseCorequires(X, Y) :- corequires(X, Y); corequires(Y, X).

courseRequires(X, Y) :- requires(X, Y); corequires(X, Y); corequires(Y, X).
