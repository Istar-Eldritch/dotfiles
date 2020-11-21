#!/bin/bash

set -e
sudo apt update

sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    pcscd \
    scdaemon \
    software-properties-common \
    cmake \
    pkg-config \
    libfreetype6-dev \
    libfontconfig1-dev \
    libxcb-xfixes0-dev \
    python3 \
    wl-clipboard \
    build-essential \
    default-libmysqlclient-dev \
    default-mysql-client \
    apt-file \
    mlocate \
    gnome-tweak-tool \
    pass \
    zsh \
    tmux \
    ripgrep \
    chromium

./install_docker.sh

./install_rust.sh

./install_nodejs.sh

./install_python.sh

./install_spotify.sh
