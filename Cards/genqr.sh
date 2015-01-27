#!/usr/bin/bash
#You have to install "pillow" and "qrcode" for python2.7
#before running this skritp
#This script creats 100 QR-Codes and delete the unnecessaries.
#Because I dont know how to write an abort condition.


for((i=2; i <102; i++))
do
	nameId=`head -n $i ./member.csv | tail -n 1 | tr -d "\n" | tr -d "\r" | sed "s/,/-/g"`

	echo $nameId

	qr --factory=svg-fragment $nameId > $nameId.svg
done

rm ./*--.svg
