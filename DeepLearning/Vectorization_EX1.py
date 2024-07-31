import time 
import numpy as np


array_1 = np.random.rand(1000000)
array_2 = np.random.rand(1000000)

tic = time.time()
array_3 = np.dot(array_1, array_2)
toc = time.time()

print("Dot Prod. by VC: ", array_3)
print("Vectorized Method TC: ", (toc-tic)*1000, "ms")

tic = time.time()
array_4 = 0
for i in range(len(array_1)):
    array_4 += array_1[i] * array_2[i]

toc = time.time()

print("Dot Prod. by FL: ", array_4)
print("For'Loop Method TC: ", (toc-tic)*1000, "ms")



