import numpy as np

def func(x):
    return x[0]**2+x[1]**2
def gradf(x):
    x = np.array(x).reshape(np.size(x))
    return np.asarray([[2*x[0]],[2*x[1]]])

def SD_M(gradf, x0, gamma, omega, tol, N):
    x = np.array(x0).reshape(len(x0), 1)
    v = np.zeros(np.shape(x))
    for i in range(N):
        g = gradf(x)
        v = omega*v + gamma*g
        x = x - v
        if np.linalg.norm(g) < tol:
            break
    return x

x = SD_M(lambda x :gradf(x), [-2,2], 0.15, 0.5, 1e-4, 100)
print(x,func(x))