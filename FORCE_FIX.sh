#!/usr/bin/env bash

echo "🔧 FORCING COMPLETE FIX..."
echo ""

# 1. Remove ALL zsh cache files
echo "1. Removing zsh cache..."
rm -f ~/.zcompdump*
rm -f ~/.zsh_history.LOCK
rm -rf ~/.zsh/cache 2>/dev/null || true
rm -rf ~/Desktop/dotfile/bin/main 2>/dev/null || true

# 2. Fix .ripgreprc issue
echo "2. Fixing .ripgreprc..."
if [ -L ~/.ripgreprc ] && [ ! -e ~/.ripgreprc ]; then
    rm ~/.ripgreprc
    ln -sf ~/.dotfiles/.ripgreprc ~/.ripgreprc
fi

# 3. Fix the registry-name issue in .functions
echo "3. Fixing .functions syntax..."
sed -i.bak 's/<registry-name>/registry-name/g' ~/.dotfiles/.functions

# 4. Force recreate symlinks
echo "4. Recreating symlinks..."
rm -f ~/.zshrc ~/.functions
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.functions ~/.functions

# 5. Verify help script exists and is executable
echo "5. Verifying help script..."
if [ -f ~/.dotfiles/bin/help ]; then
    chmod +x ~/.dotfiles/bin/help
    echo "✅ help script is ready: ~/.dotfiles/bin/help"
else
    echo "❌ ERROR: help script not found!"
    exit 1
fi

# 6. Test the path
echo "6. Testing paths..."
if [ -x ~/.dotfiles/bin/help ]; then
    echo "✅ help is executable"
else
    echo "❌ help is not executable"
fi

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║                    ✅ FIX COMPLETE! ✅                       ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "🔥 CRITICAL: You MUST close this terminal and open a NEW one!"
echo ""
echo "Do NOT use 'exec zsh' or 'source ~/.zshrc'"
echo "Close the terminal completely and open a fresh terminal window."
echo ""
echo "Then test:"
echo "  help docker"
echo ""
