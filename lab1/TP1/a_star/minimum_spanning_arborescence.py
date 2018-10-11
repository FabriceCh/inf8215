from collections import namedtuple


def minimum_spanning_arborescence(sol):
    """
    Returns the cost to reach the vertices in the unvisited list
    """
    Edge = namedtuple('Edge', 'u v w')

    def edmonds(edges, root):
        # determine min cost of edge entering each vertex
        minimum_edges = {}
        for edge in edges:
            if minimum_edges.get(edge.v) is None or edge.w < minimum_edges[edge.v].w:
                minimum_edges[edge.v] = edge
        minimum_edges[root] = Edge(-1, root, 0)

        # Assign each vertex to a group (each group represent a vertex or a cycle)
        groups = {}
        visited = []
        is_cycle_group = {}
        count = 0;

        for x in range(len(edges)):
            if visited[x]:
                continue

            node = x
            path = []

            while node != -1 and not visited[node]:
                visited[node] = True
                path.append(node)
                node = minimum_edges[node].u

            is_cycle = False
            for vertex in path:
                groups[vertex] = count
                if vertex == node:
                    is_cycle = True
                    is_cycle_group[count] = True
                if not is_cycle:
                    count += 1

            if is_cycle:
                count += 1

        # Case where there are no cycle
        result = 0
        if count == len(edges):
            for edge in minimum_edges:
                result += edge.w
            return result

        for edge in minimum_edges:
            if is_cycle_group[groups[edge.v]]:
                result += edge.w

        # Create a new graph with the groups found
        new_edges = []
        for edge in edges:
            u = groups[edge.u]
            v = groups[edge.v]
            w = edge.w

            if u == v:
                continue

            elif is_cycle_group[v]:
                new_edges.append([Edge(u, v, edge.w - minimum_edges[edge.v].w)])

            else:
                new_edges.append([Edge(u, v, edge.w)])

        return result + edmonds(new_edges, groups[root])

    root = sol.visited[0]
    edges = sol.visited + sol.not_visited[0:-1]

    return edmonds(edges, root)

# test 1  --------------  OPT. SOL. = 27
import time
from lab1.TP1.read_graph import read_graph
from lab1.TP1.a_star.solution import Solution
graph = read_graph()
start_time = time.time()
places=[0, 5, 13, 16, 6, 9, 4]
sol = Solution(places, graph)
print(minimum_spanning_arborescence(sol))
print("--- %s seconds ---" % (time.time() - start_time))