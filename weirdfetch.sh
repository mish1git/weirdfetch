#!/bin/sh

#Variables
STR="$XDG_CURRENT_DESKTOP"

echo Distro: "$(lsb_release -is)"
echo Kernel: "$(uname -r)"
echo Installed packages: "$(dpkg -l | grep -c '^ii')"
echo PC Uptime: "$(uptime)"
echo ===========================
if [ $XDG_CURRENT_DESKTOP=KDE ] #Checks if the user is running KDE
then
STR="KDE Plasma" #If the user is running KDE, change $STR to KDE Plasma
fi
echo Desktop Enviroment:  $STR

echo CPU: "$(lscpu | sed -nr '/Model name/ s/.*:\s*(.*) @ .*/\1/p')" 
echo "CPU Usage: `LC_ALL=C top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`% RAM Usage: `free -m | awk '/Mem:/ { printf("%3.1f%%", $3/$2*100) }'` HDD Usage: `df -h / | awk '/\// {print $(NF-1)}'`"
