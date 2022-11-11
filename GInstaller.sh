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
    wget https://github.com/edharman/gui-rms/raw/main/GUI_RMS.tar.bz2
    tar -xjvf GUI_RMS.tar.bz2
    echo -e "\nDo you wish to configure some stations?"
	    while true; do
   		    read -p  "Y/N: " Ans
       	    case $Ans in 
           	[yY]* ) 
            cd ~/source/Stations/Scripts
            ./add_GStation.sh ;;
           	[nN] ) break ;;
           	esac
		done
    fi
fi
echo "Your Station(s) are configured in direcotries named ~/source/Stations/<station-id>"
echo " and the script to add additional stations is ~/Stations/Scripts/add_GStation.sh"
echo " Your station data is locate in directories within ~/RMS_data/<station-id>"
