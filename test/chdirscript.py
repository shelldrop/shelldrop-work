#!/usr/bin/ python3

# Change to directory of script for .desktop


# Script import
#
#   from chdirscript import chdir
#   chdirscript()


# import    os
import os


# def   change directory
def chdirscript():
    abspath = os.path.abspath(__file__)
    dname = os.path.dirname(abspath)
    os.chdir(dname)



# END

#
