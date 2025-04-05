"""

4.11.3. Exercise Part 1

Now write a more general function called parallelogram that draws a 
quadrilateral with parallel sides. 

"""

import turtle
import sys

class Parallelogram():
    def __init__(self):

        #create the canvas and turtle
        self.screen = turtle.Screen()
        self.t = turtle.Turtle()

        #This dictionary contains the action step and it's inverse function
        self.actions = {
            "left" : self.t.right,
            "right" : self.t.left,
            "forward" : self.t.back,
            "backward" : self.t.forward
        }

        #track all of the steps taken in a dictionary.
        self.steps = []

    def parallelogram(self, l1=150, l2=100, angle=60, shift=0):
        """
        Takes in a width and height and draws a rectangle based on those dims.
        """
        #take the steps required to make a rectangle
        self.t.forward(l1)
        self.steps.append(("forward", l1))

        self.t.left(angle)
        self.steps.append(("left", angle))

        self.t.forward(l2)
        self.steps.append(("forward", l2))

        self.t.left(180-angle)
        self.steps.append(("left", 180-angle))

        self.t.forward(l1)
        self.steps.append(("forward", l1))

        self.t.left(angle)
        self.steps.append(("left", angle))

        self.t.forward(l2)
        self.steps.append(("forward", l2))

        if shift:
            self.t.left(shift)
            self.steps.append(("left", shift))

    def is_drawn(self):
        """
        Track whether a rectangle has been drawn, this will evaluate as 
        true if self.steps > 0
        """
    
        return len(self.steps)

    def undo(self):
        """
        If the rhombus is drawn, iterate through the drawing 
        steps and complete the inverse.
        """
        if self.is_drawn():
            self.steps.reverse()
            self.t.pencolor("white")
            for step in self.steps:
                #we first need to invert the direction we are traveling in
                action = self.actions[step[0]]
                action(int(step[1]))
            self.steps = []
            self.t.pencolor("black")
        else:
            print("Nothing to undo.")

    def get_input(self, wrapper=False):
        """
        Adding this function to this class in preparation for part 2 of this 
        question.

        The 'wrapper' key word changes the input text if parallelogram is being 
        called by a wrapper class.
        """

        if wrapper:
            vars = input("""Enter side length 1, side length 2, and interior angle separated by a space, 'undo' to clear the canvas or 'exit' to return to shape selection: """)
        else:
            vars = input("""Enter side length 1, side length 2, and interior angle separated by a space, or 'undo' to clear the canvas or 'exit' to close the window: """)

        #just so you can read the input for wrapper=Trua, I am copying it below:
        """
        Enter side length 1, side length 2, and interior angle separated by a space, 
        'undo' to clear the canvas or 'exit' to return to shape selection: 
        """

        #just so you can read the input for wrapper=False, I am copying it below:
        """
        Enter side length 1, side length 2, and interior angle separated by a space, 
        or 'undo' to clear the canvas or 'exit' to close the window: 
        """
    
        try:
            if len(vars.split(" ")) > 3:
                """
                allowing for special 'iterations' and 'shift' keywords that 
                will repeat the draw sequence 'iterations' times with 'shift' 
                angular offset each time
                this makes some cool patterns
                """
                
                l1, l2, angle, iterations, shift = vars.split(" ")
                
                """
                In my code I assigned all of these in one line, but they 
                get cut off in the PDF
                """
                l1 = int(l1)
                l2 = int(l2)
                angle = int(angle)
                iterations = int(iterations)
                shift = int(shift)

                for i in range(iterations):
                    self.parallelogram(l1, l2, angle, shift)

            elif len(vars.split(" ")) == 3:
                l1, l2, angle = vars.split(" ")
                l1, l2, angle = int(l1), int(l2), int(angle)
                self.parallelogram(l1, l2, angle)

            elif len(vars.split(" ")) == 1:
                if vars == "undo":
                    self.undo()
                elif vars == "exit":
                    #return true as an escape condition for the while loop
                    return 1
        except:
            print("There was an error in the entry, try again.")
    
    def clearscreen(self):
        """
        Adding in preparation for part 2...

        Give the user will have the option to clear the screen
        """
        self.screen.clearscreen()

if __name__ == '__main__':

    #Instantiate the parallelogram
    para = Parallelogram()

    """
    Continuously prompt the user for parallalogram 
    inputs until the enter "exit"
    """
    while 1:
        if para.get_input():
            break

    sys.exit()

    #this keeps the canvas open
    turtle.done()
