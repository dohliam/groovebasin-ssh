#!/bin/bash

IP="localhost"	# remote IP address
GB_LOC=".groovebasin"	# location of the remote groovebasin folder

echo "Connecting to remote IP: $IP"

# forward ports to groovebasin and then start the groovebasin server
if [ "$1" == '' ]; then
  ssh -t -t -L 16242:127.0.0.1:16242 $IP "cd $GB_LOC; groovebasin" &
elif [ $1 == "-k" ]; then
  ssh -t -t -L 16242:127.0.0.1:16242 $IP "killall nodejs; cd $GB_LOC; groovebasin" &
fi

# open browser to groovebasin page
xdg-open http://0.0.0.0:16242/
