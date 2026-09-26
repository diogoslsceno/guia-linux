#!/usr/bin/env bash
# ==============================================================================
# 🎩 Setup Automatizado para Fedora Linux e Derivados RPM
# ==============================================================================
set -euo pipefail

echo "==> [Fedora] Iniciando configuração de ambiente..."

# 1. Atualização e pacotes essenciais
echo "==> Atualizando lista de pacotes e instalando dependências base..."
sudo dnf upgrade --refresh -y
sudo dnf install -y \
    curl wget git zsh ca-certificates gnupg2 tar unzip \
    tree fastfetch htop gparted gcc gcc-c++ make python3 \
    qbittorrent util-linux-user

# 2. ZSH & Oh My Zsh
echo "==> Configurando ZSH e Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 3. Zinit (Plugin Manager)
echo "==> Instalando Zinit..."
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# 4. Starship Prompt
echo "==> Instalando Starship Prompt..."
if ! command -v starship &> /dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# 5. JetBrains Mono Nerd Font
echo "==> Instalando JetBrains Mono Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
if [ ! -f "$FONT_DIR/JetBrainsMonoNerdFont-Regular.ttf" ]; then
    TMP_ZIP="/tmp/JetBrainsMono.zip"
    wget -qO "$TMP_ZIP" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
    unzip -oq "$TMP_ZIP" -d "$FONT_DIR"
    rm -f "$TMP_ZIP"
    fc-cache -f "$FONT_DIR"
fi

# 6. Copiar dotfiles
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../dotfiles" && pwd)"
if [ -d "$DOTFILES_DIR" ]; then
    echo "==> Sincronizando dotfiles..."
    mkdir -p "$HOME/.config"
    cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    cp "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
fi

# 7. Define ZSH como shell padrão
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "==> Definindo ZSH como shell padrão..."
    sudo chsh -s "$(which zsh)" "$USER" || true
fi

echo "==> [Fedora] Instalação concluída com sucesso! Reinicie a sessão para aplicar todas as mudanças."
