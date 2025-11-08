import numpy as np

def func(x):
    return x[0]**2+x[1]**2

def gradf(x):
    x = np.array(x).reshape(np.size(x))
    return np.asarray([[2*x[0]],[2*x[1]]])

def ADAGRAD(gradf, x0 ,gamma, epsilon, epsilon1, N):
    x = np.array(x0).reshape(len(x0),1)
    G = np.zeros(np.shape(x))
    for k in range(N):
        g = gradf(x)
        G = G + np.multiply(g,g)
        x = x - gamma*np.ones(np.shape(G))/np.sqrt(G+epsilon1)*g
        if np.linalg.norm(g) < epsilon:
            break
    return x
x = ADAGRAD(lambda x: gradf(x), [-2,2], 0.15, 1e-4, 1e-8, 100)
print(x,func(x))
    
