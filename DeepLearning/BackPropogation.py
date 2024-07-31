import numpy as np
from sympy import *
from tqdm import tqdm

def calculate_loss_and_gradients(w1, w2, x1, x2, b, y):
    z = x1 * w1 + x2 * w2 + b
    a = 1 / (1 + exp(-z))
    loss = -y * log(a) - (1 - y) * log(1 - a)
    dz = a - y
    dw1 = x1 * dz
    dw2 = x2 * dz
    db = dz
    return loss, dw1, dw2, db


x1 = symbols('x1')
w1 = symbols('w1')
x2 = symbols('x2')
w2 = symbols('w2')
b = symbols('b')
y = symbols('y')
a = symbols('a')
l = symbols('l')
z = symbols('z')


z_func = x1 * w1 + x2 * w2 + b
a_func = 1 / (1 + exp(-z))
l_func = -y * log(a) - (1 - y) * log(1 - a)

da = diff(l_func, a)
dzda = diff(a_func, z)
dz = da*dzda
dw1dz = diff(z_func, w1)
dw2dz = diff(z_func, w2)
dbdz = diff(z_func, b)

dw1 = dz*dw1dz
dw2 = dz*dw2dz
db = dz*dbdz


print("Affect of changing A on L:",da)
print("Affect of changing Z on L:",dz)
print("Affect of changing W1 on L:",dw1)
print("Affect of changing W2 on L:",dw2)
print("Affect of changing B on L:",db)


W1 = 0.5
W2 = 0.5
B = 0.5
X1 = 0.5
X2 = 0.5
Y = 1

last_loss = 1000000
lr = 0.01
ctr = 0
pbar = tqdm(total=5000)

# Rest of the code
while (True):
    loss, dw1, dw2, db = calculate_loss_and_gradients(W1, W2, X1, X2, B, Y)
    ctr+=1
    if loss < last_loss:
        last_loss = loss
        W1 = W1 - lr * dw1
        W2 = W2 - lr * dw2
        B = B - lr * db
    else:
        break
    pbar.update(1)
    if loss < 0.05: 
        pbar.close()
        break


print("Propogations:",ctr)
print("W1:",W1)
print("W2:",W2)
print("B:",B)
print("Loss:",last_loss)

