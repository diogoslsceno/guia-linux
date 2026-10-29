# 🪟 GuiaWindows

> Guia pessoal de comandos, otimizações, atalhos de sistema, gerenciamento de pacotes, remoção de dual-boot e ferramentas de desenvolvimento para **Windows 10 e Windows 11**.
>
> ⚠️ **Atenção:** A maioria dos comandos administrativos deve ser executada no **PowerShell (como Administrador)** ou **Prompt de Comando (como Administrador)**. Para abrir rapidamente, pressione `Win + X` e selecione **Terminal (Administrador)** ou **PowerShell (Administrador)**.

---

# 1. 🧹 Debloat, Limpeza e Otimização do Sistema

O Windows 10 e 11 vêm de fábrica com serviços de telemetria, propagandas no menu Iniciar, assistentes em segundo plano e aplicativos promocionais desnecessários que consomem CPU, disco e memória RAM.

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

# 3. ⌨️ Comandos Essenciais do Atalho `Win + R` (Janela Executar)

A caixa de diálogo **Executar** (`Win + R`) é a forma mais rápida de abrir ferramentas administrativas, gerenciar discos, auditar hardware e acessar pastas especiais do Windows sem navegar por múltiplos menus:

## 3.1 🛠️ Gerenciamento de Hardware, Discos e Sistema

| Comando | Descrição |
|---|---|
| `diskmgmt.msc` | **Gerenciamento de Disco:** Partições, volumes, formatação e redimensionamento de discos. |
| `devmgmt.msc` | **Gerenciador de Dispositivos:** Drivers, portas USB, placas de vídeo e adaptadores de rede. |
| `services.msc` | **Serviços do Windows:** Inicia, pausa e configura serviços em segundo plano (como `ssh-agent`, Docker e WSL). |
| `compmgmt.msc` | **Gerenciamento do Computador:** Painel unificado com visualizador de eventos, discos e agendador de tarefas. |
| `msconfig` | **Configuração do Sistema:** Ajustes de inicialização do sistema operacional e modo de segurança. |
| `taskmgr` | **Gerenciador de Tarefas:** Monitoramento de uso de CPU/RAM e processos ativos (atalho: `Ctrl + Shift + Esc`). |
| `resmon` | **Monitor de Recursos:** Visão aprofundada em tempo real de CPU, Memória, Disco e Conexões de Rede. |
| `perfmon` | **Monitor de Desempenho:** Contadores de métricas de telemetria e estabilidade do hardware. |

## 3.2 🔐 Registro, Diretivas e Segurança

| Comando | Descrição |
|---|---|
| `regedit` | **Editor do Registro:** Modificações de chaves do sistema (`HKEY_LOCAL_MACHINE`, `HKEY_CURRENT_USER`). |
| `gpedit.msc` | **Editor de Diretiva de Grupo Local:** Configurações avançadas de sistema e políticas de TI (*Windows Pro/Enterprise*). |
| `secpol.msc` | **Diretiva de Segurança Local:** Bloqueio de senhas, privilégios de contas e auditorias de segurança. |
| `firewall.cpl` | **Firewall do Windows Defender:** Configuração de regras de portas e bloqueios de entrada/saída. |

## 3.3 🌐 Redes e Painel de Controle Clássico

| Comando | Descrição |
|---|---|
| `ncpa.cpl` | **Conexões de Rede:** Adaptadores Ethernet, Wi-Fi e placas de rede virtuais (vEthernet WSL / Hyper-V). |
| `appwiz.cpl` | **Programas e Recursos:** Desinstalar programas clássicos e acessar o painel de recursos opcionais. |
| `optionalfeatures` | **Recursos do Windows:** Ativar/desativar Subsistema do Windows para Linux, Hyper-V e Virtualização. |
| `sysdm.cpl` | **Propriedades do Sistema:** Configurar **Variáveis de Ambiente** (`PATH`), nome da máquina e proteção do sistema. |
| `control` | **Painel de Controle:** Abre a interface clássica do Painel de Controle do Windows. |

## 3.4 📂 Pastas Especiais, Limpeza e Diagnóstico

| Comando | Descrição |
|---|---|
| `shell:startup` | **Pasta Inicializar:** Abre o diretório de programas que iniciam automaticamente com o usuário. |
| `%temp%` | **Arquivos Temporários do Usuário:** Abre a pasta de cache temporário (`AppData\Local\Temp`) para limpeza manual. |
| `temp` | **Arquivos Temporários do Windows:** Abre a pasta de arquivos temporários da raiz do sistema (`C:\Windows\Temp`). |
| `cleanmgr` | **Limpeza de Disco:** Utilitário nativo da Microsoft para liberar espaço em disco e apagar logs antigos. |
| `dxdiag` | **Diagnóstico do DirectX:** Informações precisas sobre GPU, VRAM, monitor, áudio e placa-mãe. |
| `msinfo32` | **Informações do Sistema:** Versão exata da BIOS/UEFI, Secure Boot, Processador e Memória Física. |
| `wt` | **Windows Terminal:** Abre diretamente o terminal moderno configurado. |

---

# 4. 📦 Gerenciador de Pacotes do Windows (`winget`)

O **Winget** (Windows Package Manager) é a ferramenta oficial e moderna da Microsoft para gerenciar instalações de software via linha de comando, equivalente ao `apt`, `dnf` ou `pacman`.

## 4.1 🛠️ Comandos Essenciais do Winget

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

# 5. 🧰 Instalação de Ferramentas e Aplicativos de Desenvolvimento

> 💡 **Nota de Compatibilidade:** Nem todas as ferramentas existentes no Linux possuem binários nativos no Windows. Apenas as ferramentas oficiais que possuem suporte e instaladores nativos para o Windows estão listadas nesta seção.

---

## 5.1 🖥️ Terminal Moderno & Shell

### Windows Terminal & PowerShell 7 (PS Core)

O **Windows Terminal** e o **PowerShell 7** oferecem suporte a fontes Nerd Fonts, renderização acelerada por GPU, múltiplos painéis e abas:

```powershell
# Instala o Windows Terminal Moderno
winget install --id Microsoft.WindowsTerminal -e

# Instala o PowerShell 7 (muito mais rápido e compatível que o Windows PowerShell 5.1 legado)
winget install --id Microsoft.PowerShell -e
```

---

## 5.2 🔧 Git, SSH e GitHub

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

## 5.3 📊 Fastfetch & Utilitários CLI

```powershell
# Instala Fastfetch (informações do sistema e hardware no terminal)
winget install --id Fastfetch-cli.Fastfetch -e

# Instala 7-Zip (compactador e descompactador de arquivos)
winget install --id 7zip.7zip -e
```

---

## 5.4 🟢 Node.js e npm

```powershell
# Instala a versão LTS oficial do Node.js (inclui o gerenciador npm)
winget install --id OpenJS.NodeJS.LTS -e

# Feche e reabra o terminal e confirme as versões
node -v
npm -v
```

---

## 5.5 🤖 Gemini CLI e Gtop

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

## 5.6 🧑‍💻 Visual Studio Code

```powershell
# Instala o Visual Studio Code estável oficial
winget install --id Microsoft.VisualStudioCode -e

# Confere a instalação
code --version
```

---

## 5.7 ☕ Java / OpenJDK

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

## 5.8 🐍 Python 3

```powershell
# Instala o interpretador oficial Python 3
winget install --id Python.Python.3.12 -e

# Valida as versões
python --version
pip --version
```

---

## 5.9 🐳 Docker Desktop para Windows

O **Docker Desktop** no Windows utiliza o backend leve do WSL 2 para executar contêineres Linux nativamente com aceleração total:

```powershell
# Instala o Docker Desktop oficial
winget install --id Docker.DockerDesktop -e
```

> ⚠️ Após a instalação, reinicie o computador. Ao abrir o Docker Desktop, confirme a integração com o WSL 2 em **Settings → Resources → WSL Integration**.

---

## 5.10 🧲 qBittorrent

```powershell
# Instala o qBittorrent oficial para Windows
winget install --id qBittorrent.qBittorrent -e
```

---

## 5.11 💬 Discord, OBS Studio e Ferramentas Multimídia

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

# 6. 🎨 Prompt, Estética e Fontes (Starship + JetBrains Mono)

Você pode desfrutar da mesma estética moderna do Starship e fontes Nerd Fonts no terminal do Windows que temos no Linux!

## 6.1 🔤 Instalar a Fonte JetBrains Mono Nerd Font

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

## 6.2 🚀 Instalar o Starship Prompt

```powershell
# Instala o Starship Prompt via Winget
winget install --id Starship.Starship -e
```

---

## 6.3 🐚 Configurar o Perfil do PowerShell (`$PROFILE`)

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

# 7. 🐧 Windows Subsystem for Linux (WSL 2)

Se você precisa de um ambiente Linux 100% nativo com kernel real para compilações, Docker ou ferramentas Unix que não rodam nativamente no Windows, ative o WSL 2 com um único comando:

```powershell
# Instala o WSL 2 e a distribuição Ubuntu padrão
wsl --install
```

Após o término da instalação e reinicialização, consulte o nosso guia dedicado:
👉 **[Guia Completo WSL 2 (`guias/wsl.md`)](./wsl.md)**

---

# 8. 🔄 Guia Completo — Remoção Limpa e Segura do Dual Boot (Desinstalar Linux)

> [!CAUTION]
> **Por que este procedimento é fundamental?**
> Apenas formatar ou excluir a partição do Linux pelo Gerenciamento de Disco **não remove o inicializador GRUB da partição EFI**. Ao reiniciar o computador, a placa-mãe (UEFI) tentará carregar o GRUB que não existe mais, travando a máquina na tela de erro:
> `error: no such partition. Entering rescue mode... grub rescue>`
> Siga rigorosamente os passos abaixo para remover o Linux e restaurar o boot 100% direto pelo Windows Boot Manager.

---

## Passo 1: Excluir as Partições Linux e Recuperar Espaço em Disco

1. Pressione `Win + R`, digite **`diskmgmt.msc`** e pressione `Enter` (ou clique com botão direito no botão Iniciar → **Gerenciamento de Disco**).
2. Localize a partição do Linux (geralmente identificada pelo tamanho que você reservou, sem sistema de arquivos NTFS reconhecido ou marcada como partição primária vazia/RAW).
3. Clique com o botão direito sobre a partição do Linux e selecione **"Excluir volume..."**, confirmando com **Sim**.
4. A partição se tornará **"Espaço Não Alocado"** (barra preta).
5. **(Opcional - Estender Windows):** Para reaproveitar esse espaço no Windows, clique com o botão direito na partição do seu Windows (`C:`) e selecione **"Estender volume..."**. Avance no assistente até o fim.

---

## Passo 2: Acessar a Partição do Sistema EFI (`ESP`) via DiskPart

Como a partição EFI é protegida e oculta pelo Windows, vamos atribuir a ela uma letra de unidade temporária:

1. Abra o **Prompt de Comando (CMD) como Administrador** ou **PowerShell como Administrador**.
2. Digite o utilitário de disco:
   ```cmd
   diskpart
   ```
3. Liste todos os volumes do computador:
   ```cmd
   list vol
   ```
4. Localize o volume que possui o sistema de arquivos **FAT32**, tamanho aproximado de **100 MB a 512 MB** e a etiqueta **"Sistema"** na coluna de informações. Exemplo:
   ```text
   Volume 1         ESP          FAT32  Partição     512 MB  Íntegro    Sistema
   ```
5. Selecione o volume correspondente (substitua o número `1` pelo número identificado no seu computador):
   ```cmd
   select vol 1
   ```
6. Atribua uma letra de unidade temporária (por exemplo, a letra **`J:`** ou outra letra livre):
   ```cmd
   assign letter=j
   ```
   *Mensagem esperada: `DiskPart atribuiu com êxito a letra de unidade ou o ponto de montagem.`*
7. Saia do utilitário DiskPart para retornar ao prompt de comando:
   ```cmd
   exit
   ```
   *(Mantenha o terminal aberto!)*

---

## Passo 3: Apagar os Arquivos do Inicializador Linux (GRUB) na EFI

Você pode realizar a exclusão dos arquivos do GRUB diretamente via **Terminal** (mais rápido) ou pelo **Método Gráfico**:

### Opção A: Exclusão Rápida via Terminal (Recomendado)

No mesmo terminal administrativo em que você estava:

```cmd
# Entra na unidade EFI montada
j:

# Acessa o diretório de inicializadores UEFI
cd EFI

# Lista os inicializadores instalados
dir
```

Você verá a pasta `Microsoft`, a pasta `Boot` e as pastas correspondentes às distribuições Linux instaladas (como `ubuntu`, `debian`, `fedora`, `arch` ou similar).

> ⚠️ **ATENÇÃO MÁXIMA:** **NUNCA** apague as pastas `Microsoft` ou `Boot`! Elas são os inicializadores do próprio Windows.

Remova apenas a pasta da sua distribuição Linux:

```cmd
# Para Ubuntu / Mint / Pop:
rmdir /s /q ubuntu

# Para Debian:
rmdir /s /q debian

# Para Fedora:
rmdir /s /q fedora

# Para Arch Linux:
rmdir /s /q arch
```

---

### Opção B: Exclusão com Interface Gráfica (Explorador com Privilégios Administrativos)

Caso prefira excluir com o mouse:

1. Abra o **Gerenciador de Tarefas** (`Ctrl + Shift + Esc`).
2. Clique no menu superior em **"Executar nova tarefa"** (ou *Arquivo → Executar nova tarefa*).
3. Marque a caixa de seleção: **☑️ "Criar esta tarefa com privilégios administrativos"**.
4. Clique no botão **"Procurar..."**. Isso abrirá uma janela com privilégios de Administrador total.
5. No painel esquerdo, clique em **"Este Computador"** e acesse a unidade **`ESP (J:)`**.
6. Entre na pasta **`EFI`**.
7. Selecione a pasta da distribuição instalada (`ubuntu`, `debian`, etc.) e pressione `Shift + Delete` para excluir permanentemente.
8. Feche o Gerenciador de Tarefas e a janela de navegação.

---

## Passo 4: Desmontar a Partição EFI e Liberar a Letra

Após apagar a pasta do Linux, remova a letra de montagem para que a partição EFI volte a ficar oculta e segura contra modificações acidentais:

No prompt de comando administrativo:

```cmd
diskpart
select vol 1
remove letter=j
exit
```

---

## Passo 5: Confirmar e Reiniciar o Sistema

1. Abra o Explorador de Arquivos e certifique-se de que a unidade `J:` não aparece mais em "Este Computador".
2. Reinicie o seu computador:
   ```cmd
   shutdown /r /t 0
   ```
3. O computador inicializará diretamente no **Windows 10/11**, com tempo de boot reduzido e sem nenhuma pendência do menu GRUB!

---

# 9. ⚖️ O Que NÃO Existe ou Não se Aplica no Windows (e o que usar)

Para evitar tentativas de executar comandos incompatíveis, veja o comparativo das ferramentas exclusivas de ecossistemas Linux:

| Recurso do Linux | Por que não se aplica no Windows | O que utilizar no Windows |
|---|---|---|
| **GRUB / Vimix Theme** | O Windows não utiliza o bootloader GRUB; ele usa o **Windows Boot Manager (BCD)** gerenciado pela partição EFI. | Para dual boot, o GRUB fica no Linux. Se desejar remover o dual boot, siga a [Seção 8](#8--guia-completo--remoção-limpa-e-segura-do-dual-boot-desinstalar-linux). |
| **APT / DNF / Pacman / Zypper** | São gerenciadores de pacotes específicos de distribuições Linux baseadas em `.deb`, `.rpm` ou binários Arch. | Utilize o **`winget`** oficial ou o **`scoop`** (Seção 4). |
| **ZSH / Zinit / Oh My Zsh** | ZSH é um interpretador de shell POSIX para ambientes Unix-like. | Utilize o **PowerShell 7 moderno** com **PSReadLine** e **Starship Prompt** (Seção 6), ou utilize o **WSL 2**. |
| **Ptyxis / GNOME Tweaks / GSettings** | Ptyxis e GNOME são parte do ambiente de desktop GNOME para Linux. | Utilize o **Windows Terminal** e as **Configurações do Windows**. |
| **Permissões POSIX (`chmod`, `chown`)** | O sistema de arquivos NTFS no Windows utiliza Listas de Controle de Acesso (ACLs) em vez de octais de permissão Unix. | O PowerShell gerencia arquivos diretamente no escopo do seu usuário sem necessidade de `chmod +x`. |
