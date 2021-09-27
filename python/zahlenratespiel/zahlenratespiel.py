#!/usr/bin/env python3

# Zahlenratespiel


# import    clear  randint
import os
clear = lambda: os.system('clear')

from random import randint


# def run
def run():
    clear()
    print()
    print(" # Willkommen beim Zahlenratespiel")
    print()
    
    in_max_rand = int(input("\tBis zu welcher maximalen Zahl willst du raten? "))
    x = randint(1,in_max_rand)
    counter = int(0)

    while True:
        y = int(input("\tRate die Zahl: "))
        
        if y < 0:
            print("\tNegative Zahlen sind nicht gültig")
            continue

        if y == x:
            counter = counter + 1
            print()
            print("\tBravo, die Zufallszahl ist " + str(x) )
            print("\tBenötigte Versuche: " + str(counter) )
            print()
            break
    
        if y < x:
            counter = counter + 1
            print("\tDie Zufallszahl ist grösser als " + str(y) )
        
        if y > x:
            counter = counter + 1
            print("\tDie Zufallszahl ist kleiner als " + str(y) )
   

# def repeat
def repeat():
    print("\n\n")
    r = input(" # Exit(e) or Repeat(r)? ")

    if r == "r":
        init()
        
        
# def init
def init():
    run()
    repeat()

init() 



# END

#



