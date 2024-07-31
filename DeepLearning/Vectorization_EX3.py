import numpy as np



X = (np.random.rand(3, 10))
W = np.random.rand(3)
b = np.random.rand(1)

Z = np.dot(W.transpose(), X) + b

A = 1/(1 + np.exp(-1 * Z))


print("X: ", X)

print("W: ", W)

print("Z: ",Z)

print("A: ",A)
