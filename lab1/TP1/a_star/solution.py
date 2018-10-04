import copy

from lab1.TP1.a_star.fastest_path_estimation import fastest_path_estimation


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

    def __lt__(self, other):
        return fastest_path_estimation(self) + self.g < fastest_path_estimation(other) + other.g

    def add(self, idx):
        """
        Adds the point in position idx of not_visited list to the solution
        """
        # add the cost
        self.g += self.graph[self.visited[-1], idx]
        # add the to the visited place and remove from the unvisited places
        self.visited.append(idx)
        self.not_visited.remove(idx)


# # testing the solution with the add function
# graph_test = read_graph()
# places_test = [0, 5, 13, 16, 6, 9, 4]
# sol = Solution(places_test, graph_test)
# sol.add(5)
# sol.add(13)
# sol.add(16)
