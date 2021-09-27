#!/usr/bin/env bash

# # # bash sd-cryptofolio.sh
#
#
#     Portfolio for your Crypto Assets
#
#     Does not use ../lib
#
#     > sudo apt install curl jq
#
#
#     > Config your Assets like this
function get_price() {

         
         set_price "BTC" "1.1"
         set_price "DOGE" "1.3"
         set_price "ETH" "2.2"
         set_price "XMR" "1.8"


}
#
#
# # #



# Relative Path
   parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
   cd "$parent_path"
   

# Terminal Config
   PS1=""
   clear
	

# Head
function set_head() {
   clear
   echo -e "\n\n\t # sd-cryptofolio \n\n\n";
   echo -e "\t Asset \t\t Price \t\t\t Number \t Total $ \n"
   echo -e "\t ---------------------------------------------------------------------- \n"
}


# Set Price
function set_price() {
   last_symbol="USDT"
   pair=$1$last_symbol
   price=$(curl -s -H -X GET 'https://api.binance.com/api/v3/ticker/price?symbol='$pair | jq -r '.price')
   sum=$(echo "$price*$2" | bc -l)
   bilanz=$(echo "$bilanz+$sum" | bc -l)
   printf "\t %s \t\t %.7f \t\t %.2f \t\t %.2f \n" $1 $price $2 $sum
}
  

# Navi
function navi() {
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


# Func run
function init() {
   bilanz=0
   set_head
   get_price
   navi
}


# loop
   init
   
   
   
# # # End

#

#
