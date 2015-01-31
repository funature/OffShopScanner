#!/usr/bin/bash
#
# Felix Schulze 31/01/2015 for NoVolume WHV
#
# This Script adds the users from the member.csv file to mySql Database
#

SERVER_IP="192.168.1.26"

for((i=2; i <102; i++))
do
  nameId=`head -n $i ./member.csv | tail -n 1 | tr -d "\n" | tr -d "\r"`
  url="http://SERVER_DEST_IP/OFFShop/shop.php?idUser=USER_ID&vornameUser=USER_FNAME&nachnameUser=USER_LNAME&submit=click"
  url=`echo $url | sed "s@SERVER_DEST_IP@$SERVER_IP@g"`

  #cp for String compare
  S1=`echo $nameId`

  if [ "$S1" = "END,,"  ];
    then
    echo "::  Finished"
    break
  fi

  fname=`echo $nameId | cut -f 3 -d ","`
  lname=`echo $nameId | cut -f 2 -d ","`
  shopId=`echo $nameId | cut -f 1 -d ","`


  url=`echo $url | sed -e "s/USER_FNAME/$fname/g" -e "s/USER_LNAME/$lname/g" -e "s/USER_ID/$shopId/g"`
  wget $url -q -O /dev/null
  echo -e "[ \033[32mAdd\033[0m ] --> ID: $shopId :: $fname $lname"

done
