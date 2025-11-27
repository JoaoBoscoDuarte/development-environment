# Script de Sincronização de Configurações

Este repositório contém um script automatizado para sincronizar configurações do Neovim com controle de versão Git.

## Visão Geral

O script `sync.sh` automatiza o processo de backup e versionamento das configurações do Neovim, mantendo-as sincronizadas entre diferentes ambientes de desenvolvimento.

## Funcionalidades

- **Sincronização automática**: Copia configurações do Neovim local para o repositório
- **Controle de versão**: Cria commits automáticos com timestamp
- **Filtragem inteligente**: Exclui arquivos desnecessários (cache, locks)
- **Logs detalhados**: Fornece feedback claro sobre cada etapa do processo
- **Tratamento de erros**: Interrompe execução em caso de falhas

## Estrutura do Projeto

```
development-environment/
├── sync.sh          # Script principal de sincronização
├── README.md        # Este arquivo
└── nvim/           # Configurações sincronizadas do Neovim
    ├── init.lua
    ├── lua/
    └── ...
```

## Como Funciona

### 1. Configuração Inicial
O script define três diretórios principais:
- **REPO**: Diretório do repositório (`~/prog/development-environment`)
- **NVIM_SRC**: Configurações locais do Neovim (`~/.config/nvim`)
- **NVIM_DST**: Destino no repositório (`$REPO/nvim`)

### 2. Processo de Sincronização

#### Etapa 1: Validação
- Verifica se o diretório de configurações do Neovim existe
- Cria o diretório destino se necessário

#### Etapa 2: Cópia de Arquivos
Utiliza `rsync` com as seguintes opções:
- `--archive`: Preserva permissões, timestamps e estrutura
- `--verbose`: Exibe progresso detalhado
- `--delete`: Remove arquivos obsoletos no destino

**Arquivos Excluídos:**
- `.git/`: Evita conflitos com controle de versão
- `lazy-lock.json`: Cache do gerenciador de plugins Lazy.nvim

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
# Torna o script executável (apenas na primeira vez)
chmod +x sync.sh

# Executa a sincronização
./sync.sh
```

### Automação (Opcional)
Para sincronização automática, adicione ao crontab:
```bash
# Sincroniza a cada hora
0 * * * * /home/bosco/prog/development-environment/sync.sh

# Ou sincroniza diariamente às 18h
0 18 * * * /home/bosco/prog/development-environment/sync.sh
```

## Exemplo de Saída

```
[14:30:15] INFO: Iniciando sincronização das configurações do Neovim
[14:30:15] INFO: Copiando arquivos de configuração
sending incremental file list
lua/config/options.lua
lua/plugins/lsp.lua
[14:30:16] INFO: Arquivos sincronizados com sucesso
[14:30:16] INFO: Adicionando mudanças ao controle de versão
[14:30:16] INFO: Commit criado: update: sincroniza configs 2024-01-15 14:30:16
[14:30:17] INFO: Enviando mudanças para o repositório remoto
[14:30:18] INFO: Sincronização concluída com sucesso
```

## Tratamento de Erros

O script implementa verificações robustas:
- **Diretório inexistente**: Verifica se `~/.config/nvim` existe
- **Falhas de Git**: Captura erros de commit e push
- **Interrupção segura**: Para execução em caso de erro (`set -e`)

## Personalização

### Modificar Diretórios
Edite as variáveis no início do script:
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

## Requisitos

- **Git**: Para controle de versão
- **rsync**: Para sincronização eficiente de arquivos
- **Bash**: Shell compatível (padrão na maioria dos sistemas Unix)

## Benefícios

1. **Backup automático**: Configurações sempre versionadas
2. **Sincronização multi-dispositivo**: Mesmo ambiente em qualquer máquina
3. **Histórico completo**: Rastreamento de mudanças ao longo do tempo
4. **Recuperação fácil**: Restauração rápida em caso de problemas
5. **Colaboração**: Compartilhamento de configurações com equipe