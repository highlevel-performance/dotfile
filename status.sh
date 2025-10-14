#!/bin/bash
# Status Check Script - Verify your complete dotfiles setup

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║           DevSecOps Dotfiles Status Check             ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Function to check if command exists
check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} $1"
        return 0
    else
        echo -e "  ${RED}✗${NC} $1 (not installed)"
        return 1
    fi
}

# Function to check if file exists
check_file() {
    if [ -f "$1" ]; then
        echo -e "  ${GREEN}✓${NC} $1"
        return 0
    else
        echo -e "  ${RED}✗${NC} $1 (not found)"
        return 1
    fi
}

# Check Git Profiles
echo -e "${BLUE}━━━ Git Profiles ━━━${NC}"
if [ -f ~/.git-profiles/personal ]; then
    echo -e "  ${GREEN}✓${NC} Personal profile configured"
    source ~/.git-profiles/personal
    echo -e "    Name: ${name}"
    echo -e "    Email: ${email}"
    echo -e "    GitHub: ${github_user}"
else
    echo -e "  ${RED}✗${NC} Personal profile not found"
fi

if [ -f ~/.git-profiles/work ]; then
    echo -e "  ${GREEN}✓${NC} Work profile configured"
    source ~/.git-profiles/work
    echo -e "    Name: ${name}"
    echo -e "    Email: ${email}"
    echo -e "    GitHub: ${github_user}"
else
    echo -e "  ${RED}✗${NC} Work profile not found"
fi

# Check current Git config
echo ""
echo -e "${BLUE}━━━ Current Git Configuration ━━━${NC}"
CURRENT_EMAIL=$(git config --global user.email)
CURRENT_NAME=$(git config --global user.name)
CURRENT_USER=$(git config --global github.user)

echo -e "  Name: ${CYAN}${CURRENT_NAME}${NC}"
echo -e "  Email: ${CYAN}${CURRENT_EMAIL}${NC}"
echo -e "  GitHub User: ${CYAN}${CURRENT_USER}${NC}"

# Determine current profile
if [ "$CURRENT_EMAIL" = "shivam.sk2003@gmail.com" ]; then
    echo -e "  Profile: ${GREEN}Personal${NC}"
elif [ "$CURRENT_EMAIL" = "s.kumar@kimbal.io" ]; then
    echo -e "  Profile: ${GREEN}Work${NC}"
else
    echo -e "  Profile: ${YELLOW}Unknown${NC}"
fi

# Check GitHub Tokens
echo ""
echo -e "${BLUE}━━━ GitHub Tokens ━━━${NC}"
if [ -f ~/Desktop/dotfile/bin/github-token ]; then
    ~/Desktop/dotfile/bin/github-token list | tail -n +2
    
    # Test tokens
    echo -e "\n  Testing tokens..."
    if ~/Desktop/dotfile/bin/github-token test personal &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} Personal token is valid"
    else
        echo -e "  ${RED}✗${NC} Personal token is invalid or expired"
    fi
    
    if ~/Desktop/dotfile/bin/github-token test work &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} Work token is valid"
    else
        echo -e "  ${RED}✗${NC} Work token is invalid or expired"
    fi
else
    echo -e "  ${RED}✗${NC} github-token script not found"
fi

# Check Dotfiles
echo ""
echo -e "${BLUE}━━━ Dotfiles ━━━${NC}"
check_file ~/.zshrc
check_file ~/.tmux.conf
check_file ~/.gitconfig
check_file ~/Desktop/dotfile/.aliases
check_file ~/Desktop/dotfile/.functions
check_file ~/Desktop/dotfile/.exports

# Check Scripts
echo ""
echo -e "${BLUE}━━━ Scripts ━━━${NC}"
check_file ~/Desktop/dotfile/bin/git-profile
check_file ~/Desktop/dotfile/bin/github-token
check_file ~/Desktop/dotfile/setup.sh

# Check Zsh Configuration
echo ""
echo -e "${BLUE}━━━ Zsh Configuration ━━━${NC}"
if [ -d ~/.oh-my-zsh ]; then
    echo -e "  ${GREEN}✓${NC} Oh My Zsh installed"
    
    if [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
        echo -e "  ${GREEN}✓${NC} Powerlevel10k theme installed"
    else
        echo -e "  ${YELLOW}⚠${NC} Powerlevel10k theme not found"
    fi
    
    # Check plugins
    if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
        echo -e "  ${GREEN}✓${NC} zsh-autosuggestions plugin installed"
    else
        echo -e "  ${YELLOW}⚠${NC} zsh-autosuggestions plugin not found"
    fi
    
    if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
        echo -e "  ${GREEN}✓${NC} zsh-syntax-highlighting plugin installed"
    else
        echo -e "  ${YELLOW}⚠${NC} zsh-syntax-highlighting plugin not found"
    fi
else
    echo -e "  ${RED}✗${NC} Oh My Zsh not installed"
fi

# Check Modern CLI Tools
echo ""
echo -e "${BLUE}━━━ Modern CLI Tools ━━━${NC}"
check_command bat
check_command eza
check_command fzf
check_command ripgrep
check_command fd
check_command delta
check_command zoxide
check_command btop

# Check DevSecOps Tools
echo ""
echo -e "${BLUE}━━━ DevSecOps Tools ━━━${NC}"
check_command kubectl
check_command helm
check_command terraform
check_command docker
check_command trivy
check_command tfsec
check_command hadolint

# Check Neovim
echo ""
echo -e "${BLUE}━━━ Neovim Configuration ━━━${NC}"
if command -v nvim &> /dev/null; then
    echo -e "  ${GREEN}✓${NC} Neovim installed"
    NVIM_VERSION=$(nvim --version | head -n 1)
    echo -e "    Version: ${NVIM_VERSION}"
    
    if [ -d ~/.config/nvim ]; then
        echo -e "  ${GREEN}✓${NC} Neovim config directory exists"
    else
        echo -e "  ${YELLOW}⚠${NC} Neovim config directory not found"
    fi
else
    echo -e "  ${RED}✗${NC} Neovim not installed"
fi

# Check Tmux
echo ""
echo -e "${BLUE}━━━ Tmux Configuration ━━━${NC}"
if command -v tmux &> /dev/null; then
    echo -e "  ${GREEN}✓${NC} Tmux installed"
    TMUX_VERSION=$(tmux -V)
    echo -e "    Version: ${TMUX_VERSION}"
    
    if [ -d ~/.tmux/plugins/tpm ]; then
        echo -e "  ${GREEN}✓${NC} TPM (Tmux Plugin Manager) installed"
    else
        echo -e "  ${YELLOW}⚠${NC} TPM not installed (run setup.sh)"
    fi
else
    echo -e "  ${RED}✗${NC} Tmux not installed"
fi

# Check Help System
echo ""
echo -e "${BLUE}━━━ Help System & Scripts ━━━${NC}"

DOTFILES_INSTALL="$HOME/.dotfiles"

if [ -d "$DOTFILES_INSTALL" ]; then
    echo -e "  ${GREEN}✓${NC} Dotfiles installed at $DOTFILES_INSTALL"
    
    if [ -f "$DOTFILES_INSTALL/bin/help" ]; then
        if [ -x "$DOTFILES_INSTALL/bin/help" ]; then
            echo -e "  ${GREEN}✓${NC} help script is executable"
            
            # Test if help command works
            if "$DOTFILES_INSTALL/bin/help" >/dev/null 2>&1; then
                echo -e "  ${GREEN}✓${NC} help command works"
            else
                echo -e "  ${RED}✗${NC} help command exists but fails to run"
            fi
        else
            echo -e "  ${RED}✗${NC} help script exists but is not executable"
            echo -e "      Run: chmod +x $DOTFILES_INSTALL/bin/help"
        fi
    else
        echo -e "  ${RED}✗${NC} help script not found"
    fi
    
    # Check if bin is in PATH
    if echo "$PATH" | grep -q "$DOTFILES_INSTALL/bin"; then
        echo -e "  ${GREEN}✓${NC} $DOTFILES_INSTALL/bin is in PATH"
    else
        echo -e "  ${YELLOW}⚠${NC} $DOTFILES_INSTALL/bin not in PATH"
    fi
    
    # Check DOTFILES_DIR variable
    if [ "$DOTFILES_DIR" = "$DOTFILES_INSTALL" ]; then
        echo -e "  ${GREEN}✓${NC} DOTFILES_DIR correctly set to $DOTFILES_INSTALL"
    else
        echo -e "  ${RED}✗${NC} DOTFILES_DIR is '$DOTFILES_DIR', should be '$DOTFILES_INSTALL'"
        echo -e "      ${YELLOW}Close terminal and open a NEW one!${NC}"
    fi
else
    echo -e "  ${RED}✗${NC} Dotfiles not installed at $DOTFILES_INSTALL"
    echo -e "      Run: ./setup.sh"
fi

# Summary
echo ""
echo -e "${CYAN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║                        Summary                         ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════╝${NC}"

ALL_GOOD=true

# Check critical components
if [ ! -f ~/.zshrc ] || [ ! -f ~/.gitconfig ]; then
    ALL_GOOD=false
fi

if [ ! -f "$DOTFILES_INSTALL/bin/help" ] || [ ! -x "$DOTFILES_INSTALL/bin/help" ]; then
    ALL_GOOD=false
fi

if [ "$DOTFILES_DIR" != "$DOTFILES_INSTALL" ]; then
    ALL_GOOD=false
fi

if $ALL_GOOD; then
    echo -e "${GREEN}✅ All core components are properly configured!${NC}"
    echo ""
    echo -e "${YELLOW}Next steps:${NC}"
    echo -e "  1. Reload your terminal: ${CYAN}exec zsh${NC}"
    echo -e "  2. Configure Powerlevel10k: ${CYAN}p10k configure${NC}"
    echo -e "  3. Install Tmux plugins: Open tmux, press ${CYAN}Ctrl+A then Shift+I${NC}"
    echo -e "  4. Launch Neovim: ${CYAN}nvim${NC} (plugins will auto-install)"
else
    echo -e "${RED}⚠️  Some components are missing or misconfigured${NC}"
    echo -e "   Run: ${CYAN}./setup.sh${NC} to install missing components"
fi

echo ""
echo -e "${BLUE}Quick Commands:${NC}"
echo -e "  Switch to personal: ${CYAN}git-personal${NC}"
echo -e "  Switch to work: ${CYAN}git-work${NC}"
echo -e "  Check tokens: ${CYAN}github-token list${NC}"
echo -e "  Test token: ${CYAN}github-token test personal${NC}"
echo ""
