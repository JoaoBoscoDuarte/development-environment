#!/bin/bash
# Instalação do Node.js via nvm

log_info "Instalando nvm e Node.js"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

export NVM_DIR="$HOME/.nvm"
\. "$NVM_DIR/nvm.sh"

nvm install 24
