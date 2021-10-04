#!/usr/bin/env python3

# Crypto Ticker from Kucoin API
#
# pip install request


# import    clear   request
import os
clear = lambda: os.system('clear')

import requests


# list pair
pair = ["BTC-USDT", "ETH-USDT", "ADA-USDT", "SOL-USDT", "DOT-USDT", \
        "LUNA-USDT", "ALGO-USDT", "XTZ-USDT", "HBAR-USDT", "XMR-USDT", \
        "PDEX-USDT", "DFI-USDT"]


# def head
def head():
    clear()
    print()
    print(" # Crypto Ticker")
    print()


# def run   for get_price
def run():
    for i in pair:
        r = requests.get('https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=' + i)
        data = r.json()
        print("\t" + i + "\t" + data['data']['price'])


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

