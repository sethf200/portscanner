#!/bin/bash

# Define function to determine port range based on hostname
get_port_range() {
    case "$HOSTNAME" in
	LinuxPC)
	    MINPORT=1
	    MAXPORT=100
	    ;;
        Server1)
            MINPORT=1
            MAXPORT=4369
            ;;
        Server2)
            MINPORT=4370
            MAXPORT=8738
            ;;
        Server3)
            MINPORT=8739
            MAXPORT=13107
            ;;
        Server4)
            MINPORT=13108
            MAXPORT=17476
            ;;
        Server5)
            MINPORT=17477
            MAXPORT=21845
            ;;
        Server6)
            MINPORT=21846
            MAXPORT=26214
            ;;
        Server7)
            MINPORT=26215
            MAXPORT=30583
            ;;
        Server8)
            MINPORT=30584
            MAXPORT=34952
            ;;
        Server9)
            MINPORT=34953
            MAXPORT=39321
            ;;
        Server10)
            MINPORT=39322
            MAXPORT=43690
            ;;
        Server11)
            MINPORT=43691
            MAXPORT=48059
            ;;
        Server12)
            MINPORT=48060
            MAXPORT=52428
            ;;
        Server13)
            MINPORT=52429
            MAXPORT=56797
            ;;
        Server14)
            MINPORT=56798
            MAXPORT=61166
            ;;
        Server15)
            MINPORT=61167
            MAXPORT=65535
            ;;
        *)
            echo "Unknown hostname: $HOSTNAME"
            exit 1
            ;;
    esac
}

# Call the function to get the port range
get_port_range

# Display the port range for the current server
echo "Hostname: $HOSTNAME"
echo "Port range: $MINPORT - $MAXPORT"
sleep 5
a=$MINPORT
((b = MINPORT + 4))
SCANNUMBER=1
while [ $b -le $MAXPORT ]
do
	FILENAME="scans/scan_${SCANNUMBER}.txt"
	sudo nmap -T4 -sS -p$a-$b -oN $FILENAME -Pn 134.209.45.61
	sleep 61
	a=$(( $a+5 ))
	b=$(( $b+5 ))
	((SCANNUMBER++))
done
