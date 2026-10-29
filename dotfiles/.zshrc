# ==============================================================================
# 🐚 .zshrc - Configuração Universal de Alta Performance & Segurança
# ==============================================================================

# Caminho da instalação do Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Tema nativo desativado em favor do Starship Prompt
ZSH_THEME=""

# Configurações do Oh My Zsh
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_DISABLE_COMPFIX="true" # Previne bloqueios por permissões inseguras em multiusuários

# Plugins nativos leves do Oh My Zsh
plugins=(git sudo)

# Carrega Oh My Zsh se instalado
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------------------------
# 📜 Histórico Seguro e Otimizado
# ------------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS      # Remove duplicatas contíguas
setopt HIST_FIND_NO_DUPS         # Não mostra itens repetidos na busca reversa
setopt HIST_IGNORE_SPACE         # 🔒 Segurança: Comandos iniciados com espaço não são gravados no histórico (ex: " export TOKEN=...")
setopt HIST_SAVE_NO_DUPS         # Não salva duplicatas no arquivo
setopt SHARE_HISTORY             # Compartilha histórico entre sessões abertas
setopt INC_APPEND_HISTORY        # Grava imediatamente no arquivo de histórico

# ------------------------------------------------------------------------------
# 📦 Plugins via Zinit (Alta Velocidade)
# ------------------------------------------------------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ -f "${ZINIT_HOME}/zinit.zsh" ]]; then
    source "${ZINIT_HOME}/zinit.zsh"

    # Plugins de sintaxe e autocompletar
    zinit light zdharma-continuum/fast-syntax-highlighting
    zinit light zsh-users/zsh-autosuggestions
    zinit light zsh-users/zsh-completions
    zinit light zsh-users/zsh-history-substring-search
    zinit light hlissner/zsh-autopair
fi

# ------------------------------------------------------------------------------
# 🚀 Starship Prompt
# ------------------------------------------------------------------------------
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# ------------------------------------------------------------------------------
# 🌐 Variáveis de Ambiente & PATH Seguro
# ------------------------------------------------------------------------------
export EDITOR="nano"

# Inclui binários locais do usuário, Cargo (Rust), Go e Termux no PATH (apenas se existirem)
typeset -U path # Garante que entradas duplicadas não sejam inseridas no PATH
for dir in "$HOME/.local/bin" "$HOME/bin" "$HOME/.cargo/bin" "/usr/local/go/bin"; do
    [[ -d "$dir" ]] && path=("$dir" $path)
done

if [[ -n "$PREFIX" && -d "$PREFIX/bin" ]]; then
    path=("$PREFIX/bin" $path)
fi
export PATH

# ------------------------------------------------------------------------------
# ☕ SDKMAN (Java, Kotlin, Gradle, Maven)
# ------------------------------------------------------------------------------
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ------------------------------------------------------------------------------
# ⚡ Aliases Úteis & Proteções contra Acidentes
# ------------------------------------------------------------------------------
# Proteções contra sobrescrita e remoção destrutiva
alias cp="cp -i"                 # Pede confirmação antes de sobrescrever arquivos
alias mv="mv -i"                 # Pede confirmação antes de mover sobre arquivo existente
alias rm="rm -I"                 # Pede confirmação ao remover mais de 3 arquivos ou recursivo

# Navegação e listagem
alias l="ls -la"
alias ll="ls -lh"
alias la="ls -A"
alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias zshconfig="$EDITOR ~/.zshrc"
alias reload="source ~/.zshrc"
