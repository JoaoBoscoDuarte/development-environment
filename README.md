# Scripts de Sincronização de Configurações

Este repositório contém scripts automatizados para sincronizar configurações de ferramentas de desenvolvimento com controle de versão Git.

## Sumário

- [Visão Geral](#visão-geral)
- [Scripts Disponíveis](#scripts-disponíveis)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Como Funciona](#como-funciona)
- [Uso](#uso)
- [Exemplo de Saída](#exemplo-de-saída)
- [Tratamento de Erros](#tratamento-de-erros)
- [Personalização](#personalização)
- [Template Base](#template-base)
- [Requisitos](#requisitos)

## Visão Geral

Os scripts automatizam o processo de backup e versionamento das configurações de desenvolvimento, mantendo-as sincronizadas entre diferentes ambientes.

## Scripts Disponíveis

- **`sync.sh`**: Sincroniza todas as configurações (Neovim, Alacritty, VSCode)
- **`sync-nvim.sh`**: Sincroniza apenas configurações do Neovim
- **`sync-alacritty.sh`**: Sincroniza apenas configurações do Alacritty
- **`sync-vscode.sh`**: Sincroniza apenas configurações do VSCode

### Funcionalidades

- **Sincronização automática**: Copia configurações locais para o repositório
- **Controle de versão**: Cria commits automáticos com timestamp
- **Filtragem inteligente**: Exclui arquivos desnecessários (cache, logs)
- **Logs detalhados**: Fornece feedback claro sobre cada etapa do processo
- **Tratamento de erros**: Interrompe execução em caso de falhas

## Estrutura do Projeto

```
development-environment/
├── sync.sh              # Script de sincronização completa
├── sync-nvim.sh         # Script específico do Neovim
├── sync-alacritty.sh    # Script específico do Alacritty
├── sync-vscode.sh       # Script específico do VSCode
├── README.md            # Este arquivo
├── nvim/               # Configurações do Neovim
├── alacritty/          # Configurações do Alacritty
└── vscode/             # Configurações do VSCode
```

## Como Funciona

### 1. Configuração Inicial
Os scripts definem diretórios para cada ferramenta:
- **REPO**: Diretório do repositório (`~/prog/development-environment`)
- **Fontes**: Configurações locais de cada ferramenta
  - Neovim: `~/.config/nvim`
  - Alacritty: `~/.config/alacritty`
  - VSCode: `~/.config/Code/User`
- **Destinos**: Diretórios no repositório (`$REPO/{nvim,alacritty,vscode}`)

### 2. Processo de Sincronização

#### Etapa 1: Validação
- Verifica se o diretório de configurações do Neovim existe
- Cria o diretório destino se necessário

#### Etapa 2: Cópia de Arquivos
Utiliza `rsync` com as seguintes opções:
- `--archive`: Preserva permissões, timestamps e estrutura
- `--verbose`: Exibe progresso detalhado
- `--delete`: Remove arquivos obsoletos no destino

**Arquivos Excluídos por Ferramenta:**
- **Neovim**: `.git/`, `lazy-lock.json`
- **Alacritty**: `.git/`
- **VSCode**: `.git/`, `workspaceStorage/`, `logs/`, `CachedExtensions/`, `globalStorage/`

#### Etapa 3: Controle de Versão
- Adiciona todas as mudanças ao staging (`git add .`)
- Cria commit com timestamp automático
- Envia mudanças para o repositório remoto (`git push`)

### 3. Sistema de Logs
O script implementa funções de logging que incluem:
- **Timestamp**: Horário de cada operação
- **Níveis**: INFO, WARNING, ERROR
- **Saída estruturada**: Facilita debugging e monitoramento

## Uso

### Execução Manual
```bash
# Torna os scripts executáveis (apenas na primeira vez)
chmod +x sync*.sh

# Sincroniza todas as configurações
./sync.sh

# Ou sincroniza ferramentas específicas
./sync-nvim.sh
./sync-alacritty.sh
./sync-vscode.sh
```

### Automação (Opcional)
Para sincronização automática, adicione ao crontab:
```bash
# Sincroniza todas as configurações diariamente às 18h
0 18 * * * /home/bosco/prog/development-environment/sync.sh

# Ou sincroniza apenas Neovim a cada 2 horas
0 */2 * * * /home/bosco/prog/development-environment/sync-nvim.sh
```

## Exemplo de Saída

```
[14:30:15] INFO: Iniciando sincronização das configurações de desenvolvimento
[14:30:15] INFO: Sincronizando configurações do Neovim
[14:30:15] INFO: Copiando arquivos de configuração do Neovim
sending incremental file list
lua/config/options.lua
[14:30:16] INFO: Configurações do Neovim sincronizadas
[14:30:16] INFO: Sincronizando configurações do Alacritty
[14:30:16] INFO: Copiando arquivos de configuração do Alacritty
sending incremental file list
alacritty.yml
[14:30:16] INFO: Configurações do Alacritty sincronizadas
[14:30:16] INFO: Sincronizando configurações do VSCode
[14:30:17] INFO: Copiando arquivos de configuração do VSCode
sending incremental file list
settings.json
keybindings.json
[14:30:17] INFO: Configurações do VSCode sincronizadas
[14:30:17] INFO: Adicionando mudanças ao controle de versão
[14:30:17] INFO: Commit criado: update: sincroniza todas as configs 2024-01-15 14:30:17
[14:30:18] INFO: Enviando mudanças para o repositório remoto
[14:30:19] INFO: Sincronização concluída com sucesso
```

## Tratamento de Erros

Os scripts implementam verificações robustas:
- **Diretórios inexistentes**: Verifica se os diretórios de configuração existem
- **Falhas de Git**: Captura erros de commit e push
- **Interrupção segura**: Para execução em caso de erro (`set -e`)
- **Logs estruturados**: Diferencia INFO, WARNING e ERROR

## Personalização

### Modificar Diretórios
Edite as variáveis no início dos scripts:
```bash
REPO=~/seu/repositorio
NVIM_SRC=~/.config/nvim
NVIM_DST=$REPO/nvim
```

### Adicionar Exclusões
Modifique o comando rsync para excluir outros arquivos:
```bash
rsync -av --delete \
  --exclude='.git/' \
  --exclude='lazy-lock.json' \
  --exclude='seu-arquivo.log' \
  "$NVIM_SRC/" "$NVIM_DST/"
```

## Template Base

Para adicionar sincronização de uma nova ferramenta, use este template:

```bash
#!/bin/bash

# Script de sincronização de configurações do [FERRAMENTA]
# Sincroniza arquivos de configuração do [FERRAMENTA] local com o repositório Git

# Interrompe execução em caso de erro
set -e

# ============================================================================
# CONFIGURAÇÕES
# ============================================================================

# Diretório do repositório de desenvolvimento
REPO=~/prog/development-environment

# Diretório fonte das configurações do [FERRAMENTA]
FERRAMENTA_SRC=~/.config/[ferramenta]

# Diretório destino no repositório
FERRAMENTA_DST=$REPO/[ferramenta]

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

log_info "Iniciando sincronização das configurações do [FERRAMENTA]"

# Verifica se o diretório fonte existe
if [ ! -d "$FERRAMENTA_SRC" ]; then
    log_error "Diretório de configuração do [FERRAMENTA] não encontrado: $FERRAMENTA_SRC"
    exit 1
fi

# Cria diretório destino se não existir
mkdir -p "$FERRAMENTA_DST"

# Sincroniza arquivos usando rsync
log_info "Copiando arquivos de configuração"
rsync -av --delete \
  --exclude='.git/' \
  --exclude='[arquivos-a-excluir]' \
  "$FERRAMENTA_SRC/" "$FERRAMENTA_DST/"

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
COMMIT_MSG="update: sincroniza configs [FERRAMENTA] $(date '+%Y-%m-%d %H:%M:%S')"
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
```

### Passos para Adicionar Nova Ferramenta:
1. Copie o template acima
2. Substitua `[FERRAMENTA]` pelo nome da ferramenta
3. Substitua `[ferramenta]` pelo nome em minúsculas
4. Ajuste o caminho `FERRAMENTA_SRC` para o diretório correto
5. Adicione exclusões específicas no `--exclude`
6. Torne o script executável: `chmod +x sync-[ferramenta].sh`

## Requisitos

- **Git**: Para controle de versão
- **rsync**: Para sincronização eficiente de arquivos
- **Bash**: Shell compatível (padrão na maioria dos sistemas Unix)

## Benefícios

1. **Backup automático**: Configurações sempre versionadas
2. **Sincronização multi-dispositivo**: Mesmo ambiente em qualquer máquina
3. **Histórico completo**: Rastreamento de mudanças ao longo do tempo
4. **Recuperação fácil**: Restauração rápida em caso de problemas
5. **Modularidade**: Scripts individuais para cada ferramenta
6. **Extensibilidade**: Template para adicionar novas ferramentas facilmente