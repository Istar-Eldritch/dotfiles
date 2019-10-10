#!/bin/bash

set -e
sudo apt update

# Install packages to allow apt to use a repository over HTTPS:
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

./install_docker.sh

./install_nodejs.sh

./install_python.sh
