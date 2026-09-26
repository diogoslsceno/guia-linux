#!/usr/bin/env bash
# ==============================================================================
# 🏹 Setup Automatizado para Arch Linux e Derivados
# ==============================================================================
set -euo pipefail

echo "==> [Arch Linux] Iniciando configuração de ambiente..."

# 1. Atualização e pacotes essenciais
echo "==> Atualizando lista de pacotes e instalando dependências base..."
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm \
    curl wget git zsh base-devel ca-certificates gnupg \
    tar unzip python tree fastfetch htop gparted qbittorrent

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

# 4. Starship Prompt & Fonte JetBrains Mono Nerd
echo "==> Instalando Starship Prompt e Fonte..."
sudo pacman -S --needed --noconfirm starship ttf-jetbrains-mono-nerd

# 5. Copiar dotfiles
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../dotfiles" && pwd)"
if [ -d "$DOTFILES_DIR" ]; then
    echo "==> Sincronizando dotfiles..."
    mkdir -p "$HOME/.config"
    cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    cp "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
fi

# 6. Define ZSH como shell padrão
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "==> Definindo ZSH como shell padrão..."
    chsh -s "$(which zsh)" "$USER" || true
fi

echo "==> [Arch Linux] Instalação concluída com sucesso! Reinicie a sessão para aplicar todas as mudanças."
