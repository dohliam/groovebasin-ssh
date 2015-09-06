# groovebasin-ssh - bash script to stream music over SSH

This is a small bash script that allows you to easily stream music from one computer to another over an SSH connection. It uses the awesome music server [Groove Basin](http://groovebasin.com/) to do the actual streaming of your music library.

## Motivation
Groove Basin is actually incredibly easy to use, and works perfectly well over both regular network connections and SSH. However, since it seems that most people are not using it for this purpose, the steps to get SSH streaming to work were not particularly obvious.

Once SSH was set up, streaming was a fairly simple process:
* log into the remote server and bind the remote Groove Basin port to the same port on the local machine
* enter the Groove Basin folder on the remote machine
* start the Groove Basin server, which runs in the terminal waiting for activity
* open up a browser window and go to the Groove Basin address on the local port

This eventually became a little tiresome to go through all the time, so this script automates the process entirely and even opens a browser window pointing to the Groove Basin url once the server is ready.

*NOTE: Groove Basin is designed to run indefinitely in the background, and it is actually much easier to have the Groove Basin server run automatically on startup on the remote machine, eliminating the need to start and stop the server every time you log in via SSH. The script now assumes that the Groove Basin server is already running by default. You can still start up the server remotely with the `-s` option.

## Installation
To use this script you need to first install [Groove Basin](http://groovebasin.com/). There is [a PPA](https://github.com/andrewrk/groovebasin#ubuntu) available for Ubuntu with a relatively recent version, but the older release available in the Ubuntu repositories works just fine. You can also [install the latest version from source](https://github.com/andrewrk/groovebasin#from-source).

Once you have Groove Basin installed and set up to index your music library, just point the script to the location of the `groovebasin` program folder on the remote machine, e.g.:

     GB_LOC=".groovebasin"	# location of the remote groovebasin folder

Then, find the IP of the remote machine and set it as the value of the variable `IP`:

     IP="255.255.255.255"	# remote IP address

That's it -- you should now be able to run the script from your local machine and have it automatically connect you to the Groove Basin server on your remote computer:

    ./gb.sh

# Options
By default the script just logs into the remote server over SSH, forwards the Groove Basin server port, and opens a browser window with the player client. However there are three additional options available:

* `-h`: Display a help message
* `-k`: Remove database lock that may prevent Groove Basin from running if it was not closed properly
* `-s`: Start the Groove Basin server remotely on connect

Regarding the second option, there is no way to stop the Groove Basin server other than terminating it (`Ctrl-C`). This sometimes results in a lock on the Groove Basin database, preventing further connections and causing an error when trying to start Groove Basin. This might also happen when the SSH connection is interrupted or dies unexpectedly. The `-k` option kills the nodejs server to remove the lock, and then restarts Groove Basin as normal.

# LICENSE
MIT -- see LICENSE file for details.
