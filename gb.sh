#!/bin/bash

IP="localhost"	# remote IP address
GB_LOC=".groovebasin"	# location of the remote groovebasin folder

# forward ports to groovebasin and then start the groovebasin server

echo "Connecting to remote IP: $IP"
ssh -t -t -L 16242:127.0.0.1:16242 $IP "cd $GB_LOC; groovebasin" &

# open browser to groovebasin page

xdg-open http://0.0.0.0:16242/
