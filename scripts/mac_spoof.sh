#!/bin/bash
while true
do
    function generate_mac ()  {
        hexchars="0123456789abcdef"
        echo "$prefix$(
            for i in {1..6}; do 
                echo -n ${hexchars:$(( $RANDOM % 16 )):1}
            done | sed -e 's/\(..\)/:\1/g'
        )"
    }
    old_mac=$(ip link show wlp4s0 | awk '/ether/ {print $2}')
    prefix=${old_mac:0:8}
    mac=$(generate_mac)
    ip link set dev wlp4s0 down
    ip link set dev wlp4s0 address $mac
    ip link set dev wlp4s0 up
    echo 'Old MAC address: ' ${old_mac}
    echo 'New MAC address: ' ${mac}
    sleep 3540                                                                                                                                                  
    wait
done
