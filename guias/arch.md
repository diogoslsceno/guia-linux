# 🏹 GuiaLinuxArch

> Guia pessoal de comandos e configurações para **Arch Linux** e suas distribuições derivadas (ex: EndeavourOS, Manjaro, Garuda Linux).
>
> ⚠️ **Atenção:** o Arch Linux é uma distribuição *rolling-release*. Sempre execute uma atualização completa do sistema antes de instalar novos pacotes e leia os avisos oficiais do Arch Linux ao atualizar.

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

## 1.7 📦 Gerenciamento de pacotes com Pacman & AUR (Yay)

No Arch Linux, o gerenciador oficial de pacotes é o **Pacman**. Para pacotes comunitários no **AUR (Arch User Repository)**, utiliza-se um helper como o **Yay** ou **Paru**.

```bash
# Atualiza os repositórios e todo o sistema (Rolling Release)
sudo pacman -Syu

# Instala um pacote dos repositórios oficiais
sudo pacman -S nome-do-pacote

# Remove um pacote e suas dependências não utilizadas
sudo pacman -Rns nome-do-pacote

# Pesquisa um pacote nos repositórios oficiais
pacman -Ss nome-do-pacote

# Mostra informações detalhadas de um pacote
pacman -Si nome-do-pacote

# Lista pacotes instalados explicitamente
pacman -Qe

# Remove pacotes órfãos (dependências não utilizadas por nenhum app)
sudo pacman -Rns $(pacman -Qtdq)

# Limpa a cache de pacotes antigos do pacman
sudo pacman -Sc
```

### 📦 Instalando e configurando o Helper AUR (Yay)

```bash
# Instala dependências de compilação
sudo pacman -S --needed base-devel git -y

# Clona o repositório do yay
cd ~/Downloads
git clone https://aur.archlinux.org/yay.git

# Compila e instala o yay
cd yay
makepkg -si

# Verifica a instalação
yay --version

# Atualiza todo o sistema + AUR
yay -Syu
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

# Verifica a configuração
gsettings get org.gnome.mutter dynamic-workspaces
gsettings get org.gnome.desktop.wm.preferences num-workspaces
```

---

# 2. 📦 Instalação de aplicativos e ferramentas

## 2.1 🧰 Dependências básicas

```bash
sudo pacman -S --needed \
curl \
wget \
git \
base-devel \
ca-certificates \
gnupg \
tar \
unzip \
python
```

## 2.2 🌳 Tree

```bash
sudo pacman -S tree --noconfirm
```

## 2.3 🖥️ Ferramentas do sistema

```bash
# Personalização do GNOME
sudo pacman -S gnome-tweaks --noconfirm

# Integração de extensões do GNOME com navegador
sudo pacman -S gnome-browser-connector --noconfirm

# Gerenciador de extensões do GNOME
sudo pacman -S extension-manager --noconfirm

# Informações do sistema
sudo pacman -S fastfetch --noconfirm

# Backup do sistema
sudo pacman -S timeshift --noconfirm

# Efeito Matrix no terminal
sudo pacman -S cmatrix --noconfirm

# Visualizador de áudio
sudo pacman -S cava --noconfirm

# Monitoramento de processos
sudo pacman -S htop --noconfirm

# Gerenciador de partições
sudo pacman -S gparted --noconfirm
```

## 2.4 🟢 Node.js e npm

```bash
# Instala Node.js e npm dos repositórios oficiais do Arch
sudo pacman -S nodejs npm --noconfirm

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

### Opção 1: Code - OSS (Repositório Oficial Arch)

```bash
sudo pacman -S code --noconfirm
```

### Opção 2: Visual Studio Code Oficial (Proprietário via AUR)

```bash
# Instala o binário oficial da Microsoft via yay
yay -S visual-studio-code-bin --noconfirm

# Verifica a instalação
code --version
```

## 2.7 🔀 Meld e Sublime Merge

```bash
# Meld (Oficial)
sudo pacman -S meld --noconfirm

# Sublime Merge (via AUR)
yay -S sublime-merge --noconfirm
```

## 2.8 🐳 Docker e Docker Compose

```bash
# Instala Docker e Docker Compose dos repositórios oficiais
sudo pacman -S docker docker-compose --noconfirm

# Inicia e habilita o serviço do Docker no inicializador do sistema
sudo systemctl enable --now docker.service

# Verifica a versão
docker --version
docker compose version

# Testa a execução do Docker
sudo docker run hello-world

# Permite executar Docker sem necessidade de sudo
sudo usermod -aG docker $USER
```

> Após adicionar seu usuário ao grupo `docker`, encerre a sessão do usuário ou rode `newgrp docker` para aplicar o grupo.

## 2.9 💬 Discord

No Arch Linux, o Discord está disponível diretamente no repositório oficial.

```bash
# Instala o Discord oficial
sudo pacman -S discord --noconfirm

# Verifica a instalação
discord --version
```

## 2.10 ☕ Java / OpenJDK

No Arch Linux, o Java é gerenciado facilmente via `archlinux-java`.

```bash
# Instala o OpenJDK 21 LTS (ou jdk-openjdk para a versão mais recente)
sudo pacman -S jdk21-openjdk --noconfirm

# Verifica todas as versões de Java instaladas no sistema
archlinux-java status

# Define o Java 21 como a versão padrão do sistema
sudo archlinux-java set java-21-openjdk

# Verifica o runtime e o compilador
java --version
javac --version
```

## 2.11 🐍 Anaconda

```bash
# Atualiza o sistema
sudo pacman -Syu

# Baixa o instalador do Anaconda
cd ~/Downloads
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh -O Anaconda3-latest.sh

# Executa o instalador
bash Anaconda3-latest.sh

# Inicializa o Conda para ZSH
~/anaconda3/bin/conda init zsh

# Aplica as alterações no terminal
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

```bash
# Instala o Flatpak
sudo pacman -S flatpak --noconfirm

# Adiciona o repositório Flathub
sudo flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo

# Verifica os repositórios ativados
flatpak remotes
```

### Apps Flatpak (Opcional)

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
```

## 2.13 🧰 JetBrains Toolbox

No Arch Linux, você pode instalar o JetBrains Toolbox diretamente via AUR ou pelo site oficial.

### Opção 1: Via AUR (Yay)

```bash
yay -S jetbrains-toolbox --noconfirm
```

### Opção 2: Download Oficial

```bash
cd ~/Downloads

# Baixa o JetBrains Toolbox
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.8.0.51918.tar.gz

# Extrai o arquivo
tar -xzf jetbrains-toolbox-*.tar.gz

# Entra no diretório e executa
cd jetbrains-toolbox-*/
./jetbrains-toolbox
```

Pelo Toolbox, você pode instalar e gerenciar com facilidade:
- IntelliJ IDEA Community
- PyCharm Community
- CLion
- PhpStorm

## 2.14 📱 Android Studio

### Opção 1: Via AUR (Recomendado no Arch)

```bash
yay -S android-studio --noconfirm
```

### Opção 2: Download Oficial Tarball

```bash
cd ~/Downloads

# Baixa a versão oficial
wget -O android-studio.tar.gz \
https://redirector.gvt1.com/edgedl/android/studio/install/current/android-studio-*.tar.gz

# Cria a pasta de instalação
sudo mkdir -p /opt/android-studio

# Extrai em /opt
sudo tar -xzf android-studio.tar.gz -C /opt/android-studio --strip-components=1

# Cria o link simbólico global
sudo ln -sf /opt/android-studio/bin/studio /usr/local/bin/android-studio

# Executa
android-studio
```

Na primeira inicialização, certifique-se de marcar e instalar:
- Android SDK
- Android SDK Command-line Tools
- Android Emulator
- Android SDK Platform Tools

## 2.15 🎥 OBS Studio

```bash
# Instala o OBS Studio dos repositórios oficiais do Arch
sudo pacman -S obs-studio --noconfirm

# Verifica a versão
obs --version
```

## 2.16 🧲 qBittorrent

### Opção 1: Via repositórios oficiais (Pacman)

```bash
# Instala o qBittorrent oficial dos repositórios do Arch
sudo pacman -S qbittorrent --noconfirm

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

## 2.17 🛠️ GRUB Customizer

> ⚠️ O GRUB Customizer altera a configuração do bootloader. No Arch Linux, recomenda-se cautela pois atualizações do GRUB podem conflitar com customizações manuais.

```bash
# Instala via AUR
yay -S grub-customizer --noconfirm

# Executa
grub-customizer
```

## 2.18 🔧 Git + SSH + GitHub

### Criar/configurar uma chave SSH

```bash
# Verifica se já existem chaves
ls -la ~/.ssh

# Cria uma nova chave SSH ed25519
ssh-keygen -t ed25519 -C "SEU_EMAIL_REAL"

# Inicia o SSH Agent
eval "$(ssh-agent -s)"

# Adiciona a chave ao agente
ssh-add ~/.ssh/id_ed25519

# Exibe a chave pública para copiar
cat ~/.ssh/id_ed25519.pub
```

No GitHub:
1. Acesse **Settings → SSH and GPG keys → New SSH key**.
2. Em **Title**, dê um nome para o computador (ex: `Arch-Desktop`).
3. Em **Key type**, marque `Authentication Key`.
4. Cole a chave pública exata exibida pelo comando `cat ~/.ssh/id_ed25519.pub`.
5. Salve em **Add SSH key**.

### Testar a conexão com o GitHub

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

---

# 3. 🐚 Instalação e configuração do ZSH

## 3.1 Instalar ZSH

```bash
# Instala ZSH e zsh-completions
sudo pacman -S zsh zsh-completions --noconfirm

# Verifica a versão instalada
zsh --version

# Define o ZSH como shell padrão do usuário
chsh -s $(which zsh)
```

> Faça logout e login novamente para aplicar a alteração do shell padrão.

## 3.2 Instalar Curl e Git

```bash
sudo pacman -S curl git --noconfirm
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
# Instala o Starship
curl -sS https://starship.rs/install.sh | sh

# Verifica a versão
starship --version
```

## 3.7 Configurar o `~/.zshrc`

Edite o arquivo `~/.zshrc`:

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

No Arch Linux, você pode instalar as Nerd Fonts via Pacman ou manualmente.

### Opção via Pacman:

```bash
sudo pacman -S ttf-jetbrains-mono-nerd --noconfirm
```

### Opção manual:

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
```

Após instalar, configure o seu emulador de terminal para usar a fonte `JetBrainsMono Nerd Font`.

## 3.9 ⭐ Configurar o Starship

Crie o arquivo de configuração do Starship:

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

Este guia fornece todo o ecossistema necessário para uma instalação moderna, limpa e produtiva no **Arch Linux**. Aproveite a flexibilidade do Pacman e do AUR para gerenciar seu ambiente de desenvolvimento.

> 💡 **Dica:** Sempre consulte a página principal da [ArchWiki](https://wiki.archlinux.org/) para detalhes avançados de hardware ou personalização do sistema.

---

# 4. 🎨 Guia Completo — GRUB + Tema Vimix (Arch Linux)

> **Ambiente de Referência:** Arch Linux / EndeavourOS / Manjaro e derivados.

> [!WARNING]
> **Aviso Importante & Gestão de Risco:**
> Esta seção de customização do GRUB e instalação do tema Vimix **não é estritamente necessária** para o funcionamento do sistema operacional ou para a configuração do ambiente de desenvolvimento. Trata-se de uma alteração estética e de organização avançada do bootloader.
> 
> **Riscos envolvidos:**
> - **Incapacidade de Inicialização (*Boot Loop* / Tela Preta):** Editar scripts em `/etc/grub.d/` (como o `10_linux`) ou alterar parâmetros como `GRUB_GFXMODE` pode impedir o carregamento do menu gráfico ou do próprio kernel.
> - **Perda de Opções de Recuperação (*Recovery Mode* / Fallback):** A remoção de submenus de kernels adicionais e entradas *fallback* elimina as vias padrão de contingência do sistema caso ocorra uma falha após atualização de drivers ou de versão do kernel (*rolling release*).
> - **Acesso Restrito ao Firmware:** Desabilitar a entrada `30_uefi-firmware` remove o atalho para as configurações de BIOS/UEFI diretamente pelo menu do GRUB.
> - **Remoção Incorreta de Kernels:** Apagar pacotes de kernel ativos via Pacman sem verificar a versão em uso (`uname -r`) pode deixar o sistema sem imagem de boot.
> 
> 💡 **Recomendação:** Crie o backup recomendado (Passo 1), execute todas as verificações antes do *reboot* e tenha um pendrive de boot (*Live USB*) à mão para eventuais recuperações via `arch-chroot`.

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
sudo grub-mkconfig -o /boot/grub/grub.cfg
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
sudo pacman -S --noconfirm imagemagick
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

### 25. Verificar os kernels instalados (Pacman)

```bash
pacman -Q | grep -E 'linux'
```

### 26. Remover kernels antigos ou não utilizados (Pacman)

```bash
sudo pacman -Rns linux-lts # (exemplo, se aplicável)
```

### 27. Limpar pacotes órfãos desnecessários

```bash
sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null || true
```

### 28. Confirmar imagens no `/boot`

```bash
ls -lah /boot | grep -E 'vmlinuz|initramfs'
```

### 29. Gerar a configuração final do GRUB (Arch)

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### 30. Verificar as entradas do menu

```bash
sudo grep -E "^(menuentry|submenu)" /boot/grub/grub.cfg
```

### 31. Confirmar remoção de submenus e recovery

```bash
sudo grep -F "fallback" /boot/grub/grub.cfg
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

