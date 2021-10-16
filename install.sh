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
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install curl wget tmux vim
curl https://get.docker.com/ | sh
sudo usermod -aG docker $USER

echo "All done..."
