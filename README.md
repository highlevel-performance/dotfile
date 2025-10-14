# 🚀 DevSecOps Dotfiles

A comprehensive, production-ready dotfiles configuration tailored for DevSecOps engineers. This setup includes configurations for zsh, tmux, Neovim (LazyVim), git, and various DevSecOps tools.

## ✨ Features

### 🔧 Core Tools
- **Zsh** with Oh My Zsh and Powerlevel10k theme
- **Tmux** with custom keybindings and DevSecOps sessions
- **Neovim** with LazyVim for modern IDE experience
- **Git** with security-focused aliases and GPG signing

### 🛠️ DevSecOps Tools Support
- **Container Technologies**: Docker, Docker Compose, Podman
- **Kubernetes**: kubectl, helm, kubectx, kubens
- **Infrastructure as Code**: Terraform, Ansible, Packer
- **Cloud Providers**: AWS CLI, Azure CLI, GCP CLI
- **Security Scanning**: Trivy, Grype, Snyk, tfsec, Hadolint
- **Secret Management**: SOPS, Vault, git-secrets
- **CI/CD**: Jenkins, GitLab CI, GitHub Actions

### 🎨 Modern CLI Tools
- `bat` - Better cat with syntax highlighting
- `eza` - Modern replacement for ls
- `ripgrep` (rg) - Fast recursive search
- `fd` - Simple, fast alternative to find
- `fzf` - Fuzzy finder
- `delta` - Better git diff
- `btop` - Modern system monitor
- `procs` - Modern replacement for ps
- `dust` - Better du
- `duf` - Better df

## 📋 Prerequisites

- macOS or Linux
- Git
- Curl or Wget
- Terminal with true color support

## 🚀 Installation

### Quick Install

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/Desktop/dotfile
cd ~/Desktop/dotfile

# Make setup script executable
chmod +x setup.sh

# Run the installation
./setup.sh
```

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

## 📁 Structure

```
dotfile/
├── .zshrc                  # Zsh configuration
├── .tmux.conf              # Tmux configuration
├── .gitconfig              # Git configuration
├── .gitignore_global       # Global gitignore
├── .aliases                # Command aliases
├── .functions              # Custom shell functions
├── .exports                # Environment variables
├── setup.sh                # Installation script
├── README.md               # This file
└── nvim/                   # Neovim configuration
    ├── init.lua            # Main config
    └── lua/
        ├── config/
        │   ├── options.lua
        │   ├── keymaps.lua
        │   └── autocmds.lua
        └── plugins/
            └── devsecops.lua
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

## 📦 DevSecOps Aliases

### Docker

```bash
d        # docker
dc       # docker-compose
dps      # docker ps
dpsa     # docker ps -a
di       # docker images
dex      # docker exec -it
dlogs    # docker logs -f
```

### Kubernetes

```bash
k        # kubectl
kgp      # kubectl get pods
kgs      # kubectl get services
kgn      # kubectl get nodes
kl       # kubectl logs
klf      # kubectl logs -f
kex      # kubectl exec -it
```

### Terraform

```bash
tf       # terraform
tfi      # terraform init
tfp      # terraform plan
tfa      # terraform apply
tfd      # terraform destroy
tfv      # terraform validate
```

### Git

```bash
gs       # git status
ga       # git add
gc       # git commit
gp       # git push
gpl      # git pull
gco      # git checkout
glog     # git log (pretty)
```

### Security

```bash
trivy-fs         # Scan file system
tfsec-scan       # Scan Terraform
grype-scan       # Scan with Grype
gitleaks-scan    # Scan for secrets
```

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

### Git Security

- Automatic commit signing with GPG
- `.gitignore_global` for sensitive files
- Aliases for scanning commit history
- Integration with git-secrets and gitleaks

### Sensitive File Detection

Neovim will alert when opening files that may contain secrets:
- `*.pem`, `*.key`
- Files with "secret", "password" in name
- `.env` files

### History Filtering

Commands containing sensitive keywords are automatically excluded from shell history.

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

All detailed documentation is in the `docs/` folder:

- **[Installation Guide](docs/INSTALLATION.md)** - Complete setup instructions
- **[Git Profiles](docs/GIT_PROFILES.md)** - Manage personal/work profiles
- **[Git Authentication](docs/GIT_AUTH_GUIDE.md)** - Setup authenticated cloning
- **[Help System](docs/HELP_ENV_GUIDE.md)** - Using help and environment variables
- **[Security Audit](docs/SECURITY_AUDIT.md)** - Security status and protections

### Quick Start
```bash
./docs/QUICKSTART.sh           # Quick demo
./docs/QUICK_UPLOAD.sh         # Upload to GitHub guide
./bin/scan-secrets             # Security scan
help                           # Show help system
```

See [docs/README.md](docs/README.md) for complete documentation index.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## 📄 License

MIT License - feel free to use and modify as needed.

## 🙏 Acknowledgments

- [Oh My Zsh](https://ohmyz.sh/)
- [LazyVim](https://www.lazyvim.org/)
- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
- The DevSecOps community

---

**Made with ❤️ for DevSecOps Engineers**

For questions or issues, please open an issue on GitHub.
