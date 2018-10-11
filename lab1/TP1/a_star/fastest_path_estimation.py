import copy
from _heapq import heappush, heappop


def fastest_path_estimation(sol):
    """
    Returns the time spent on the fastest path between
    the current vertex c and the ending vertex pm
    """

    class Path:
        def __init__(self, places, graph):
            self.g = 0  # current cost
            self.graph = graph
            self.visited = [places[0]]  # list of already visited attractions
            self.not_visited = copy.deepcopy(places[1:])  # list of attractions not yet visited

        def __lt__(self, other):
            return self.g < other.g

        def add(self, idx):
            # add the cost
            self.g += self.graph[self.visited[-1], idx]
            # add the to the visited place and remove from the unvisited places
            self.visited.append(idx)
            self.not_visited.remove(idx)

    def add_to_heap_queue(path):
        # custom function to add to heap queue sorted by the solution's cost
        heappush(h_queue, path)

    if len(sol.not_visited) == 0:
        return 0
    elif len(sol.not_visited) == 1:
        return sol.graph[sol.visited[-1], sol.not_visited[0]]

    c = sol.visited[-1]
    pm = sol.not_visited[-1]
    # the heap queue of solution sorted by their cost - change all to tuples with g for dijkstra
    h_queue = []

    # the places to use for the graph
    sub_search_places = [c]
    sub_search_places.extend(sol.not_visited)

    # push the first "node" in the queue
    add_to_heap_queue(Path(sub_search_places, sol.graph))
    while True:
        # take the next solution with the shortest cost
        path = heappop(h_queue)
        # if it contains destination, stop and return that solution
        if pm in path.visited:
            return path.g
        # create a new solution for each neighbor of the current vertex and add it to heap queue
        for place in path.not_visited:
            new_path = copy.deepcopy(path)
            new_path.add(place)
            add_to_heap_queue(new_path)
