#!/usr/bin/env python2.7

#Felix Schulze
#2015/01/20



def searchCode(ScanCode):

    # send Ean-Code to Novolume OffShop Server
    # and get item description and price
    # if item could not be found send item = 0 !
    item = "Coke 0.5l"
    # return price as string !
    price = "1.00"

    return item, price



# Start of main program
print ("\n\rOffShopScanner Software\n\rVer.: 0.9 --- NoVolume\n\rFelix Schulze 2015")

# Wait for login via rfid card

# as long as the purchase is not completed scan for ean-codes
while 1:

    # Scan ean-codes
    ScanCode= raw_input("\nScan... : ")

    # Check if END is typed and leave while loop
    #print (ScanCode.encode("hex"))
    if(ScanCode == "END"):
        print ("Purchased finished")
        break

    # send request to server and get descripton and price back
    item, price = searchCode(ScanCode)

    # print warning if scanned item could not be found
    if (item == "0"):
        print ("Item not found")
        continue

    # print item informations on the screen
    print ("Item    : " + item)
    print ("Price   : " + price + " EUR")
    # send item information via UART to microcontroller

# if purchase is finished send bill to Novolume Shop Server
