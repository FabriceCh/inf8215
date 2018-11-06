% List of prerequirements for all the courses
prerequires(inf1010, inf1005C).	% INF1010 requires INF1005C
prerequires(log1000, inf1005C).
prerequires(inf1600, inf1005C).
prerequires(inf1600, inf1500).
prerequires(inf2010, inf1010).
prerequires(log2410, inf1010).
prerequires(log2410, log1000).
prerequires(inf2705, inf2010).
prerequires(inf2705, mth1007).

corequires(log1000, inf1900).
corequires(inf1600, inf1900).
corequires(inf2010, inf2810).
corequires(inf2205, inf1900).
corequires(inf2705, log2990).

requirements(X, Y) :- coursePreRequires(X, Y); (coursePreRequires(X, Z), coursePreRequires(Z, Y));
					  (coursePreRequires(X, Z), coursePreRequires(Z, ZZ), coursePreRequires(ZZ, Y)),
					  X\==Y.

courseCoRequires(X, Y) :- corequires(X, Y); corequires(Y, X).

coursePreRequires(X, Y) :- prerequires(X, Y); courseCoRequires(X, Y).

% Rule to get all the requirements for a course with duplicates
courseRequirements(X, L) :- setof(Z, requirements(X, Z), L).
