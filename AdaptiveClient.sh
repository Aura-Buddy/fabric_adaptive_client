#Since we only have three options now for data type, string, int and image, we will set two characters
#	to represent 01 - string, 02 - int, 03 - - image
string=1
stringHeader='01'
int=2
intHeader='02'
image=3
imageHeader='03'
done=4
counter=1	#first value of ledger and increments with each transaction request
input=0

#Then we should install a while loop
echo "\nTo use this client\nType in for your first argument the numeric value associated with each argument\n\n1\tString\n2\tInt\n3\tImage\n4\tFinished Using Client\n\nYour second argument is the data you want to append to the ledger\n\n"
echo "What would you like to send\n"
read input
while [ $input != $done ]; do
    #if my first input is a string
    if [ $input -eq $string ]; then
	echo "Type in your message: \n"
	read stringValue
        sendingmessage=$stringHeader$stringValue
        ./AdaptiveClient.go $counter $sendingmessage
        #increment counter to next value onto next ledger appendage
        counter=$(($counter + 1))
        echo "\nIf you are done, type '4' for your next command"
    fi
    #if my first input is an int
    if [ $input -eq $int ]; then
	echo "Type in your message: \n"
	read intValye
        sendingmessage=$intHeader$intValue
        ./AdaptiveClient.go $counter $sendingmessage
        #increment counter to next value onto next ledger appendage
        counter=$(($counter + 1))
        echo "If you are done, type '4' for your next command"
    fi
    #if my first input is an image
    if [ $input -eq $image ]; then
	echo "Type in your image file name: \n"
	read imagefileName
        sendingmessage=$imageHeader$imagefileName
        ./AdaptiveClient.go $counter $sendingmessage
        #increment counter to next value onto next ledger appendage
        counter=$(($counter + 1))
        echo "If you are done, type '4' for your next command"
    fi
    if [ $input -eq $done ]; then
        read 4
    fi
    if [ $input != $string ]; then
  	if [ $input != $int ]; then
		if [ $input != $image ]; then
			if [ $input != $done ]; then
    				echo "\nTo use this client\nType in for your first argument the numeric value associated with each argument\n\n1\tString\n2\tInt\n3\tImage\n4\tFinished Using Client\n\nYour second argument is the data you want to append to the ledger\n\n"
    			fi
		fi
	fi
    fi
    read input
done    
