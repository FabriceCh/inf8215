import copy
from random import randint


def shaking(sol, k):
    """
    Returns a solution on the k-th neighborhood of sol
    """
    new_solution = copy.deepcopy(sol)
    for x in range(k):
        idx1 = randint(1, len(new_solution.visited) - 2)
        idx2 = randint(1, len(new_solution.visited) - 2)
        new_solution.swap(idx1, idx2)

    return new_solution

# import numpy as np
# from lab1.TP1.VNS.initial_sol import initial_sol


# def read_graph():
#     return np.loadtxt("../montreal", dtype='i', delimiter=',')


# places_test = [0, 5, 13, 16, 6, 9, 4]
# graph_test = read_graph()

# solution = initial_sol(graph_test, places_test)
# print(solution.visited)
# shaking(solution, 2)
# print(solution.visited)
