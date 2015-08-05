#!/bin/bash

IP="localhost"	# remote IP address
GB_LOC=".groovebasin"	# location of the remote groovebasin folder

MSG="Connecting to remote IP: $IP"

# forward ports to groovebasin and then start the groovebasin server
if [ "$1" == '' ]; then
  echo $MSG
  ssh -t -t -L 16242:127.0.0.1:16242 $IP "cd $GB_LOC; groovebasin" &
elif [ $1 == "-k" ]; then
  echo $MSG
  ssh -t -t -L 16242:127.0.0.1:16242 $IP "killall nodejs; cd $GB_LOC; groovebasin" &
elif [ $1 == "-h" ]; then
  HLPTXT="\n**groovebasin-ssh - Stream music over SSH**\n\n
        ==Usage==\n
        Default: Log into remote server over SSH, start the groovebasin server, and open groovebasin page in browser\n\n
        ==Options==\n
        -h\t\tShow this help text.\n
        -k\t\tRemove database lock that may prevent groovebasin from running if it was not closed properly.\n"
  echo -e $HLPTXT
  exit
fi

# open browser to groovebasin page
xdg-open http://0.0.0.0:16242/
