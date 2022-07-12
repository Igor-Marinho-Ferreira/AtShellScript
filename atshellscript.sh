#!/bin/bash

shwmenu=0; #Always show the menu after every operation (1: True, 0: False)
shwmenucls=1; # Clear screen before showing the menu. It will also request to hit a key after every operation (1: True, 0: False)
startcls=1; # Clear the screen at startup (1: True, 0: False)
onekeyc=1; # Single Keypress for menu choice, rather than having to hit Enter (1: True, 0: False)

#Show Date and Time
Date_and_Time() {
    date "+%a %d %b %Y %H:%M:%S %Z (UTC%:z)"
}

show_menu() {
    if [ $shwmenucls -eq 1 ]; then clear ; fi
    echo "Welcome to the program that will help you with some activities";
    Date_and_Time
    sleep 4
    clear
    echo ;
    echo "=-=-=-=-=-=MENU=-=-=-=-=-="
    echo ;
    echo "1. Nothing yet"
    echo "2. Nothing yet"
    echo "M. Menu"
    echo "0. Quit"
}

waitkey() {
    read -rs -n 1 -p "Press any key to continue..." wkey
}

choose_option() {
    local choice
    echo -ne "$tsproon";
    echo -n "Enter choice ";
    if [ $shwmenu -eq 0 ]; then echo -n "[M for Menu] "; fi
    echo -n ": ";
    echo -ne "$tsproof";
    if [ $onekeyc -eq 1 ]; then
    read -r -n 1 -p "" choice # Key press
    echo ;
    else
    read -r -p "" choice # Type choice and hit Enter
    fi
    case $choice in
    "1") Date_and_Time ;;
    "2") Date_and_Time ;;
    "M" | "m") show_menu ;;
    "0") exit 0 ;;
    *) echo -e "${tsalerton}Invalid option.${tsalertof}"
    esac
    if [ $shwmenu -eq 1 ] && [ $shwmenucls -eq 1 ] && [ $wkeyi -eq 1 ]; then
    waitkey ; # echo ; # sleep 2 ;
    fi
}

# Main
if [ $startcls -eq 1 ]; then clear ; fi
if [ $shwmenu -eq 0 ]; then show_menu ; fi
while true
do
echo ;
if [ $shwmenu -eq 1 ]; then show_menu ; fi
choose_option
done
