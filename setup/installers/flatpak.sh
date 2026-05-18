#!/bin/bash
# Instalação de aplicativos via Flatpak

FLATPAK_APPS=(
    com.brave.Browser
    com.valvesoftware.Steam
    com.spotify.Client
    com.visualstudio.code
    org.vinegarhq.Sober
    com.obsproject.Studio
    md.obsidian.Obsidian
)

log_info "Configurando Flathub"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

log_info "Instalando aplicativos Flatpak"
for app in "${FLATPAK_APPS[@]}"; do
    log_info "Instalando $app"
    flatpak install -y flathub "$app"
done

grep -qxF "alias code='flatpak run com.visualstudio.code'" ~/.bashrc \
    || echo "alias code='flatpak run com.visualstudio.code'" >> ~/.bashrc
