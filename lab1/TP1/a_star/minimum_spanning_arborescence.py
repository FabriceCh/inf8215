from collections import namedtuple
from lab1.TP1.read_graph import read_graph

def minimum_spanning_arborescence(sol):
    """
    Returns the cost to reach the vertices in the unvisited list
    """
    Edge = namedtuple('Edge', 'u v w')
    graph = read_graph()

    def edmonds(edges, v, root):
        # determine min cost of edge entering each vertex
        minimum_edges = {}
        for edge in edges:
            if minimum_edges.get(edge.v) is None or edge.w < minimum_edges[edge.v].w:
                minimum_edges[edge.v] = edge
        minimum_edges[root] = Edge(-1, root, 0)

        # Assign each vertex to a group (each group represent a vertex or a cycle)
        groups = {}
        visited = {}
        is_cycle_group = {}
        count = 0

        # Initiating dictionnaries
        for edge in edges:
            visited[edge.v] = False
            groups[edge.v] = -1

        for edge in edges:
            if edge.v in visited and visited[edge.v]:
                continue

            node = edge.v
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

        # Initialising is_cycle_group
        for x in range(count):
            is_cycle_group[x] = False

        # Case where there are no cycle
        result = 0
        if count == v:
            for key, edge in minimum_edges.items():
                result += edge.w
            return result

        for key, edge in minimum_edges.items():
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
                new_edges.append(Edge(u, v, w - minimum_edges[edge.v].w))

            else:
                new_edges.append(Edge(u, v, w))

        return result + edmonds(new_edges, count, groups[root])

    root = sol.visited[0]
    nodes = sol.visited + sol.not_visited[0:-1]

    edges = []
    for node in range(len(nodes)):
        for other_node in range (node, len(nodes)):
            if node == other_node:
                continue
            edges.append(Edge(nodes[node], nodes[other_node], graph[node, other_node]))
            edges.append(Edge(nodes[other_node], nodes[node], graph[other_node, node]))

    return edmonds(edges, len(nodes), root)

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