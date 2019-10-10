#!/bin/bash

set -e

sudo apt install -y \
    virtualenv \
    python-pip \
    libmysqlclient-dev \
    build-essential \
    python3-dev \
    python3-venv

pip install --upgrade setuptools wheel