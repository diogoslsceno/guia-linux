#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
# 📱 Setup Automatizado para Termux no Android
# ==============================================================================
set -euo pipefail

echo "==> [Termux] Iniciando configuração de ambiente móvel..."

# 1. Atualização completa e limpeza do sistema
echo "==> Atualizando repositórios e limpando pacotes obsoletos..."
pkg update && pkg upgrade -y && apt autoremove -y && pkg clean

# 2. Pacotes essenciais
echo "==> Instalando dependências base..."
pkg install -y \
    curl wget git zsh ca-certificates gnupg \
    tar unzip zip jq build-essential clang make \
    tree fastfetch htop tmux ncdu micro cmatrix termux-tools starship

# 3. ZSH & Oh My Zsh
echo "==> Configurando ZSH e Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 4. Zinit (Plugin Manager)
echo "==> Instalando Zinit..."
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# 5. Nerd Font para Termux
echo "==> Baixando e aplicando JetBrains Mono Nerd Font..."
mkdir -p "$HOME/.termux"
cd "$HOME/.termux"
TMP_ZIP="$HOME/.termux/jb_tmp.zip"
wget -qO "$TMP_ZIP" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
unzip -oq "$TMP_ZIP" "JetBrainsMonoNerdFont-Regular.ttf"
mv -f "JetBrainsMonoNerdFont-Regular.ttf" font.ttf
rm -f "$TMP_ZIP"

# 6. Copiar dotfiles e propriedades do Termux com permissões seguras
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../dotfiles" && pwd)"
if [ -d "$DOTFILES_DIR" ]; then
    echo "==> Sincronizando dotfiles e teclas virtuais..."
    mkdir -p "$HOME/.config"
    cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    cp "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
    cp "$DOTFILES_DIR/termux.properties" "$HOME/.termux/termux.properties"
    chmod 600 "$HOME/.zshrc"
    chmod 644 "$HOME/.config/starship.toml"
    chmod 644 "$HOME/.termux/termux.properties"
fi

# 7. Recarregar propriedades do Termux
termux-reload-settings

# 8. Define ZSH como shell padrão
echo "==> Definindo ZSH como shell padrão..."
chsh -s zsh || true

echo "==> [Termux] Configuração concluída! Abra uma nova sessão para desfrutar do novo terminal."
