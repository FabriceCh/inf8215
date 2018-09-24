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
# using debugger: the sol should have g = 20, not_visited: [16, 6, 9, 4], visited:[0, 5, 13]


def bfs(graph, places):
    """
    Returns the best solution which spans over all attractions indicated in 'places'
    """

    def get_minimal_solution(sol_queue):
        min_solution = queue.get()
        while sol_queue.not_empty:
            sol = queue.get()
            if sol.g < min_solution.g:
                min_solution = sol
        return min_solution


    queue = Queue()
    queue.put(Solution(places, graph))

    while True:
        solution = queue.get()
        if len(solution.not_visited) == 0:
            queue.put(solution)
            break;
        for idx in solution.not_visited:
            new_places = solution.not_visited
            new_places.remove(idx)
            queue.put(Solution(new_places, solution.graph))



    return get_minimal_solution(queue)

# testing

# test 1  --------------  OPT. SOL. = 27
start_time = time.time()
places=[0, 5, 13, 4]
sol = bfs(graph=graph_test, places=places)
print(sol.g)
print("--- %s seconds ---" % (time.time() - start_time))
