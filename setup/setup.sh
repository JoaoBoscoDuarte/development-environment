#!/bin/bash
# Setup inicial do ambiente de desenvolvimento Debian

set -e

SETUP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log_info()    { echo "[$(date '+%H:%M:%S')] INFO: $1"; }
log_warning() { echo "[$(date '+%H:%M:%S')] WARNING: $1"; }
log_error()   { echo "[$(date '+%H:%M:%S')] ERROR: $1" >&2; }

run_step() {
    local name="$1"
    local script="$2"
    log_info "Iniciando: $name"
    # shellcheck source=/dev/null
    source "$script"
    log_info "Concluído: $name"
}

log_info "Iniciando setup do ambiente de desenvolvimento"

run_step "Pacotes apt"  "$SETUP_DIR/packages.sh"
run_step "Rust"         "$SETUP_DIR/installers/rust.sh"
run_step "Neovim"       "$SETUP_DIR/installers/nvim.sh"
run_step "Node.js"      "$SETUP_DIR/installers/node.sh"
run_step "Flatpak apps" "$SETUP_DIR/installers/flatpak.sh"
run_step "Alacritty"    "$SETUP_DIR/installers/alacritty.sh"

log_info "Setup concluído! Reinicie o terminal para aplicar todas as mudanças."
