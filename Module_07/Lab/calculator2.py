import numpy as np

def add(x,y):
    """
    Add two arrays using a Python loop.
    x and y must be two-dimensional arrays of the same shape.
    """
    return np.add(x,y).reshape(x.shape)

def multiply(x,y):
    """
    Multiply two arrays using a Python loop.
    x and y must be two-dimensional arrays of the same shape.
    """
    return np.multiply(x,y).reshape(x.shape)

def sqrt(x):
    """
    Take the square root of the elements of an arrays using a Python loop.
    """
    return np.sqrt(x).reshape(x.shape)

def hypotenuse(x,y):
    """
    Return sqrt(x**2 + y**2) for two arrays, a and b.
    x and y must be two-dimensional arrays of the same shape.
    """
    return sqrt(add(x**2, y**2)).reshape(x.shape)