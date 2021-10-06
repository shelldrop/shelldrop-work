#!/usr/bin/env python3

# open file - dictionary

# input.txt
#   Hase Tier
#   Mensch Säugetier


# Dict woerter
woerter = {}


# fobj input.txt r -> Dict woerter
fobj = open("input.txt", "r")
for line in fobj:
    line = line.strip()
    zuordnung = line.split(" ")
    woerter[zuordnung[0]] = zuordnung[1]
fobj.close()


# fobj output.txt w -> Dict woerter
fobj_out = open("output.txt", "w")
for eintrag in woerter:
    fobj_out.write("{} {}\n".format(eintrag, woerter[eintrag]))
fobj_out.close()


# Ask first word -> print second word
while True:
    wort = input("Erstes Wort: ")
    if wort in woerter:
        print("das Zweite Wort ist: ", woerter[wort])
    else:
        print("Das Wort gibt es nicht")


# End

#


