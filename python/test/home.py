#!/usr/bin/env python3

# Class Test


# base load
import sys
sys.path.append('/home/om/shelldrop/python')
import os
clear = lambda: os.system('clear')


# imports
from lib.c.wm import *





# clear()

clear()


# Class create

#w1 = WM(1000,400, "My Title", "blue", "true", "../res/logo.png")

wm = Tk()
Wm(wm, 1000, 400, "My Title", "blue", "true", "../res/logo.png")



l2 = Label(text="NNNNN", bg="black", fg="white")
l2.pack()




#l2.text.set("Mope")


#l1.config(text ="Mope") 

#l2 = w1.Label(text="juuuhhuu", bg="green", fg="black").pack()


#l1.lab("Hallo", "red", "black")


#b1 = w1.but("lala", "blue", "red")
#b1['text'] = "Text updated"




wm.mainloop()







input("\n\nEnde")


# END

#

