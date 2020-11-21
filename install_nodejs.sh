#!/bin/bash

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
\. $NVM_DIR/nvm.sh
nvm install 14

npm i -g dotenv
