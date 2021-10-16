#!/usr/bin/env bash
#
# api_binance
#

# Get API
#
#   get_pair pair
#       return price change24pro avg24 avg5
#
#   get_balance asset
#       return balance
#
#   get_orders pair
#       return orders
#
#   market pair side quantity
#
#   limit pair side quantity price
#
#   stoplosslimit pair side quantity limit_price stop_price
#
#   oco pair side quantity $price stop
#
#   del_order_id pair orderId
#
#   del_order_all pair
#



# Get Pair
function get_pair() {
   price=$(curl -s -H "X-MBX-APIKEY: $APIKEY" -X GET 'https://api.binance.com/api/v3/ticker/price?symbol='$1 | jq -r '.price')
   change24pro=$(curl -s -H "X-MBX-APIKEY: $APIKEY" -X GET 'https://api.binance.com/api/v3/ticker/24hr?symbol='$1 | jq -r '.priceChangePercent')
   avg24=$(curl -s -H "X-MBX-APIKEY: $APIKEY" -X GET 'https://api.binance.com/api/v3/ticker/24hr?symbol='$1 | jq -r '.weightedAvgPrice')
   avg5=$(curl -s -H "X-MBX-APIKEY: $APIKEY" -X GET 'https://api.binance.com/api/v3/avgPrice?symbol='$1 | jq -r '.price')
}


# Get Balance
function get_balance() {
   timestamp=$(( $(date +%s) *1000))
   timestamp='timestamp='$timestamp
   querystring=$timestamp
   signature=`echo -n $querystring | openssl dgst -sha256 -hmac $APISECRET`
   signature=`echo $signature|cut -c 10-`
   signature='signature='$signature
   balance=$(curl -s -H "X-MBX-APIKEY: $APIKEY" -X GET 'https://api.binance.com/api/v3/account?'$timestamp'&'$signature | jq -r '.balances' | jq -r '.[] | select(.asset=="'$1'")' | jq -r '.free')
}


# Get Orders
function get_orders() {
   symbol='symbol='$1
   timestamp=$(( $(date +%s) *1000))
   timestamp='timestamp='$timestamp
   querystring=$symbol"&"$timestamp
   signature=`echo -n $querystring | openssl dgst -sha256 -hmac $APISECRET`
   signature=`echo $signature|cut -c 10-`
   signature='signature='$signature
   orders=$(curl -s -H "X-MBX-APIKEY: $APIKEY" -X GET 'https://api.binance.com/api/v3/openOrders?'$symbol'&'$timestamp'&'$signature | jq -r '.[].orderId' )
   side=$(curl -s -H "X-MBX-APIKEY: $APIKEY" -X GET 'https://api.binance.com/api/v3/openOrders?'$symbol'&'$timestamp'&'$signature | jq -r '.[].side' )
}


# Market
function market() {
   symbol='symbol='$1
   side='side='$2
   type='type=MARKET'
   quantity='quantity='$3
   recvWindow='recvWindow=5000'
   timestamp=$(( $(date +%s) *1000))
   timestamp='timestamp='$timestamp
   querystring=$symbol"&"$side"&"$type"&"$quantity"&"$recvWindow"&"$timestamp
   signature=`echo -n $querystring | openssl dgst -sha256 -hmac $APISECRET`
   signature=`echo $signature|cut -c 10-`
   signature='signature='$signature
   orderId=$( curl -s -H "X-MBX-APIKEY: $APIKEY" -X POST 'https://api.binance.com/api/v3/order?'$symbol'&'$side'&'$type'&'$quantity'&'$recvWindow'&'$timestamp'&'$signature | jq -r '.orderId' )
}


# Limit
function limit() {
   symbol='symbol='$1
   side='side='$2
   type='type=LIMIT'
   timeInForce='timeInForce=GTC'
   quantity='quantity='$3
   bl_price='price='$4
   timestamp=$(( $(date +%s) *1000))
   timestamp='timestamp='$timestamp
   querystring=$symbol"&"$side"&"$type"&"$timeInForce"&"$quantity"&"$bl_price"&"$timestamp
   signature=`echo -n $querystring | openssl dgst -sha256 -hmac $APISECRET`
   signature=`echo $signature|cut -c 10-`
   signature='signature='$signature
   orderId=$( curl -s -H "X-MBX-APIKEY: $APIKEY" -X POST 'https://api.binance.com/api/v3/order?'$symbol'&'$side'&'$type'&'$timeInForce'&'$quantity'&'$bl_price'&'$timestamp'&'$signature | jq -r '.orderId' )
}


# Stop Loss Limit
function stoplosslimit() {
   symbol='symbol='$1
   side='side='$2
   type='type=STOP_LOSS_LIMIT'
   quantity='quantity='$3
   limit_price='price='$4 
   stop_price='stopPrice='$5
   timeInForce='timeInForce=GTC'
   timestamp=$(( $(date +%s) *1000))
   timestamp='timestamp='$timestamp
   querystring=$symbol"&"$side"&"$type"&"$quantity"&"$limit_price"&"$stop_price"&"$timeInForce"&"$timestamp
   signature=`echo -n $querystring | openssl dgst -sha256 -hmac $APISECRET`
   signature=`echo $signature|cut -c 10-`
   signature='signature='$signature
   orderId=$( curl -s -H "X-MBX-APIKEY: $APIKEY" -X POST 'https://api.binance.com/api/v3/order?'$symbol'&'$side'&'$type'&'$quantity'&'$limit_price'&'$stop_price'&'$timeInForce'&'$timestamp'&'$signature | jq -r '.orderId' )
}


# OCO
function oco() {
   symbol='symbol='$1
   side='side='$2
   quantity='quantity='$3
   price='price='$4
   stop_price='stopPrice='$5
   stop_price_limit='stopLimitPrice='$6
   stopLimitTimeInForce='stopLimitTimeInForce=GTC'
   timestamp=$(( $(date +%s) *1000 ))
   timestamp='timestamp='$timestamp
   querystring=$symbol"&"$side"&"$quantity"&"$price"&"$stop_price"&"$stop_price_limit"&"$stopLimitTimeInForce"&"$timestamp
   signature=`echo -n $querystring | openssl dgst -sha256 -hmac $APISECRET`
   signature=`echo $signature| cut -c 10-`
   signature='signature='$signature
   orderId=$( curl -s -H "X-MBX-APIKEY: $APIKEY" -X POST 'https://api.binance.com/api/v3/order/oco?'$symbol'&'$side'&'$quantity'&'$price'&'$stop_price'&'$stop_price_limit'&'$stopLimitTimeInForce'&'$timestamp'&'$signature | jq -r '.orderId' )
}


# Delete Order by Id
function del_order_id() {
   symbol='symbol='$1
   order_id='orderId='$2
   timestamp=$(( $(date +%s) *1000))
   timestamp='timestamp='$timestamp
   querystring=$symbol"&"$order_id"&"$timestamp
   signature=`echo -n $querystring | openssl dgst -sha256 -hmac $APISECRET`
   signature=`echo $signature|cut -c 10-`
   signature='signature='$signature
   curl -s -H "X-MBX-APIKEY: $APIKEY" -X DELETE 'https://api.binance.com/api/v3/order?'$symbol'&'$order_id'&'$timestamp'&'$signature
}


# Delete all Order
function del_order_all() {
   symbol='symbol='$1
   timestamp=$(( $(date +%s) *1000))
   timestamp='timestamp='$timestamp
   querystring=$symbol"&"$timestamp
   signature=`echo -n $querystring | openssl dgst -sha256 -hmac $APISECRET`
   signature=`echo $signature|cut -c 10-`
   signature='signature='$signature
   curl -s -H "X-MBX-APIKEY: $APIKEY" -X DELETE 'https://api.binance.com/api/v3/openOrders?'$symbol'&'$timestamp'&'$signature
}



# # # End

#

#

