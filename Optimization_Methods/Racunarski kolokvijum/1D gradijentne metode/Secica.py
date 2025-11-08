import numpy as np
import math
def func(x):
    f=x**4-5*x**3-2*x**2+24*x
    return f
def dfunc(x):
    f=4*x**3-15*x**2-4*x+24
    return f

def Secica(x0,x1,tol):
    x_ppre = math.inf
    x_pre = x0
    x_novo = x1
    it = 0
    while(np.abs(x_novo - x_pre)>tol):
        it = it +1
        x_ppre = x_pre
        x_pre = x_novo
        x_novo = x_pre - dfunc(x_pre)*(x_pre - x_ppre)/(dfunc(x_pre)-dfunc(x_ppre))
    return x_novo,func(x_novo),it
tol=0.0001
init_guess1=0
init_guess2=3
[xopt,fopt,it]=Secica(init_guess1,init_guess2,tol)
print(xopt,fopt,it)