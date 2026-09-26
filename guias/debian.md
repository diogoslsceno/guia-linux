# 🐧 GuiaLinuxDebian

> Guia pessoal de comandos e configurações para **Ubuntu/Debian**.
>
> ⚠️ **Atenção:** alguns comandos são específicos do Ubuntu/GNOME ou podem variar conforme a versão da distribuição. Leia cada seção antes de executar comandos com `sudo`, remoção de pacotes ou alteração de configurações.

---

# 1. 💻 Comandos úteis do terminal

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
| `tree` | Mostra a estrutura de diretórios em formato de árvore. Requer instalação. |

## 1.2 📁 Copiar, mover e renomear

| Comando | Função |
|---|---|
| `mv antigo novo` | Renomeia arquivo ou pasta. |
| `mv arquivo destino/` | Move arquivo ou pasta para outro diretório. |
| `cp arquivo destino/` | Copia um arquivo para outro diretório. |
| `cp -r pasta destino/` | Copia uma pasta e todo o seu conteúdo. |

## 1.3 🗑️ Excluir arquivos e pastas

> ⚠️ Cuidado com `rm -rf`: a exclusão é forçada e pode apagar dados sem confirmação.

| Comando | Função |
|---|---|
| `rm arquivo.txt` | Remove um arquivo. |
| `rm -r pasta` | Remove uma pasta e seu conteúdo. |
| `rm -rf pasta` | Remove uma pasta e seu conteúdo forçando a exclusão. |
| `rmdir pasta` | Remove uma pasta vazia. |

## 1.4 📄 Visualização e edição

| Comando | Função |
|---|---|
| `cat arquivo.txt` | Exibe o conteúdo de um arquivo. |
| `nano arquivo.txt` | Abre um arquivo no editor Nano. |
| `code .` | Abre o diretório atual no Visual Studio Code. |
| `code arquivo.txt` | Abre um arquivo específico no Visual Studio Code. |

## 1.5 🔧 Permissões e proprietário

| Comando | Função |
|---|---|
| `chmod +x arquivo.sh` | Adiciona permissão de execução a um arquivo. |
| `sudo chown $USER:$USER arquivo` | Altera o proprietário de um arquivo para o usuário e grupo atuais. |

## 1.6 🖥️ Terminal e sessão

| Comando / atalho | Função |
|---|---|
| `clear` | Limpa a tela do terminal. |
| `Ctrl + L` | Atalho para limpar a tela. |
| `exit` | Encerra a sessão do terminal. |
| `history` | Mostra o histórico de comandos digitados. |
| `man comando` | Mostra o manual de um comando. Ex.: `man ls`. |
| `source ~/.zshrc` | Recarrega as configurações do ZSH. |

## 1.7 📦 Gerenciamento de pacotes com APT

```bash
# Atualiza a lista de pacotes disponíveis
sudo apt update

# Atualiza os pacotes instalados
sudo apt upgrade -y

# Remove pacotes desnecessários
sudo apt autoremove -y

# Atualiza o sistema, remove dependências desnecessárias e limpa o cache
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean

# Instala um pacote
sudo apt install nome-do-pacote -y

# Remove um pacote instalado
sudo apt remove nome-do-pacote -y
```

### 🔄 Reiniciar e desligar

```bash
# Reinicia o computador
sudo reboot

# Desliga o computador imediatamente
sudo shutdown now
```

### 🖥️ Configurações do GNOME

```bash
# Define a opacidade do perfil padrão do Ptyxis para 55%
gsettings set org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/$(gsettings get org.gnome.Ptyxis default-profile-uuid | tr -d \')/ opacity 0.55

# Desativa áreas de trabalho dinâmicas
gsettings set org.gnome.mutter dynamic-workspaces false

# Define 5 áreas de trabalho
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5

# Verifica a configuração de áreas de trabalho dinâmicas
gsettings get org.gnome.mutter dynamic-workspaces

# Verifica a quantidade de áreas de trabalho
gsettings get org.gnome.desktop.wm.preferences num-workspaces
```

---

# 2. 📦 Instalação de aplicativos e ferramentas

## 2.1 🧰 Dependências básicas

Essas dependências são usadas para evitar problemas comuns com certificados, downloads, repositórios e pacotes.

```bash
sudo apt update && sudo apt install -y \
curl \
wget \
git \
ca-certificates \
gnupg \
software-properties-common \
apt-transport-https
```

## 2.2 🌳 Tree

```bash
sudo apt install tree -y
```

## 2.3 🖥️ Ferramentas do sistema

```bash
# Personalização do GNOME
sudo apt install gnome-tweaks -y

# Integração de extensões do GNOME com navegador
sudo apt install chrome-gnome-shell -y

# Gerenciador de extensões do GNOME
sudo apt install gnome-shell-extension-manager -y

# Informações do sistema
sudo apt install fastfetch -y

# Backup
sudo apt install timeshift -y

# Efeito inspirado no filme Matrix
sudo apt install cmatrix -y

# Visualização de áudio
sudo apt install cava -y

# Monitoramento do sistema
sudo apt install htop -y

# Gerenciador de discos
sudo apt install gparted -y
```

> 💡 Nota: O `neofetch` foi descontinuado na maioria dos repositórios Debian/Ubuntu mais recentes, sendo recomendado utilizar o `fastfetch`.

## 2.4 🟢 Node.js e npm

### Opção 1: Via repositórios oficiais da distribuição

```bash
# Instala Node.js e npm pelos pacotes padrão do APT
sudo apt install nodejs npm -y

# Verifica as versões instaladas
node -v
npm -v
```

### Opção 2: Via NodeSource (Versão LTS / v22)

```bash
# Configura o repositório do Node.js 22 LTS
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

# Instala o Node.js 22 e npm
sudo apt install -y nodejs

# Verifica a versão
node -v
npm -v
```

## 2.5 🤖 Gemini CLI, Gtop e Antigravity

> ⚠️ Certifique-se de que o Node.js e o npm estão instalados (Seção 2.4) antes de executar os comandos `npm`.

```bash
# Instala o monitor gtop globalmente via npm
sudo npm install -g gtop

# Instala o Gemini CLI globalmente
sudo npm install -g @google/gemini-cli

# Instala o Antigravity CLI
curl -fsSL https://antigravity.google/cli/install.sh | bash

# Adiciona os binários locais ao PATH do ZSH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc

# Recarrega a sessão do shell
source ~/.zshrc

# Verifica as instalações
node -v
npm -v
gemini --version
agy --version
```

## 2.6 🧑‍💻 Visual Studio Code

### Opção recomendada: pacote `.deb` oficial

```bash
cd ~/Downloads

# Baixa a versão estável para Linux Debian/Ubuntu
wget -O code.deb \
"https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

# Instala o pacote
sudo apt install ./code.deb -y

# Verifica a instalação
code --version
```

### Alternativa: Snap

```bash
sudo snap install --classic code
```

## 2.7 🔀 Meld e Sublime Merge

```bash
# Meld
sudo apt install meld -y

# Sublime Merge (via Snap)
sudo snap install sublime-merge --classic
```

## 2.8 🐳 Docker e Docker Compose

### Para Ubuntu:

```bash
# Remove instalações antigas/conflitantes
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc docker-buildx podman-docker containerd runc 2>/dev/null | cut -f1)

# Atualiza os pacotes
sudo apt update

# Instala dependências
sudo apt install ca-certificates curl gnupg

# Cria o diretório das chaves
sudo install -m 0755 -d /etc/apt/keyrings

# Adiciona a chave GPG oficial do Docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Adiciona o repositório do Docker para Ubuntu
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Atualiza a lista de pacotes
sudo apt update

# Instala Docker Engine, CLI, containerd, Buildx e Compose
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Inicia e habilita o serviço do Docker
sudo systemctl enable --now docker

# Verifica o Docker e Compose
docker --version
docker compose version

# Permite executar Docker sem sudo
sudo usermod -aG docker $USER
```

### Para Debian puro:

```bash
# Para Debian, substitua a URL do repositório por debian:
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
```

> Depois de adicionar o usuário ao grupo `docker`, encerre a sessão ou execute `newgrp docker` para a alteração entrar em vigor.

## 2.9 💬 Discord

```bash
cd ~/Downloads

# Baixa o pacote .deb do Discord
wget 'https://discord.com/api/download?platform=linux&format=deb' -O discord.deb

# Confere o arquivo baixado
ls -lh discord.deb

# Instala o Discord
sudo apt install ./discord.deb -y

# Verifica o executável
which discord

# Verifica a versão
discord --version
```

## 2.10 ☕ Java / OpenJDK

```bash
# Atualiza a lista de pacotes
sudo apt update

# Instala a versão LTS do OpenJDK (ex: OpenJDK 21) ou OpenJDK 25 se disponível
sudo apt install -y openjdk-21-jdk openjdk-21-jre

# Para versão mais recente (OpenJDK 25) quando disponível no repositório:
# sudo apt install -y openjdk-25-jdk

# Verifica o Java
java --version

# Verifica o compilador
javac --version

# Escolhe/verifica o Java padrão
sudo update-alternatives --config java

# Escolhe/verifica o compilador padrão
sudo update-alternatives --config javac

# Verifica os caminhos dos executáveis
which java
which javac

# Verifica o caminho real do Java
readlink -f "$(which java)"
```

## 2.11 🐍 Anaconda

```bash
# Atualiza o sistema
sudo apt update && sudo apt upgrade -y

# Instala dependências
sudo apt install -y curl wget bzip2 ca-certificates

# Vai para Downloads
cd ~/Downloads

# Baixa o instalador do Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh -O Anaconda3-latest.sh

# Executa o instalador
bash Anaconda3-latest.sh

# Inicializa o Conda para ZSH
~/anaconda3/bin/conda init zsh

# Aplica as alterações
source ~/.zshrc

# Desativa a inicialização automática do ambiente base
conda config --set auto_activate_base false

# Remove a configuração do Conda adicionada ao Bash se preferir apenas no ZSH
~/anaconda3/bin/conda init --reverse bash

# Desativa o ambiente base da sessão atual
conda deactivate

# Verifica a instalação
conda --version
conda info --base
```

## 2.12 📦 Flatpak

```bash
# Instala o Flatpak
sudo apt install flatpak -y

# Integra o Flatpak ao GNOME Software
sudo apt install gnome-software-plugin-flatpak -y

# Adiciona o repositório Flathub
sudo flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo

# Verifica os repositórios Flatpak
flatpak remotes
```

### Apps Flatpak recomendados

```bash
# IntelliJ IDEA Community
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community -y

# PyCharm Community
flatpak install flathub com.jetbrains.PyCharm-Community -y

# CLion
flatpak install flathub com.jetbrains.CLion -y

# PhpStorm
flatpak install flathub com.jetbrains.PhpStorm -y

# Android Studio
flatpak install flathub com.google.AndroidStudio -y

# Visual Studio Code
flatpak install flathub com.visualstudio.code -y
```

### Permissões para IDEs via Flatpak

```bash
# VS Code
flatpak override --user --filesystem=host com.visualstudio.code
flatpak override --user --device=all com.visualstudio.code

# Android Studio
flatpak override --user --filesystem=host com.google.AndroidStudio
flatpak override --user --device=all com.google.AndroidStudio

# IDEs JetBrains
flatpak override --user --filesystem=host com.jetbrains.IntelliJ-IDEA-Community
flatpak override --user --filesystem=host com.jetbrains.PyCharm-Community
flatpak override --user --filesystem=host com.jetbrains.CLion
flatpak override --user --filesystem=host com.jetbrains.PhpStorm

flatpak override --user --device=all com.jetbrains.IntelliJ-IDEA-Community
flatpak override --user --device=all com.jetbrains.PyCharm-Community
flatpak override --user --device=all com.jetbrains.CLion
flatpak override --user --device=all com.jetbrains.PhpStorm
```

### Comandos úteis do Flatpak

```bash
# Lista os aplicativos instalados
flatpak list

# Atualiza os aplicativos
flatpak update -y

# Remove um aplicativo
flatpak uninstall com.jetbrains.IntelliJ-IDEA-Community
```

## 2.13 🧰 JetBrains Toolbox

> O JetBrains Toolbox é a forma recomendada de instalar e gerenciar IDEs JetBrains de forma centralizada.

```bash
cd ~/Downloads

# Baixa o JetBrains Toolbox
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.8.0.51918.tar.gz

# Extrai
tar -xzf jetbrains-toolbox-*.tar.gz

# Entra na pasta extraída
cd jetbrains-toolbox-*/

# Executa o Toolbox
./jetbrains-toolbox
```

Pelo Toolbox, é recomendado instalar:
- IntelliJ IDEA Community
- PyCharm Community
- CLion
- PhpStorm

## 2.14 📱 Android Studio

```bash
cd ~/Downloads

# Baixa o Android Studio
wget -O android-studio.tar.gz \
https://redirector.gvt1.com/edgedl/android/studio/install/current/android-studio-*.tar.gz

# Cria a pasta de instalação
sudo mkdir -p /opt/android-studio

# Extrai para /opt
sudo tar -xzf android-studio.tar.gz \
-C /opt/android-studio \
--strip-components=1

# Cria um link simbólico global
sudo ln -sf /opt/android-studio/bin/studio /usr/local/bin/android-studio

# Abre o Android Studio
android-studio
```

Na primeira inicialização, certifique-se de marcar e instalar:
- Android SDK
- Android SDK Command-line Tools
- Android Emulator
- Android SDK Platform Tools

## 2.15 🎥 OBS Studio

```bash
# Atualiza a lista de pacotes
sudo apt update

# Instala o OBS Studio
sudo apt install obs-studio -y

# Verifica a instalação
obs --version
```

Para abrir:
```bash
obs
```

## 2.16 🧲 qBittorrent

### Opção 1: Via PPA oficial (Recomendado para Ubuntu e derivados)

```bash
# Adiciona o repositório PPA oficial do qBittorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y

# Atualiza a lista de pacotes
sudo apt update

# Instala o qBittorrent
sudo apt install qbittorrent -y

# Verifica a versão instalada
qbittorrent --version
```

### Opção 2: Via repositório oficial do sistema (Debian puro / APT padrão)

```bash
# Atualiza a lista de pacotes
sudo apt update

# Instala o qBittorrent disponível no repositório da distribuição
sudo apt install qbittorrent -y

# Verifica a instalação
qbittorrent --version
```

### Opção 3: Via Flatpak (Flathub)

```bash
# Instala o qBittorrent pelo Flathub
flatpak install flathub org.qbittorrent.qBittorrent -y

# Executa via Flatpak
flatpak run org.qbittorrent.qBittorrent
```

## 2.17 🛠️ GRUB Customizer

> ⚠️ O GRUB Customizer altera a configuração do bootloader. Use com cuidado e mantenha uma forma de recuperação do sistema caso alguma alteração impeça o sistema de iniciar.

```bash
# Atualiza a lista de pacotes
sudo apt update

# Instala o GRUB Customizer
sudo apt install grub-customizer -y
```

Para abrir:
```bash
grub-customizer
```

## 2.18 🔧 Git + SSH + GitHub

### Criar/configurar uma chave SSH

```bash
# Verifica a pasta SSH
ls -la ~/.ssh

# Remove a chave antiga, caso necessário
rm -f ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub

# Cria uma nova chave (substitua pelo e-mail associado ao GitHub)
ssh-keygen -t ed25519 -C "SEU_EMAIL_REAL"

# Inicia o SSH Agent
eval "$(ssh-agent -s)"

# Adiciona a chave ao agente
ssh-add ~/.ssh/id_ed25519

# Verifica a chave adicionada
ssh-add -l

# Exibe a chave pública para copiar
cat ~/.ssh/id_ed25519.pub
```

No GitHub:
1. Acesse **Settings → SSH and GPG keys → New SSH key**.
2. Em **Title**, informe um nome para identificar a máquina (ex: `Debian-Laptop`).
3. Em **Key type**, selecione `Authentication Key`.
4. Cole o conteúdo de `~/.ssh/id_ed25519.pub`.
5. Clique em **Add SSH key**.

### Testar a conexão

```bash
ssh -T git@github.com
```

Resultado esperado:
```text
Hi SEU_USUARIO! You've successfully authenticated,
but GitHub does not provide shell access.
```

### Configurar identidade do Git

```bash
git config --global user.name "SEU NOME"
git config --global user.email "SEU_EMAIL_REAL"

# Verifica a configuração
git config --global --list
```

### Configurar um repositório para usar SSH

```bash
# Entre na pasta do repositório
cd CAMINHO/DO/SEU/REPOSITORIO

# Verifica o endereço remoto atual
git remote -v

# Troca HTTPS por SSH (substitua pelo endereço do seu repositório)
git remote set-url origin git@github.com:USUARIO/REPOSITORIO.git

# Confere novamente
git remote -v
```

### Fluxo básico para enviar alterações

```bash
# Verifica o estado do repositório
git status

# Adiciona alterações
git add .

# Cria um commit
git commit -m "Atualiza projeto"

# Envia para o remoto
git push
```

---

# 3. 🐚 Instalação e configuração do ZSH

## 3.1 Instalar ZSH

```bash
# Instala o ZSH
sudo apt install zsh -y

# Verifica a versão
zsh --version

# Define o ZSH como shell padrão
chsh -s $(which zsh)
```

> Após `chsh`, encerre a sessão do usuário e faça login novamente para ativar o ZSH como shell padrão.

## 3.2 Instalar Curl e Git

```bash
sudo apt install curl git -y

curl --version
git --version
```

## 3.3 Instalar Oh My Zsh

```bash
# Instala o Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Abre a configuração do ZSH
nano ~/.zshrc

# Recarrega as configurações
source ~/.zshrc
```

## 3.4 Instalar plugins

```bash
# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Sugestões automáticas
git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## 3.5 Instalar Zinit

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

## 3.6 Instalar Starship

```bash
# Instala o Starship Prompt
curl -sS https://starship.rs/install.sh | sh

# Verifica a instalação
starship --version
```

## 3.7 Configurar o `~/.zshrc`

Abra o arquivo:

```bash
nano ~/.zshrc
```

Adicione ao final do arquivo:

```zsh
### Plugins via Zinit

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light hlissner/zsh-autopair
zinit light Aloxaf/fzf-tab
zinit light agkozak/zsh-z
zinit light zdharma-continuum/history-search-multi-word

### Starship Prompt

eval "$(starship init zsh)"

### SDKMAN

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
```

Salve no Nano: `Ctrl + O` → `Enter` → `Ctrl + X`.

Recarrega as configurações:

```bash
source ~/.zshrc
```

## 3.8 🔤 Nerd Font — opcional

```bash
# Cria a pasta de fontes do usuário
mkdir -p ~/.local/share/fonts

# Entra na pasta
cd ~/.local/share/fonts

# Baixa a JetBrains Mono Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

# Extrai
unzip JetBrainsMono.zip

# Atualiza o cache de fontes
fc-cache -fv
```

Nas configurações do terminal (ex: Gnome Terminal, Ptyxis, Tilix), selecione a fonte `JetBrainsMono Nerd Font`.

## 3.9 ⭐ Configurar o Starship

Crie a pasta de configuração e o arquivo:

```bash
mkdir -p ~/.config
nano ~/.config/starship.toml
```

### Tema original

```toml
format = """
[░▒▓](#a3aed2)\
[  ](bg:#a3aed2 fg:#090c0c)\
[](bg:#769ff0 fg:#a3aed2)\
$directory\
[](fg:#769ff0 bg:#394260)\
$git_branch\
$git_status\
[](fg:#394260 bg:#212736)\
$nodejs\
$rust\
$golang\
$php\
[](fg:#212736 bg:#1d2230)\
$time\
[ ](fg:#1d2230)\
\n$character"""

[directory]
style = "fg:#e3e5e5 bg:#769ff0"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = " "
"Pictures" = " "

[git_branch]
symbol = ""
style = "bg:#394260"
format = '[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)'

[git_status]
style = "bg:#394260"
format = '[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)'

[nodejs]
symbol = ""
style = "bg:#212736"
format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

[rust]
symbol = ""
style = "bg:#212736"
format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

[golang]
symbol = ""
style = "bg:#212736"
format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

[php]
symbol = ""
style = "bg:#212736"
format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

[time]
disabled = false
time_format = "%R"
style = "bg:#1d2230"
format = '[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)'
```

### Tema azul alternativo

```toml
format = """
[░▒▓](#021644)\
[   ](bg:#021644 fg:#E6ECFF)\
[](bg:#0A2A66 fg:#021644)\
$directory\
[](fg:#0A2A66 bg:#0F2F73)\
$git_branch\
$git_status\
[](fg:#0F2F73 bg:#081D4A)\
$rust\
$golang\
$php\
[](fg:#081D4A bg:#061738)\
$time\
[ ](fg:#061738)\
\n$character"""

[directory]
style = "fg:#E6ECFF bg:#0A2A66"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = " "
"Pictures" = " "

[git_branch]
symbol = ""
style = "bg:#0F2F73"
format = '[[ $symbol $branch ](fg:#8FB3FF bg:#0F2F73)]($style)'

[git_status]
style = "bg:#0F2F73"
format = '[[($all_status$ahead_behind )](fg:#8FB3FF bg:#0F2F73)]($style)'

[nodejs]
symbol = ""
style = "bg:#081D4A"
format = '[[ $symbol ($version) ](fg:#8FB3FF bg:#081D4A)]($style)'

[rust]
symbol = ""
style = "bg:#081D4A"
format = '[[ $symbol ($version) ](fg:#8FB3FF bg:#081D4A)]($style)'

[golang]
symbol = ""
style = "bg:#081D4A"
format = '[[ $symbol ($version) ](fg:#8FB3FF bg:#081D4A)]($style)'

[php]
symbol = ""
style = "bg:#081D4A"
format = '[[ $symbol ($version) ](fg:#8FB3FF bg:#081D4A)]($style)'

[time]
disabled = false
time_format = "%R"
style = "bg:#061738"
format = '[[  $time ](fg:#C6D4FF bg:#061738)]($style)'
```

---

## 📌 Observações finais

Este guia fornece uma base robusta e atualizada para gerenciar e preparar máquinas baseadas no ecossistema **Debian/Ubuntu** para desenvolvimento de software de alta produtividade.

> 💡 **Dica:** Realize as instalações sequencialmente por seções para validar as dependências de sistema antes dos frameworks.

---

# 4. 🎨 Guia Completo — GRUB + Tema Vimix (Ubuntu / Debian)

> **Ambiente de Referência:** Ubuntu 26.04.1 LTS / Debian e derivados.

> [!WARNING]
> **Aviso Importante & Gestão de Risco:**
> Esta seção de customização do GRUB e instalação do tema Vimix **não é estritamente necessária** para o funcionamento do sistema operacional ou para a configuração do ambiente de desenvolvimento. Trata-se de uma alteração estética e de organização avançada do bootloader.
> 
> **Riscos envolvidos:**
> - **Incapacidade de Inicialização (*Boot Loop* / Tela Preta):** Editar scripts em `/etc/grub.d/` (como o `10_linux`) ou alterar parâmetros como `GRUB_GFXMODE` pode impedir o carregamento do menu gráfico ou do próprio kernel.
> - **Perda de Opções de Recuperação (*Recovery Mode*):** A remoção de submenus de kernels adicionais e do *Recovery Mode* elimina as vias padrão de contingência do sistema caso ocorra uma falha após atualização de drivers de vídeo ou do kernel.
> - **Acesso Restrito ao Firmware:** Desabilitar a entrada `30_uefi-firmware` remove o atalho para as configurações de BIOS/UEFI diretamente pelo menu do GRUB.
> - **Remoção Incorreta de Kernels:** Purgar pacotes de kernel ativos sem verificar a versão em uso (`uname -r`) pode deixar a máquina sem um kernel funcional.
> 
> 💡 **Recomendação:** Crie o backup recomendado (Passo 1), execute todas as verificações antes do *reboot* e tenha um pendrive de boot (*Live USB*) à mão para eventuais recuperações via `chroot`.

---

### 1. Criar backup do GRUB

```bash
mkdir -p ~/backup-grub

sudo cp -a /etc/default/grub ~/backup-grub/grub
sudo cp -a /boot/grub/grub.cfg ~/backup-grub/grub.cfg
sudo cp -a /etc/grub.d ~/backup-grub/grub.d
```

### 2. Verificar o backup

```bash
ls -lah ~/backup-grub
```

### 3. Atualizar o GRUB antes da instalação do tema

```bash
sudo update-grub
```

### 4. Verificar se o Windows está sendo detectado

```bash
sudo grep -i "windows" /boot/grub/grub.cfg
```

### 5. Ir para o diretório do tema

```bash
cd ~/Documentos/codes/grub2-themes
```

### 6. Verificar o repositório

```bash
git status
git remote -v
```

### 7. Verificar as opções do instalador

```bash
./install.sh --help
```

### 8. Instalar o ImageMagick
> Necessário para o processamento das imagens do tema.

```bash
sudo apt update
sudo apt install -y imagemagick
```

### 9. Confirmar a instalação do ImageMagick

```bash
magick --version
```

### 10. Verificar a pasta de temas

```bash
ls -lah /usr/share/grub/themes
```

### 11. Instalar o Tema Vimix
> **Opções utilizadas:** `vimix` (tema escolhido), `color` (ícones coloridos), `1080p` (resolução).

```bash
sudo ./install.sh -t vimix -i color -s 1080p
```

### 12. Confirmar a configuração criada pelo tema

```bash
grep -E '^(GRUB_DEFAULT|GRUB_TIMEOUT_STYLE|GRUB_TIMEOUT|GRUB_THEME|GRUB_GFXMODE|GRUB_CMDLINE_LINUX_DEFAULT|GRUB_CMDLINE_LINUX)=' /etc/default/grub
```

### 13. Verificar os arquivos do Tema Vimix

```bash
ls -lah /usr/share/grub/themes/vimix
```

### 14. Criar backup específico do `10_linux`
> Esse arquivo será modificado para remover submenus, kernels adicionais e Recovery Mode.

```bash
sudo cp -a /etc/grub.d/10_linux /etc/grub.d/10_linux.vimix-backup
```

### 15. Impedir que o backup seja executado pelo GRUB
> Arquivos executáveis em `/etc/grub.d` são processados pelo `grub-mkconfig`. O backup deve permanecer apenas como cópia de segurança.

```bash
sudo chmod -x /etc/grub.d/10_linux.vimix-backup
```

### 16. Confirmar as permissões dos scripts

```bash
ls -l /etc/grub.d/10_linux*

# Resultado esperado:
# -rwxr-xr-x ... /etc/grub.d/10_linux
# -rw-r--r-- ... /etc/grub.d/10_linux.vimix-backup
```

### 17. Editar o `10_linux`
> Alteração feita: manter somente a primeira versão do kernel como entrada principal "Ubuntu". Isso elimina entradas secundárias e submenus.

```bash
sudo vim /etc/grub.d/10_linux
```

### 18. Alteração no final do `/etc/grub.d/10_linux`
O bloco original que criava o submenu e Recovery Mode foi substituído por:

```bash
if [ "x$is_top_level" = xtrue ]; then
  linux_entry "${OS}" "${version}" simple \
              "${GRUB_CMDLINE_LINUX} ${GRUB_CMDLINE_LINUX_DEFAULT}"
  is_top_level=false
fi

done

echo "$title_correction_code"
```

### 19. Confirmar o final do `10_linux`

```bash
tail -n 30 /etc/grub.d/10_linux
```

### 20. Remover Memtest86+ do menu

```bash
sudo vim /etc/default/grub
```

Adicionar/manter a linha:
```env
GRUB_DISABLE_MEMTEST=true
```

### 21. Desabilitar "UEFI Firmware Settings"
> O arquivo continua existindo, mas deixa de ser executável.

```bash
sudo chmod -x /etc/grub.d/30_uefi-firmware
```

### 22. Confirmar que UEFI Firmware Settings está desabilitado

```bash
ls -l /etc/grub.d/30_uefi-firmware

# Deve aparecer sem "x" nas permissões:
# -rw-r--r--
```

### 23. Verificar os parâmetros finais do GRUB

```bash
grep -E '^(GRUB_DEFAULT|GRUB_TIMEOUT_STYLE|GRUB_TIMEOUT|GRUB_DISABLE_MEMTEST|GRUB_THEME|GRUB_GFXMODE|GRUB_CMDLINE_LINUX_DEFAULT|GRUB_CMDLINE_LINUX)=' /etc/default/grub

# Configuração esperada:
# GRUB_DEFAULT=0
# GRUB_TIMEOUT_STYLE=menu
# GRUB_TIMEOUT=30
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
# GRUB_CMDLINE_LINUX=""
# GRUB_DISABLE_MEMTEST=true
# GRUB_GFXMODE=1920x1080,auto
# GRUB_THEME="/usr/share/grub/themes/vimix/theme.txt"
```

### 24. Verificar o kernel atual

```bash
uname -r
# Exemplo retornado: 7.0.0-31-generic
```

### 25. Verificar os kernels instalados

```bash
dpkg -l | grep -E 'linux-image|linux-headers' | grep -E '7\.0\.0'
```

### 26. Remover o kernel antigo
> ⚠️ **ATENÇÃO:** Executar somente se o sistema estiver funcionando normalmente com o kernel atual.

```bash
sudo apt purge \
linux-image-7.0.0-30-generic \
linux-headers-7.0.0-30 \
linux-headers-7.0.0-30-generic
```

### 27. Remover pacotes restantes do kernel antigo

```bash
sudo apt purge \
linux-image-unsigned-7.0.0-30-generic \
linux-main-modules-zfs-7.0.0-30-generic \
linux-modules-7.0.0-30-generic \
linux-tools-7.0.0-30 \
linux-tools-7.0.0-30-generic
```

### 28. Limpar dependências desnecessárias

```bash
sudo apt autoremove -y
```

### 29. Confirmar que somente o kernel atual está no `/boot`

```bash
ls -lah /boot | grep -E 'vmlinuz|initrd'
```

### 30. Gerar a configuração final do GRUB

```bash
sudo update-grub
```

### 31. Verificar as entradas do menu

```bash
sudo grep -E "^(menuentry|submenu)" /boot/grub/grub.cfg

# Resultado esperado:
# menuentry 'Ubuntu' ...
# menuentry 'Windows Boot Manager (on /dev/nvme0n1p1)' ...
```

### 32. Confirmar remoção do "Advanced options"

```bash
sudo grep -F "Advanced options for Ubuntu" /boot/grub/grub.cfg
# (Não deve retornar nada)
```

### 33. Confirmar remoção do Recovery Mode

```bash
sudo grep -F "recovery mode" /boot/grub/grub.cfg
# (Não deve retornar nada)
```

### 34. Confirmar remoção do Memtest

```bash
sudo grep -i "memory test" /boot/grub/grub.cfg
# (Não deve retornar nada)
```

### 35. Confirmar remoção do UEFI Firmware Settings

```bash
sudo grep -F "UEFI Firmware Settings" /boot/grub/grub.cfg
# (Não deve retornar nada)
```

### 36. Confirmar novamente a entrada do Windows

```bash
sudo grep -i "Windows Boot Manager" /boot/grub/grub.cfg
```

### 37. Confirmar ativação do Tema Vimix

```bash
grep -F 'GRUB_THEME="/usr/share/grub/themes/vimix/theme.txt"' /etc/default/grub
```

### 38. Resultado Final Esperado

O menu do GRUB deverá apresentar somente:
* **Ubuntu**
* **Windows Boot Manager**

Sem entradas para *Advanced options*, *Recovery Mode*, *Memtest86+* ou *UEFI Firmware Settings*.

### 39. Reiniciar o sistema
> ⚠️ **Executar somente depois de todas as verificações acima.**

```bash
sudo reboot
```

