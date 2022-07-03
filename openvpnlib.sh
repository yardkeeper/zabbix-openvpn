#!/bin/bash
file="openvpn-status.log"
IFS=$'\n';


function get_users () {


a=$(cat $file|wc -l)
b=$( echo "$a / 2 - 1 / 1"|bc )
for cn in $(cat $file|sed -n 4,"$b"p| cut -d "," -f 1 | jq  --raw-input '. | split("\n") | map( {"{#VPNUSER}": .} ) | {data: .}')
do
  echo "$cn"
done
}

function get_address () {

a=$(cat $file|wc -l)
b=$( echo "$a / 2 - 1 / 1"|bc )
for ad in $(cat $file|sed -n 4,"$b"p| cut -d "," -f 2)
do
  echo "$ad"
done
}

function get_byter () {

a=$(cat $file|wc -l)
b=$( echo "$a / 2 - 1 / 1"|bc )
for br in $(cat $file|sed -n 4,"$b"p| cut -d "," -f 3)
do
  echo "$br"
done
}

function get_bytes () {

a=$(cat $file|wc -l)
b=$( echo "$a / 2 - 1 / 1"|bc )
for bs in $(cat $file|sed -n 4,"$b"p| cut -d "," -f 4)
do
  echo "$bs"
done
}


function get_connected () {

a=$(cat $file|wc -l)
b=$( echo "$a / 2 - 1 / 1"|bc )
for con in $(cat $file|sed -n 4,"$b"p| cut -d "," -f 5)
do
  echo "$con"
done



echo "$get_address"
