#!/usr/bin/env bash

# ================================
# Setup GitHub Tokens from .env
# ================================

# Load .env configuration
DOTFILES_DIR="${HOME}/Desktop/dotfile"
if [[ -f "${DOTFILES_DIR}/.env" ]]; then
    set -a
    source "${DOTFILES_DIR}/.env"
    set +a
else
    echo "❌ Error: .env file not found at ${DOTFILES_DIR}/.env"
    exit 1
fi

TOKEN_DIR="$HOME/.github-tokens"
mkdir -p "$TOKEN_DIR"
chmod 700 "$TOKEN_DIR"

echo "Setting up GitHub tokens from .env..."
echo ""

# Personal token
if [ -n "$GITHUB_TOKEN_PERSONAL" ]; then
    echo "$GITHUB_TOKEN_PERSONAL" > "$TOKEN_DIR/personal.token"
    chmod 600 "$TOKEN_DIR/personal.token"
    git config --global github.token.personal "$GITHUB_TOKEN_PERSONAL"
    personal_masked="${GITHUB_TOKEN_PERSONAL:0:7}...${GITHUB_TOKEN_PERSONAL: -4}"
    echo "✅ Personal token configured: $personal_masked"
else
    echo "⚠️  Warning: GITHUB_TOKEN_PERSONAL not set in .env"
fi

# Work token
if [ -n "$GITHUB_TOKEN_WORK" ]; then
    echo "$GITHUB_TOKEN_WORK" > "$TOKEN_DIR/work.token"
    chmod 600 "$TOKEN_DIR/work.token"
    git config --global github.token.work "$GITHUB_TOKEN_WORK"
    work_masked="${GITHUB_TOKEN_WORK:0:7}...${GITHUB_TOKEN_WORK: -4}"
    echo "✅ Work token configured: $work_masked"
else
    echo "⚠️  Warning: GITHUB_TOKEN_WORK not set in .env"
fi

echo ""
echo "✅ GitHub tokens configured successfully!"
echo ""
echo "Tokens stored in:"
echo "  - $TOKEN_DIR/personal.token"
echo "  - $TOKEN_DIR/work.token"
echo "  - Git config: github.token.personal & github.token.work"
echo ""
echo "To update tokens, edit ~/Desktop/dotfile/.env and run this script again"
echo ""
echo "Usage:"
echo "  github-token get personal"
echo "  github-token get work"
echo "  github-token list"
echo "  github-token test personal"
echo "  github-token test work"
