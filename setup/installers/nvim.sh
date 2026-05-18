#!/bin/bash
# Instalação do Neovim (latest)

log_info "Instalando Neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

NVIM_PATH='export PATH="$PATH:/opt/nvim-linux-x86_64/bin"'
grep -qxF "$NVIM_PATH" ~/.bashrc || echo "$NVIM_PATH" >> ~/.bashrc
