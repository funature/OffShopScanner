

#!/usr/bin/bash
#
# Felix Schulze 31/01/2015 for NoVolume WHV
#
# This Script adds the users from the member.csv file to mySql Database
#

SERVER_IP="192.168.1.26"

for((i=2; i <102; i++))
do
  itemId=`head -n $i ./items.csv | tail -n 1 | tr -d "\n" | tr -d "\r"`
  url="http://SERVER_DEST_IP/OFFShop/shop.php?idItem=ITEM_CODE&nameItem=ITEM_DESC&preisItem=ITEM_PRICE&submitinsertUser=insertItem"
  url=`echo $url | sed "s@SERVER_DEST_IP@$SERVER_IP@g"`

  #cp for String compare
  S1=`echo $itemId`

  if [ "$S1" = "END,,"  ];
    then
    echo "::  Finished"
    break
  fi

  itemCode=`echo $itemId | cut -f 1 -d ","`
  itemDesc=`echo $itemId | cut -f 2 -d ","`
  itemPrice=`echo $itemId | cut -f 3 -d ","`


  url=`echo $url | sed -e "s/ITEM_CODE/$itemCode/g" -e "s/ITEM_DESC/$itemDesc/g" -e "s/ITEM_PRICE/$itemPrice/g"`
  wget $url -q -O /dev/null
  echo -e "[ \033[32mAdd\033[0m ] --> ID: $itemCode :: $itemDesc $itemPrice"

done
