#!/bin/bash

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
\. $NVM_DIR/nvm.sh
nvm install 10

npm i -g dotenv
