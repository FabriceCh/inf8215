import copy
import heapq
import time

from lab1.TP1.a_star.fastest_path_estimation import fastest_path_estimation
from lab1.TP1.read_graph import read_graph
from lab1.TP1.a_star.solution import Solution

places_test = [0, 5, 13, 16, 6, 9, 20]


# sol = Solution(places_test, read_graph())
# final_sol = fastest_path_estimation(sol)
# print(final_sol.g)
# print(final_sol.visited)
# sol.add(5)
# final_sol = fastest_path_estimation(sol)
# print(final_sol.g)
# print(final_sol.visited)
# sol.add(13)
# final_sol = fastest_path_estimation(sol)
# print(final_sol.g)
# print(final_sol.visited)


def A_star(graph, places):
    """
    Performs the A* algorithm
    """
    # TODO

    # blank solution
    root = Solution(graph=graph, places=places)

    # search tree T
    T = []
    heapq.heapify(T)
    heapq.heappush(T, root)

    n_nodes = 0
    final_sol = None

    while True:
        n_nodes += 1
        # take the next solution with the shortest cost
        sol = heapq.heappop(T)
        # if it contains destination, stop and return that solution
        if len(sol.not_visited) == 1:
            final_sol = sol
            final_sol.add(sol.not_visited[0])
            break
        # create a new solution for each neighbor of the current vertex and add it to heap queue
        for idx in sol.not_visited[:-1]:
            new_sol = copy.deepcopy(sol)
            new_sol.add(idx)
            heapq.heappush(T, new_sol)
    print("number of explored nodes: " + str(n_nodes))

    return final_sol


graph = read_graph()

# test 1  --------------  OPT. SOL. = 27
start_time = time.time()
places = [0, 5, 13, 16, 6, 9, 4]
astar_sol = A_star(graph=read_graph(), places=places)
print(astar_sol.g)
print(astar_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))

# test 2  --------------  OPT. SOL. = 30
start_time = time.time()
places = [0, 1, 4, 9, 20, 18, 16, 5, 13, 19]
astar_sol = A_star(graph=graph, places=places)
print(astar_sol.g)
print(astar_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))

# test 3  --------------  OPT. SOL. = 26
start_time = time.time()
places = [0, 2, 7, 13, 11, 16, 15, 7, 9, 8, 4]
astar_sol = A_star(graph=graph, places=places)
print(astar_sol.g)
print(astar_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))

# test 4  --------------  OPT. SOL. = 40
start_time = time.time()
places = [0, 2, 20, 3, 18, 12, 13, 5, 11, 16, 15, 4, 9, 14, 1]
astar_sol = A_star(graph=graph, places=places)
print(astar_sol.g)
print(astar_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))
