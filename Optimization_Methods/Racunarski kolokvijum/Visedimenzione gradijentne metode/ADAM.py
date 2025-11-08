import numpy as np 
import matplotlib.pyplot as plt
def func(x):
    return 5*x[0]**2 + x[1]**2+ 4*x[0]*x[1] - 14*x[0] - 6*x[1] +20

def gradf(x):
    x = np.array(x).reshape(np.size(x))
    return np.asarray([[10*x[0]+4*x[0]-14],[2*x[1]+4*x[1]-6]])

def ADAM(gradf, x0, gamma, omega1, omega2, epsilon, epsilon2, N):
    x = np.array(x0).reshape(len(x0),1)
    v = np.zeros(np.shape(x))
    m = np.zeros(np.shape(x))
    for i in range(N):
        g = gradf(x)
        m = omega1*m + (1 - omega1)*g
        v = omega2*v + (1 - omega2)*np.multiply(g,g)
        x = x - gamma*np.ones(np.shape(g))/np.sqrt(v+epsilon2)*m
        if np.linalg.norm(g) < epsilon:
            break;
    return x

x = ADAM(lambda x: gradf(x), [-2,2], 0.15, 0.5, 0.5, 1e-4, 1e-8, 100)
print(x, func(x))




