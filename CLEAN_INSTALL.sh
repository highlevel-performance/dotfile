#!/usr/bin/env bash

# ============================================================================
# CLEAN REINSTALL SCRIPT - Fix all path and installation issues
# ============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                                                              ║${NC}"
echo -e "${BLUE}║       🔧 CLEAN REINSTALL - FIX ALL ISSUES 🔧                ║${NC}"
echo -e "${BLUE}║                                                              ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

DOTFILES_SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.dotfiles"

echo -e "${YELLOW}Step 1: Cleaning up old installations...${NC}"

# Remove old symlinks
rm -f ~/.zshrc
rm -f ~/.tmux.conf
rm -f ~/.gitconfig
rm -f ~/.gitignore_global
rm -f ~/.aliases
rm -f ~/.functions
rm -f ~/.exports
rm -f ~/.gitmessage
rm -f ~/.ripgreprc

echo -e "${GREEN}✅ Old symlinks removed${NC}"

# Remove old .dotfiles directory
if [ -d "$INSTALL_DIR" ]; then
    # Backup .env if it exists
    if [ -f "$INSTALL_DIR/.env" ]; then
        echo -e "${YELLOW}Backing up .env file...${NC}"
        cp "$INSTALL_DIR/.env" "$HOME/.env.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${GREEN}✅ .env backed up${NC}"
    fi
    rm -rf "$INSTALL_DIR"
fi

echo -e "${GREEN}✅ Old installation cleaned${NC}"
echo ""

echo -e "${YELLOW}Step 2: Creating fresh installation...${NC}"

# Create install directory
mkdir -p "$INSTALL_DIR"

# Copy all files
echo -e "${BLUE}Copying files to $INSTALL_DIR...${NC}"
rsync -av --exclude='.git' --exclude='*.backup' "$DOTFILES_SOURCE/" "$INSTALL_DIR/"

echo -e "${GREEN}✅ Files copied${NC}"

# Make all bin scripts executable
echo -e "${YELLOW}Step 3: Making scripts executable...${NC}"
if [ -d "$INSTALL_DIR/bin" ]; then
    chmod +x "$INSTALL_DIR"/bin/*
    echo -e "${GREEN}✅ All bin scripts are executable${NC}"
fi

# Make all demo scripts executable
if [ -d "$INSTALL_DIR/docs" ]; then
    chmod +x "$INSTALL_DIR"/docs/*.sh 2>/dev/null || true
    echo -e "${GREEN}✅ All demo scripts are executable${NC}"
fi

# Make setup scripts executable
chmod +x "$INSTALL_DIR"/*.sh 2>/dev/null || true

echo ""
echo -e "${YELLOW}Step 4: Creating symlinks...${NC}"

# Create symlinks
ln -sf "$INSTALL_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$INSTALL_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$INSTALL_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$INSTALL_DIR/.gitignore_global" "$HOME/.gitignore_global"
ln -sf "$INSTALL_DIR/.aliases" "$HOME/.aliases"
ln -sf "$INSTALL_DIR/.functions" "$HOME/.functions"
ln -sf "$INSTALL_DIR/.exports" "$HOME/.exports"
ln -sf "$INSTALL_DIR/.gitmessage" "$HOME/.gitmessage"
ln -sf "$INSTALL_DIR/.ripgreprc" "$HOME/.ripgreprc"
ln -sf "$INSTALL_DIR/nvim" "$HOME/.config/nvim"

echo -e "${GREEN}✅ Symlinks created${NC}"

# Setup .env if it doesn't exist
if [ ! -f "$INSTALL_DIR/.env" ]; then
    if [ -f "$HOME/.env.backup."* ]; then
        echo -e "${YELLOW}Restoring .env from backup...${NC}"
        cp "$(ls -t $HOME/.env.backup.* | head -1)" "$INSTALL_DIR/.env"
        echo -e "${GREEN}✅ .env restored${NC}"
    elif [ -f "$INSTALL_DIR/.env.example" ]; then
        echo -e "${YELLOW}Creating .env from .env.example...${NC}"
        cp "$INSTALL_DIR/.env.example" "$INSTALL_DIR/.env"
        echo -e "${GREEN}✅ .env created - PLEASE EDIT IT WITH YOUR VALUES!${NC}"
    fi
fi

echo ""
echo -e "${YELLOW}Step 5: Verifying installation...${NC}"

# Verify paths
if [ -L "$HOME/.zshrc" ] && [ -e "$HOME/.zshrc" ]; then
    echo -e "${GREEN}✅ .zshrc linked correctly${NC}"
else
    echo -e "${RED}❌ .zshrc link failed${NC}"
fi

if [ -x "$INSTALL_DIR/bin/help" ]; then
    echo -e "${GREEN}✅ help script is executable${NC}"
else
    echo -e "${RED}❌ help script is not executable${NC}"
fi

if [ -f "$INSTALL_DIR/.functions" ]; then
    echo -e "${GREEN}✅ .functions file exists${NC}"
else
    echo -e "${RED}❌ .functions file missing${NC}"
fi

echo ""
echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                                                              ║${NC}"
echo -e "${BLUE}║              ✅ INSTALLATION COMPLETE! ✅                    ║${NC}"
echo -e "${BLUE}║                                                              ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${YELLOW}📋 IMPORTANT NEXT STEPS:${NC}"
echo ""
echo -e "${GREEN}1. Edit your .env file:${NC}"
echo "   nvim ~/.dotfiles/.env"
echo ""
echo -e "${GREEN}2. Reload your shell:${NC}"
echo "   exec zsh"
echo ""
echo -e "${GREEN}3. Test the help command:${NC}"
echo "   help docker"
echo ""
echo -e "${GREEN}4. Configure Powerlevel10k:${NC}"
echo "   p10k configure"
echo ""

echo -e "${YELLOW}🔍 VERIFY PATHS:${NC}"
echo "   Dotfiles location: $INSTALL_DIR"
echo "   .zshrc location: $HOME/.zshrc -> $(readlink $HOME/.zshrc)"
echo "   help script: $INSTALL_DIR/bin/help"
echo ""

echo -e "${GREEN}Installation directory: $INSTALL_DIR${NC}"
echo -e "${GREEN}All scripts are now executable!${NC}"
echo ""
echo -e "${BLUE}🚀 Ready to go! Run: exec zsh${NC}"
echo ""
