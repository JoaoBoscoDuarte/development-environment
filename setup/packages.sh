#!/bin/bash
# Pacotes apt básicos

APT_PACKAGES=(
    build-essential
    git
    curl
    wget
    xclip
    wl-clipboard
    cargo
    cmake
    g++
    pkg-config
    libfontconfig1-dev
    libxcb-xfixes0-dev
    libxkbcommon-dev
    python3
    fastfetch
    gzip
    scdoc
    flatpak
    gnome-software-plugin-flatpak
)

log_info "Atualizando pacotes do sistema"
sudo apt update && sudo apt upgrade -y

log_info "Instalando pacotes apt"
sudo apt install -y "${APT_PACKAGES[@]}"
