import heapq

from lab1.TP1.a_star.fastest_path_estimation import fastest_path_estimation
from lab1.TP1.read_graph import read_graph
from lab1.TP1.a_star.solution import Solution

places_test = [0, 5, 13, 16, 6, 9, 20]
sol = Solution(places_test, read_graph())
final_sol = fastest_path_estimation(sol)
print(final_sol.g)
print(final_sol.visited)
sol.add(5)
final_sol = fastest_path_estimation(sol)
print(final_sol.g)
print(final_sol.visited)
sol.add(13)
final_sol = fastest_path_estimation(sol)
print(final_sol.g)
print(final_sol.visited)


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

# #test 1  --------------  OPT. SOL. = 27
# start_time = time.time()
# places=[0, 5, 13, 16, 6, 9, 4]
# astar_sol = A_star(graph=graph, places=places)
# print(astar_sol.g)
# print(astar_sol.visited)
# print("--- %s seconds ---" % (time.time() - start_time))
