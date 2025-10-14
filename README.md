<div align="center">

# 🚀 DevSecOps Dotfiles

### *Professional dotfiles for DevSecOps Engineers*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell: Zsh](https://img.shields.io/badge/Shell-Zsh-1f425f.svg)](https://www.zsh.org/)
[![OS: macOS](https://img.shields.io/badge/OS-macOS-blue.svg)](https://www.apple.com/macos/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

A comprehensive, production-ready dotfiles configuration tailored for DevSecOps engineers. This setup includes configurations for **Zsh**, **Tmux**, **Neovim (LazyVim)**, **Git**, and various DevSecOps tools with **100+ aliases**, custom functions, and a built-in help system.

[Features](#-features) • [Quick Start](#-quick-start) • [Installation](#-installation) • [Documentation](docs/README.md) • [Security](#-security-features)

</div>

---

## ✨ Key Features

<table>
<tr>
<td width="50%">

### 🔧 **Core Shell**
- **Zsh** with Oh My Zsh
- **Powerlevel10k** theme
- **35+ plugins** (git, docker, kubectl, terraform, aws, azure, gcloud)
- **100+ aliases** for DevSecOps workflows
- **20+ custom functions**
- **Auto-suggestions** & **syntax highlighting**

### 🎨 **Modern CLI Tools**
- `bat` → Better cat with syntax highlighting
- `eza` → Modern ls replacement
- `ripgrep` → Blazing fast search
- `fd` → Simple, fast find alternative
- `fzf` → Fuzzy finder
- `delta` → Beautiful git diffs
- `btop` → System monitor
- `procs` → Modern ps replacement
- `zoxide` → Smart cd command

</td>
<td width="50%">

### 🛠️ **DevSecOps Tools**
- **Containers**: Docker, Docker Compose
- **Kubernetes**: kubectl, helm, kubectx, kubens
- **IaC**: Terraform, tfsec
- **Cloud**: AWS CLI, Azure CLI, GCP CLI
- **Security**: Trivy, Hadolint, git-secrets
- **Monitoring**: btop, procs, dust, duf

### � **Custom Features**
- 📚 **Built-in help system** (`help` command)
- 🔐 **Git profile management** (personal/work)
- 🔑 **Authenticated GitHub cloning**
- 🛡️ **Security scanner** (`scan-secrets`)
- ⚙️ **Environment-driven config** (`.env`)
- 🎭 **Tmux session management**

</td>
</tr>
</table>

## 🌟 What Makes This Different?

| Feature | This Dotfiles | Typical Dotfiles |
|---------|--------------|------------------|
| **Help System** | ✅ Built-in `help` command with 12 topics | ❌ Manual documentation only |
| **Git Profiles** | ✅ Easy personal/work switching | ❌ Manual configuration |
| **Security** | ✅ Secret scanner + .env isolation | ⚠️ Basic or none |
| **DevSecOps Focus** | ✅ 100+ tailored aliases | ⚠️ Generic aliases |
| **Documentation** | ✅ 22 guides + demos | ⚠️ Basic README |
| **Environment-Driven** | ✅ All config from .env | ❌ Hardcoded values |
| **Maintained** | ✅ Active & tested | ⚠️ Often abandoned |

---

## 📋 Prerequisites

- **Operating System**: macOS (primary) or Linux
- **Git**: Version 2.0+
- **Curl or Wget**: For downloading dependencies
- **Terminal**: iTerm2, Alacritty, or any terminal with true color support
- **Optional**: Nerd Font (for icons in Powerlevel10k)

## ⚡ Quick Start

```bash
# Clone the repository
git clone https://github.com/highlevel-performance/dotfile.git ~/dotfiles
cd ~/dotfiles

# Copy and configure environment
cp .env.example .env
# Edit .env with your personal settings

# Run the automated installer
./setup.sh

# Start using
help              # Show available commands
help git          # Git-specific help
git-personal      # Switch to personal git profile
```

## 🚀 Installation

### Automated Installation (Recommended)

```bash
# 1. Clone the repository
git clone https://github.com/highlevel-performance/dotfile.git ~/dotfiles
cd ~/dotfiles

# 2. Setup environment variables
cp .env.example .env
nano .env  # or vim/code - add your personal information

# 3. Run the installer
./setup.sh

# 4. Restart your terminal or source
source ~/.zshrc
```

The installer will:
- ✅ Install Homebrew (if not present)
- ✅ Install Oh My Zsh with Powerlevel10k theme
- ✅ Install all required CLI tools
- ✅ Setup Tmux with TPM
- ✅ Configure Neovim with LazyVim
- ✅ Create symlinks for all config files
- ✅ Setup git profiles (personal/work)

### Manual Installation

If you prefer to install manually or customize the setup:

```bash
# 1. Install Homebrew (macOS)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3. Install required packages
brew install git zsh tmux neovim fzf ripgrep fd bat eza zoxide btop procs dust duf delta

# 4. Create symlinks
ln -sf ~/Desktop/dotfile/.zshrc ~/.zshrc
ln -sf ~/Desktop/dotfile/.tmux.conf ~/.tmux.conf
ln -sf ~/Desktop/dotfile/.gitconfig ~/.gitconfig
ln -sf ~/Desktop/dotfile/.gitignore_global ~/.gitignore_global
ln -sf ~/Desktop/dotfile/.aliases ~/.aliases
ln -sf ~/Desktop/dotfile/.functions ~/.functions
ln -sf ~/Desktop/dotfile/.exports ~/.exports
ln -sf ~/Desktop/dotfile/nvim ~/.config/nvim

# 5. Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 6. Restart your terminal
```

## 📁 Repository Structure

```
dotfile/
├── 📄 Configuration Files
│   ├── .zshrc                  # Zsh configuration
│   ├── .tmux.conf              # Tmux configuration
│   ├── .gitconfig              # Git configuration (no secrets!)
│   ├── .aliases                # 100+ DevSecOps aliases
│   ├── .functions              # 20+ custom shell functions
│   ├── .exports                # Environment variables
│   └── .env.example            # Environment template (copy to .env)
│
├── 🔧 Scripts (bin/)
│   ├── help                    # Interactive help system
│   ├── scan-secrets            # Security scanner
│   ├── git-profile             # Git profile switcher
│   ├── git-clone-auth          # Authenticated cloning
│   └── sync-*                  # Sync commands
│
├── 📚 Documentation (docs/)
│   ├── README.md               # Documentation index
│   ├── INSTALLATION.md         # Detailed setup guide
│   ├── GIT_PROFILES.md         # Git profile management
│   ├── GIT_AUTH_GUIDE.md       # Authentication setup
│   ├── SECURITY_AUDIT.md       # Security report
│   └── *.sh                    # Demo scripts
│
├── 🎨 Neovim (nvim/)
│   ├── init.lua                # Main config
│   └── lua/
│       ├── config/             # Core settings
│       └── plugins/            # DevSecOps plugins
│
└── 🛠️ Setup Scripts
    ├── setup.sh                # Automated installer
    ├── status.sh               # Status checker
    └── uninstall.sh            # Clean uninstaller
```

## 🎯 Post-Installation

### 1. Configure Powerlevel10k

```bash
p10k configure
```

### 2. Install Tmux Plugins

Open tmux and press `Ctrl+A` then `I` (capital i) to install plugins.

### 3. Configure Git

Update `.gitconfig` with your information:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 4. Setup GPG Signing (Optional)

```bash
# Generate GPG key
gpg --full-generate-key

# List keys
gpg --list-secret-keys --keyid-format=long

# Configure git to use GPG key
git config --global user.signingkey YOUR_KEY_ID
```

### 5. Install Additional DevSecOps Tools

```bash
# Kubernetes tools
brew install kubectx kubens stern k9s

# Security tools
brew install aquasecurity/trivy/trivy tfsec hadolint checkov

# Cloud CLIs
brew install awscli azure-cli
```

## 🔑 Key Bindings

### Tmux

| Key | Action |
|-----|--------|
| `Ctrl+A` | Prefix key |
| `Ctrl+A \|` | Split pane vertically |
| `Ctrl+A -` | Split pane horizontally |
| `Ctrl+A h/j/k/l` | Navigate panes (vim-style) |
| `Alt+Arrow` | Navigate panes (arrows) |
| `Ctrl+A r` | Reload config |
| `Ctrl+A x` | Kill pane |

### Neovim

| Key | Action |
|-----|--------|
| `Space` | Leader key |
| `Space e` | Toggle file explorer |
| `Space ff` | Find files |
| `Space fg` | Live grep |
| `Space fb` | Find buffers |
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Show hover documentation |
| `Space ca` | Code actions |

## 📦 Popular Aliases & Commands

<table>
<tr>
<td width="25%">

### 🐳 **Docker**
```bash
d         # docker
dc        # docker-compose
dps       # docker ps
di        # docker images
dex       # docker exec -it
dlogs     # docker logs -f
drm       # docker rm
drmi      # docker rmi
```

</td>
<td width="25%">

### ☸️ **Kubernetes**
```bash
k         # kubectl
kgp       # get pods
kgs       # get services
kgd       # get deployments
kdp       # describe pod
kl        # logs
klf       # logs -f
kex       # exec -it
```

</td>
<td width="25%">

### 🏗️ **Terraform**
```bash
tf        # terraform
tfi       # init
tfp       # plan
tfa       # apply
tfd       # destroy
tfv       # validate
tff       # fmt
tfshow    # show
```

</td>
<td width="25%">

### 🔀 **Git**
```bash
gs        # status
ga        # add
gc        # commit
gp        # push
gpl       # pull
gco       # checkout
glog      # pretty log
gd        # diff
```

</td>
</tr>
</table>

### 🔍 Discovery with Help System

Don't memorize all aliases! Use the built-in help:

```bash
help                    # Show main help menu
help git                # Git commands
help kubernetes         # K8s commands
help docker             # Docker commands
help terraform          # Terraform commands
help aws                # AWS CLI commands
help security           # Security tools
help all | grep <term>  # Search all commands
```

**Total: 100+ aliases across 12 categories!** See [docs/HELP_QUICK_REF.sh](docs/HELP_QUICK_REF.sh) for complete list.

## 🔍 Custom Functions

### Kubernetes

```bash
kgetall          # Get all resources in namespace
klogs            # Interactively select pod for logs
kexec            # Interactively exec into pod
kport            # Port forward with selection
kresources       # Show resource usage
```

### Security

```bash
secscan          # Run all security scanners
gitscan          # Scan git repo for secrets
dscan <image>    # Scan Docker image
tfseccheck       # Run Terraform security checks
```

### AWS

```bash
awsswitch <profile>  # Switch AWS profile
awsinfo              # Show AWS account info
ec2list              # List EC2 instances
```

### Utilities

```bash
mkcd <dir>           # Create and cd into directory
extract <file>       # Extract any archive
findport <port>      # Find process using port
killport <port>      # Kill process on port
genpass [length]     # Generate random password
```

## 🔒 Security Features

<table>
<tr>
<td width="33%">

### 🛡️ **Protection Layers**
- 📝 `.gitignore` with 80+ patterns
- 🔍 `scan-secrets` tool
- 🔐 `.env` file isolation
- ❌ No hardcoded credentials
- 📋 Comprehensive documentation

</td>
<td width="33%">

### 🔐 **Git Security**
- Profile separation (personal/work)
- Token-based authentication
- `.gitignore_global` for sensitive files
- Optional GPG commit signing
- git-secrets integration

</td>
<td width="33%">

### 🎯 **Best Practices**
- Environment-driven configuration
- Sensitive file detection in Neovim
- History filtering for secrets
- Pre-commit security scanning
- Automated secret rotation guides

</td>
</tr>
</table>

### Security Commands

```bash
./bin/scan-secrets      # Scan for exposed secrets
help security           # Show security-related commands
git-personal           # Switch to personal git profile
git-work               # Switch to work git profile
```

## 🛠️ Customization

### Local Overrides

Create these files for local customization (they're gitignored):

- `~/.zshrc.local` - Local zsh config
- `~/.gitconfig.local` - Local git config
- `~/.exports.local` - Local environment variables

### Adding Custom Plugins

Edit `nvim/lua/plugins/devsecops.lua` to add Neovim plugins.

### Adding Aliases

Add your custom aliases to `.aliases` file.

### Adding Functions

Add custom functions to `.functions` file.

## 🧪 Testing

After installation, test the configuration:

```bash
# Test zsh
source ~/.zshrc
echo "Zsh loaded successfully"

# Test tmux
tmux new-session -d -s test && tmux kill-session -t test
echo "Tmux working"

# Test neovim
nvim --version

# Test git
git config --list

# Test DevSecOps tools
kubectl version --client
terraform version
docker --version
aws --version
```

## 📚 Additional Resources

### Documentation

- [Oh My Zsh](https://ohmyz.sh/)
- [Tmux](https://github.com/tmux/tmux/wiki)
- [LazyVim](https://www.lazyvim.org/)
- [Neovim](https://neovim.io/doc/)

### DevSecOps Tools

- [Trivy](https://aquasecurity.github.io/trivy/)
- [tfsec](https://tfsec.dev/)
- [Checkov](https://www.checkov.io/)
- [Gitleaks](https://github.com/gitleaks/gitleaks)
- [OWASP ZAP](https://www.zaproxy.org/)

## 🐛 Troubleshooting

### Zsh plugins not loading

```bash
rm -rf ~/.zcompdump*
source ~/.zshrc
```

### Tmux plugins not working

```bash
# Reinstall TPM
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install plugins: Ctrl+A then I
```

### Neovim plugins not installing

```bash
# Clean and reinstall
rm -rf ~/.local/share/nvim
nvim
```

### Colors not working

Ensure your terminal supports true color:
- macOS: Use iTerm2 or Alacritty
- Linux: Use Alacritty, Kitty, or Terminator

## 📚 Documentation

Comprehensive documentation is available in the [`docs/`](docs/) folder:

<table>
<tr>
<td width="50%">

### 📖 **Guides**
- 📘 [Installation Guide](docs/INSTALLATION.md) - Detailed setup
- 🔀 [Git Profiles](docs/GIT_PROFILES.md) - Personal/work separation
- 🔑 [Git Authentication](docs/GIT_AUTH_GUIDE.md) - Secure cloning
- 🌍 [Environment Setup](docs/HELP_ENV_GUIDE.md) - `.env` configuration
- 🔒 [Security Audit](docs/SECURITY_AUDIT.md) - Security status
- 📝 [What Changed](docs/WHAT_CHANGED.md) - Recent updates

</td>
<td width="50%">

### 🎬 **Demo Scripts**
```bash
./docs/QUICKSTART.sh        # Quick feature demo
./docs/FEATURE_DEMO.sh      # Detailed demos
./docs/QUICK_UPLOAD.sh      # GitHub upload guide
./docs/STRUCTURE.sh         # View structure
```

### 💡 **Quick Reference**
```bash
help                        # Main help
cat docs/HELP_QUICK_REF.sh  # All commands
```

</td>
</tr>
</table>

📑 **Full Documentation Index:** [docs/README.md](docs/README.md)

## 🎯 Usage Examples

### Switching Git Profiles
```bash
git-personal              # Switch to personal profile
git-work                  # Switch to work profile
git-status                # Check current profile
```

### Authenticated GitHub Cloning
```bash
gclone user/repo          # Clone with authentication
# or
git-clone-auth user/repo  # Same, with auto-token injection
```

### Security Scanning
```bash
./bin/scan-secrets        # Scan for exposed secrets
help security             # Show security commands
```

### Environment Management
```bash
sync-all                  # Sync profiles & tokens from .env
sync-profiles             # Sync git profiles only
sync-tokens               # Sync GitHub tokens only
```

---

## 🐛 Troubleshooting

<details>
<summary><b>Zsh plugins not loading</b></summary>

```bash
rm -rf ~/.zcompdump*
source ~/.zshrc
```
</details>

<details>
<summary><b>Tmux plugins not working</b></summary>

```bash
# Reinstall TPM
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install plugins: Ctrl+A then I (capital i)
```
</details>

<details>
<summary><b>Neovim plugins not installing</b></summary>

```bash
# Clean and reinstall
rm -rf ~/.local/share/nvim
nvim  # Will trigger lazy.nvim installation
```
</details>

<details>
<summary><b>Colors not working properly</b></summary>

Ensure your terminal supports true color:
- **macOS**: iTerm2 or Alacritty (recommended)
- **Linux**: Alacritty, Kitty, or Terminator

Check true color support:
```bash
echo $COLORTERM  # Should output: truecolor or 24bit
```
</details>

<details>
<summary><b>GPG signing errors</b></summary>

```bash
# Disable GPG signing if not needed
git config --global commit.gpgsign false

# Or install GPG
brew install gpg
gpg --full-generate-key
git config --global user.signingkey YOUR_KEY_ID
```
</details>

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

You are free to:
- ✅ Use commercially
- ✅ Modify
- ✅ Distribute
- ✅ Private use

---

## 🙏 Acknowledgments

Special thanks to these amazing projects:

- [Oh My Zsh](https://ohmyz.sh/) - Zsh framework
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Zsh theme
- [LazyVim](https://www.lazyvim.org/) - Neovim configuration
- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) - Tmux plugins
- [Homebrew](https://brew.sh/) - Package manager
- The entire DevSecOps community

---

## 📊 Stats

![GitHub stars](https://img.shields.io/github/stars/highlevel-performance/dotfile?style=social)
![GitHub forks](https://img.shields.io/github/forks/highlevel-performance/dotfile?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/highlevel-performance/dotfile?style=social)

---

<div align="center">

### Made with ❤️ for DevSecOps Engineers

**Questions? Issues?** → [Open an issue](https://github.com/highlevel-performance/dotfile/issues)

**Want to contribute?** → [Submit a PR](https://github.com/highlevel-performance/dotfile/pulls)

⭐ **Star this repo if you find it helpful!** ⭐

</div>
