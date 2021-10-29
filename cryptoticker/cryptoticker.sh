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
    symbols=("BTC-USDT" "ETH-USDT" "LTC-USDT" "XMR-USDT" "DFI-USDT" "DOT-USDT" "PDEX-USDT" "LUNA-USDT" "SOV-USDT" \
    "XTZ-USDT" "HBAR-USDT" "SOL-USDT" "COTI-USDT" "LINK-USDT" "CPOOL-USDT" )


# Def header
header() {
    echo -e "\n"
    echo -e " # Cryptoticker"
    echo -e "\n"
}


# Def data -> Loop Symbols
price() {
    for i in "${symbols[@]}"
    do
        echo -n -e "\t$i\t"
            get_price $i
        echo -e -n "\t\t"
            get_change24h $i
        echo -e -n "\n"
        
    done
}


# Def navi
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
}


# Def init
init() {
    clear
    header
    price
    navi
}
init



# End

#

