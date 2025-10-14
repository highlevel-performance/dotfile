#!/usr/bin/env bash

# ================================
# COMPLETE UNINSTALL Script for Dotfiles
# ================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                                                              ║${NC}"
echo -e "${BLUE}║            🗑️  COMPLETE DOTFILES UNINSTALL 🗑️               ║${NC}"
echo -e "${BLUE}║                                                              ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}⚠️  This will remove:${NC}"
echo "   • All dotfile symlinks"
echo "   • ~/.dotfiles directory"
echo "   • All zsh cache files"
echo "   • Oh-my-zsh installation"
echo "   • Powerlevel10k theme"
echo ""
echo -e "${GREEN}✅ This will KEEP:${NC}"
echo "   • Your backup files (~/.dotfiles_backup_*)"
echo "   • Your .env backup files"
echo ""
read -p "Are you sure you want to completely uninstall? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Uninstall cancelled."
    exit 1
fi

echo ""
echo -e "${RED}🗑️  Starting complete uninstall...${NC}"
echo ""

# 1. Remove all symlinks
echo -e "${YELLOW}Step 1: Removing symlinks...${NC}"
files=(
    "$HOME/.zshrc"
    "$HOME/.tmux.conf"
    "$HOME/.gitconfig"
    "$HOME/.gitignore_global"
    "$HOME/.aliases"
    "$HOME/.functions"
    "$HOME/.exports"
    "$HOME/.gitmessage"
    "$HOME/.ripgreprc"
    "$HOME/.config/nvim"
)

for file in "${files[@]}"; do
    if [ -L "$file" ] || [ -f "$file" ]; then
        rm -f "$file"
        echo -e "${GREEN}✅ Removed: $file${NC}"
    fi
done

# 2. Remove ~/.dotfiles directory
echo ""
echo -e "${YELLOW}Step 2: Removing ~/.dotfiles directory...${NC}"
if [ -d "$HOME/.dotfiles" ]; then
    # Backup .env if it exists
    if [ -f "$HOME/.dotfiles/.env" ]; then
        backup_file="$HOME/.env.backup.$(date +%Y%m%d_%H%M%S)"
        cp "$HOME/.dotfiles/.env" "$backup_file"
        echo -e "${GREEN}✅ Backed up .env to: $backup_file${NC}"
    fi
    rm -rf "$HOME/.dotfiles"
    echo -e "${GREEN}✅ Removed ~/.dotfiles${NC}"
fi

# 3. Remove ALL zsh cache and compiled files
echo ""
echo -e "${YELLOW}Step 3: Removing zsh cache files...${NC}"
rm -f ~/.zcompdump* 2>/dev/null || true
rm -f ~/.zsh_history.LOCK 2>/dev/null || true
rm -rf ~/.zsh/cache 2>/dev/null || true
rm -f ~/.zshrc.zwc 2>/dev/null || true
rm -f ~/.zlogin.zwc 2>/dev/null || true
rm -f ~/.zlogout.zwc 2>/dev/null || true
rm -f ~/.zprofile.zwc 2>/dev/null || true
rm -f ~/.zshenv.zwc 2>/dev/null || true
echo -e "${GREEN}✅ Removed all zsh cache files${NC}"

# 4. Remove Oh-my-zsh
echo ""
echo -e "${YELLOW}Step 4: Removing Oh-my-zsh...${NC}"
if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf "$HOME/.oh-my-zsh"
    echo -e "${GREEN}✅ Removed Oh-my-zsh${NC}"
else
    echo -e "${BLUE}ℹ️  Oh-my-zsh not found (already removed)${NC}"
fi

# 5. Remove Powerlevel10k cache
echo ""
echo -e "${YELLOW}Step 5: Removing Powerlevel10k cache...${NC}"
rm -rf ~/.cache/p10k* 2>/dev/null || true
rm -f ~/.p10k.zsh 2>/dev/null || true
echo -e "${GREEN}✅ Removed Powerlevel10k cache${NC}"

# 6. Remove tmux plugins
echo ""
echo -e "${YELLOW}Step 6: Removing tmux plugins...${NC}"
if [ -d "$HOME/.tmux" ]; then
    rm -rf "$HOME/.tmux"
    echo -e "${GREEN}✅ Removed tmux plugins${NC}"
else
    echo -e "${BLUE}ℹ️  Tmux plugins not found${NC}"
fi

# 7. Remove Neovim config
echo ""
echo -e "${YELLOW}Step 7: Removing Neovim config...${NC}"
if [ -d "$HOME/.config/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
    echo -e "${GREEN}✅ Removed Neovim config${NC}"
fi
if [ -d "$HOME/.local/share/nvim" ]; then
    rm -rf "$HOME/.local/share/nvim"
    echo -e "${GREEN}✅ Removed Neovim data${NC}"
fi

echo ""
echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                                                              ║${NC}"
echo -e "${BLUE}║          ✅ COMPLETE UNINSTALL FINISHED! ✅                  ║${NC}"
echo -e "${BLUE}║                                                              ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}✅ Everything removed successfully!${NC}"
echo ""
echo -e "${YELLOW}📋 Summary:${NC}"
echo "   • Symlinks removed"
echo "   • ~/.dotfiles removed"
echo "   • Zsh cache cleared"
echo "   • Oh-my-zsh removed"
echo "   • Powerlevel10k removed"
echo "   • Tmux plugins removed"
echo "   • Neovim config removed"
echo ""
echo -e "${GREEN}✅ Backups preserved:${NC}"
echo "   • Check ~/.dotfiles_backup_* for old configs"
echo "   • Check ~/.env.backup.* for environment files"
echo ""
echo -e "${YELLOW}🔄 To reinstall:${NC}"
echo "   cd ~/Desktop/dotfile"
echo "   ./setup.sh"
echo ""
echo -e "${RED}⚠️  IMPORTANT: Close this terminal and open a new one!${NC}"
echo ""
