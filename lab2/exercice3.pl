% List of all the courses
course('INF1005C').
course('INF1500').
course('INF1010').
course('LOG1000').
course('INF1600').
course('INF2010').
course('LOG2810').
course('LOG2410').
course('INF2705').
course('MTH1007').
course('LOG2990').
course('INF2205').
course('INF1900').

% List of prerequirements for all the courses
requires('INF1010', 'INF1005C').	% INF1010 requires INF1005C
requires('LOG1000', 'INF1005C').
requires('INF1600', 'INF1005C').
requires('INF1600', 'INF1500').
requires('INF2010', 'INF1010').
requires('INF2010', 'INF2810').
requires('LOG2410', 'INF1010').
requires('LOG2410', 'LOG1000').
requires('INF2705', 'INF2010').
requires('INF2705', 'MTH1007').
requires('INF2705', 'LOG2990').
requires('INF1900', 'INF1600').
requires('INF1900', 'LOG1000').
requires('INF1900', 'INF2205').

% Rule to get all the direct requirements for a course
directRequirements(Course) :- requires(Course, C), print(C).

% Rule to return all requirements for a course
% completeRequirementsFor(Course) :- requires(directRequirements(Course), C).