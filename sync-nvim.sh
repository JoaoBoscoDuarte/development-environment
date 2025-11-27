#!/bin/bash

# Script de sincronização de configurações do Neovim
# Sincroniza arquivos de configuração do Neovim local com o repositório Git

# Interrompe execução em caso de erro
set -e

# ============================================================================
# CONFIGURAÇÕES
# ============================================================================

# Diretório do repositório de desenvolvimento
REPO=~/prog/development-environment

# Diretório fonte das configurações do Neovim
NVIM_SRC=~/.config/nvim

# Diretório destino no repositório
NVIM_DST=$REPO/nvim

# ============================================================================
# FUNÇÕES AUXILIARES
# ============================================================================

# Exibe mensagens de log com timestamp
log_info() {
    echo "[$(date '+%H:%M:%S')] INFO: $1"
}

log_warning() {
    echo "[$(date '+%H:%M:%S')] WARNING: $1"
}

log_error() {
    echo "[$(date '+%H:%M:%S')] ERROR: $1" >&2
}

# ============================================================================
# SINCRONIZAÇÃO
# ============================================================================

log_info "Iniciando sincronização das configurações do Neovim"

# Verifica se o diretório fonte existe
if [ ! -d "$NVIM_SRC" ]; then
    log_error "Diretório de configuração do Neovim não encontrado: $NVIM_SRC"
    exit 1
fi

# Cria diretório destino se não existir
mkdir -p "$NVIM_DST"

# Sincroniza arquivos usando rsync
log_info "Copiando arquivos de configuração"
rsync -av --delete \
  --exclude='.git/' \
  --exclude='lazy-lock.json' \
  "$NVIM_SRC/" "$NVIM_DST/"

log_info "Arquivos sincronizados com sucesso"

# ============================================================================
# CONTROLE DE VERSÃO
# ============================================================================

# Navega para o diretório do repositório
cd "$REPO"

# Adiciona todas as mudanças ao staging
log_info "Adicionando mudanças ao controle de versão"
git add .

# Cria commit com timestamp
COMMIT_MSG="update: sincroniza configs Neovim $(date '+%Y-%m-%d %H:%M:%S')"
if git commit -m "$COMMIT_MSG"; then
    log_info "Commit criado: $COMMIT_MSG"
else
    log_warning "Nenhuma mudança detectada para commit"
fi

# Envia mudanças para o repositório remoto
log_info "Enviando mudanças para o repositório remoto"
if git push; then
    log_info "Sincronização concluída com sucesso"
else
    log_error "Falha ao enviar mudanças para o repositório remoto"
    exit 1
fi