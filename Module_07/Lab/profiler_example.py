# -*- coding: utf-8 -*-
"""
Created on Mon Feb 17 19:35:42 2025

@author: hdavi
"""

# load numpy as np

import numpy as np

# load the user created file "calculator",  this has the functions
# we will profile

import calculator2 as calc

#set the matrix sizes

M = 10**3
N = 10**3

# set the seed on the random number generator
# so we get repeatable results

np.random.seed(42)

# generate random matrices to work with

A = np.random.random((M,N))
B = np.random.random((M,N))

#now call hypotenause and print the first return value

print(calc.hypotenuse(A, B)[0,0])