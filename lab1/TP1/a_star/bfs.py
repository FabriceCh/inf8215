import copy
import time
from queue import Queue

from lab1.TP1.read_graph import read_graph
from lab1.TP1.a_star.solution import Solution

graph_test = read_graph()


# using debugger: the sol should have g = 20, not_visited: [16, 6, 9, 4], visited:[0, 5, 13]


def bfs(graph, places):
    """
    Returns the best solution which spans over all attractions indicated in 'places'
    """

    def get_minimal_solution(sol_queue):
        min_solution = queue.get()
        min_solution.add(min_solution.not_visited[0])
        while not sol_queue.empty():
            sol = queue.get()
            sol.add(sol.not_visited[0])
            if sol.g < min_solution.g:
                min_solution = sol
        return min_solution

    queue = Queue()
    queue.put(Solution(places, graph))

    node_counter = 1
    while True:
        node_counter += 1
        solution = queue.get()
        if len(solution.not_visited) == 1:
            queue.put(solution)
            break
        for idx in solution.not_visited[:-1]:
            new_solution = copy.deepcopy(solution)
            new_solution.add(idx)
            queue.put(new_solution)


    print("number of nodes explored: " + str(node_counter))
    return get_minimal_solution(queue)

# testing

# test 1  --------------  OPT. SOL. = 27
start_time = time.time()
places = [0, 5, 13, 16, 6, 9, 4]
sol = bfs(graph=graph_test, places=places)
print(sol.g)
print(sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))
#
# # test 2 -------------- OPT. SOL. = 30
start_time = time.time()
places = [0, 1, 4, 9, 20, 18, 16, 5, 13, 19]
sol = bfs(graph=graph_test, places=places)
print(sol.g)
print(sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))
#
# # test 3 -------------- OPT. SOL. = 26
# start_time = time.time()
# places = [0, 2, 7, 13, 11, 16, 15, 7, 9, 8, 4]
# sol = bfs(graph=graph_test, places=places)
# print(sol.g)
# print("--- %s seconds ---" % (time.time() - start_time))
