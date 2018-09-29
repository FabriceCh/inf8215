import numpy as np
import copy
import time
from queue import Queue


def read_graph():
    return np.loadtxt("montreal", dtype='i', delimiter=',')


graph_test = read_graph()


class Solution:
    def __init__(self, places, graph):
        """
        places: a list containing the indices of attractions to visit
        p1 = places[0]
        pm = places[-1]
        """
        self.g = 0  # current cost
        self.graph = graph
        self.visited = [places[0]]  # list of already visited attractions
        self.not_visited = copy.deepcopy(places[1:])  # list of attractions not yet visited

    def add(self, idx):
        """
        Adds the point in position idx of not_visited list to the solution
        """
        # add the cost
        self.g += self.graph[self.visited[-1], idx]
        # add the to the visited place and remove from the unvisited places
        self.visited.append(idx)
        self.not_visited.remove(idx)


# testing the solution with the add function
places_test = [0, 5, 13, 16, 6, 9, 4]
sol = Solution(places_test, graph_test)
sol.add(5)
sol.add(13)
sol.add(16)


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
        solution = queue.get()
        if len(solution.not_visited) == 1:
            queue.put(solution)
            break
        for idx in solution.not_visited[:-1]:
            new_solution = copy.deepcopy(solution)
            new_solution.add(idx)
            queue.put(new_solution)
            node_counter += 1

    print("number of nodes explored: " + str(node_counter))
    return get_minimal_solution(queue)


# testing

# test 1  --------------  OPT. SOL. = 27
start_time = time.time()
places = [0, 5, 13, 16, 6, 9, 4]
sol = bfs(graph=graph_test, places=places)
print(sol.g)
print("--- %s seconds ---" % (time.time() - start_time))

# test 2 -------------- OPT. SOL. = 30
start_time = time.time()
places = [0, 1, 4, 9, 20, 18, 16, 5, 13, 19]
sol = bfs(graph=graph_test, places=places)
print(sol.g)
print("--- %s seconds ---" % (time.time() - start_time))

# test 3 -------------- OPT. SOL. = 26
start_time = time.time()
places = [0, 2, 7, 13, 11, 16, 15, 7, 9, 8, 4]
sol = bfs(graph=graph_test, places=places)
print(sol.g)
print("--- %s seconds ---" % (time.time() - start_time))
