#!/bin/bash

#clear screen

clear

#banner 

echo "      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

      ::██████╗ ███████╗ ██████╗ ██████╗ ███╗   ██╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗::

      ::██╔══██╗██╔════╝██╔════╝██╔═══██╗████╗  ██║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║::

      ::██████╔╝█████╗  ██║     ██║   ██║██╔██╗ ██║███████║   ██║   ██║██║   ██║██╔██╗ ██║::

      ::██╔══██╗██╔══╝  ██║     ██║   ██║██║╚██╗██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║::

      ::██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║::

      ::╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝::

      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::Made by Palani::::::::::::::::"

#getting domain or ip address for recon

echo "Enter your IP or domain :"

read ip

#Checking whether its is a Valid domain or ip

count=$( ping -c 1 $ip | grep icmp* | wc -l )

if [ $count -eq 0 ]

then

    echo "Host is Down. Cross check the IP or domain "

else

    echo "Its up :)"

fi

# Nmap scan

echo nmap scan is started.... 

nmap -sC -sV -oA "$ip" -p -o nmap_"$ip".txt

xdotool key alt+shift+right

xdotool key alt+right

# Gouster bruteforcing directories 

echo gobuster is runnning....

gobuster dir -u http://"$ip"/ -w /usr/share/dirbuster/wordlists/directory-list-2.3-small.txt

xdotool key alt+shift+down

xdotool key alt+down

# netcat to get the reverse shell

echo Started netcat to get shell

nc -nvlp "$ip" 1234

xdotool key alt+shift+left

xdotool key alt+left

# starting metasploit

echo opening Metasploit...

msfconsole

# opening web browser to view the website 

firefox http://"$ip"

#opening required directories

mkdir ./$ip

