#!/bin/bash

set -e

sudo apt install -y \
    virtualenv \
    python3-pip \
    python3-dev \
    python3-venv

pip3 install --upgrade setuptools wheel pynvim
