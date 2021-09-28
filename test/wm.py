#!/usr/bin/ python3

# Function: Windowmanager

# Script import
#
#   from lib.wm import wm
#   wm(1000,400,"My Title","blue",RESI="true" or "false")


# import    tkinter
from tkinter import *


# create window
def wm(width,height,title,bg,resi):
    wm = Tk()
    w = width
    h = height
    x = wm.winfo_screenwidth()
    y = wm.winfo_screenheight()
    pos_x = int(x/2 - w/2)
    pos_y = int(y/2 - h/2)
    wm.geometry(f'{w}x{h}+{pos_x}+{pos_y}')
    icon = PhotoImage(file = 'res/logo.png')
    wm.iconphoto(False, icon)
    wm.title(title)
    wm.configure(bg=bg)
    wm.resizable(resi,resi)


# body



    
# mainloop
    wm.mainloop()



# End

#
