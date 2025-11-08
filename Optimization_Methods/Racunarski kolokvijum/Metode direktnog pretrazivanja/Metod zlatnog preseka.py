import numpy as np
import math 
def func(x):
    return -1*(x**4 - 5*x**3 - 2*x**2 + 24*x)

def Zlatni_presek(a,b,tol):
    c = (3-np.sqrt(5))/2
    x1 = a + c*(b-a)
    x2 = a + b - x1
    it = 0
    while(np.abs(b-a)>tol):
        it = it +1
        if(func(x1)<func(x2)):
            b = x2
            x2 = x1
            x1 = a + (b-a)*c
        else:
            a = x1
            x1 = x2
            x2 = b - c*(b-a)
    if(func(x1)<func(x2)):
        return x1,func(x1),it
    else:
        return x2,func(x2),it
    
a = 0
b = 3
tol = 0.0001
xopt,yopt,it = Zlatni_presek(a, b, tol)
print(xopt,yopt,it)