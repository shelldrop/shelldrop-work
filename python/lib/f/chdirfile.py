#!/usr/bin/ python3

# Change directory to file place
#
# from chdirfile import *
# chdirfile()


# import
import os


# def chdirfile
def chdirfile():
    abspath = os.path.abspath(__file__)
    dname = os.path.dirname(abspath)
    os.chdir(dname)



# END

#
