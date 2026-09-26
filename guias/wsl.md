# 🪟 GuiaLinuxWSL2

> Guia pessoal de comandos, boas práticas e configurações para o **WSL 2 (Windows Subsystem for Linux)**.
>
> ⚠️ **Atenção:** O WSL 2 roda um kernel Linux real virtualizado via Hyper-V leve no Windows 10/11. Ele possui particularidades de rede, compartilhamento de sistema de arquivos (`/mnt/c`) e inicialização via `systemd`.

---

# 1. ⚙️ Configurações Essenciais do WSL 2

## 1.1 🚀 Arquivo `.wslconfig` (Host Windows)

No Windows, crie ou edite o arquivo `%USERPROFILE%\.wslconfig` para limitar os recursos do Hyper-V e evitar consumo excessivo de memória:

```ini
[wsl2]
memory=8GB            # Limite máximo de memória RAM alocada para o WSL
processors=4          # Quantidade de núcleos de CPU
swap=4GB              # Tamanho do swap
localhostForwarding=true

[experimental]
autoMemoryReclaim=gradual  # Libera memória RAM de volta para o Windows gradualmente
sparseVhd=true             # Reduz automaticamente o tamanho do disco virtual (.vhdx)
```

## 1.2 🐧 Arquivo `/etc/wsl.conf` (Dentro do Linux)

No terminal do seu Linux no WSL, configure `/etc/wsl.conf`:

```ini
[boot]
systemd=true          # Habilita systemd (essencial para docker, cron e serviços)

[network]
generateResolvConf=true

[interop]
enabled=true
appendWindowsPath=false  # Evita poluir o PATH do Linux com executáveis do Windows
```

Aplique as mudanças reiniciando o WSL no PowerShell do Windows:
```powershell
wsl --shutdown
```

---

# 2. ⚡ Desempenho e Armazenamento

> [!IMPORTANT]
> **Regra de Ouro do WSL 2:**
> **Sempre** clone repositórios e execute projetos dentro do sistema de arquivos nativo do Linux (`/home/$USER/` ou `~`).
> Acessar arquivos através de `/mnt/c/` envolve ponte de rede/emulação de disco 9P, o que reduz drasticamente a velocidade de leitura e escrita do Git, Node.js e compiladores.

| Caminho | Desempenho | Uso Ideal |
|---|---|---|
| `~/projetos/` (`Linux Nativo`) | ⚡ Máxima Velocidade (Ext4) | Código-fonte, Docker, `node_modules`, builds |
| `/mnt/c/Users/...` (`Windows NTFS`) | 🐢 Lento (Ponte 9P) | Apenas transferência pontual de arquivos |

---

# 3. 📦 Ferramentas e Ambiente de Desenvolvimento no WSL

## 3.1 🧰 Dependências Base

Se estiver usando a distribuição padrão Ubuntu no WSL:

```bash
sudo apt update && sudo apt install -y \
    curl wget git zsh ca-certificates gnupg tree fastfetch htop build-essential
```

## 3.2 🧑‍💻 Visual Studio Code & Remote WSL

A melhor forma de usar o VS Code no WSL é instalando o VS Code no Windows e utilizando a extensão oficial **WSL** (Remote - WSL).

No terminal do WSL:
```bash
# Abre a pasta atual diretamente no VS Code do Windows conectado ao Linux
code .
```

## 3.3 🐳 Docker no WSL 2

Você tem duas abordagens principais:

### Opção 1: Docker Desktop para Windows (GUI)
1. Instale o Docker Desktop no Windows.
2. Em **Settings → Resources → WSL Integration**, ative sua distribuição.

### Opção 2: Docker Engine Nativo no WSL (Leve e sem interface gráfica)
Com o `systemd=true` ativado em `/etc/wsl.conf`, instale o Docker diretamente no Linux (consulte o [guias/debian.md](./debian.md#28--docker-e-docker-compose)).

## 3.4 🤖 Gemini CLI e Antigravity CLI

```bash
# Node.js
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

# Gemini CLI e Antigravity
sudo npm install -g @google/gemini-cli
curl -fsSL https://antigravity.google/cli/install.sh | bash

# Exportar PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

## 3.5 🧲 qBittorrent no WSL

Para ambientes WSL2 com interface gráfica (**WSLg** nativo no Windows 11), você pode executar o qBittorrent desktop normalmente:

```bash
# Instala qBittorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
sudo apt update
sudo apt install -y qbittorrent

# Executa (abrirá como janela nativa no Windows via WSLg)
qbittorrent &
```

Caso esteja sem interface gráfica ou em servidor headless, utilize `qbittorrent-nox`:
```bash
sudo apt install -y qbittorrent-nox
qbittorrent-nox
```
Acesse a Web UI em seu navegador Windows em `http://localhost:8080`.

---

# 4. 🐚 ZSH, Starship e Windows Terminal

1. **Instale a fonte JetBrains Mono Nerd Font no Windows** para que os glifos apareçam corretamente no **Windows Terminal**.
2. No Windows Terminal, acesse as **Configurações → Perfis → Sua Distro → Aparência → Tipo de Letra** e selecione `JetBrainsMono Nerd Font`.
3. Configure ZSH e Starship normalmente no WSL:
```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Ativar Starship no ~/.zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```
