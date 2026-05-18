#!/bin/bash
# Instalação do Rust via rustup

log_info "Instalando Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

rustup override set stable
rustup update stable
