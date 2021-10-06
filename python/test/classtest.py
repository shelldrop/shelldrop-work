#!/usr/bin/env python3

# Class Test


# base load
import sys
sys.path.append('/home/om/shelldrop/python')
import os
clear = lambda: os.system('clear')


# imports
from lib.c.kontakt import *





# clear()

clear()


# Class create

k1 = Kontakt("Roland", "Krenn", "upmore7@gmail.com", "079 200 20 20", "Seilergasse 2A", "4800", "Zofingen", "27.04.1978")
#k1.Nachname = "Harry"
k1.output()



input("\n\nEnde")


# END

#

