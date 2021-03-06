#!/bin/sh

# execute the bash script for ASF Steam farm | Code for Raspbian OS running Debian Jessie.

# colors and bold
r=$(tput setaf 1)
g=$(tput setaf  2)
bold=$(tput bold)
res=$(tput sgr0)

# check if executed by root
if ! [ $(id -u) = 0 ]; then
        echo "${b}${r}[ERROR]: YOU MUST BE ROOT TO EXECUTE THIS SCRIPT.${res}"
        exit 1
fi

# local variables
user=$(whoami)
date=$(date +%F)
hours=$(date +%H:%M:%S)
hostname=$(hostname)
file="/var/www/html/failiserver/logid/asf.txt" # file to store log

usergreeting="Hello, $user | $hostname. Time executed: $date $hours"
spacer="     "

# add shit tons of spaces so you can understand the log file after multiple
# times of executing the code
x=1
while [ $x -le 7 ]
do
	echo "$spacer" >> $file
	x=$(( $x + 1))
done
 
loginfo=$(echo "ASF has been executed by $user | $hostname.") >> $file
execution=$(echo "Time of execution: $date $hours") >> $file

# open ASF and execute it, making a log file
echo $usergreeting >> $file
echo "${b}${g}$usergreeting"; sleep 3s
echo "${b}${g}Starting to run ArchiSteamFarm."
echo "${b}${g}Saving log to the default location of ${r}${b}$file."

sleep 2s 
echo ""
echo "${b}${g}ArchiSteamFarm is now running! Press ${r}${b}CTRL + C ${g}to exit.${res}"

# info to log file
/home/pi/Desktop/ASF/ArchiSteamFarm >> $file

