#!/usr/bin/bash
#
# Felix Schulze 28/01/2015 for NoVolume WHV
#
#You have to install "pillow" and "qrcode" for python2.7
#before running this skritp

for((i=2; i <102; i++))
do
	nameId=`head -n $i ./member.csv | tail -n 1 | tr -d "\n" | tr -d "\r"`

	#cp for String compare
	S1=`echo $nameId | cut -c 11- | cut -c -2`
	S2=",,"

	if [ "$S1" = "$S2" ];
	then
		echo "::Finished"
		break
	fi

	fname=`echo $nameId | cut -f 3 -d ","`
	lname=`echo $nameId | cut -f 2 -d ","`
	shopId=`echo $nameId | cut -f 1 -d ","`

	echo $shopId-$lname-$fname

	qr --factory=svg-fragment $shopId-$lname-$fname > ./qrcode/$shopId-$lname-$fname.svg
done
