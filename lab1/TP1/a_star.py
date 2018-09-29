import copy
import heapq
import time

from TP1.search_tree import Solution, read_graph



def fastest_path_estimation(sol):
    """
    Returns the time spent on the fastest path between
    the current vertex c and the ending vertex pm
    """
    c = sol.visited[-1]
    pm = sol.not_visited[-1]

    sols = []

    for idx in sol.not_visited[:-1]:
        new_solution = copy.deepcopy(sol)
        new_solution.add(idx)
        heapq.push(sols, (new_solution.g, new_solution))





def A_star(graph, places):
    """
    Performs the A* algorithm
    """

    # blank solution
    root = Solution(graph=graph, places=places)

    # search tree T
    T = []
    heapq.heapify(T)
    heapq.heappush(T, root)



places_test = [0, 5, 13, 16, 6, 9, 4]
sol = Solution(places_test, read_graph())

fastest_path_estimation(sol)

# #test 1  --------------  OPT. SOL. = 27
# start_time = time.time()
# places=[0, 5, 13, 16, 6, 9, 4]
# astar_sol = A_star(graph=graph, places=places)
# print(astar_sol.g)
# print(astar_sol.visited)
# print("--- %s seconds ---" % (time.time() - start_time))