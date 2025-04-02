"""

4.11.1. Exercise

Write a function called rectangle that draws a rectangle with given side lengths. For example, here's a rectangle that's 80 units wide and 40 units tall.

"""

import jupyturtle as jp

def rect(width=100, height=100,polarity=1):
    """
    Takes in a width and height and draws a rectangle based on those dims.

    Polarity defines the initial direction of the first step (1=right, 0=left)
    """

    #create the canvas and turtle
    jp.make_turtle()

    #take the steps required to make a rectangle
    jp.forward(100)

if __name__ == '__main__':
    rect()