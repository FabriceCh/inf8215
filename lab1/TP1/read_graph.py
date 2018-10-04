import numpy as np


def read_graph():
    return np.loadtxt("montreal", dtype='i', delimiter=',')
