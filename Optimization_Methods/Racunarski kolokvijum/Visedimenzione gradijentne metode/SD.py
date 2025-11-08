import numpy as np

def func(x):
    return x[0]**2 + 5*x[0] + 4 + x[1]**2 + 5*x[1] + 4

def gradf(x):
    x = np.array(x).reshape(np.size(x))
    return np.asarray([[2*x[0] + 5],[2*x[1] + 5]])

def SD(gradf,x0,gamma,epsilon,N):
    x = np.array(x0).reshape(len(x0), 1)
    for k in range(N):
        g = gradf(x)
        x = x - gamma*g
        if np.linalg.norm(g)<epsilon:
            break
    return x
x = SD(lambda x: gradf(x), [0,0], 0.15, 1e-4,100)
print(x, func(x))