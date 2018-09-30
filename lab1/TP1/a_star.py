import copy
import heapq
import time
from _heapq import heappush, heappop

from TP1.search_tree import Solution, read_graph


def fastest_path_estimation(sol):
    """
    Returns the time spent on the fastest path between
    the current vertex c and the ending vertex pm
    """

    class Solution_holder:
        def __init__(self, solution):
            self.solution = solution
            self.g = solution.g

        def __lt__(self, other):
            return self.g < other.g

    def add_to_heap_queue(sol_holder):
        # custom function to add to heap queue sorted by the solution's cost
        heappush(h_queue, sol_holder)

    c = sol.visited[-1]
    pm = sol.not_visited[-1]
    # the heap queue of solution sorted by their cost - change all to tuples with g for dijkstra
    h_queue = []

    # the places to use for the graph
    sub_search_places = [c]
    sub_search_places.extend(sol.not_visited)

    # push the first "node" in the queue
    add_to_heap_queue(Solution_holder(Solution(sub_search_places, sol.graph)))
    while True:
        # take the next solution with the shortest cost
        solution = heappop(h_queue).solution
        # if it contains destination, stop and return that solution
        if pm in solution.visited:
            return solution
        # create a new solution for each neighbor of the current vertex and add it to heap queue
        for place in solution.not_visited:
            new_solution = copy.deepcopy(solution)
            new_solution.add(place)
            add_to_heap_queue(Solution_holder(new_solution))


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
