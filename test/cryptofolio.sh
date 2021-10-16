#!/usr/bin/env bash

# cryptofolio
#
# Portfolio for your Crypto Assets
#
#   > sudo apt install curl jq
#
#   > Config your Assets like this
get_price() {

    price "BTC" "1.1"
    price "DOGE" "1.3"
    price "ETH" "2.2"
    price "XMR" "1.8"


}
#
#


# Base
    parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
    cd "$parent_path"
    PS1=""
    clear  


# Def header
header() {
    clear
    echo -e "\n\n\t # sd-cryptofolio \n\n\n";
    echo -e "\t Asset \t\t Price \t\t\t Number \t Total $ \n"
    echo -e "\t ---------------------------------------------------------------------- \n"
}


# Def price
price() {
   last_symbol="USDT"
   pair=$1$last_symbol
   price=$(curl -s -H -X GET 'https://api.binance.com/api/v3/ticker/price?symbol='$pair | jq -r '.price')
   sum=$(echo "$price*$2" | bc -l)
   bilanz=$(echo "$bilanz+$sum" | bc -l)
   printf "\t %s \t\t %.7f \t\t %.2f \t\t %.2f \n" $1 $price $2 $sum
}
  

# Def navi
navi() {
   echo -e "\n\t ---------------------------------------------------------------------- \n"
   printf "\t\t\t\t\t\t\t\t %.2f %s \n" $bilanz $last_symbol
   echo -e "\n\n\n\t [e] \t exit "
   echo -e "\t [any] \t reload \n\n"
   read input


   case "$input" in
      e | exit) exit ;;
      r) init ;;
      *) init ;;
   esac
}


# Def init
init() {
   bilanz=0
   header
   get_price
   navi
}
init
   
   
   
# End

#

