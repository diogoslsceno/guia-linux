# 🎩 GuiaLinuxFedora

> Guia pessoal de comandos e configurações para **Fedora Linux**, distribuição mantida pelo projeto Fedora e patrocinada pela Red Hat.
>
> ⚠️ **Atenção:** este guia foi adaptado para o ecossistema Fedora/RPM (`dnf`). Leia cada seção antes de executar comandos com `sudo`, remoção de pacotes ou alteração de configurações.

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

## 1.7 📦 Gerenciamento de pacotes com DNF

No Fedora, o gerenciador de pacotes principal é o **DNF**.

```bash
# Atualiza os metadados e todos os pacotes do sistema
sudo dnf upgrade --refresh -y

# Instala um pacote
sudo dnf install nome-do-pacote -y

# Remove um pacote
sudo dnf remove nome-do-pacote -y

# Procura um pacote nos repositórios
dnf search nome-do-pacote

# Mostra informações detalhadas de um pacote
dnf info nome-do-pacote

# Lista pacotes instalados
dnf list installed

# Remove dependências não utilizadas
sudo dnf autoremove -y

# Limpa o cache do DNF
sudo dnf clean all
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

# Verifica as configurações
gsettings get org.gnome.mutter dynamic-workspaces
gsettings get org.gnome.desktop.wm.preferences num-workspaces
```

---

# 2. 📦 Instalação de aplicativos e ferramentas

## 2.1 🧰 Dependências básicas

```bash
# Atualiza o sistema
sudo dnf upgrade --refresh -y

# Instala utilitários de compilação, download, compactação e ferramentas básicas
sudo dnf install -y \
curl \
wget \
git \
ca-certificates \
gnupg2 \
tar \
unzip \
gcc \
gcc-c++ \
make \
python3
```

## 2.2 🌳 Tree

```bash
sudo dnf install tree -y
```

## 2.3 🖥️ Ferramentas do sistema

```bash
# Personalização do GNOME
sudo dnf install gnome-tweaks -y

# Gerenciador de extensões do GNOME
sudo dnf install gnome-extensions-app -y

# Informações do sistema
sudo dnf install fastfetch -y

# Backup do sistema
sudo dnf install timeshift -y

# Efeito Matrix no terminal
sudo dnf install cmatrix -y

# Visualização de áudio
sudo dnf install cava -y

# Monitoramento de processos
sudo dnf install htop -y

# Gerenciador de partições de disco
sudo dnf install gparted -y
```

## 2.4 🟢 Node.js e npm

```bash
# Instala Node.js e npm dos repositórios oficiais do Fedora
sudo dnf install nodejs npm -y

# Verifica as versões instaladas
node -v
npm -v
```

## 2.5 🤖 Gemini CLI, Gtop e Antigravity

```bash
# Instala o monitor gtop globalmente via npm
sudo npm install -g gtop

# Instala o Gemini CLI globalmente
sudo npm install -g @google/gemini-cli

# Instala o Antigravity CLI
curl -fsSL https://antigravity.google/cli/install.sh | bash

# Adiciona os binários locais ao PATH do ZSH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc

# Recarrega o ZSH
source ~/.zshrc

# Verifica as instalações
node -v
npm -v
gemini --version
agy --version
```

## 2.6 🧑‍💻 Visual Studio Code

### Instalação pelo repositório RPM oficial da Microsoft

```bash
# Importa a chave GPG da Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Adiciona o repositório do VS Code
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\nrepo_gpgcheck=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Atualiza os metadados do DNF
sudo dnf check-update

# Instala o VS Code
sudo dnf install code -y

# Verifica a versão
code --version
```

## 2.7 🔀 Meld e Sublime Merge

```bash
# Meld (Oficial)
sudo dnf install meld -y
```

> Para o Sublime Merge no Fedora, você pode utilizar o repositório RPM oficial da Sublime ou instalar via Flatpak/tarball.

## 2.8 🐳 Docker Engine e Docker Compose

```bash
# Remove versões conflitantes antigas caso existam
sudo dnf remove docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-selinux \
docker-engine-selinux \
docker-engine -y

# Instala plugins de gerenciamento do DNF
sudo dnf install dnf-plugins-core -y

# Adiciona o repositório oficial do Docker para Fedora
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Instala Docker Engine, CLI, containerd, Buildx e Compose
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Inicia e habilita o serviço do Docker no inicializador
sudo systemctl enable --now docker

# Verifica as instalações
docker --version
docker compose version

# Testa a execução do Docker
sudo docker run hello-world

# Permite executar Docker sem sudo
sudo usermod -aG docker $USER
```

> Após adicionar seu usuário ao grupo `docker`, encerre a sessão ou execute `newgrp docker` para aplicar a alteração.

## 2.9 💬 Discord

No Fedora, a opção mais prática e mantida para o Discord é o **Flatpak** via Flathub.

```bash
# Instala o Discord pelo Flathub
flatpak install flathub com.discordapp.Discord -y

# Executa
flatpak run com.discordapp.Discord
```

## 2.10 ☕ Java / OpenJDK

```bash
# Instala a versão LTS do OpenJDK (ex: OpenJDK 21) ou versão mais recente (java-latest-openjdk)
sudo dnf install java-21-openjdk-devel -y

# Para a versão mais recente disponível:
# sudo dnf install java-latest-openjdk-devel -y

# Verifica o Java e o compilador
java --version
javac --version

# Verifica o caminho dos executáveis
which java
which javac
readlink -f "$(which java)"
```

## 2.11 🐍 Anaconda

```bash
# Atualiza o sistema e instala dependências
sudo dnf upgrade --refresh -y
sudo dnf install -y curl wget bzip2 ca-certificates

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

# Desativa o ambiente base da sessão atual
conda deactivate

# Verifica a instalação
conda --version
conda info --base
```

## 2.12 📦 Flatpak

O Fedora Workstation já vem com o Flatpak integrado por padrão. Ative o Flathub para acessar todo o repositório:

```bash
# Instala Flatpak caso não esteja instalado
sudo dnf install flatpak -y

# Adiciona o repositório Flathub
sudo flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo

# Lista repositórios configurados
flatpak remotes
```

### Apps Flatpak recomendados

```bash
# Discord
flatpak install flathub com.discordapp.Discord -y

# OBS Studio
flatpak install flathub com.obsproject.Studio -y

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
```

## 2.13 🎥 OBS Studio

```bash
# Instala o OBS Studio pelo Flathub (recomendado para Fedora)
flatpak install flathub com.obsproject.Studio -y

# Executa o OBS Studio
flatpak run com.obsproject.Studio
```

## 2.14 🧲 qBittorrent

### Opção 1: Via repositórios oficiais (DNF)

```bash
# Instala o qBittorrent pelo DNF
sudo dnf install qbittorrent -y

# Verifica a versão instalada
qbittorrent --version
```

### Opção 2: Via Flatpak (Flathub)

```bash
# Instala o qBittorrent pelo Flathub
flatpak install flathub org.qbittorrent.qBittorrent -y

# Executa via Flatpak
flatpak run org.qbittorrent.qBittorrent
```

## 2.15 🛠️ GRUB Customizer

> ⚠️ O GRUB Customizer altera as configurações do gerenciador de boot. No Fedora, verifique a disponibilidade nos repositórios habilitados antes de instalar.

```bash
# Pesquisa o pacote
dnf search grub-customizer

# Se disponível:
sudo dnf install grub-customizer -y
```

## 2.16 🧰 JetBrains Toolbox

```bash
cd ~/Downloads

# Baixa o JetBrains Toolbox
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.8.0.51918.tar.gz

# Extrai
tar -xzf jetbrains-toolbox-*.tar.gz

# Entra na pasta e executa
cd jetbrains-toolbox-*/
./jetbrains-toolbox
```

## 2.17 📱 Android Studio

### Opção Flatpak:

```bash
flatpak install flathub com.google.AndroidStudio -y
```

Na primeira inicialização, instale:
- Android SDK
- Android SDK Command-line Tools
- Android Emulator
- Android SDK Platform Tools

## 2.18 🔧 Git + SSH + GitHub

### Criar/configurar uma chave SSH

```bash
# Verifica se já existem chaves
ls -la ~/.ssh

# Cria uma nova chave SSH
ssh-keygen -t ed25519 -C "SEU_EMAIL_REAL"

# Inicia o agente SSH
eval "$(ssh-agent -s)"

# Adiciona a chave ao agente
ssh-add ~/.ssh/id_ed25519

# Exibe a chave pública para copiar
cat ~/.ssh/id_ed25519.pub
```

No GitHub:
1. Acesse **Settings → SSH and GPG keys → New SSH key**.
2. Em **Title**, dê um nome para o computador (ex: `Fedora-Laptop`).
3. Em **Key type**, marque `Authentication Key`.
4. Cole o conteúdo de `~/.ssh/id_ed25519.pub`.
5. Clique em **Add SSH key**.

### Testar a conexão

```bash
ssh -T git@github.com
```

### Configurar identidade global do Git

```bash
git config --global user.name "SEU NOME"
git config --global user.email "SEU_EMAIL_REAL"

# Verifica a configuração
git config --global --list
```

### Configurar repositório para SSH

```bash
cd CAMINHO/DO/SEU/REPOSITORIO
git remote set-url origin git@github.com:USUARIO/REPOSITORIO.git
git remote -v
```

---

# 3. 🐚 Instalação e configuração do ZSH

## 3.1 Instalar ZSH

```bash
# Instala o ZSH
sudo dnf install zsh -y

# Verifica a versão
zsh --version

# Define o ZSH como shell padrão
chsh -s $(which zsh)
```

> Encerre a sessão e faça login novamente para ativar o ZSH.

## 3.2 Instalar Curl e Git

```bash
sudo dnf install curl git -y
```

## 3.3 Instalar Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 3.4 Instalar plugins

```bash
# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## 3.5 Instalar Zinit

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

## 3.6 Instalar Starship Prompt

```bash
curl -sS https://starship.rs/install.sh | sh
starship --version
```

## 3.7 Configurar o `~/.zshrc`

Edite o arquivo:

```bash
nano ~/.zshrc
```

Adicione ao final:

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

Recarrega as configurações:

```bash
source ~/.zshrc
```

## 3.8 🔤 Nerd Font (JetBrains Mono)

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
```

Configure o emulador de terminal com a fonte `JetBrainsMono Nerd Font`.

## 3.9 ⭐ Configurar o Starship

Crie e edite o arquivo `~/.config/starship.toml`:

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

Este guia fornece uma base atualizada e robusta para o ambiente **Fedora Linux**, alinhada com as melhores práticas para desenvolvimento de software no ecossistema Red Hat.

---

# 4. 🎨 Guia Completo — GRUB + Tema Vimix (Fedora Linux)

> **Ambiente de Referência:** Fedora Linux / RHEL e derivados.

> [!WARNING]
> **Aviso Importante & Gestão de Risco:**
> Esta seção de customização do GRUB e instalação do tema Vimix **não é estritamente necessária** para o funcionamento do sistema operacional ou para a configuração do ambiente de desenvolvimento. Trata-se de uma alteração estética e de organização avançada do bootloader.
> 
> **Riscos envolvidos:**
> - **Incapacidade de Inicialização (*Boot Loop* / Tela Preta):** Editar scripts em `/etc/grub.d/` (como o `10_linux`) ou alterar parâmetros como `GRUB_GFXMODE` pode impedir o carregamento do menu gráfico ou do próprio kernel.
> - **Perda de Opções de Recuperação (*Recovery Mode*):** A remoção de submenus de kernels adicionais e do *Recovery Mode* elimina as vias padrão de contingência do sistema caso ocorra uma falha após atualização de drivers de vídeo ou do kernel.
> - **Acesso Restrito ao Firmware:** Desabilitar a entrada `30_uefi-firmware` remove o atalho para as configurações de BIOS/UEFI diretamente pelo menu do GRUB.
> - **Remoção Incorreta de Kernels:** Remover pacotes de kernel ativos via DNF sem verificar a versão em uso (`uname -r`) pode deixar o sistema inoperante.
> 
> 💡 **Recomendação:** Crie o backup recomendado (Passo 1), execute todas as verificações antes do *reboot* e tenha um pendrive de boot (*Live USB*) à mão para eventuais recuperações via `chroot`.

---

### 1. Criar backup do GRUB

```bash
mkdir -p ~/backup-grub

sudo cp -a /etc/default/grub ~/backup-grub/grub
sudo cp -a /boot/grub2/grub.cfg ~/backup-grub/grub.cfg 2>/dev/null || sudo cp -a /boot/efi/EFI/fedora/grub.cfg ~/backup-grub/grub.cfg
sudo cp -a /etc/grub.d ~/backup-grub/grub.d
```

### 2. Verificar o backup

```bash
ls -lah ~/backup-grub
```

### 3. Atualizar o GRUB antes da instalação do tema

```bash
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

### 4. Verificar se o Windows está sendo detectado

```bash
sudo grep -i "windows" /boot/grub2/grub.cfg
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
sudo dnf install -y imagemagick
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

```bash
sudo chmod -x /etc/grub.d/10_linux.vimix-backup
```

### 16. Confirmar as permissões dos scripts

```bash
ls -l /etc/grub.d/10_linux*
```

### 17. Editar o `10_linux`

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

```bash
sudo chmod -x /etc/grub.d/30_uefi-firmware
```

### 22. Confirmar permissões do UEFI Firmware Settings

```bash
ls -l /etc/grub.d/30_uefi-firmware
```

### 23. Verificar os parâmetros finais do GRUB

```bash
grep -E '^(GRUB_DEFAULT|GRUB_TIMEOUT_STYLE|GRUB_TIMEOUT|GRUB_DISABLE_MEMTEST|GRUB_THEME|GRUB_GFXMODE|GRUB_CMDLINE_LINUX_DEFAULT|GRUB_CMDLINE_LINUX)=' /etc/default/grub
```

### 24. Verificar o kernel atual

```bash
uname -r
```

### 25. Verificar os kernels instalados (DNF / RPM)

```bash
rpm -qa | grep -E 'kernel-core|kernel-modules'
```

### 26. Remover kernels antigos (se necessário)

```bash
sudo dnf remove kernel-core-VERSION kernel-modules-VERSION
```

### 27. Limpar dependências desnecessárias

```bash
sudo dnf autoremove -y
```

### 28. Confirmar imagens no `/boot`

```bash
ls -lah /boot | grep -E 'vmlinuz|initramfs'
```

### 29. Gerar a configuração final do GRUB (Fedora)

```bash
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

### 30. Verificar as entradas do menu

```bash
sudo grep -E "^(menuentry|submenu)" /boot/grub2/grub.cfg
```

### 31. Confirmar remoção de submenus e recovery

```bash
sudo grep -F "recovery" /boot/grub2/grub.cfg
```

### 32. Confirmar ativação do Tema Vimix

```bash
grep -F 'GRUB_THEME="/usr/share/grub/themes/vimix/theme.txt"' /etc/default/grub
```

### 33. Resultado Final Esperado

O menu do GRUB apresentará layout limpo com o tema Vimix e entradas essenciais do sistema.

### 34. Reiniciar o sistema
> ⚠️ **Executar somente depois de todas as verificações acima.**

```bash
sudo reboot
```

