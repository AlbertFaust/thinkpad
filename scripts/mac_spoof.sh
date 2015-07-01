#!/bin/bash                                                                                                                                                     
function generate_mac ()  {
    hexchars="0123456789abcdef"
    echo "60:57:18$(
        for i in {1..6}; do 
            echo -n ${hexchars:$(( $RANDOM % 16 )):1}
        done | sed -e 's/\(..\)/:\1/g'
    )"
}
MAC=$(generate_mac)
ip link set dev wlp4s0 down
ip link set dev wlp4s0 address $MAC
ip link set dev wlp4s0 up
