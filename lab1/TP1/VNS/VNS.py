import time

from lab1.TP1.VNS.initial_sol import initial_sol
from lab1.TP1.read_graph import read_graph


def vns(sol, k_max, t_max):
    """
    Performs the VNS algorithm
    """


graph = read_graph()

# # test 1  --------------  OPT. SOL. = 27
# places = [0, 5, 13, 16, 6, 9, 4]
# sol = initial_sol(graph=graph, places=places)
# start_time = time.time()
# vns_sol = vns(sol=sol, k_max=10, t_max=1)
# print(vns_sol.g)
# print(vns_sol.visited)
# print("--- %s seconds ---" % (time.time() - start_time))
#
# # test 2  --------------  OPT. SOL. = 30
# places = [0, 1, 4, 9, 20, 18, 16, 5, 13, 19]
# sol = initial_sol(graph=graph, places=places)
#
# start_time = time.time()
# vns_sol = vns(sol=sol, k_max=10, t_max=1)
# print(vns_sol.g)
# print(vns_sol.visited)
#
# print("--- %s seconds ---" % (time.time() - start_time))
#
# # test 3  --------------  OPT. SOL. = 26
# places = [0, 2, 7, 13, 11, 16, 15, 7, 9, 8, 4]
# sol = initial_sol(graph=graph, places=places)
#
# start_time = time.time()
# vns_sol = vns(sol=sol, k_max=10, t_max=1)
# print(vns_sol.g)
# print(vns_sol.visited)
# print("--- %s seconds ---" % (time.time() - start_time))
#
# # test 4  --------------  OPT. SOL. = 40
# places = [0, 2, 20, 3, 18, 12, 13, 5, 11, 16, 15, 4, 9, 14, 1]
# sol = initial_sol(graph=graph, places=places)
#
# start_time = time.time()
# vns_sol = vns(sol=sol, k_max=10, t_max=1)
# print(vns_sol.g)
# print(vns_sol.visited)
# print("--- %s seconds ---" % (time.time() - start_time))
