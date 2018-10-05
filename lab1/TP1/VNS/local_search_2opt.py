import copy

def local_search_2opt(sol):
    """
    Apply 2-opt local search over sol
    """
    improvement = True

    while improvement:
        improvement = False
        for i in range(1, len(sol.visited) - 2):
            for j in range(1, len(sol.visited) -2):
                new_solution = copy.deepcopy(sol)
                new_solution.swap(i, j)
                if new_solution.g < sol.g:
                    sol = new_solution
                    improvement = True

import numpy as np
from lab1.TP1.VNS.initial_sol import initial_sol

def read_graph():
    return np.loadtxt("../montreal", dtype='i', delimiter=',')


places_test = [0, 5, 13, 16, 9, 4]
graph_test = read_graph()

solution = initial_sol(graph_test, places_test)
print(solution.g)
local_search_2opt(solution)

print(solution.visited)
print(solution.g)