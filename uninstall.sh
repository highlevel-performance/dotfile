#!/usr/bin/env bash

# ================================
# Uninstall Script for Dotfiles
# ================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}⚠️  This will remove all dotfile symlinks${NC}"
echo -e "${YELLOW}⚠️  Your backup files will remain intact${NC}"
echo ""
read -p "Are you sure you want to uninstall? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Uninstall cancelled."
    exit 1
fi

echo -e "\n${RED}Removing symlinks...${NC}\n"

# Remove symlinks
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
    if [ -L "$file" ]; then
        rm "$file"
        echo -e "${GREEN}✅ Removed: $file${NC}"
    fi
done

echo -e "\n${GREEN}✅ Dotfiles uninstalled${NC}"
echo -e "${YELLOW}ℹ️  To restore backups, check ~/.dotfiles_backup_* directories${NC}"
