# ==============================================================================
# 🐚 .zshrc - Configuração Universal de Alta Performance (Guia Linux)
# ==============================================================================

# Caminho da instalação do Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Tema desativado em favor do Starship Prompt
ZSH_THEME=""

# Configurações do Oh My Zsh
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins nativos leves do Oh My Zsh
plugins=(git sudo)

# Carrega Oh My Zsh se instalado
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

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
# 🌐 Variáveis de Ambiente & PATH
# ------------------------------------------------------------------------------
export EDITOR="nano"

# Inclui binários locais do usuário, Cargo (Rust), Go e Termux no PATH
export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:/usr/local/go/bin:$PATH"

if [[ -n "$PREFIX" ]]; then
    export PATH="$PREFIX/bin:$PATH"
fi

# ------------------------------------------------------------------------------
# ☕ SDKMAN (Java, Kotlin, Gradle, Maven)
# ------------------------------------------------------------------------------
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ------------------------------------------------------------------------------
# ⚡ Aliases Úteis
# ------------------------------------------------------------------------------
alias l="ls -la"
alias ll="ls -lh"
alias la="ls -A"
alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias zshconfig="$EDITOR ~/.zshrc"
alias reload="source ~/.zshrc"
