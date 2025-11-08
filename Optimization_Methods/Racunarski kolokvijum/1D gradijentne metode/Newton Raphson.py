# -*- coding: utf-8 -*-
"""
Created on Wed Dec 21 18:31:16 2022

@author: Korisnik
"""
import numpy as np
import math
def func(x):
    f=x**4-5*x**3-2*x**2+24*x
    return f
def dfunc(x):
    f=4*x**3-15*x**2-4*x+24
    return f
def ddfunc(x):
    f=12*x**2-30*x-4
    return f


def NewtonRaphson(x0,tol):
    x_novo = x0
    x_pre = math.inf
    iteracije = 0
    while(np.abs(x_novo - x_pre)>tol):
        iteracije = iteracije + 1
        x_pre = x_novo
        x_novo = x_pre - dfunc(x_pre)/ddfunc(x_pre)
    return x_novo,func(x_novo),iteracije

tol=0.0001
init_guess=1
[xopt,fopt,iter]=NewtonRaphson(init_guess,tol)
print(xopt,fopt,iter)









    
        