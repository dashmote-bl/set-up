#!/bin/sh
# set -eu -o pipefail
echo -e "${c}Updating everything following installation"; $r
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

#Installing basic tools
echo -e "${c}Installing Curl and wget"; $r
sudo apt-get install -y wget curl gzip

#Setting up Git
read -p "${y}Do you want to setup Git global config? (y/n): " -r; $r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo -e "${c}Setting up global git config at ~/.gitconfig"; $r
	git config --global color.ui true
	read -p "Enter Your Full Name: " name
	read -p "Enter Your Email: " email
	git config --global user.name "$name"
	git config --global user.email "$email"
	echo -e "${c}Git Setup Successfully!"; $r
else
	echo -e "${c}Skipping!"; $r && :
fi

#Installing Clash
echo -e "${c}Installing Clash VPN"; $r
wget -O clash.gz https://github.com/Dreamacro/clash/releases/download/v1.4.1/clash-freebsd-amd64-v1.4.1.gz
gzip -f clash.gz -d
chmod +x clash
./ clash    

