# 🪟 GuiaWindows

> Guia pessoal de comandos, otimizações, gerenciamento de pacotes e ferramentas de desenvolvimento para **Windows 10 e Windows 11**.
>
> ⚠️ **Atenção:** A maioria dos comandos administrativos deve ser executada no **PowerShell (como Administrador)**. Para abrir, pressione `Win + X` e selecione **Terminal (Administrador)** ou **PowerShell (Administrador)**.

---

# 1. 🧹 Debloat, Limpeza e Otimização do Sistema

O Windows 10 e 11 vêm de fábrica com diversos serviços de telemetria, propagandas no menu Iniciar, assistentes em segundo plano e aplicativos promocionais desnecessários que consomem CPU, disco e memória RAM.

## 1.1 🚀 Script de Otimização e Debloat (Win11Debloat)

Execute o comando abaixo no **PowerShell como Administrador** para iniciar a interface de debloat oficial do projeto Raphi:

```powershell
& ([scriptblock]::Create((irm "https://debloat.raphi.re/")))
```

### O que este script realiza:
* **Remove Bloatware:** Desinstala aplicativos promocionais pré-instalados (ex: Candy Crush, jogos de terceiros, Cortana, Bing News, Microsoft News, etc.).
* **Desativa Telemetria:** Bloqueia o rastreamento invasivo e coleta de dados diagnósticos enviada em segundo plano para servidores da Microsoft.
* **Otimiza o Menu Iniciar & Barra de Tarefas:** Remove a busca na web via Bing no menu Iniciar (deixando apenas busca local de alta velocidade) e desativa feeds de notícias/widgets intrusivos.
* **Privacidade e Desempenho:** Desativa IDs de publicidade, relatórios de erros desnecessários e serviços de diagnóstico em segundo plano.

---

## 1.2 ⚡ Chris Titus Tech Windows Utility (WinUtil) — Alternativa Complementar

Caso deseje instalar pacotes em massa, ajustar serviços do sistema e desativar recursos avançados de telemetria através de uma interface gráfica completa:

```powershell
irm "https://christitus.com/win" | iex
```

---

# 2. 💻 Comandos Úteis do Terminal (PowerShell vs Linux)

No PowerShell do Windows, muitos comandos familiares do Linux funcionam via *aliases* integrados, porém operam como cmdlets baseados em objetos:

## 2.1 📍 Tabela Comparativa de Comandos

| Função | Linux / Bash | PowerShell (Windows) | Alias Nativo no Windows |
|---|---|---|---|
| **Diretório Atual** | `pwd` | `Get-Location` | `pwd`, `gl` |
| **Listar Arquivos** | `ls -la` | `Get-ChildItem -Force` | `ls`, `dir`, `gci` |
| **Entrar em Pasta** | `cd nome` | `Set-Location nome` | `cd`, `sl` |
| **Subir de Nível** | `cd ..` | `cd ..` | `cd ..` |
| **Pasta do Usuário** | `cd ~` | `cd ~` ou `cd $HOME` | `cd ~` |
| **Criar Pasta** | `mkdir pasta` | `New-Item -ItemType Directory pasta` | `mkdir`, `md` |
| **Criar Arquivo Vazio** | `touch arquivo.txt` | `New-Item -ItemType File arquivo.txt` | `ni arquivo.txt` |
| **Mover / Renomear** | `mv arq destino/` | `Move-Item arq destino/` | `mv`, `move`, `mi` |
| **Copiar Arquivo/Pasta** | `cp -r pasta destino/` | `Copy-Item -Recurse pasta destino/` | `cp`, `copy`, `cpi` |
| **Remover Arquivo** | `rm arquivo.txt` | `Remove-Item arquivo.txt` | `rm`, `del`, `erase` |
| **Remover Recursivo** | `rm -rf pasta` | `Remove-Item -Recurse -Force pasta` | `rm -r -fo pasta` |
| **Visualizar Arquivo** | `cat arquivo.txt` | `Get-Content arquivo.txt` | `cat`, `type`, `gc` |
| **Limpar Tela** | `clear` ou `Ctrl + L` | `Clear-Host` | `clear`, `cls` |
| **Histórico** | `history` | `Get-History` | `history`, `h` |
| **Processos Ativos** | `ps aux` ou `top` | `Get-Process` | `ps`, `gps` |
| **Matar Processo** | `kill -9 <PID>` | `Stop-Process -Id <PID> -Force` | `kill -Id <PID>` |

## 2.2 🛡️ Habilitar Execução de Scripts no PowerShell

Por padrão de segurança, o Windows bloqueia a execução de scripts locais no PowerShell. Para liberar a execução do seu perfil de usuário:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

## 2.3 🔄 Reiniciar e Desligar via Linha de Comando

```powershell
# Reinicia o computador imediatamente
Restart-Computer
# Ou via comando clássico:
shutdown /r /t 0

# Desliga o computador imediatamente
Stop-Computer
# Ou via comando clássico:
shutdown /s /t 0
```

---

# 3. 📦 Gerenciador de Pacotes do Windows (`winget`)

O **Winget** (Windows Package Manager) é a ferramenta oficial e moderna da Microsoft para gerenciar instalações de software via linha de comando, equivalente ao `apt`, `dnf` ou `pacman`.

## 3.1 🛠️ Comandos Essenciais do Winget

```powershell
# Atualiza os índices de repositórios do Winget
winget source update

# Pesquisa um aplicativo no repositório oficial
winget search <nome-do-programa>

# Instala um pacote pelo seu ID exato de forma silenciosa
winget install --id <ID-do-Pacote> -e --silent --accept-package-agreements --accept-source-agreements

# Lista todos os programas instalados no computador
winget list

# Verifica todos os aplicativos que possuem atualizações disponíveis
winget upgrade

# Atualiza todos os programas instalados automaticamente
winget upgrade --all --include-unknown --accept-package-agreements --accept-source-agreements

# Desinstala um aplicativo pelo ID
winget uninstall --id <ID-do-Pacote>
```

---

# 4. 🧰 Instalação de Ferramentas e Aplicativos de Desenvolvimento

> 💡 **Nota de Compatibilidade:** Nem todas as ferramentas existentes no Linux possuem binários nativos no Windows. Apenas as ferramentas oficiais que possuem suporte e instaladores nativos para o Windows estão listadas nesta seção.

---

## 4.1 🖥️ Terminal Moderno & Shell

### Windows Terminal & PowerShell 7 (PS Core)

O **Windows Terminal** e o **PowerShell 7** oferecem suporte a fontes Nerd Fonts, renderização acelerada por GPU, múltiplos painéis e abas:

```powershell
# Instala o Windows Terminal Moderno
winget install --id Microsoft.WindowsTerminal -e

# Instala o PowerShell 7 (muito mais rápido e compatível que o Windows PowerShell 5.1 legado)
winget install --id Microsoft.PowerShell -e
```

---

## 4.2 🔧 Git, SSH e GitHub

### 1. Instalar o Git para Windows

```powershell
winget install --id Git.Git -e
```

### 2. Ativar o Serviço OpenSSH Agent no Windows

No Windows, o serviço do agente SSH vem desativado por padrão. Habilite-o no PowerShell como Administrador:

```powershell
# Configura o serviço ssh-agent para inicialização automática
Get-Service -Name ssh-agent | Set-Service -StartupType Automatic

# Inicia o serviço do SSH Agent
Start-Service ssh-agent
```

### 3. Gerar Chave SSH Ed25519 e Configurar GitHub

```powershell
# Cria a chave SSH (substitua pelo seu e-mail do GitHub)
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"

# Adiciona a chave gerada ao SSH Agent
ssh-add $HOME\.ssh\id_ed25519

# Exibe a chave pública para copiar e colar no GitHub (Settings -> SSH Keys)
Get-Content $HOME\.ssh\id_ed25519.pub
```

### 4. Configurar Identidade Global do Git

```powershell
git config --global user.name "Seu Nome"
git config --global user.email "seu-email@exemplo.com"
git config --global init.defaultBranch main
```

---

## 4.3 📊 Fastfetch & Utilitários CLI

```powershell
# Instala Fastfetch (informações do sistema e hardware no terminal)
winget install --id Fastfetch-cli.Fastfetch -e

# Instala 7-Zip (compactador e descompactador de arquivos)
winget install --id 7zip.7zip -e
```

---

## 4.4 🟢 Node.js e npm

```powershell
# Instala a versão LTS oficial do Node.js (inclui o gerenciador npm)
winget install --id OpenJS.NodeJS.LTS -e

# Feche e reabra o terminal e confirme as versões
node -v
npm -v
```

---

## 4.5 🤖 Gemini CLI e Gtop

Com o Node.js e npm instalados:

```powershell
# Instala o Google Gemini CLI globalmente
npm install -g @google/gemini-cli

# Instala o monitor de recursos de sistema em terminal gtop
npm install -g gtop

# Verifica a instalação do Gemini
gemini --version
```

---

## 4.6 🧑‍💻 Visual Studio Code

```powershell
# Instala o Visual Studio Code estável oficial
winget install --id Microsoft.VisualStudioCode -e

# Confere a instalação
code --version
```

---

## 4.7 ☕ Java / OpenJDK

Instale o **Microsoft Build of OpenJDK 21 LTS** ou **Eclipse Temurin OpenJDK 21**:

```powershell
# Opção 1: Microsoft Build of OpenJDK 21 LTS
winget install --id Microsoft.OpenJDK.21 -e

# Opção 2: Eclipse Temurin OpenJDK 21 LTS
# winget install --id EclipseAdoptium.Temurin.21.JDK -e

# Validação (em um novo terminal)
java -version
javac -version
```

---

## 4.8 🐍 Python 3

```powershell
# Instala o interpretador oficial Python 3
winget install --id Python.Python.3.12 -e

# Valida as versões
python --version
pip --version
```

---

## 4.9 🐳 Docker Desktop para Windows

O **Docker Desktop** no Windows utiliza o backend leve do WSL 2 para executar contêineres Linux nativamente com aceleração total:

```powershell
# Instala o Docker Desktop oficial
winget install --id Docker.DockerDesktop -e
```

> ⚠️ Após a instalação, reinicie o computador. Ao abrir o Docker Desktop, confirme a integração com o WSL 2 em **Settings → Resources → WSL Integration**.

---

## 4.10 🧲 qBittorrent

```powershell
# Instala o qBittorrent oficial para Windows
winget install --id qBittorrent.qBittorrent -e
```

---

## 4.11 💬 Discord, OBS Studio e Ferramentas Multimídia

```powershell
# Discord
winget install --id Discord.Discord -e

# OBS Studio
winget install --id OBSProject.OBSStudio -e

# JetBrains Toolbox (Gerenciador de IDEs IntelliJ, PyCharm, CLion, etc.)
winget install --id JetBrains.Toolbox -e

# Android Studio Oficial
winget install --id Google.AndroidStudio -e

# Utilitários de Diff e Git
winget install --id Meld.Meld -e
winget install --id SublimeHQ.SublimeMerge -e
```

---

# 5. 🎨 Prompt, Estética e Fontes (Starship + JetBrains Mono)

Você pode desfrutar da mesma estética moderna do Starship e fontes Nerd Fonts no terminal do Windows que temos no Linux!

## 5.1 🔤 Instalar a Fonte JetBrains Mono Nerd Font

```powershell
# Instala a fonte JetBrains Mono Nerd Font oficial via Winget
winget install --id RomanSetik.JetBrainsMonoNerdFont -e
```

### Configurar a fonte no Windows Terminal:
1. Abra o **Windows Terminal**.
2. Pressione `Ctrl + ,` para abrir as **Configurações**.
3. No menu lateral, acesse **Perfis** → **Padrões** → **Aparência**.
4. No campo **Tipo de Letra** (Font face), selecione `JetBrainsMono Nerd Font`.
5. Clique em **Salvar**.

---

## 5.2 🚀 Instalar o Starship Prompt

```powershell
# Instala o Starship Prompt via Winget
winget install --id Starship.Starship -e
```

---

## 5.3 🐚 Configurar o Perfil do PowerShell (`$PROFILE`)

O arquivo `$PROFILE` no Windows equivale ao `~/.zshrc` ou `~/.bashrc` do Linux.

### 1. Instalar o Módulo `PSReadLine` (Autosuggestions & Syntax Highlighting)

O módulo PSReadLine oferece no PowerShell o mesmo comportamento preditivo do ZSH:

```powershell
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
```

### 2. Criar e Editar o Perfil do PowerShell

```powershell
# Cria o arquivo de perfil caso ainda não exista
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

# Abre o arquivo no Bloco de Notas ou VS Code
notepad $PROFILE
# Ou: code $PROFILE
```

### 3. Cole a Configuração Abaixo no Seu `$PROFILE`

```powershell
# ==============================================================================
# 🚀 PowerShell Profile - Guia Windows
# ==============================================================================

# 1. Configurações do PSReadLine (Autossugestão e histórico estilo Zsh)
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -Colors @{
    InlinePrediction = "$([char]0x1b)[38;5;242m"
}

# 2. Inicialização do Starship Prompt
Invoke-Expression (&starship init powershell)

# 3. Aliases Úteis
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name c -Value Clear-Host
function .. { Set-Location .. }
function ... { Set-Location ..\.. }
```

### 4. Usar o Arquivo `starship.toml` Compartilhado do Repositório

Copie o arquivo de tema `dotfiles/starship.toml` deste repositório para o seu diretório de configurações do usuário no Windows:

```powershell
# Cria a pasta de configuração caso não exista
New-Item -ItemType Directory -Path "$HOME\.config" -Force

# Copia a configuração do tema Starship
Copy-Item ".\dotfiles\starship.toml" "$HOME\.config\starship.toml"
```

---

# 6. 🐧 Windows Subsystem for Linux (WSL 2)

Se você precisa de um ambiente Linux 100% nativo com kernel real para compilações, Docker ou ferramentas Unix que não rodam nativamente no Windows, ative o WSL 2 com um único comando:

```powershell
# Instala o WSL 2 e a distribuição Ubuntu padrão
wsl --install
```

Após o término da instalação e reinicialização, consulte o nosso guia dedicado:
👉 **[Guia Completo WSL 2 (`guias/wsl.md`)](./wsl.md)**

---

# 7. ⚖️ O Que NÃO Existe ou Não se Aplica no Windows (e o que usar)

Para evitar tentativas de executar comandos incompatíveis, veja o comparativo das ferramentas exclusivas de ecossistemas Linux:

| Recurso do Linux | Por que não se aplica no Windows | O que utilizar no Windows |
|---|---|---|
| **GRUB / Vimix Theme** | O Windows não utiliza o bootloader GRUB; ele usa o **Windows Boot Manager (BCD)** gerenciado pela partição EFI. | Se você usa Dual-Boot (Windows + Linux), o tema GRUB deve ser configurado dentro do Linux (consulte o guia da sua distro). O GRUB gerencia a inicialização de ambos. |
| **APT / DNF / Pacman / Zypper** | São gerenciadores de pacotes específicos de distribuições Linux baseadas em `.deb`, `.rpm` ou binários Arch. | Utilize o **`winget`** oficial ou o **`scoop`**. |
| **ZSH / Zinit / Oh My Zsh** | ZSH é um interpretador de shell POSIX para ambientes Unix-like. | Utilize o **PowerShell 7 moderno** com **PSReadLine** e **Starship Prompt** (Seção 5), ou utilize o **WSL 2**. |
| **Ptyxis / GNOME Tweaks / GSettings** | Ptyxis e GNOME são parte do ambiente de desktop GNOME para Linux. | Utilize o **Windows Terminal** e as **Configurações do Windows**. |
| **Permissões POSIX (`chmod`, `chown`)** | O sistema de arquivos NTFS no Windows utiliza Listas de Controle de Acesso (ACLs) em vez de octais de permissão Unix. | O PowerShell gerencia arquivos diretamente no escopo do seu usuário sem necessidade de `chmod +x`. |
