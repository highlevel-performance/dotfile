#!/usr/bin/env bash

# ================================
# DevSecOps Dotfiles Setup Script
# ================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Emoji for better UX
CHECK="✅"
CROSS="❌"
INFO="ℹ️"
ROCKET="🚀"
WRENCH="🔧"

print_header() {
    echo -e "\n${BLUE}================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================${NC}\n"
}

print_success() {
    echo -e "${GREEN}${CHECK} $1${NC}"
}

print_error() {
    echo -e "${RED}${CROSS} $1${NC}"
}

print_info() {
    echo -e "${YELLOW}${INFO} $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# Get script directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_header "${ROCKET} DevSecOps Dotfiles Installation"

echo "Dotfiles directory: $DOTFILES_DIR"
echo ""

# ================================
# 1. Check OS
# ================================

print_info "Detecting operating system..."
OS="$(uname -s)"
case "$OS" in
    Linux*)     OS_TYPE=Linux;;
    Darwin*)    OS_TYPE=Mac;;
    *)          OS_TYPE="UNKNOWN:${OS}"
esac
print_success "Operating System: $OS_TYPE"

# ================================
# 2. Install Homebrew (macOS)
# ================================

if [[ "$OS_TYPE" == "Mac" ]]; then
    print_header "${WRENCH} Installing Homebrew"
    if ! command -v brew &> /dev/null; then
        print_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH for M1/M2 Macs
        if [[ -d "/opt/homebrew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        print_success "Homebrew installed"
    else
        print_success "Homebrew already installed"
    fi
fi

# ================================
# 3. Install Core Tools
# ================================

print_header "${WRENCH} Installing Core Tools"

install_package() {
    local package=$1
    local command_check=${2:-$1}
    
    if ! command -v "$command_check" &> /dev/null; then
        print_info "Installing $package..."
        if [[ "$OS_TYPE" == "Mac" ]]; then
            brew install "$package"
        elif [[ "$OS_TYPE" == "Linux" ]]; then
            if command -v apt-get &> /dev/null; then
                sudo apt-get install -y "$package"
            elif command -v yum &> /dev/null; then
                sudo yum install -y "$package"
            fi
        fi
        print_success "$package installed"
    else
        print_success "$package already installed"
    fi
}

# Essential tools
install_package "git"
install_package "curl"
install_package "wget"
install_package "zsh"
install_package "tmux"
install_package "neovim" "nvim"

# Modern CLI tools
install_package "fzf"
install_package "ripgrep" "rg"
install_package "fd"
install_package "bat"
install_package "eza"
install_package "zoxide" "z"
install_package "btop"
install_package "procs"
install_package "dust"
install_package "duf"
install_package "delta"

# ================================
# 4. Install Oh My Zsh
# ================================

print_header "${WRENCH} Installing Oh My Zsh"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_success "Oh My Zsh installed"
else
    print_success "Oh My Zsh already installed"
fi

# Install Powerlevel10k theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    print_info "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    print_success "Powerlevel10k installed"
else
    print_success "Powerlevel10k already installed"
fi

# Install zsh plugins
print_info "Installing zsh plugins..."

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions
fi

print_success "Zsh plugins installed"

# ================================
# 5. Install Tmux Plugin Manager
# ================================

print_header "${WRENCH} Installing Tmux Plugin Manager"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    print_info "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    print_success "TPM installed"
else
    print_success "TPM already installed"
fi

# ================================
# 6. Backup Existing Dotfiles
# ================================

print_header "${WRENCH} Backing up existing dotfiles"

backup_dir="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"

files_to_backup=(
    ".zshrc"
    ".tmux.conf"
    ".gitconfig"
    ".gitignore_global"
    ".aliases"
    ".functions"
    ".exports"
)

for file in "${files_to_backup[@]}"; do
    if [ -f "$HOME/$file" ] || [ -L "$HOME/$file" ]; then
        print_info "Backing up $file..."
        mv "$HOME/$file" "$backup_dir/"
    fi
done

if [ -d "$HOME/.config/nvim" ]; then
    print_info "Backing up nvim config..."
    mv "$HOME/.config/nvim" "$backup_dir/nvim"
fi

print_success "Backup created at $backup_dir"

# ================================
# 7. Create Symlinks
# ================================

print_header "${WRENCH} Creating symlinks"

create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ -e "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
    fi
    
    mkdir -p "$(dirname "$target")"
    ln -sf "$source" "$target"
    print_success "Linked: $target -> $source"
}

create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"
create_symlink "$DOTFILES_DIR/.aliases" "$HOME/.aliases"
create_symlink "$DOTFILES_DIR/.functions" "$HOME/.functions"
create_symlink "$DOTFILES_DIR/.exports" "$HOME/.exports"
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Make all bin scripts executable
print_info "Making bin scripts executable..."
if [ -d "$DOTFILES_DIR/bin" ]; then
    chmod +x "$DOTFILES_DIR"/bin/*
    print_success "All bin scripts are now executable"
fi

# Make all demo scripts in docs executable
print_info "Making demo scripts executable..."
if [ -d "$DOTFILES_DIR/docs" ]; then
    chmod +x "$DOTFILES_DIR"/docs/*.sh 2>/dev/null || true
    print_success "All demo scripts are now executable"
fi

# ================================
# 8. Install DevSecOps Tools
# ================================

print_header "${WRENCH} Installing DevSecOps Tools"

# Docker (if not installed)
if ! command -v docker &> /dev/null; then
    print_warning "Docker not found. Please install Docker manually:"
    print_info "macOS: https://docs.docker.com/desktop/mac/install/"
    print_info "Linux: https://docs.docker.com/engine/install/"
else
    print_success "Docker installed"
fi

# Kubernetes tools
install_package "kubectl"
install_package "helm"

# Install kubectx and kubens
if [[ "$OS_TYPE" == "Mac" ]]; then
    install_package "kubectx"
fi

# Terraform
install_package "terraform"

# Cloud CLIs
if [[ "$OS_TYPE" == "Mac" ]]; then
    install_package "awscli" "aws"
fi

# Security tools
print_info "Installing security tools..."

# Trivy
if ! command -v trivy &> /dev/null && [[ "$OS_TYPE" == "Mac" ]]; then
    brew install aquasecurity/trivy/trivy
    print_success "Trivy installed"
fi

# tfsec
if ! command -v tfsec &> /dev/null && [[ "$OS_TYPE" == "Mac" ]]; then
    brew install tfsec
    print_success "tfsec installed"
fi

# Hadolint
if ! command -v hadolint &> /dev/null && [[ "$OS_TYPE" == "Mac" ]]; then
    brew install hadolint
    print_success "Hadolint installed"
fi

# ================================
# 9. Set Zsh as Default Shell
# ================================

print_header "${WRENCH} Setting Zsh as default shell"

if [ "$SHELL" != "$(which zsh)" ]; then
    print_info "Changing default shell to zsh..."
    chsh -s "$(which zsh)"
    print_success "Default shell changed to zsh"
else
    print_success "Zsh is already the default shell"
fi

# ================================
# 10. Finish
# ================================

print_header "${ROCKET} Installation Complete!"

echo ""
print_success "Dotfiles have been successfully installed!"
echo ""
print_info "Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Run Powerlevel10k configuration: p10k configure"
echo "  3. Install Tmux plugins: Open tmux and press Ctrl+A then I"
echo "  4. Open Neovim to install plugins: nvim (plugins will auto-install)"
echo ""
print_info "Additional configurations:"
echo "  - Update .gitconfig with your name and email"
echo "  - Configure GPG key for commit signing"
echo "  - Install additional DevSecOps tools as needed"
echo ""
print_warning "Backup of old dotfiles: $backup_dir"
echo ""
print_success "Happy DevSecOps! 🚀"
