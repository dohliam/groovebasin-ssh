#!/bin/bash

# groovebasin-ssh - bash script to stream music over SSH
# 
# to use this script you need to first install Groove Basin:
# http://groovebasin.com/

# setup options
IP="configure"	# remote IP address
GB_LOC=".groovebasin"	# location of the remote Groove Basin folder

# forward ports to Groove Basin and then start the Groove Basin server
MSG="Connecting to remote IP: $IP"

if [ "$IP" == 'configure' ]; then
  echo " Unknown server. Please configure remote IP address and Groove Basin folder location."
  exit
elif [ "$1" == '' ]; then
  echo $MSG
  ssh -t -t -L 16242:127.0.0.1:16242 $IP &
elif [ $1 == "-h" ]; then
  HLPTXT="\n**groovebasin-ssh - Stream music over SSH**\n\n
        ==Usage==\n
        Default:\tLog into remote server over SSH and forward \n\t\tGroove Basin server port, then open Groove \n\t\tBasin page in browser\n\n
        ==Options==\n
        -h\t\tShow this help text.\n
        -k\t\tRemove database lock that may prevent Groove \n\t\tBasin from running if it was not closed \n\t\tproperly.\n
        -s\t\tLog into remote server over SSH, start the \n\t\tGroove Basin server, and open Groove Basin \n\t\tpage in browser\n\n"
  echo -e $HLPTXT
  exit
elif [ $1 == "-k" ]; then
  echo $MSG
  ssh -t -t -L 16242:127.0.0.1:16242 $IP "killall nodejs; cd $GB_LOC; groovebasin" &
elif [ "$1" == '-s' ]; then
  echo $MSG
  ssh -t -t -L 16242:127.0.0.1:16242 $IP "cd $GB_LOC; groovebasin" &
fi

# open browser to Groove Basin page
xdg-open http://0.0.0.0:16242/
