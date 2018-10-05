from random import shuffle

from lab1.TP1.a_star.solution import Solution


def initial_sol(graph, places):
    """
    Return a completed initial solution
    """
    possible_places = places[1:-1]
    shuffle(possible_places)
    shuffled_places = [places[0]] + possible_places + [places[-1]]
    sol = Solution(shuffled_places, graph)
    while len(sol.not_visited) != 0:
        sol.add(sol.not_visited[0])
    return sol


# # test
# places_test = [0, 5, 13, 16, 6, 9, 4]
# graph_test = read_graph()
#
# initial_solution = (initial_sol(graph_test, places_test))
# print(initial_solution.visited)
# initial_solution = (initial_sol(graph_test, places_test))
# print(initial_solution.visited)
# initial_solution = (initial_sol(graph_test, places_test))
# print(initial_solution.visited)
# initial_solution = (initial_sol(graph_test, places_test))
# print(initial_solution.visited)
# initial_solution = (initial_sol(graph_test, places_test))
# print(initial_solution.visited)
# initial_solution = (initial_sol(graph_test, places_test))
# print(initial_solution.visited)
# initial_solution = (initial_sol(graph_test, places_test))
# print(initial_solution.visited)
# initial_solution = (initial_sol(graph_test, places_test))
# print(initial_solution.visited)
# initial_solution = (initial_sol(graph_test, places_test))
# print(initial_solution.visited)
# initial_solution = (initial_sol(graph_test, places_test))
# print(initial_solution.visited)