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
        self.g = 0 # current cost
        self.graph = graph
        self.visited = [places[0]] # list of already visited attractions
        self.not_visited = copy.deepcopy(places[1:]) # list of attractions not yet visited

    def add(self, idx):
        """
        Adds the point in position idx of not_visited list to the solution
        """
        if(idx not in self.not_visited):
            print("the index was not found in the not_visited list")
            return None
        if(idx in self.visited):
            print("the index is already in the visited list")
            return None
        #add the cost
        self.g += self.graph[self.visited[-1], idx]
        #add the to the visited place and remove from the unvisited places
        self.visited.append(idx)
        self.not_visited.remove(idx)

# testing the solution with the add function
places_test=[0, 5, 13, 16, 6, 9, 4]
sol = Solution(places_test, graph_test)
sol.add(5)
sol.add(13)
sol.add(16)
# using debbugger: the sol should have g = 20, not_visited: [16, 6, 9, 4], visited:[0, 5, 13]


def bfs(graph, places):
    """
    Returns the best solution which spans over all attractions indicated in 'places'
    """
    def get_minimal_solution(solutions):
        min_g = solutions[0].g
        min_solution = solutions[0]
        for solution in solutions[1:]:
            if solution.g < min_g:
                min_g = solution.g
                min_solution = solution
        return min_solution

    places_pool = places[1:-1]
    queue = Queue()
    solutions = []
    current_solution = Solution(places, graph)
    map(queue.put, places_pool)

    while queue.not_empty:
        new_sol = current_solution
        new_sol.add(queue.get())
        if len(new_sol.not_visited) == 0:
            solutions.append(new_sol)
    return get_minimal_solution(solutions)

# testing

# test 1  --------------  OPT. SOL. = 27
start_time = time.time()
places=[0, 5, 13, 4]
sol = bfs(graph=graph_test, places=places)
print(sol.g)
print("--- %s seconds ---" % (time.time() - start_time))
