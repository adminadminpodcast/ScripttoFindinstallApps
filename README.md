# Script to find what has been install from your bash history.

I wanted a way of when i backup of my ubuntu desktop to produce a list of apps, snaps and PPA have been installed since the system has been installed from the command line.

This script create a file, check the following commands have been run by checking the bash history and write to the file

* apt install
* snap install
* apt-get install
* add-apt-repository ppa

Every time the script is rerun, it compares what is in the file and what is return from the bash history any new command is append to the file
