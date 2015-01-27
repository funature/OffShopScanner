#!/usr/bin/bash
#You have to install "pillow" and "qrcode" for python2.7
#before running this skritp


for((i=2; i <102; i++))
do
	nameId=`head -n $i ./member.csv | tail -n 1 | tr -d "\n" | tr -d "\r" | sed "s/,/-/g"`

	#cp for String compare
	S1=`echo $nameId | awk '{print substr($0,11)}'`
	S2="--"

	if [ "$S1" = "$S2" ];
	then
		echo "::Finished"
		break
	fi	
	
	echo $nameId

	qr --factory=svg-fragment $nameId > $nameId.svg
done

