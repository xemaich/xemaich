#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y vim nano git curl wget htop bash-completion xz-utils zip unzip ufw locales net-tools mc jq make gcc gpg build-essential ncdu sysstat
sudo apt install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io
echo -e '\n\e[42mDocker\e[0m\n'
docker --version && sleep 1

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo -e '\n\e[42mDocker Compose\e[0m\n'
docker-compose --version && sleep 1

rm -rf ~/masa-node*

cd ~
git clone https://github.com/masa-finance/masa-node-v1.0.git
echo -e '\n\e[42mInstalling Masa\e[0m\n' && sleep 1

cd ~/masa-node-v1.0 && PRIVATE_CONFIG=ignore docker-compose up -d
