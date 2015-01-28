#!/usr/bin/bash



for((i=2; i <102; i++))
do
  nameId=`head -n $i ./member.csv | tail -n 1 | tr -d "\n" | tr -d "\r"`
  nameIdx=`echo $nameId | sed "s/,/-/g"`


  #cp for String compare
  S1=`echo $nameId | awk '{print substr($0,11)}'`
  S2=",,"

  if [ "$S1" = "$S2" ];
  then
    echo "::  Finished"
    break
  fi

  fname=`echo $nameId | cut -f 3 -d ","`
  lname=`echo $nameId | cut -f 2 -d ","`
  shopId=`echo $nameId | cut -f 1 -d ","`
  qrsvg=`cat ./qrcode/$nameIdx.svg | cut -c 90- | sed "s/svg://g" | sed "s/<\/svg>//g"`

  echo "ID: $shopId :: $fname $lname"
  cat default.svg | sed -e "s@USER_QR@$qrsvg@g" -e "s/USER_NAME/$fname $lname/g" -e "s/USER_ID/$shopId/g" > ./cards/$fname-$lname.svg

done
