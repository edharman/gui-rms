#!/bin/bash
# check we're in the users home dir and that RMS has been installed
this_user=$(ps -ef|awk '/xdm/ {print $1}')
if $pwd != ${this_user}
then
    echo "this script should be run from your home directory"
    exit
else
if [[ ! -d ~/source/RMS ]]
then 
    echo "Can't find the RMS installation in your home directory, please install this 1st"
    echo " put link to install and opencv stuff here"
else
mkdir .tmp
cd .tmp
	wget https://github.com/edharman/gui-rms/raw/main/GUI_RMS.tar.bz2
	tar -xjf GUI_RMS.tar.bz2 -C ~/
	cd ~/
	rm -rf .tmp
	fi
fi
echo "Two new directories have been created -
~/source/Stations
~/source/Stations/Scripts

~/source/Stations is where your individual camera configuration data will be stored with each directory named as per your station-id
The Scripts directory contains a couple of helper files and two utility scripts -
add_GStation.sh - a utility to add stations
GRMSUpdater.sh - a utility to via cron schedule updates to the RMS code"

echo -e "\nDo you wish to configure some stations?"
read -p  "Y/N: " Ans
case $Ans in 
	[nN]* ) 
	exit ;;
esac
cd ~/source/Stations/Scripts
./add_GStation.sh


