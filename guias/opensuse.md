# 🦎 GuiaLinuxOpenSUSE

> Guia pessoal de comandos e configurações para **openSUSE** (Tumbleweed *rolling-release* e Leap estável).
>
> ⚠️ **Atenção:** o openSUSE utiliza o gerenciador de pacotes **Zypper** e o sistema de controle **YaST**. Leia cada seção antes de executar comandos com `sudo`.

---

# 1. 💻 Comandos úteis do terminal openSUSE

## 1.1 📍 Navegação e diretórios

| Comando | Função |
|---|---|
| `pwd` | Mostra o caminho completo do diretório atual. |
| `ls` | Lista arquivos e pastas do diretório atual. |
| `cd nome-da-pasta` | Entra em uma pasta específica. |
| `cd ..` | Volta para o diretório anterior. |
| `cd ~` | Vai para o diretório home do usuário. |
| `mkdir nome-da-pasta` | Cria uma nova pasta. |
| `mkdir -p caminho/completo` | Cria múltiplas pastas caso não existam. |
| `touch arquivo.txt` | Cria um arquivo vazio. |
| `tree` | Mostra a estrutura de diretórios em árvore. |

## 1.2 📁 Copiar, mover e renomear

| Comando | Função |
|---|---|
| `mv antigo novo` | Renomeia arquivo ou pasta. |
| `mv arquivo destino/` | Move arquivo ou pasta para outro diretório. |
| `cp arquivo destino/` | Copia um arquivo para outro diretório. |
| `cp -r pasta destino/` | Copia uma pasta recursivamente. |

## 1.3 🗑️ Excluir arquivos e pastas

| Comando | Função |
|---|---|
| `rm arquivo.txt` | Remove um arquivo. |
| `rm -r pasta` | Remove uma pasta e seu conteúdo. |
| `rm -rf pasta` | Força a remoção de arquivos e diretórios sem confirmação. |
| `rmdir pasta` | Remove uma pasta vazia. |

## 1.4 📄 Visualização e edição

| Comando | Função |
|---|---|
| `cat arquivo.txt` | Exibe o conteúdo de um arquivo. |
| `nano arquivo.txt` | Abre um arquivo no editor Nano. |
| `code .` | Abre o diretório atual no Visual Studio Code. |

## 1.5 🔧 Permissões e proprietário

| Comando | Função |
|---|---|
| `chmod +x arquivo.sh` | Torna o arquivo executável. |
| `sudo chown $USER:$USER arquivo` | Altera proprietário para o usuário atual. |

## 1.6 🖥️ Terminal e sessão

| Comando / atalho | Função |
|---|---|
| `clear` | Limpa a tela do terminal. |
| `Ctrl + L` | Atalho para limpar a tela. |
| `exit` | Encerra a sessão do terminal. |
| `history` | Mostra histórico de comandos. |
| `source ~/.zshrc` | Recarrega as configurações do ZSH. |

## 1.7 📦 Gerenciamento de pacotes com Zypper

No openSUSE, o gerenciador principal de linha de comando é o **`zypper`**:

```bash
# Atualiza os índices dos repositórios
sudo zypper refresh

# Atualização do sistema para openSUSE Tumbleweed (Rolling Release)
sudo zypper dup -y

# Atualização de pacotes para openSUSE Leap
sudo zypper update -y

# Instala um pacote
sudo zypper install -y nome-do-pacote

# Remove um pacote e suas dependências não utilizadas
sudo zypper remove -u nome-do-pacote

# Procura um pacote nos repositórios
zypper search nome-do-pacote

# Exibe informações detalhadas de um pacote
zypper info nome-do-pacote

# Limpa o cache local de pacotes
sudo zypper clean --all
```

---

# 2. 📦 Instalação de aplicativos e ferramentas

## 2.1 🧰 Dependências básicas

```bash
sudo zypper refresh && sudo zypper install -y \
    curl \
    wget \
    git \
    ca-certificates \
    gpg2 \
    tar \
    unzip \
    gcc \
    gcc-c++ \
    make \
    python3 \
    tree \
    fastfetch \
    htop \
    gparted
```

## 2.2 🟢 Node.js e npm

```bash
# Instala Node.js e npm
sudo zypper install -y nodejs npm

# Verifica versões
node -v
npm -v
```

## 2.3 🤖 Gemini CLI, Gtop e Antigravity

```bash
# Monitor gtop global via npm
sudo npm install -g gtop

# Gemini CLI global
sudo npm install -g @google/gemini-cli

# Antigravity CLI
curl -fsSL https://antigravity.google/cli/install.sh | bash

# Exporta binários locais para o PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Validação
gemini --version
agy --version
```

## 2.4 🧑‍💻 Visual Studio Code

```bash
# Importa chave GPG da Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Adiciona o repositório oficial do VS Code
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode

# Atualiza repositórios e instala o Code
sudo zypper refresh
sudo zypper install -y code

# Verifica versão
code --version
```

## 2.5 🐳 Docker Engine e Docker Compose

```bash
# Instala Docker e utilitários
sudo zypper install -y docker docker-compose

# Habilita e inicia o daemon do Docker
sudo systemctl enable --now docker

# Adiciona o usuário ao grupo docker
sudo usermod -aG docker $USER
```

> Reinicie a sessão ou execute `newgrp docker` para validar as permissões.

## 2.6 🧲 qBittorrent

```bash
# Instala o qBittorrent oficial dos repositórios openSUSE
sudo zypper install -y qbittorrent

# Verifica a versão
qbittorrent --version
```

## 2.7 📦 Flatpak & Flathub

```bash
# Instala o suporte a Flatpak
sudo zypper install -y flatpak

# Adiciona o repositório Flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Exemplo: Instalação do Discord
flatpak install flathub com.discordapp.Discord -y
```

## 2.8 ☕ Java / OpenJDK

```bash
# Instala o OpenJDK 21 LTS
sudo zypper install -y java-21-openjdk java-21-openjdk-devel

# Valida runtime e compilador
java --version
javac --version
```

## 2.9 🔧 Git + SSH + GitHub

```bash
# Gera chave SSH Ed25519
ssh-keygen -t ed25519 -C "SEU_EMAIL_REAL"

# Inicia SSH Agent e adiciona chave
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Exibe a chave pública para adicionar no GitHub
cat ~/.ssh/id_ed25519.pub
```

---

# 3. 🐚 ZSH, Starship e Nerd Fonts

## 3.1 Instalar ZSH & Oh My Zsh

```bash
# Instala ZSH
sudo zypper install -y zsh

# Define como shell padrão
chsh -s $(which zsh)

# Instala Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

## 3.2 Zinit & Starship

```bash
# Zinit
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y
```

## 3.3 Nerd Fonts (JetBrains Mono)

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip
fc-cache -fv
```

---

# 4. 🎨 Bootloader e Customização

O openSUSE utiliza o GRUB2 integrado com snapshots do **Btrfs** e **Snapper**. Caso deseje personalizar o tema ou as entradas do bootloader:

```bash
# Atualizar configuração do GRUB no openSUSE
sudo update-bootloader --refresh
# Ou alternativamente:
# sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```
