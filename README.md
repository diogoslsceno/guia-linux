# 🚀 Hub de Guias de Configuração de Ambiente Linux

Este repositório é um hub centralizado de guias passo a passo para configuração de terminal, shell ZSH, ferramentas de desenvolvimento e personalização de ambiente no Linux.

Toda a instrução de instalação e configuração foi refatorada, expandida e integrada em guias dedicados para cada distribuição na pasta [`guias/`](./guias/).

---

## 📁 Estrutura do Repositório

```text
guia-linux/
└── guias/
    ├── arch.md
    ├── debian.md
    ├── fedora.md
    └── termux.md
├── .gitignore
├── README.md
```

---

## 📚 Guias Disponíveis

### 1. 🐧 [Debian & Ubuntu (`guias/debian.md`)](./guias/debian.md)
* **Público-Alvo:** Usuários de **Ubuntu, Debian e derivados** (ex: Linux Mint, Zorin OS, Pop!_OS).
* **Objetivo:** Guia completo de referência e configuração do sistema e terminal.
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
* **Objetivo:** Adaptar todos os passos do guia principal para o ecossistema Red Hat/Fedora.
* **Resumo do Conteúdo:**
  * **Gerenciamento de Pacotes (DNF):** Equivalentes dos comandos APT utilizando o `dnf`.
  * **Setup do ZSH & Plugins:** ZSH, Oh My Zsh e Zinit ajustados para Fedora.
  * **Prompt & Estética:** Configuração avançada de prompt e fontes no Fedora.
  * **Ferramentas e Compatibilidade:** Docker Engine, RPM oficial do VS Code, Flatpak/Flathub, qBittorrent e ferramentas de dev.
  * **Customização do GRUB:** Instalação do Tema Vimix, backup e otimização do bootloader no Fedora.

---

### 3. 🏹 [Arch Linux (`guias/arch.md`)](./guias/arch.md)
* **Público-Alvo:** Usuários de **Arch Linux** e derivados (ex: EndeavourOS, Manjaro, Garuda Linux).
* **Objetivo:** Guia dedicado ao ecossistema *Rolling Release* utilizando `pacman` e o helper AUR `yay`.
* **Resumo do Conteúdo:**
  * **Gerenciamento de Pacotes (Pacman & Yay):** Comandos essenciais do `pacman`, gerenciamento de órfãos e AUR.
  * **Setup do ZSH & Plugins:** ZSH, Oh My Zsh e Zinit otimizados para Arch.
  * **Prompt & Fontes:** Prompt Starship e pacotes de fontes `ttf-jetbrains-mono-nerd`.
  * **Ferramentas e IDEs:** Docker, Java (`archlinux-java`), VS Code, Discord, JetBrains Toolbox, Android Studio, qBittorrent e Flatpak.
  * **Customização do GRUB:** Instalação do Tema Vimix, backup e limpeza de menus no Arch Linux.

---

### 4. 📱 [Termux / Android (`guias/termux.md`)](./guias/termux.md)
* **Público-Alvo:** Usuários de **Termux** no Android (smartphones e tablets).
* **Objetivo:** Adaptar o ecossistema Linux para ambiente móvel com arquitetura Bionic libc e prefixo `$PREFIX`.
* **Resumo do Conteúdo:**
  * **Comandos & Atalhos Móveis:** Navegação, permissões de armazenamento do Android (`termux-setup-storage`), atalhos com teclas de volume e controle de background (`termux-wake-lock`).
  * **Gerenciamento de Pacotes (PKG & APT):** Comandos essenciais do `pkg`, troca de mirrors (`termux-change-repo`) e repositórios extras (`tur-repo`, `root-repo`, `x11-repo`).
  * **Setup do ZSH & Plugins:** ZSH, Oh My Zsh e Zinit adaptados para Android.
  * **Prompt & Estética:** **Starship Prompt** nativo, fontes **Nerd Fonts** aplicadas diretamente em `~/.termux/font.ttf` e temas TOML completos.
  * **Ferramentas de Dev:** Node.js LTS, Git com SSH Ed25519, Gemini CLI, Antigravity CLI, Python 3, OpenJDK e **VS Code via `code-server`** (para programar direto no navegador web).
  * **Integração de Hardware (Termux:API):** Acesso a notificações, bateria, clipboard e lanterna.
  * **Acesso Remoto & PRoot:** Servidor OpenSSH (`sshd`) na porta 8022 para acessar o celular pelo PC via Wi-Fi, barra de teclas virtuais estendidas (`extra-keys`) e `proot-distro` (Linux completo sem root).

---

## 🛠️ Como Utilizar Este Repositório

1. **Identifique sua distribuição / ambiente:**
   * Se você usa Ubuntu, Debian, Linux Mint, Zorin OS ou Pop!_OS, consulte o [guias/debian.md](./guias/debian.md).
   * Se você usa Fedora ou RHEL, consulte o [guias/fedora.md](./guias/fedora.md).
   * Se você usa Arch Linux, EndeavourOS, Manjaro ou Garuda, consulte o [guias/arch.md](./guias/arch.md).
   * Se você usa Android com Termux, consulte o [guias/termux.md](./guias/termux.md).

2. **Siga a ordem do guia escolhido:** Cada arquivo foi estruturado em sequência lógica para que você possa copiar, colar e executar os comandos do início ao fim sem quebrar dependências do sistema.

---
