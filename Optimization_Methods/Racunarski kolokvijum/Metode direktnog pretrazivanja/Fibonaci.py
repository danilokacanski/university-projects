import numpy as np
import math 
def func(x):
    return -1*(x**4 - 5*x**3 - 2*x**2 + 24*x)
def Fibonacijev_broj(n):
    if(n<2):
        return 1
    if(n == 3):
        return 2
    fnovo = 2
    fpre = 1
    fppre = 1
    for i in range(3,n):
        fppre = fpre
        fpre = fnovo
        fnovo = fpre + fppre
    return fnovo
print(Fibonacijev_broj(22))

def fibonaci(a,b,tol):
    n = 0;
    while(np.abs(b-a)/tol>Fibonacijev_broj(n)):
        n = n + 1
    x1 = a + Fibonacijev_broj(n-2)/Fibonacijev_broj(n)*(b-a)
    x2 = a + b -x1
    for i in range(2,n+1):
        if(func(x1)<func(x2)):
            b = x2
            x2 = x1
            x1 = a + b - x2
        else:
            a = x1
            x1 = x2
            x2 = a+ b -x1
    if(func(x1)<func(x2)):
        return x1, func(x1), n
    else:
        return x2, func(x2), n
    
a = 0
b= 3
tol = 0.0001
[xopt,yopt,it] = fibonaci(a, b, tol)
print(xopt,yopt,it)        
            
        