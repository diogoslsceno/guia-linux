# 🚀 Hub de Guias de Configuração de Ambiente Linux

Este repositório é um hub centralizado de guias passo a passo, dotfiles de alta velocidade e scripts automatizados de provisionamento para configuração de terminal, shell ZSH, ferramentas de desenvolvimento e personalização de ambiente no Linux.

Toda a instrução de instalação e configuração foi refatorada, expandida e integrada em guias dedicados para cada ecossistema na pasta [`guias/`](./guias/), acompanhada de scripts prontos em [`scripts/`](./scripts/) e dotfiles em [`dotfiles/`](./dotfiles/).

---

## 📁 Estrutura do Repositório

```text
guia-linux/
├── dotfiles/
│   ├── .zshrc               # Configuração universal e otimizada do ZSH (Zinit + Oh My Zsh)
│   ├── starship.toml        # Tema e paletas de cores do Starship Prompt
│   └── termux.properties    # Barra virtual de teclas estendidas (extra-keys) para Android
├── guias/
│   ├── arch.md              # Arch Linux, EndeavourOS, Manjaro (Pacman & Yay)
│   ├── debian.md            # Debian, Ubuntu, Linux Mint, Pop!_OS (APT & DPKG)
│   ├── fedora.md            # Fedora, RHEL, CentOS (DNF & RPM)
│   ├── opensuse.md          # openSUSE Tumbleweed e Leap (Zypper)
│   ├── termux.md            # Android Termux (Bionic libc, PKG, code-server, SSH)
│   └── wsl.md               # Windows Subsystem for Linux 2 (WSL 2 & WSLg)
├── scripts/
│   ├── install.sh           # Orquestrador universal com autodetecção da distribuição
│   ├── setup-arch.sh        # Script automatizado para Arch Linux
│   ├── setup-debian.sh      # Script automatizado para Debian / Ubuntu
│   ├── setup-fedora.sh      # Script automatizado para Fedora
│   └── setup-termux.sh      # Script automatizado para Android Termux
├── .gitignore
└── README.md
```

---

## ⚡ Instalação Rápida Automatizada (One-Liner)

Você pode provisionar seu ambiente automaticamente executando o script orquestrador universal, que detecta seu sistema operacional e configura os pacotes essenciais, ZSH, plugins Zinit, Starship Prompt, fontes Nerd Fonts e dotfiles:

```bash
# Clone o repositório
git clone https://github.com/diogoslsceno/guia-linux.git
cd guia-linux

# Execute o instalador universal autodetectável
./scripts/install.sh
```

Ou execute diretamente o script dedicado para a sua distribuição:
- **Debian / Ubuntu:** `./scripts/setup-debian.sh`
- **Fedora:** `./scripts/setup-fedora.sh`
- **Arch Linux:** `./scripts/setup-arch.sh`
- **Termux (Android):** `./scripts/setup-termux.sh`

---

## 📚 Guias Disponíveis

### 1. 🐧 [Debian & Ubuntu (`guias/debian.md`)](./guias/debian.md)
* **Público-Alvo:** Usuários de **Ubuntu, Debian e derivados** (ex: Linux Mint, Zorin OS, Pop!_OS).
* **Resumo do Conteúdo:**
  * **Comandos Úteis de Terminal:** Navegação, permissões (`chown`, `chmod`), gerenciamento de processos e atalhos.
  * **Gerenciamento de Pacotes (APT):** Atualização, instalação e manutenção de pacotes do sistema.
  * **Setup do ZSH & Plugins:** ZSH, Oh My Zsh, Zinit, autosuggestions e sintaxe destacada.
  * **Prompt & Estética:** **Starship Prompt** e **Nerd Fonts** (JetBrains Mono).
  * **Ferramentas de Dev:** SDKMAN, Node.js, Docker, Java, Git, Gemini CLI, Antigravity CLI, VS Code e qBittorrent.
  * **Customização do GRUB:** Instalação do Tema Vimix, backup, remoção de submenus/recovery e otimização de boot.

---

### 2. 🎩 [Fedora Linux (`guias/fedora.md`)](./guias/fedora.md)
* **Público-Alvo:** Usuários de **Fedora Linux** e distribuições da família RHEL/RPM.
* **Resumo do Conteúdo:**
  * **Gerenciamento de Pacotes (DNF):** Equivalentes dos comandos APT utilizando o `dnf`.
  * **Setup do ZSH & Plugins:** ZSH, Oh My Zsh e Zinit ajustados para Fedora.
  * **Prompt & Estética:** Configuração avançada de prompt e fontes no Fedora.
  * **Ferramentas e Compatibilidade:** Docker Engine, RPM oficial do VS Code, Flatpak/Flathub, qBittorrent e ferramentas de dev.
  * **Customização do GRUB:** Instalação do Tema Vimix, backup e otimização do bootloader no Fedora.

---

### 3. 🏹 [Arch Linux (`guias/arch.md`)](./guias/arch.md)
* **Público-Alvo:** Usuários de **Arch Linux** e derivados (ex: EndeavourOS, Manjaro, Garuda Linux).
* **Resumo do Conteúdo:**
  * **Gerenciamento de Pacotes (Pacman & Yay):** Comandos essenciais do `pacman`, gerenciamento de órfãos e AUR.
  * **Setup do ZSH & Plugins:** ZSH, Oh My Zsh e Zinit otimizados para Arch.
  * **Prompt & Fontes:** Prompt Starship e pacotes de fontes `ttf-jetbrains-mono-nerd`.
  * **Ferramentas e IDEs:** Docker, Java (`archlinux-java`), VS Code, Discord, JetBrains Toolbox, Android Studio, qBittorrent e Flatpak.
  * **Customização do GRUB:** Instalação do Tema Vimix, backup e limpeza de menus no Arch Linux.

---

### 4. 🦎 [openSUSE (`guias/opensuse.md`)](./guias/opensuse.md)
* **Público-Alvo:** Usuários de **openSUSE Tumbleweed** (*rolling-release*) e **openSUSE Leap**.
* **Resumo do Conteúdo:**
  * **Gerenciador Zypper:** Comandos de atualização (`dup` / `update`), instalação e busca de pacotes.
  * **Setup do Terminal:** ZSH, Zinit, Starship Prompt e JetBrains Mono Nerd Font.
  * **Ferramentas de Desenvolvimento:** Docker Engine, VS Code (RPM oficial via Zypper repo), Node.js, OpenJDK 21, qBittorrent e Flatpak.
  * **Bootloader:** Comandos de atualização e compatibilidade com snapshots Snapper/Btrfs.

---

### 5. 📱 [Termux / Android (`guias/termux.md`)](./guias/termux.md)
* **Público-Alvo:** Usuários de **Termux** no Android (smartphones e tablets).
* **Resumo do Conteúdo:**
  * **Comandos & Atalhos Móveis:** Permissões do Android (`termux-setup-storage`), atalhos por teclas de volume e controle de suspensão (`termux-wake-lock`).
  * **Gerenciamento de Pacotes (PKG & APT):** Comandos essenciais, troca de mirrors (`termux-change-repo`) e repositórios extras (`tur-repo`, `root-repo`, `x11-repo`).
  * **Setup do ZSH & Plugins:** ZSH, Oh My Zsh e Zinit adaptados para Android.
  * **Prompt & Estética:** Starship Prompt, fontes Nerd Fonts (`~/.termux/font.ttf`) e barra de teclas extras virtuais (`extra-keys`).
  * **Ferramentas de Dev:** Node.js LTS, Git com SSH Ed25519, Gemini CLI, Antigravity CLI, Python 3, OpenJDK e **VS Code via `code-server`**.
  * **Integração de Hardware & Acesso Remoto:** `termux-api` (bateria, clipboard, lanterna), servidor OpenSSH (porta 8022) e `proot-distro` (Linux completo sem root).

---

### 6. 🪟 [WSL 2 / Windows Subsystem for Linux (`guias/wsl.md`)](./guias/wsl.md)
* **Público-Alvo:** Desenvolvedores utilizando Linux integrado dentro do **Windows 10/11**.
* **Resumo do Conteúdo:**
  * **Configuração de Recursos:** Otimização de CPU, memória RAM e swap via `.wslconfig` no Windows.
  * **Integração de Sistema:** Ativação de `systemd`, resolução de nomes e isolamento de PATH via `/etc/wsl.conf`.
  * **Desempenho de Armazenamento:** Boas práticas de velocidade (Ext4 vs emulação 9P no NTFS `/mnt/c`).
  * **Ferramentas e IDEs:** Extensão VS Code Remote WSL, Docker Desktop vs Docker Engine nativo, WSLg (interface gráfica) e qBittorrent.

---

## 🛠️ Como Utilizar Este Repositório

1. **Escolha o seu método de instalação:**
   - **Automatizado:** Vá para o diretório [`scripts/`](./scripts/) e execute o instalador correspondente.
   - **Manual & Didático:** Escolha o guia da sua distribuição na pasta [`guias/`](./guias/) e execute os passos sequencialmente com explicações detalhadas para cada comando.

2. **Personalize os Dotfiles:**
   - Explore a pasta [`dotfiles/`](./dotfiles/) para copiar ou ajustar configurações limpas e testadas de `.zshrc`, `starship.toml` e propriedades do Termux.

---
