#!/usr/bin/env python3

# Crypto Ticker from Binance API
#
# pip install request


# import    clear   request
import os
clear = lambda: os.system('clear')

import requests


# list pair
pair = ["BTCUSDT","ETHUSDT","ADAUSDT","SOLUSDT","DOTUSDT","XTZUSDT","XMRUSDT", "LUNAUSDT", "HBARUSDT"]


# def head
def head():
    clear()
    print()
    print(" # Crypto Ticker")
    print()


# def run   for get_price
def run():
    for i in pair:
        r = requests.get('https://api.binance.com/api/v3/ticker/price?symbol=' + i)
        data = r.json()
        print("\t" + data['symbol'] + "\t\t" + data['price'])


# def repeat
def repeat():
    print("\n\n")
    r = input(" # Exit(e) or Repeat(r)? ")

    if r == "r":
        init()


# def init
def init():
    head()
    run()
    repeat()

init()    



# END

#

