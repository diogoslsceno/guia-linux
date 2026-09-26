#!/usr/bin/env bash
# ==============================================================================
# 🚀 Instalador Universal - Hub Guia Linux
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=================================================================="
echo "          🚀 Hub Guia Linux - Provisionamento Automático          "
echo "=================================================================="

# 1. Detecção do Termux
if [ -n "${TERMUX_VERSION:-}" ] || [ -d "/data/data/com.termux" ]; then
    echo "==> Ambiente Android/Termux detectado."
    bash "$SCRIPT_DIR/setup-termux.sh"
    exit 0
fi

# 2. Detecção de Distribuições Desktop / Servidor via /etc/os-release
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        ubuntu|debian|linuxmint|pop|zorin)
            echo "==> Ecossistema Debian/Ubuntu detectado ($ID)."
            bash "$SCRIPT_DIR/setup-debian.sh"
            ;;
        fedora|rhel|centos|rocky|almalinux)
            echo "==> Ecossistema Fedora/Red Hat detectado ($ID)."
            bash "$SCRIPT_DIR/setup-fedora.sh"
            ;;
        arch|endeavouros|manjaro|garuda)
            echo "==> Ecossistema Arch Linux detectado ($ID)."
            bash "$SCRIPT_DIR/setup-arch.sh"
            ;;
        opensuse*|suse)
            echo "==> Ecossistema openSUSE detectado ($ID)."
            echo "Consulte o guia dedicado: guias/opensuse.md"
            ;;
        *)
            echo "==> Distribuição '$ID' detectada."
            echo "Por favor, execute o script específico manualmente em scripts/ ou siga os guias em guias/."
            exit 1
            ;;
    esac
else
    echo "Erro: Não foi possível identificar o sistema operacional via /etc/os-release."
    exit 1
fi
