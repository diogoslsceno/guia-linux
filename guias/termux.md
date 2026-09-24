# 📱 GuiaLinuxTermux

> Guia pessoal de comandos e configurações para **Termux**, ambiente de terminal e ecossistema Linux no Android.
>
> ⚠️ **Atenção:** 
> - **Fonte de Instalação:** Instale o Termux e seus plugins exclusivamente via **F-Droid** ou **GitHub Releases**. A versão disponível na Google Play Store foi descontinuada e não recebe mais atualizações de repositórios.
> - **Arquitetura & libc:** O Termux roda nativamente sobre a biblioteca C do Android (**Bionic libc**) e sua árvore de arquivos fica confinada no prefixo `$PREFIX` (`/data/data/com.termux/files/usr`). Ele não possui o padrão FHS tradicional de distribuições desktop (não há `/bin`, `/lib` ou `/usr` na raiz do sistema sem PRoot/chroot).
> - **Otimização de Bateria:** Para evitar que o sistema Android encerre sessões e serviços em background, desative a otimização de bateria nas configurações do dispositivo para o Termux.

---

# 1. 💻 Comandos úteis do terminal Termux

## 1.1 📍 Navegação e diretórios

| Comando | Função |
|---|---|
| `pwd` | Mostra o caminho completo do diretório atual. |
| `ls` | Lista arquivos e pastas do diretório atual. |
| `ls -la` | Lista todos os arquivos, incluindo ocultos, com detalhes e permissões. |
| `cd nome-da-pasta` | Entra em uma pasta específica. |
| `cd ..` | Volta para o diretório anterior. |
| `cd ~` | Vai para o diretório home do Termux (`$HOME`). |
| `cd $PREFIX` | Acessa a raiz dos binários e configurações instaladas no Termux. |
| `mkdir nome-da-pasta` | Cria uma nova pasta. |
| `mkdir -p caminho/completo` | Cria múltiplas pastas encadeadas caso não existam. |
| `touch arquivo.txt` | Cria um arquivo vazio ou atualiza timestamp. |
| `tree` | Mostra a estrutura de diretórios em formato de árvore. Requer instalação. |

## 1.2 📁 Copiar, mover e renomear

| Comando | Função |
|---|---|
| `mv antigo novo` | Renomeia arquivo ou pasta. |
| `mv arquivo destino/` | Move arquivo ou pasta para outro diretório. |
| `cp arquivo destino/` | Copia um arquivo para outro diretório. |
| `cp -r pasta destino/` | Copia uma pasta e todo o seu conteúdo recursivamente. |

## 1.3 🗑️ Excluir arquivos e pastas

> ⚠️ Cuidado com `rm -rf`: a exclusão é imediata e irreversível.

| Comando | Função |
|---|---|
| `rm arquivo.txt` | Remove um arquivo. |
| `rm -r pasta` | Remove uma pasta e seu conteúdo. |
| `rm -rf pasta` | Força a remoção de uma pasta e todo o conteúdo sem confirmação. |
| `rmdir pasta` | Remove uma pasta vazia. |

## 1.4 📄 Visualização e edição

| Comando | Função |
|---|---|
| `cat arquivo.txt` | Exibe o conteúdo de um arquivo no terminal. |
| `less arquivo.txt` | Visualiza arquivos longos com paginação interativa. |
| `nano arquivo.txt` | Editor de texto amigável em terminal. |
| `micro arquivo.txt` | Editor de texto moderno de terminal com suporte a mouse e atalhos comuns. |
| `termux-open arquivo.pdf` | Abre o arquivo no aplicativo padrão correspondente do Android. |
| `termux-open --view url` | Abre uma URL no navegador padrão do Android. |

## 1.5 🔧 Permissões e particularidades de armazenamento

No Termux, o usuário padrão gerencia seu próprio diretório `$HOME` sem necessidade de `sudo`.

```bash
# Adiciona permissão de execução a um script
chmod +x script.sh

# Permissões de leitura e escrita padrão
chmod 644 arquivo.txt
chmod 755 pasta/
```

> 💡 **Nota sobre `/sdcard` e Armazenamento Compartilhado:**
> Os diretórios do cartão SD / armazenamento interno compartilhado do Android (`/sdcard` ou `~/storage/shared`) utilizam emulação FAT/fuse gerenciada pelo Android. Neles, permissões de execução POSIX (`chmod +x`) e links simbólicos podem não funcionar. Sempre clone seus repositórios e compile projetos dentro de `$HOME` (`~`).

## 1.6 📱 Atalhos de terminal e controle no Termux

O Termux possui combinações especiais utilizando os botões físicos de volume do smartphone para simular teclas ausentes no teclado touch:

| Combinação | Efeito |
|---|---|
| `Volume Down + C` | Envia sinal `Ctrl + C` (interrompe o processo atual). |
| `Volume Down + D` | Envia sinal `Ctrl + D` (EOF / fecha sessão). |
| `Volume Down + Z` | Envia sinal `Ctrl + Z` (suspende processo para background). |
| `Volume Down + L` | Envia `Ctrl + L` (limpa a tela do terminal). |
| `Volume Down + A` | Move o cursor para o início da linha (`Ctrl + A`). |
| `Volume Down + E` | Move o cursor para o fim da linha (`Ctrl + E`). |
| `Volume Up + Q` | Mostra ou oculta a barra de teclas extras virtuais. |
| `Volume Up + W` | Move o cursor para cima (`Up Arrow`). |
| `Volume Up + S` | Move o cursor para baixo (`Down Arrow`). |
| `Volume Up + A` | Move o cursor para a esquerda (`Left Arrow`). |
| `Volume Up + D` | Move o cursor para a direita (`Right Arrow`). |
| `Volume Up + T` | Simula a tecla `Tab` (autocompletar). |

### 🛠️ Comandos de controle da sessão

```bash
# Limpa o buffer da tela
clear

# Mostra o histórico de comandos digitados
history

# Recarrega as configurações do ZSH
source ~/.zshrc

# Recarrega configurações visuais e propriedades do Termux
termux-reload-settings

# Encerra a sessão do terminal
exit
```

## 1.7 📦 Gerenciamento de pacotes com PKG e APT

No Termux, o utilitário recomendado é o **`pkg`**, que funciona como um invólucro (*wrapper*) inteligente e otimizado sobre o `apt`.

```bash
# Atualiza os índices de repositórios e todos os pacotes instalados
pkg update && pkg upgrade -y

# Alternativa direta com APT
apt update && apt full-upgrade -y

# Instala um pacote
pkg install nome-do-pacote -y

# Remove um pacote
pkg uninstall nome-do-pacote

# Remove pacotes e dependências órfãs
apt autoremove -y

# Procura um pacote nos repositórios
pkg search nome-do-pacote

# Exibe informações detalhadas de um pacote
pkg show nome-do-pacote

# Lista todos os pacotes instalados
pkg list-installed

# Limpa o cache de pacotes baixados
pkg clean
```

### 🌐 Alterar espelho de repositório (Mirror Selector)

Caso sinta lentidão nos downloads ou erros de conexão com os repositórios oficiais:

```bash
# Abre menu interativo para escolher o mirror mais rápido
termux-change-repo
```

### 🗃️ Habilitar repositórios complementares

O ecossistema Termux disponibiliza repositórios adicionais mantidos pela comunidade:

```bash
# Repositório com ferramentas de ambiente gráfico X11
pkg install x11-repo -y

# Repositório de utilitários para dispositivos com root
pkg install root-repo -y

# Termux User Repository (TUR) - Pacotes comunitários extras
pkg install tur-repo -y
```

## 1.8 📂 Acesso ao armazenamento do dispositivo (Android Storage)

Para permitir que o Termux acesse as pastas compartilhadas do celular (Downloads, Documentos, Fotos, etc.):

```bash
# Solicita permissão de armazenamento ao Android
termux-setup-storage
```

Após conceder a permissão no pop-up do Android, o diretório `~/storage` será criado com atalhos simbólicos:
- `~/storage/shared`: Raiz do armazenamento interno.
- `~/storage/downloads`: Pasta Downloads do celular.
- `~/storage/dcim`: Fotos e câmera.
- `~/storage/pictures`: Imagens do sistema.
- `~/storage/music`: Músicas.
- `~/storage/external-1`: Cartão MicroSD externo (se houver).

---

# 2. 📦 Instalação de aplicativos e ferramentas

## 2.1 🧰 Dependências básicas

Pacotes fundamentais para downloads, certificados, manipulação de arquivos e compilações:

```bash
pkg update && pkg install -y \
curl \
wget \
git \
ca-certificates \
gnupg \
tar \
unzip \
zip \
jq \
build-essential \
clang \
make
```

## 2.2 🌳 Tree

```bash
pkg install tree -y
```

## 2.3 🖥️ Ferramentas CLI do sistema

```bash
# Informações detalhadas do sistema e hardware
pkg install fastfetch -y

# Monitor interativo de processos
pkg install htop -y

# Multiplexador de terminal (essencial para dividir tela e manter sessões ativas)
pkg install tmux -y

# Analisador interativo de uso de disco
pkg install ncdu -y

# Editor moderno de terminal
pkg install micro -y

# Efeito Matrix no terminal
pkg install cmatrix -y

# Ferramentas nativas do Termux
pkg install termux-tools -y
```

## 2.4 🟢 Node.js e npm

```bash
# Instala o Node.js versão LTS (recomendada)
pkg install nodejs-lts -y

# Caso prefira a versão Current mais recente:
# pkg install nodejs -y

# Verifica as versões instaladas
node -v
npm -v
```

> 💡 **Nota de Configuração de Binários Globais do NPM:**
> No Termux, pacotes globais do npm são instalados diretamente no `$PREFIX/bin`, ficando imediatamente disponíveis no terminal sem necessidade de `sudo`.

## 2.5 🤖 Gemini CLI, Gtop e Antigravity

```bash
# Monitor de recursos em Node.js
npm install -g gtop

# Google Gemini CLI global
npm install -g @google/gemini-cli

# Antigravity CLI
curl -fsSL https://antigravity.google/cli/install.sh | bash

# Garante a inclusão dos diretórios locais no PATH
echo 'export PATH="$HOME/.local/bin:$PREFIX/bin:$PATH"' >> ~/.zshrc

# Aplica as alterações
source ~/.zshrc

# Verificação das ferramentas
node -v
npm -v
gemini --version
agy --version
```

## 2.6 🧑‍💻 Visual Studio Code no Termux (`code-server`)

Como o VS Code tradicional é um aplicativo desktop (Electron), a forma mais estável e produtiva de programar com VS Code nativamente no celular ou tablet é utilizando o **`code-server`** (VS Code rodando em backend no Termux e acessado via navegador web).

### Opção 1: Instalação via TUR (Termux User Repository) — Recomendado

```bash
# Ativa o repositório TUR
pkg install tur-repo -y

# Instala o code-server compilado nativamente para Termux
pkg install code-server -y
```

### Opção 2: Instalação via npm

```bash
# Instala dependências de compilação
pkg install python make clang nodejs-lts -y

# Instala o code-server globalmente
npm install -g code-server --unsafe-perm
```

### Executar e acessar o VS Code

```bash
# Inicia o code-server sem autenticação para uso local no celular
code-server --auth none --bind-addr 127.0.0.1:8080
```

Abra o navegador do Android (Chrome, Firefox, Brave) e acesse:
```text
http://localhost:8080
```

> 💡 **Dica de Produtividade:** No navegador do Android, toque no menu de 3 pontos e escolha **"Adicionar à tela inicial"** para transformar o VS Code em um Web App (PWA) em tela cheia com suporte a teclado físico e mouse.

## 2.7 🔧 Git + SSH + GitHub

### Criar e configurar chave SSH no dispositivo

```bash
# Cria o diretório .ssh com as permissões corretas
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Remove chaves antigas se necessário
rm -f ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub

# Gera uma nova chave Ed25519 (substitua pelo seu e-mail do GitHub)
ssh-keygen -t ed25519 -C "SEU_EMAIL_REAL"

# Inicia o SSH Agent
eval "$(ssh-agent -s)"

# Adiciona a chave ao agente
ssh-add ~/.ssh/id_ed25519

# Exibe a chave pública para copiar
cat ~/.ssh/id_ed25519.pub
```

### Adicionar chave no GitHub:
1. Acesse **GitHub → Settings → SSH and GPG keys → New SSH key**.
2. No campo **Title**, identifique o aparelho (ex: `Galaxy-Termux` ou `Xiaomi-Termux`).
3. Em **Key type**, selecione `Authentication Key`.
4. Cole o conteúdo exibido pelo comando `cat ~/.ssh/id_ed25519.pub`.
5. Clique em **Add SSH key**.

### Testar a conexão:

```bash
ssh -T git@github.com
```

Resultado esperado:
```text
Hi SEU_USUARIO! You've successfully authenticated,
but GitHub does not provide shell access.
```

### Configurar identidade do Git:

```bash
git config --global user.name "SEU NOME"
git config --global user.email "SEU_EMAIL_REAL"
git config --global init.defaultBranch main

# Verifica a configuração
git config --global --list
```

### Fluxo de trabalho com repositórios:

```bash
# Clone um projeto via SSH
git clone git@github.com:USUARIO/REPOSITORIO.git

# Acesso ao diretório
cd REPOSITORIO

# Status, add, commit e push
git status
git add .
git commit -m "feat: implementa nova funcionalidade via Termux"
git push
```

## 2.8 🐍 Python & Ambientes Virtuais

```bash
# Instala Python 3, pip e ferramentas de compilação de wheels
pkg install python python-pip -y

# Instala suporte para compilação de pacotes científicos/C
pkg install libxml2 libxslt libffi -y

# Verifica versões
python --version
pip --version

# Cria um ambiente virtual isolado
python -m venv ~/meu-env

# Ativa o ambiente virtual
source ~/meu-env/bin/activate

# Desativa o ambiente
deactivate
```

## 2.9 ☕ Java / OpenJDK & Outras Linguagens

```bash
# Instala o OpenJDK no Termux
pkg install openjdk-17 -y

# Verifica as versões do Java
java -version
javac -version

# Rust
pkg install rust -y
rustc --version
cargo --version

# Golang
pkg install golang -y
go version
```

## 2.10 🐧 PRoot Distro (Linux Completo sem Root)

O `proot-distro` é uma ferramenta oficial que permite executar sistemas operacionais Linux completos (como Debian, Ubuntu, Arch Linux, Alpine, Fedora) isolados dentro do Termux sem necessidade de desbloqueio de bootloader ou root.

```bash
# Instala o proot-distro
pkg install proot-distro -y

# Lista as distribuições disponíveis para instalação
proot-distro list

# Instala o Debian (ou ubuntu, archlinux, etc.)
proot-distro install debian

# Entra na distribuição instalada
proot-distro login debian
```

Dentro da distribuição PRoot, você tem um ambiente Linux com padrão FHS (`/usr`, `/etc`, `/bin`), permitindo rodar `apt`, compilar pacotes glibc padrão e isolar dependências complexas. Para sair de volta ao Termux, basta digitar `exit`.

## 2.11 📱 Termux:API (Integração com Hardware Android)

O pacote `termux-api` permite controlar o hardware do smartphone por meio de scripts e comandos no terminal (requer a instalação do app companheiro **Termux:API** via F-Droid).

```bash
# Instala as ferramentas de linha de comando da API
pkg install termux-api -y
```

### Exemplos práticos de uso da API:

```bash
# Mostra o status detalhado da bateria (formato JSON)
termux-battery-status

# Lê o conteúdo da área de transferência do Android
termux-clipboard-get

# Copia um texto para a área de transferência
termux-clipboard-set "Texto copiado direto do terminal!"

# Emite uma notificação nativa no Android
termux-notification --title "Termux Alerta" --content "Script finalizado com sucesso!"

# Exibe uma mensagem flutuante (Toast)
termux-toast "Compilação concluída!"

# Vibra o smartphone por 500 milissegundos
termux-vibrate -d 500

# Liga/desliga a lanterna do celular
termux-torch on
termux-torch off

# Informações da conexão Wi-Fi atual
termux-wifi-connectioninfo
```

---

# 3. 🐚 Instalação e configuração do ZSH

## 3.1 Instalar ZSH

```bash
# Instala o interpretador ZSH
pkg install zsh -y

# Verifica a versão instalada
zsh --version

# Define o ZSH como shell padrão do Termux
chsh -s zsh
```

## 3.2 Instalar Curl e Git

```bash
pkg install curl git -y

curl --version
git --version
```

## 3.3 Instalar Oh My Zsh

```bash
# Instala o Oh My Zsh sem intervenção interativa imediata
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Abre o arquivo de configuração para edição
nano ~/.zshrc

# Recarrega as configurações
source ~/.zshrc
```

## 3.4 Instalar plugins do ZSH

```bash
# Destaque de sintaxe (zsh-syntax-highlighting)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Sugestões automáticas baseadas no histórico (zsh-autosuggestions)
git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## 3.5 Instalar Zinit

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

## 3.6 Instalar Starship Prompt

No Termux, o Starship pode ser instalado diretamente via pacote oficial do repositório:

```bash
# Instalação nativa via pkg
pkg install starship -y

# Verifica a instalação
starship --version
```

## 3.7 Configurar o `~/.zshrc`

Edite seu arquivo `~/.zshrc`:

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

### Starship Prompt

eval "$(starship init zsh)"

### Variáveis e Caminhos do Termux

export PATH="$HOME/.local/bin:$PREFIX/bin:$PATH"
export EDITOR="nano"
```

Salve no Nano: `Ctrl + O` (ou `Volume Down + O`) → `Enter` → `Ctrl + X` (ou `Volume Down + X`).

Recarregue as configurações:

```bash
source ~/.zshrc
```

## 3.8 🔤 Nerd Font e Estética no Termux

No Termux, as fontes personalizadas e paletas de cores devem ser salvas no diretório `~/.termux/`. O arquivo de fonte deve obrigatoriamente se chamar `font.ttf`.

```bash
# Cria o diretório de configurações do Termux
mkdir -p ~/.termux

# Baixa a JetBrains Mono Nerd Font diretamente
curl -fLo ~/.termux/font.ttf \
https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

# Como o download do release contém o zip completo, extraímos especificamente o TTF:
cd ~/.termux
pkg install unzip -y
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -O jb.zip
unzip -o jb.zip "JetBrainsMonoNerdFont-Regular.ttf"
mv "JetBrainsMonoNerdFont-Regular.ttf" font.ttf
rm -f jb.zip

# Aplica as novas fontes e configurações na tela instantaneamente
termux-reload-settings
```

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

# 4. ⚙️ Customização avançada do Termux e Acesso Remoto

Como o Termux opera sobre o kernel do Android, não há inicializador GRUB a ser modificado. No ecossistema móvel, o controle de baixo nível e a alta produtividade concentram-se na personalização da **Barra de Teclas Extras**, na **Prevenção de Suspensão de Processos** e no **Servidor OpenSSH** (que possibilita controlar e programar no celular diretamente pelo teclado e tela do computador).

## 4.1 ⌨️ Configurar a Barra de Teclas Extras (`extra-keys`)

Crie uma barra de botões virtuais acima do teclado touch para agilizar a navegação com teclas essenciais (`ESC`, `TAB`, `CTRL`, `ALT`, aspas, barras e setas):

```bash
mkdir -p ~/.termux
nano ~/.termux/termux.properties
```

Cole a seguinte configuração:

```properties
# Configuração de Teclas Extras Virtuais do Termux
extra-keys = [ \
  ['ESC', 'TAB', 'CTRL', 'ALT', {key: '-', popup: '_'}, {key: '/', popup: '\\'}, 'HOME', 'UP', 'END'], \
  ['QUOTE', 'APOSTROPHE', 'TILDE', 'PIPE', {key: '(', popup: ')'}, {key: '[', popup: ']'}, 'LEFT', 'DOWN', 'RIGHT'] \
]
```

Aplique as mudanças imediatamente:

```bash
termux-reload-settings
```

## 4.2 🌐 Servidor OpenSSH (Acessar o Termux pelo Computador via Wi-Fi)

Configurar o SSH no Termux permite abrir um terminal do celular na tela do seu computador desktop ou laptop, aproveitando a rede local Wi-Fi.

### 1. Instalar o OpenSSH

```bash
pkg install openssh -y
```

### 2. Definir uma senha para o usuário do Termux

```bash
passwd
```
Digite e confirme uma senha segura.

### 3. Verificar o usuário e o IP local do celular

```bash
# Mostra o nome de usuário do Termux
whoami

# Mostra o endereço IP do smartphone na rede Wi-Fi local
ifconfig wlan0 | grep "inet "
# Ou através do termux-api:
# termux-wifi-connectioninfo
```
> O IP será algo no formato `192.168.1.X` ou `192.168.0.X`.

### 4. Iniciar o servidor SSH

No Termux, o OpenSSH escuta por padrão na porta **8022** (e não na 22, para não exigir privilégios de root):

```bash
sshd
```

### 5. Conectar a partir do Computador (Linux, macOS ou Windows PowerShell)

No terminal do seu computador:

```bash
ssh SEU_USUARIO@IP_DO_CELULAR -p 8022
```
*Exemplo:* `ssh u0_a245@192.168.1.15 -p 8022`

### 6. Parar o servidor SSH

```bash
pkill sshd
```

### (Opcional) Acesso sem senha usando chave SSH pública do PC

No seu computador, copie a chave pública para o Termux:

```bash
ssh-copy-id -p 8022 SEU_USUARIO@IP_DO_CELULAR
```

## 4.3 🔋 Gestão de Energia e Background (Wake-lock)

Por padrão, o Android suspende processos de aplicativos em segundo plano para economizar bateria quando a tela é desligada. Para manter serviços como `sshd`, downloads longos ou servidores web ativos:

```bash
# Impede o Android de suspender o Termux enquanto a tela estiver desligada
termux-wake-lock

# Libera o bloqueio quando terminar
termux-wake-unlock
```

> 💡 **Recomendação:** Acesse as **Configurações do Android → Aplicativos → Termux → Bateria** e marque como **"Sem Restrições"** (Unrestricted).

## 4.4 🚀 Inicialização automática de serviços com Termux:Boot

Com o aplicativo **Termux:Boot** (F-Droid), é possível iniciar servidores automaticamente ao ligar o celular:

```bash
# Cria o diretório de inicialização do Termux:Boot
mkdir -p ~/.termux/boot

# Cria um script de inicialização
cat << 'EOF' > ~/.termux/boot/start-services.sh
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
sshd
EOF

# Concede permissão de execução
chmod +x ~/.termux/boot/start-services.sh
```

---

## 📌 Observações finais

O Termux transforma qualquer dispositivo Android em uma estação de desenvolvimento portátil e autossuficiente. A combinação de **ZSH + Starship**, **code-server**, **OpenSSH** e **proot-distro** oferece um ambiente Linux completo, conectado ao hardware do smartphone e pronto para produtividade em qualquer lugar.
