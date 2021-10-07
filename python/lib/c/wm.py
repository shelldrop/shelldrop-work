#!/usr/bin/ python3

# class Wm -> Windowmanager tkinter
#
# wm = Tk()
# Wm(wm, 1000, 400, "Title", "bg", "resi=true/false", "path/to/icon")
# ...code
# wm.mainloop()


# import
from tkinter import *


# class Wm
class Wm():

    def __init__(self, wm, width, height, title, bg, resi, icon):
        self.W = width
        self.H = height
        self.Title = title
        self.Bg = bg
        self.Resi = resi
        self.Icon = icon
        x = wm.winfo_screenwidth()
        y = wm.winfo_screenheight()
        pos_x = int(x/2 - self.W/2)
        pos_y = int(y/2 - self.H/2)
        wm.geometry(f'{self.W}x{self.H}+{pos_x}+{pos_y}')
        icon = PhotoImage(file = self.Icon)
        wm.iconphoto(False, icon)
        wm.title(self.Title)
        wm.configure(bg=self.Bg)
        wm.resizable(self.Resi,self.Resi)



# End

#
