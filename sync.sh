#!/bin/bash

set -e  # para o script se algo der errado

REPO=~/prog/development-environment
NVIM_SRC=~/.config/nvim
NVIM_DST=$REPO/nvim

echo "🔄 Sincronizando NVIM..."

# garante que a pasta existe
mkdir -p "$NVIM_DST"

# copia tudo, exceto itens que devem ser ignorados
rsync -av --delete \
  --exclude='.git/' \
  --exclude='lazy-lock.json' \
  "$NVIM_SRC/" "$NVIM_DST/"

echo "✔️ Arquivos do NVIM sincronizados!"

cd "$REPO"

# adiciona mudanças
git add .

# cria commit com data e hora
git commit -m "update: sincroniza configs $(date '+%Y-%m-%d %H:%M:%S')" || {
    echo "⚠️ Nada para commitar."
}

# envia pro GitHub
git push

echo "🚀 Sincronização completa!"

