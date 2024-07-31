import time 
import numpy as np
import math

v = np.random.rand(1000000)
u = np.zeros((1000000, 1))

tic = time.time()
for i in range(len(v)):
    u[i] = math.exp(v[i])
toc = time.time()


print("For'Loop TC: ", (toc-tic)*1000, 'ms')

tic = time.time()
u = np.exp(v)
toc = time.time()

print("vectorization TC: ", (toc-tic)*1000, 'ms')



