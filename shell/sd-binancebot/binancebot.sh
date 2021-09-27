#!/usr/bin/env bash

# # # bash sd-binancebot.sh
#
#
#     This is a Binance Bot to trade automatically on Binance.
#
#     Used ../lib
#     > sudo apt install jq curl
#
#
# Config API Key
#
      APIKEY="<API Key>"
      APISECRET="<Secret Key>"
#
# Loop time s
      loop_time='60'
#  
# Pair
      first_pair="BNB"
      last_pair="USDT"
#
# OCO BUY
      buy_vol="2"
      buy_price="330"
      buy_stop="380"
      buy_stop_limit="370"
# 
# OCO SELL
      sell_vol="2"
      sell_price="380"
      sell_stop="330"
      sell_stop_limit="320"
#
#
# # #



# Relative Path
   parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
   cd "$parent_path"

# Source
   source ../lib/api_binance.sh

# Vars INI
   pair=$first_pair$last_pair



# Logic
function logic() {

# Get Price
   get_pair $pair
   f_price=$price
  
# Get Orders
   get_orders $pair
   f_orders=$orders
 
# Get Balance
   get_balance $first_pair
   f_balance_first=$balance
   get_balance $last_pair
   f_balance_last=$balance


# If Order Exist
   clear
   
   if [ "$f_orders" == "" ]
   then
      oco $pair "BUY" $buy_vol $buy_price $buy_stop $buy_stop_limit
      not_sell="true"
      echo -e "\n\n\t BUY"
   fi
   
   if [ "$f_orders" != "" ] && [ "$not_sell" != "true" ]
   then
      oco $pair "SELL" $sell_vol $sell_price $sell_stop $sell_stop_limit
      echo -e "\n\n\t SELL"
   fi

   not_sell="false"

   echo -e "\n\n\t Pair: " $pair
   echo -e "\t Price: " $f_price
   echo -e "\t Balance First Pair: " $f_balance_first
   echo -e "\t Balance Last Pair: " $f_balance_last
   echo -e "\n\n"
  
}



# Init
function init() {
  logic
  sleep $loop_time
  init
}
init



# # # End

#

#

