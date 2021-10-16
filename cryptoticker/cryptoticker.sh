#!/usr/bin/env bash

# cryptoticker
#


# Base
    parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
    cd "$parent_path"
    PS1=""


# Source
    source ../lib/api/api_kucoin.lib


# Array -> Symbols
    symbols=("BTC-USDT" "ETH-USDT" "DOT-USDT" "PDEX-USDT" "DFI-USDT" "XMR-USDT")


# Function Header
header() {
    echo -e " # Cryptoticker"
    echo -e "\n"
}


# Loop Symbols
price() {
    for i in "${symbols[@]}"
    do
        echo -n -e "\t$i\t"
        get_price $i
    done
}


# Navi
navi() {
    echo -e "\n\n"
    echo -n -e "\tExit(e) | Repeat(r) -> "
    read navi
    
    if [ "$navi" == "r" ]
    then
        init
    else
        exit 1
    fi     
}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


# Func run
init() {
    clear
    header
    price
    navi
}
init



# End

#

