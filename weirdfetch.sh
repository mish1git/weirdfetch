#!/bin/sh

#Variables
STR="$XDG_CURRENT_DESKTOP"
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ${RED}Distro${NC}: "$(lsb_release -is)"
echo ${RED}Kernel${NC}: "$(uname -r)"
echo ${RED}Installed packages${NC}: "$(dpkg -l | grep -c '^ii')"
echo ${RED}PC Uptime${NC}: "$(uptime)"
echo ===========================
if [ $XDG_CURRENT_DESKTOP=KDE ] #Checks if the user is running KDE
then
STR="KDE Plasma" #If the user is running KDE, change $STR to KDE Plasma
fi
echo ${RED}Desktop Enviroment${NC}:  $STR

echo ${RED}CPU${NC}: "$(lscpu | sed -nr '/Model name/ s/.*:\s*(.*) @ .*/\1/p')" 
echo ${RED}"CPU Usage${NC}: `LC_ALL=C top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`% \n${RED}RAM Usage${NC}: `free -m | awk '/Mem:/ { printf("%3.1f%%", $3/$2*100) }'` \n${RED}HDD Usage${NC}: `df -h / | awk '/\// {print $(NF-1)}'`"
