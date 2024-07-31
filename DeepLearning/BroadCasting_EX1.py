import numpy as np


A = np.array(([56, 0, 4.4, 68], [1.2, 104, 52, 8], [1.8, 135, 99, 0.9]))


r = A.sum(axis=0)

A/=r
A*=100

print(A)
