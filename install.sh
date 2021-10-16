#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical

# Generate swap space.
sudo fallocate -l 2.5G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# Update repo and get tools
sudo apt-get update
sudo apt-get --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install curl wget tmux vim -y 
curl https://get.docker.com/ | sh
sudo usermod -aG docker $USER

echo "All done..."
