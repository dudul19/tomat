#!/bin/bash

clear
cd /usr/local/
rm -rf sbin
rm -rf /usr/bin/enc
cd
mkdir /usr/local/sbin

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")

red() { echo -e "${*}"; }

clear

function load() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    
    tput civis
    echo -ne "Please Wait Loading - [ "
    while true; do
        for ((i = 0; i < 5; i++)); do
            echo -ne "# "
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "Please Wait Loading - ["
    done
    echo -e "] - OK !"
    tput cnorm
}

res1() {
    wget https://raw.githubusercontent.com/vpn-store0/v5-script/main/Cdy/menu.zip
    7z x menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu
    rm -rf menu.zip
}
r
netfilter-persistent
clear

echo -e "☉———————————————————————————————————————☉"
echo -e "          UPDATE TOMATO AUTOSCRIPT        "
echo -e "☉———————————————————————————————————————☉"
echo -e "      Updating Service & Script...        "
res1 >/dev/null 2>&1
load
echo -e "☉———————————————————————————————————————☉"
echo -e ""
read -n 1 -s -r -p "Press any key to go back"
menu