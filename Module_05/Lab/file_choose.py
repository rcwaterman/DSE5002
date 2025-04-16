# I have always used filedialog from tkinter for this task. Import it...
from tkinter import filedialog

# Create the file_choose function that returns the response from the askopenfilename function
def file_choose():
    return filedialog.askopenfilename()