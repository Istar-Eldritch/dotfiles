#!/bin/bash

# Bail out the script on error
set -e

sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# Add docker gpg key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add docker repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

# Install docker cli and engine
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add the current shell user to the docker user group
sudo usermod -aG docker $USER