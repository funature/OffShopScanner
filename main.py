#!/usr/bin/env python

#Felix Schulze
#2015/01/20


def searchCode(ScanCode):

    # send Ean-Code to Novolume OffShop Server
    # and get item description and price
    # if item could not be found send item = 0 !

    #return item, price

# Start of main program
print ("\n\rOffShopScanner Software\n\rVer.: 0.9 --- [NoVolume] Felix Schulze 2015")

# Wait for login via rfid card

# as long as the purchase is not completed scan for ean-codes
while 1:
  ScanCode= input("\nScan... : ")

  item, price = searchCode(ScanCode)

  if (item == "0"):
    print ("Item not found")
    i-=1
    continue


  print ("Item    : " + item)
  print ("Price   : " + price + " EUR")
  i+=1

# if purchase is finished send bill to Novolume Shop Server
